#!/usr/bin/env bash

# This is technically redundant, since all consumers of this lib will have enabled these,
# however, it helps Shellcheck realise the options under which these functions will run.
set -euo pipefail

# Read the full Python version of the Python install in the cache, or the empty string
# if the cache is empty or doesn't contain a Python version metadata file.
function cache::cached_python_full_version() {
	local cache_dir="${1}"

	if [[ -f "${cache_dir}/.scalingo/python-version" ]]; then
		local version
		version="$(cat "${cache_dir}/.scalingo/python-version")"
		# For historical reasons the version has always been stored as `python-X.Y.Z`,
		# so we have to remove the `python-` prefix.
		echo "${version#python-}"
	fi
}

# Validates and restores the contents of the build cache if appropriate.
# The cache is discarded if any of the following have changed:
# - Stack
# - Python version
# - Package manager
# - Package manager version
# - requirements.txt contents (pip only)
function cache::restore() {
	local build_dir="${1}"
	local cache_dir="${2}"
	local stack="${3}"
	local cached_python_full_version="${4}"
	local python_full_version="${5}"
	local package_manager="${6}"

	if [[ ! -d "${cache_dir}/.scalingo/python" ]]; then
		meta_set "cache_status" "empty"
		return 0
	fi

	local cache_restore_start_time
	cache_restore_start_time=$(nowms)
	local cache_invalidation_reasons=()

	local cached_stack
	cached_stack="$(cat "${cache_dir}/.scalingo/python-stack" || true)"
	if [[ "${cached_stack}" != "${stack}" ]]; then
		cache_invalidation_reasons+=("The stack has changed from ${cached_stack:-"unknown"} to ${stack}")
	fi

	if [[ "${cached_python_full_version}" != "${python_full_version}" ]]; then
		cache_invalidation_reasons+=("The Python version has changed from ${cached_python_full_version:-"unknown"} to ${python_full_version}")
	fi

	# The metadata store only exists in caches created in v252+ of the buildpack (released 2024-06-17),
	# so here and below we have to handle the case where `meta_prev_get` returns the empty string.
	local cached_package_manager
	cached_package_manager="$(meta_prev_get "package_manager")"
	if [[ -z "${cached_package_manager}" ]]; then
		# Using `compgen` since `[[ -d ... ]]` doesn't work with globs.
		if compgen -G "${cache_dir}/.scalingo/python/lib/python*/site-packages/pipenv" >/dev/null; then
			cached_package_manager="pipenv"
		elif compgen -G "${cache_dir}/.scalingo/python/lib/python*/site-packages/pip" >/dev/null; then
			cached_package_manager="pip"
		fi
	fi

	if [[ "${cached_package_manager}" != "${package_manager}" ]]; then
		cache_invalidation_reasons+=("The package manager has changed from ${cached_package_manager:-"unknown"} to ${package_manager}")
	else
		case "${package_manager}" in
			pip)
				local cached_pip_version
				cached_pip_version="$(meta_prev_get "pip_version")"
				# Handle caches written by buildpack versions older than v252 (see above).
				if [[ -z "${cached_pip_version}" ]]; then
					# Whilst we don't know the old version, we know the pip version has definitely
					# changed since buildpack v251.
					cache_invalidation_reasons+=("The pip version has changed")
				elif [[ "${cached_pip_version}" != "${PIP_VERSION:?}" ]]; then
					cache_invalidation_reasons+=("The pip version has changed from ${cached_pip_version} to ${PIP_VERSION}")
				fi

				# We invalidate the cache if requirements.txt changes since pip is a package installer
				# rather than a project/environment manager, and so does not deterministically manage
				# installed Python packages. For example, if a package entry in a requirements file is
				# later removed, pip will not uninstall the package. This check can be removed if we
				# ever switch to only caching pip's HTTP/wheel cache rather than site-packages.
				# TODO: Remove the `-f` check once the setup.py fallback feature is removed.
				if [[ -f "${build_dir}/requirements.txt" ]] && ! cmp --silent "${cache_dir}/.scalingo/requirements.txt" "${build_dir}/requirements.txt"; then
					cache_invalidation_reasons+=("The contents of requirements.txt changed")
				fi
				;;
			pipenv)
				local cached_pipenv_version
				cached_pipenv_version="$(meta_prev_get "pipenv_version")"
				# Handle caches written by buildpack versions older than v252 (see above).
				if [[ -z "${cached_pipenv_version}" ]]; then
					# Whilst we don't know the old version, we know the Pipenv version has definitely
					# changed since buildpack v251.
					cache_invalidation_reasons+=("The Pipenv version has changed")
				elif [[ "${cached_pipenv_version}" != "${PIPENV_VERSION:?}" ]]; then
					cache_invalidation_reasons+=("The Pipenv version has changed from ${cached_pipenv_version} to ${PIPENV_VERSION}")
				fi
				# `pipenv {install,sync}` by design don't actually uninstall packages on their own (!!):
				# and we can't use `pipenv clean` since it isn't compatible with `--system`.
				# https://github.com/pypa/pipenv/issues/3365
				# We have to explicitly check for the presence of the Pipfile.lock.sha256 file,
				# since we only started writing it to the build cache as of buildpack v292+.
				local pipfile_lock_checksum_file="${cache_dir}/.scalingo/python/Pipfile.lock.sha256"
				if [[ -f "${pipfile_lock_checksum_file}" ]] && ! sha256sum --check --strict --status "${pipfile_lock_checksum_file}"; then
					cache_invalidation_reasons+=("The contents of Pipfile.lock changed")
				fi
				;;
			poetry)
				local cached_poetry_version
				cached_poetry_version="$(meta_prev_get "poetry_version")"
				# Poetry support was added after the metadata store, so we'll always have the version here.
				if [[ "${cached_poetry_version}" != "${POETRY_VERSION:?}" ]]; then
					cache_invalidation_reasons+=("The Poetry version has changed from ${cached_poetry_version:-"unknown"} to ${POETRY_VERSION}")
				fi
				;;
			uv)
				local cached_uv_version
				cached_uv_version="$(meta_prev_get "uv_version")"
				# uv support was added after the metadata store, so we'll always have the version here.
				if [[ "${cached_uv_version}" != "${UV_VERSION:?}" ]]; then
					cache_invalidation_reasons+=("The uv version has changed from ${cached_uv_version:-"unknown"} to ${UV_VERSION}")
				fi
				;;
			*)
				utils::abort_internal_error "Unhandled package manager: ${package_manager}"
				;;
		esac
	fi

	if [[ -n "${cache_invalidation_reasons[*]}" ]]; then
		output::step "Discarding cache since:"
		local reason
		for reason in "${cache_invalidation_reasons[@]}"; do
			echo "       - ${reason}"
		done

		rm -rf \
			"${cache_dir}/.scalingo/python" \
			"${cache_dir}/.scalingo/python-poetry" \
			"${cache_dir}/.scalingo/python-stack" \
			"${cache_dir}/.scalingo/python-uv" \
			"${cache_dir}/.scalingo/python-version" \
			"${cache_dir}/.scalingo/requirements.txt"

		meta_set "cache_status" "discarded"
	else
		output::step "Restoring cache"
		mkdir -p "${build_dir}/.scalingo"
		# Moving the files directly in place is much faster than copying when both the cache and
		# build directory are on the same filesystem mount. The Python directory is guaranteed
		# to not already exist thanks to the earlier `checks::existing_python_dir_present()`.
		mv "${cache_dir}/.scalingo/python" "${build_dir}/.scalingo/"
		meta_set "cache_status" "reused"
	fi

	# Remove any legacy cache contents written by older buildpack versions.
	rm -rf \
		"${cache_dir}/.scalingo/python-sqlite3-version" \
		"${cache_dir}/.scalingo/src" \
		"${cache_dir}/.scalingo/vendor"

	meta_time "cache_restore_duration" "${cache_restore_start_time}"
}

