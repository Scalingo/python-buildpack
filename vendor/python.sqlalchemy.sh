#!/usr/bin/env bash

set_sql_alchemy_url() {
	local database_url="${1}"
	local env_var="${2}"

	# Check that at least one of these exists:
	local files=()
	[[ -f "requirements.txt" ]] && files+=("requirements.txt")
	[[ -f "Pipfile" ]] && files+=("Pipfile")
	[[ -f "pyproject.toml" ]] && files+=("pyproject.toml")

	# If none exist, exits early:
	((${#files[@]} == 0)) && return 0

	if grep --ignore-case --silent "sqlalchemy" "${files[@]}" \
		&& [[ "${database_url}" == "postgres://*" ]]
	then
		# Replace 'postgres://' with 'postgresql://':
		local full_database_url="${database_url/postgres:\/\//postgresql://}"

		# Export the updated env var:
		export "${env_var}=${full_database_url}"
	fi
}

while IFS= read -r database_url_variable; do
	# Use Bash indirect expansion to pass the variable value to the function
	# Name of the variable is edited to insert '_ALCHEMY' before '_URL':
	set_sql_alchemy_url "${!database_url_variable}" \
		"${database_url_variable//_URL/}_ALCHEMY_URL"
done < <( printenv | cut --delimiter= --fields1 \
			| grep --extended-regexp='^SCALINGO_POSTGRESQL_URL' )

#for database_url_variable in $( env | awk -F "=" '{print $1}' | grep "SCALINGO_POSTGRESQL_URL" ); do
#	set_sql_alchemy_url "$( eval echo "\$${database_url_variable}" )" "${database_url_variable//_URL/}_ALCHEMY_URL"
#done