# Copies Python and dependencies from the build directory to the cache, for use by subsequent builds.
function cache::save() {
	local build_dir="${1}"
	local cache_dir="${2}"
	local stack="${3}"
	local python_full_version="${4}"
	local package_manager="${5}"

	local cache_save_start_time
	cache_save_start_time=$(nowms)

	output::step "Saving cache"

	mkdir -p "${cache_dir}/.scalingo"

	rm -rf "${cache_dir}/.scalingo/python"
	# In theory we should be able to use `--reflink=auto` here for improved performance, however,
	# initial benchmarking showed it to be slower with the file system type / mounts used by the
	# Heroku build system for some reason. (Copying was faster using `--link`, however, that fails
	# when copying cross-mount such as for Heroku CI and build-in-app-dir, plus hardlinks could
	# result in unintended cache mutation if later buildpacks add/remove packages etc.)
	cp --recursive "${build_dir}/.scalingo/python" "${cache_dir}/.scalingo/"

	# Metadata used by subsequent builds to determine whether the cache can be reused.
	# These are written/consumed via separate files and not the metadata store for compatibility
	# with buildpack versions prior to the metadata store existing (which was only added in v252).
	echo "${stack}" >"${cache_dir}/.scalingo/python-stack"
	# For historical reasons the Python version was always stored with a `python-` prefix.
	# We continue to use that format so that the file can be read by older buildpack versions.
	echo "python-${python_full_version}" >"${cache_dir}/.scalingo/python-version"

	# TODO: Simplify this once multiple package manager files being found is turned into an
	# error and the setup.py fallback feature is removed.
	if [[ "${package_manager}" == "pip" && -f "${build_dir}/requirements.txt" ]]; then
		# TODO: Switch this to using sha256sum like the Pipenv implementation.
		cp "${build_dir}/requirements.txt" "${cache_dir}/.scalingo/"
	elif [[ "${package_manager}" == "pipenv" ]]; then
		# This must use a relative path for the lockfile, since the output file will contain
		# the path specified, and the build directory path changes every build.
		sha256sum Pipfile.lock >"${cache_dir}/.scalingo/python/Pipfile.lock.sha256"
	fi

	meta_time "cache_save_duration" "${cache_save_start_time}"
}
