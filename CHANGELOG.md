# Changelog

## [Unreleased]


## [v294] - 2025-07-28

- Improved performance of Python build cache restoration. ([#1845](https://github.com/heroku/heroku-buildpack-python/pull/1845))
- Added a build log message for the build cache saving step. ([#1844](https://github.com/heroku/heroku-buildpack-python/pull/1844))

## [v293] - 2025-07-23

- Work around a Pipenv bug when using `--system`, that causes packages to not be installed correctly if they are also a dependency of Pipenv (such as `certifi` ). ([#1842](https://github.com/heroku/heroku-buildpack-python/pull/1842))

## [v292] - 2025-07-23

- Updated Pipenv from 2024.0.1 to 2025.0.4. ([#1840](https://github.com/heroku/heroku-buildpack-python/pull/1840))
- Fixed the way Pipenv is installed, so that it and its dependencies are installed into a separate virtual environment rather than same environment as the app. If your app inadvertently depended on Pipenv's internal dependencies, you will need to add those dependencies explicitly to your `Pipfile`. ([#1840](https://github.com/heroku/heroku-buildpack-python/pull/1840))
- Stopped installing pip when Pipenv is the chosen package manager. ([#1840](https://github.com/heroku/heroku-buildpack-python/pull/1840))
- The build cache is now cleared when using Pipenv if the contents of `Pipfile.lock` has changed since the last build. This is required to work around Pipenv not uninstalling packages when they are removed from the lockfile. ([#1840](https://github.com/heroku/heroku-buildpack-python/pull/1840))
- The build now errors when using Pipenv without its lockfile (`Pipfile.lock`). This replaces the warning displayed since November 2024. ([#1833](https://github.com/heroku/heroku-buildpack-python/pull/1833))

## [v291] - 2025-07-10

- Updated uv from 0.7.13 to 0.7.20. ([#1827](https://github.com/heroku/heroku-buildpack-python/pull/1827) and [#1829](https://github.com/heroku/heroku-buildpack-python/pull/1829))
- The build now errors if the Python buildpack has been run multiple times in the same build. This replaces the warning displayed since December 2024. ([#1830](https://github.com/heroku/heroku-buildpack-python/pull/1830))
- The build now errors if an existing `.heroku/python/` directory is found in the app source. This replaces the warning displayed since December 2024. ([#1830](https://github.com/heroku/heroku-buildpack-python/pull/1830))

## [v290] - 2025-06-17

- Updated uv from 0.7.10 to 0.7.13. ([#1819](https://github.com/heroku/heroku-buildpack-python/pull/1819))

## [v289] - 2025-06-12

- The Python 3.13 version alias now resolves to Python 3.13.5. ([#1814](https://github.com/heroku/heroku-buildpack-python/pull/1814))

## [v288] - 2025-06-03

- The Python 3.13 version alias now resolves to Python 3.13.4. ([#1810](https://github.com/heroku/heroku-buildpack-python/pull/1810))
- The Python 3.12 version alias now resolves to Python 3.12.11. ([#1810](https://github.com/heroku/heroku-buildpack-python/pull/1810))
- The Python 3.11 version alias now resolves to Python 3.11.13. ([#1810](https://github.com/heroku/heroku-buildpack-python/pull/1810))
- The Python 3.10 version alias now resolves to Python 3.10.18. ([#1810](https://github.com/heroku/heroku-buildpack-python/pull/1810))
- The Python 3.9 version alias now resolves to Python 3.9.23. ([#1810](https://github.com/heroku/heroku-buildpack-python/pull/1810))
- Updated uv from 0.7.6 to 0.7.10. ([#1811](https://github.com/heroku/heroku-buildpack-python/pull/1811))

## [v287] - 2025-05-20

- Updated pip from 25.0.1 to 25.1.1. ([#1795](https://github.com/heroku/heroku-buildpack-python/pull/1795))
- Updated Poetry from 2.1.2 to 2.1.3. ([#1797](https://github.com/heroku/heroku-buildpack-python/pull/1797))
- Updated uv from 0.7.3 to 0.7.6. ([#1800](https://github.com/heroku/heroku-buildpack-python/pull/1800) and [#1803](https://github.com/heroku/heroku-buildpack-python/pull/1803))

## [v286] - 2025-05-13

- Added support for the package manager uv. ([#1791](https://github.com/heroku/heroku-buildpack-python/pull/1791))

## [v285] - 2025-05-08

- Improved internal buildpack metrics handling of attributes that contain newline characters. ([#1792](https://github.com/heroku/heroku-buildpack-python/pull/1792))

## [v284] - 2025-05-06

- Fixed parsing of `runtime.txt` and `.python-version` files that contain CRLF characters. ([#1789](https://github.com/heroku/heroku-buildpack-python/pull/1789))

## [v283] - 2025-05-06

- Added a warning when an app doesn't specify a Python version and instead relies upon the default/cached version. ([#1787](https://github.com/heroku/heroku-buildpack-python/pull/1787))
- Improved the instructions for migrating from `runtime.txt` to `.python-version`. ([#1783](https://github.com/heroku/heroku-buildpack-python/pull/1783))
- Improved the error messages shown when `.python-version`, `runtime.txt` or `Pipfile.lock` contain an invalid Python version. ([#1783](https://github.com/heroku/heroku-buildpack-python/pull/1783) and [#1786](https://github.com/heroku/heroku-buildpack-python/pull/1786))
- Improved the rendering of the error message shown when `.python-version` or `runtime.txt` contain stray invisible characters (such as ASCII control codes). ([#1783](https://github.com/heroku/heroku-buildpack-python/pull/1783))
- Improved the upgrade instructions shown for EOL and unsupported Python versions. ([#1783](https://github.com/heroku/heroku-buildpack-python/pull/1783) and [#1786](https://github.com/heroku/heroku-buildpack-python/pull/1786))
- Improved the error messages shown when no Python package manager files are found. ([#1787](https://github.com/heroku/heroku-buildpack-python/pull/1787))

## [v282] - 2025-05-02

- Removed support for Heroku-20. ([#1778](https://github.com/heroku/heroku-buildpack-python/pull/1778))

## [v281] - 2025-04-08

- The Python 3.13 version alias now resolves to Python 3.13.3. ([#1775](https://github.com/heroku/heroku-buildpack-python/pull/1775))
- The Python 3.12 version alias now resolves to Python 3.12.10. ([#1775](https://github.com/heroku/heroku-buildpack-python/pull/1775))
- The Python 3.11 version alias now resolves to Python 3.11.12. ([#1775](https://github.com/heroku/heroku-buildpack-python/pull/1775))
- The Python 3.10 version alias now resolves to Python 3.10.17. ([#1775](https://github.com/heroku/heroku-buildpack-python/pull/1775))
- The Python 3.9 version alias now resolves to Python 3.9.22. ([#1775](https://github.com/heroku/heroku-buildpack-python/pull/1775))

## [v280] - 2025-04-08

- Updated pip from 24.3.1 to 25.0.1. ([#1759](https://github.com/heroku/heroku-buildpack-python/pull/1759))
- Updated Poetry from 2.1.1 to 2.1.2. ([#1772](https://github.com/heroku/heroku-buildpack-python/pull/1772))

## [v279] - 2025-02-26

- Updated Poetry from 2.0.1 to 2.1.1. ([#1758](https://github.com/heroku/heroku-buildpack-python/pull/1758))
- Stopped filtering out pip's `Requirement already satisfied:` log lines when installing dependencies. ([#1765](https://github.com/heroku/heroku-buildpack-python/pull/1765))
- Improved the error messages shown if installing pip/Poetry/Pipenv fails. ([#1764](https://github.com/heroku/heroku-buildpack-python/pull/1764))
- Stopped installing pip into Poetry's virtual environment. ([#1761](https://github.com/heroku/heroku-buildpack-python/pull/1761))

## [v278] - 2025-02-24

- Added build-time rewriting of editable VCS dependency paths (in addition to the existing run-time rewriting), to work around an upstream Pipenv bug with editable VCS dependencies not being reinstalled correctly for cached builds. ([#1756](https://github.com/heroku/heroku-buildpack-python/pull/1756))
- Changed the location of repositories for editable VCS dependencies when using pip and Pipenv, to improve build performance and match the behaviour when using Poetry. ([#1753](https://github.com/heroku/heroku-buildpack-python/pull/1753))

## [v277] - 2025-02-17

- Improved the warning message shown when the requested Python version is not the latest patch version. ([#1749](https://github.com/heroku/heroku-buildpack-python/pull/1749))
- Improved the error message shown when the requested Python patch version isn't available. ([#1749](https://github.com/heroku/heroku-buildpack-python/pull/1749))
- Improved the error message shown if there was a networking or server related error downloading Python. ([#1749](https://github.com/heroku/heroku-buildpack-python/pull/1749))
- Adjusted the curl options used when downloading Python to set a maximum download time of 120s to prevent hanging builds in the case of network issues. ([#1749](https://github.com/heroku/heroku-buildpack-python/pull/1749))
- Refactored the Python download step to avoid an unnecessary version check `HEAD` request to S3 prior to downloading Python or reusing a cached install. ([#1749](https://github.com/heroku/heroku-buildpack-python/pull/1749))
- Updated the `runtime.txt` deprecation warning to include a link to the deprecation changelog post. ([#1747](https://github.com/heroku/heroku-buildpack-python/pull/1747))
- Improved buildpack metrics for Python version selection. ([#1749](https://github.com/heroku/heroku-buildpack-python/pull/1749))
- Improved buildpack metrics for builds that fail. ([#1746](https://github.com/heroku/heroku-buildpack-python/pull/1746) and [#1749](https://github.com/heroku/heroku-buildpack-python/pull/1749))

## [v276] - 2025-02-05

- The Python 3.13 version alias now resolves to Python 3.13.2. ([#1744](https://github.com/heroku/heroku-buildpack-python/pull/1744))
- The Python 3.12 version alias now resolves to Python 3.12.9. ([#1744](https://github.com/heroku/heroku-buildpack-python/pull/1744))
- Deprecated support for the `runtime.txt` file. ([#1743](https://github.com/heroku/heroku-buildpack-python/pull/1743))
- Improved the error messages shown when `.python-version`, `runtime.txt` or `Pipfile.lock` contain an invalid Python version. ([#1743](https://github.com/heroku/heroku-buildpack-python/pull/1743))

## [v275] - 2025-01-13

- Updated Poetry from 1.8.5 to 2.0.1. ([#1734](https://github.com/heroku/heroku-buildpack-python/pull/1734))

## [v274] - 2025-01-08

- Added a deprecation warning for Python 3.9. ([#1732](https://github.com/heroku/heroku-buildpack-python/pull/1732))
- Removed support for Python 3.8. ([#1732](https://github.com/heroku/heroku-buildpack-python/pull/1732))
- Improved the error messages shown for EOL or unrecognised major Python versions. ([#1732](https://github.com/heroku/heroku-buildpack-python/pull/1732))

## [v273] - 2025-01-03

- Added more Python project related file and directory names to the list recognised by buildpack detection. ([#1729](https://github.com/heroku/heroku-buildpack-python/pull/1729))
- Improved the file listing in the error messages shown when buildpack detection fails or when no Python package manager files are found. ([#1728](https://github.com/heroku/heroku-buildpack-python/pull/1728))

## [v272] - 2024-12-13

- Added a warning if the Python buildpack has been run multiple times in the same build. In the future this warning will be made an error. ([#1724](https://github.com/heroku/heroku-buildpack-python/pull/1724))
- Added a warning if an existing `.heroku/python/` directory is found in the app source. In the future this warning will be made an error. ([#1724](https://github.com/heroku/heroku-buildpack-python/pull/1724))
- Improved the error message shown if the buildpack is used on an unsupported stack. ([#1724](https://github.com/heroku/heroku-buildpack-python/pull/1724))
- Fixed Dev Center links to reflect recent article URL changes. ([#1723](https://github.com/heroku/heroku-buildpack-python/pull/1723))
- Added metrics for the existence of a uv lockfile. ([#1725](https://github.com/heroku/heroku-buildpack-python/pull/1725))

## [v271] - 2024-12-12

- Updated the Python 3.8 EOL warning message with the new sunset date. ([#1721](https://github.com/heroku/heroku-buildpack-python/pull/1721))
- Improved the error message shown when pip install fails due to pip rejecting a package with invalid version metadata. ([#1718](https://github.com/heroku/heroku-buildpack-python/pull/1718))
- Improved the error message shown when the copy of pip bundled in the `ensurepip` module cannot be found. ([#1720](https://github.com/heroku/heroku-buildpack-python/pull/1720))

## [v270] - 2024-12-10

- Changed the default Python version for new apps from 3.12 to 3.13. ([#1715](https://github.com/heroku/heroku-buildpack-python/pull/1715))
- Changed Python version pinning behaviour for apps that do not specify a Python version. Repeat builds are now pinned to the major Python version only (`3.X`) instead of the full Python version (`3.X.Y`), so that they always use the latest patch version. ([#1714](https://github.com/heroku/heroku-buildpack-python/pull/1714))
- Updated Poetry from 1.8.4 to 1.8.5. ([#1716](https://github.com/heroku/heroku-buildpack-python/pull/1716))

## [v269] - 2024-12-04

- The Python 3.13 version alias now resolves to Python 3.13.1. ([#1712](https://github.com/heroku/heroku-buildpack-python/pull/1712))
- The Python 3.12 version alias now resolves to Python 3.12.8. ([#1712](https://github.com/heroku/heroku-buildpack-python/pull/1712))
- The Python 3.11 version alias now resolves to Python 3.11.11. ([#1712](https://github.com/heroku/heroku-buildpack-python/pull/1712))
- The Python 3.10 version alias now resolves to Python 3.10.16. ([#1712](https://github.com/heroku/heroku-buildpack-python/pull/1712))
- The Python 3.9 version alias now resolves to Python 3.9.21. ([#1712](https://github.com/heroku/heroku-buildpack-python/pull/1712))

## [v268] - 2024-12-04

- Updated pip from 24.0 to 24.3.1. ([#1685](https://github.com/heroku/heroku-buildpack-python/pull/1685))
- Updated wheel from 0.44.0 to 0.45.1. ([#1707](https://github.com/heroku/heroku-buildpack-python/pull/1707))

## [v267] - 2024-11-12

- Deprecated using Pipenv without a lockfile (`Pipfile.lock`). ([#1695](https://github.com/heroku/heroku-buildpack-python/pull/1695))
- Fixed Poetry venv creation when using an outdated Python version whose `ensurepip` module doesn't enable isolated mode, and the app's build directory contents shadows a package imported by pip (such as `brotli`). ([#1698](https://github.com/heroku/heroku-buildpack-python/pull/1698))

## [v266] - 2024-11-08

- Added a warning when the files for multiple package managers are found. In the future this warning will become an error. ([#1692](https://github.com/heroku/heroku-buildpack-python/pull/1692))
- Updated the build log message shown when installing dependencies to include the package manager command being run. ([#1689](https://github.com/heroku/heroku-buildpack-python/pull/1689))
- Changed test dependency installation on Heroku CI to now install `requirements.txt` and `requirements-test.txt` in a single `pip install` invocation rather than separately. This allows pip's resolver to resolve any version conflicts between the two files. ([#1689](https://github.com/heroku/heroku-buildpack-python/pull/1689))
- Improved the error messages and buildpack metrics for package manager related failures. ([#1689](https://github.com/heroku/heroku-buildpack-python/pull/1689))
- Improved the build log output, error messages and buildpack failure metrics for the NLTK downloader feature. ([#1690](https://github.com/heroku/heroku-buildpack-python/pull/1690))

## [v265] - 2024-11-06

- Fixed Poetry installation when using outdated patch versions of Python 3.8, 3.9 and 3.10, whose bundled pip doesn't support the `--python` option. ([#1687](https://github.com/heroku/heroku-buildpack-python/pull/1687))

## [v264] - 2024-11-06

- Added support for the package manager Poetry. Apps must have a `pyproject.toml` + `poetry.lock` and no other package manager files (otherwise pip/Pipenv will take precedence for backwards compatibility). ([#1682](https://github.com/heroku/heroku-buildpack-python/pull/1682))

## [v263] - 2024-10-31

- Fixed cache handling so that it now also discards the cache when the package manager (or its version) changes. ([#1679](https://github.com/heroku/heroku-buildpack-python/pull/1679))
- Improved the build log output shown when restoring or discarding the cache. For example, if the cache was invalidated all reasons are now shown. ([#1679](https://github.com/heroku/heroku-buildpack-python/pull/1679))
- Stopped performing unnecessary cache file copies when the cache is due to be invalidated. This required moving the cache restoration step to after the `bin/pre_compile` hook runs. ([#1679](https://github.com/heroku/heroku-buildpack-python/pull/1679))
- Fixed cache restoration in the case where an app's `requirements.txt` was formerly a symlink. ([#1679](https://github.com/heroku/heroku-buildpack-python/pull/1679))
- Added buildpack metrics for the status of the cache and duration of cache restoration/saving. ([#1679](https://github.com/heroku/heroku-buildpack-python/pull/1679))

## [v262] - 2024-10-25

- Updated buildpack-generated warning messages to use colour and be more consistently formatted. ([#1666](https://github.com/heroku/heroku-buildpack-python/pull/1666))
- Improved build log output and error messages for the `bin/pre_compile` and `bin/post_compile` customisation hooks. ([#1667](https://github.com/heroku/heroku-buildpack-python/pull/1667))

## [v261] - 2024-10-14

- Added support for configuring the Python version using a `.python-version` file. Both the `3.N` and `3.N.N` version forms are supported (the former is recommended). The existing `runtime.txt` file will take precedence if both files are found, however, we recommend switching to `.python-version` since it is more commonly supported in the Python ecosystem. ([#1664](https://github.com/heroku/heroku-buildpack-python/pull/1664))
- Added support for specifying only the Python major version in `runtime.txt` instead of requiring the full Python version (for example `python-3.N` instead of `python-3.N.N`). ([#1664](https://github.com/heroku/heroku-buildpack-python/pull/1664))

## [v260] - 2024-10-10

- Added support for Python 3.13. ([#1661](https://github.com/heroku/heroku-buildpack-python/pull/1661))
- Removed the `idle3` and `pydoc3` scripts since they do not work with relocated Python and so have been broken for some time. Invoke them via their modules instead (e.g. `python -m pydoc`). ([#1661](https://github.com/heroku/heroku-buildpack-python/pull/1661))

## [v259] - 2024-10-09

- Improved build log output about the detected Python version. ([#1658](https://github.com/heroku/heroku-buildpack-python/pull/1658))
- Improved error messages shown when the requested Python version is not a valid version string or is for an unknown/non-existent major Python version. ([#1658](https://github.com/heroku/heroku-buildpack-python/pull/1658))
- Improved error messages shown when `Pipfile.lock` is not valid JSON. ([#1658](https://github.com/heroku/heroku-buildpack-python/pull/1658))
- Fixed invalid Python versions being silently ignored when they were specified via the `python_version` field in `Pipfile.lock`. ([#1658](https://github.com/heroku/heroku-buildpack-python/pull/1658))
- Added support for Python 3.9 on Heroku-24. ([#1656](https://github.com/heroku/heroku-buildpack-python/pull/1656))
- Added buildpack metrics for use of outdated Python patch versions and occurrences of internal errors. ([#1657](https://github.com/heroku/heroku-buildpack-python/pull/1657))
- Improved the robustness of buildpack error handling by enabling `inherit_errexit`. ([#1655](https://github.com/heroku/heroku-buildpack-python/pull/1655))

## [v258] - 2024-10-01

- Added support for Python 3.12.7. ([#1650](https://github.com/heroku/heroku-buildpack-python/pull/1650))
- Changed the default Python version for new apps from 3.12.6 to 3.12.7. ([#1650](https://github.com/heroku/heroku-buildpack-python/pull/1650))
- Fixed Django collectstatic debug output being shown if `DEBUG_COLLECTSTATIC` was set to `0` or the empty string. ([#1646](https://github.com/heroku/heroku-buildpack-python/pull/1646))
- Stopped adding a trailing `:` to `C_INCLUDE_PATH`, `CPLUS_INCLUDE_PATH`, `LIBRARY_PATH`, `LD_LIBRARY_PATH` and `PKG_CONFIG_PATH`. ([#1645](https://github.com/heroku/heroku-buildpack-python/pull/1645))
- Removed remnants of the unused `.heroku/vendor/` directory. ([#1644](https://github.com/heroku/heroku-buildpack-python/pull/1644))

## [v257] - 2024-09-24

- Moved the SQLite3 install step prior to installing dependencies when using Pipenv. This now matches the behaviour when using pip and allows dependencies to actually use the headers. ([#1640](https://github.com/heroku/heroku-buildpack-python/pull/1640))
- Stopped exposing the `SKIP_PIP_INSTALL` env var to `bin/post_compile` and other subprocesses when using Pipenv. ([#1640](https://github.com/heroku/heroku-buildpack-python/pull/1640))
- Stopped creating `.heroku/python/requirements-{declared,installed}.txt` files when using pip. ([#1640](https://github.com/heroku/heroku-buildpack-python/pull/1640))
- Stopped creating a placeholder `requirements.txt` file when an app only has a `setup.py` file and no other package manager files. Instead pip is now invoked directly using `--editable .`. ([#1640](https://github.com/heroku/heroku-buildpack-python/pull/1640))
- Improved buildpack metrics for package manager detection and duration of install steps. ([#1640](https://github.com/heroku/heroku-buildpack-python/pull/1640))
- Updated buildpack-generated error messages to use colour and be more consistently formatted. ([#1639](https://github.com/heroku/heroku-buildpack-python/pull/1639))

## [v256] - 2024-09-07

- Added support for Python 3.8.20, 3.9.20, 3.10.15, 3.11.10 and 3.12.6. ([#1632](https://github.com/heroku/heroku-buildpack-python/pull/1632))
- Changed the default Python version for new apps from 3.12.5 to 3.12.6. ([#1632](https://github.com/heroku/heroku-buildpack-python/pull/1632))
- Updated wheel from 0.43.0 to 0.44.0. ([#1629](https://github.com/heroku/heroku-buildpack-python/pull/1629))

## [v255] - 2024-08-07

- Added support for Python 3.12.5. ([#1622](https://github.com/heroku/heroku-buildpack-python/pull/1622))
- Changed the default Python version for new apps from 3.12.4 to 3.12.5. ([#1622](https://github.com/heroku/heroku-buildpack-python/pull/1622))

## [v254] - 2024-07-16

- Updated setuptools from 69.2.0 to 70.3.0. ([#1614](https://github.com/heroku/heroku-buildpack-python/pull/1614))
- Updated pipenv from 2023.12.1 to 2024.0.1. ([#1601](https://github.com/heroku/heroku-buildpack-python/pull/1601))

## [v253] - 2024-07-01

- Improved the error messages shown when an app is missing the necessary Python package manager files. ([#1608](https://github.com/heroku/heroku-buildpack-python/pull/1608))

## [v252] - 2024-06-17

- Removed export of `Pipfile.lock` to `requirements.txt` during the build. ([#1593](https://github.com/heroku/heroku-buildpack-python/pull/1593))
- Removed internal `pipenv-to-pip` script that was unintentionally exposed onto `PATH`. ([#1593](https://github.com/heroku/heroku-buildpack-python/pull/1593))
- Stopped exposing the internal `BIN_DIR`, `BPLOG_PREFIX`, `EXPORT_PATH` and `PROFILE_PATH` environment variables to `bin/{pre,post}_compile` and other subprocesses. ([#1595](https://github.com/heroku/heroku-buildpack-python/pull/1595) and [#1597](https://github.com/heroku/heroku-buildpack-python/pull/1597))
- Implemented the `bin/report` build report API and removed log based metrics. ([#1597](https://github.com/heroku/heroku-buildpack-python/pull/1597))

## [v251] - 2024-06-07

- Added support for Python 3.12.4. ([#1591](https://github.com/heroku/heroku-buildpack-python/pull/1591))
- Changed the default Python version for new apps from 3.12.3 to 3.12.4. ([#1591](https://github.com/heroku/heroku-buildpack-python/pull/1591))

## [v250] - 2024-04-26

- Added support for Heroku-24. ([#1575](https://github.com/heroku/heroku-buildpack-python/pull/1575))

## [v249] - 2024-04-18

- Improved the error message shown for EOL Python versions when using a stack for which those versions were never built. ([#1570](https://github.com/heroku/heroku-buildpack-python/pull/1570))
- Fixed the "Python security update is available" warning being shown when the requested version is newer than the latest version known to the buildpack. ([#1569](https://github.com/heroku/heroku-buildpack-python/pull/1569))
- Fixed glibc warnings seen when downgrading the stack version. ([#1568](https://github.com/heroku/heroku-buildpack-python/pull/1568))
- Changed compression format and S3 URL for Python runtime archives. ([#1567](https://github.com/heroku/heroku-buildpack-python/pull/1567))
- Adjusted compiler options used to build Python for improved parity with the Docker Hub Python images. ([#1566](https://github.com/heroku/heroku-buildpack-python/pull/1566))
- Excluded `LD_LIBRARY_PATH` and `PYTHONHOME` app config vars when invoking subprocesses during the build. ([#1565](https://github.com/heroku/heroku-buildpack-python/pull/1565))

## [v248] - 2024-04-09

- Added support for Python 3.12.3. ([#1560](https://github.com/heroku/heroku-buildpack-python/pull/1560))
- Changed the default Python version for new apps from 3.12.2 to 3.12.3. ([#1560](https://github.com/heroku/heroku-buildpack-python/pull/1560))

## [v247] - 2024-04-08

- Added support for Python 3.11.9. ([#1558](https://github.com/heroku/heroku-buildpack-python/pull/1558))

## [v246] - 2024-03-25

- Updated pip from 23.3.2 to 24.0. ([#1541](https://github.com/heroku/heroku-buildpack-python/pull/1541))
- Updated setuptools from 68.2.2 to 69.2.0. ([#1553](https://github.com/heroku/heroku-buildpack-python/pull/1553))
- Updated wheel from 0.42.0 to 0.43.0. ([#1550](https://github.com/heroku/heroku-buildpack-python/pull/1550))
- Updated pipenv from 2023.11.15 to 2023.12.1. ([#1540](https://github.com/heroku/heroku-buildpack-python/pull/1540))

## [v245] - 2024-03-21

- Added support for Python 3.8.19, 3.9.19 and 3.10.14. ([#1551](https://github.com/heroku/heroku-buildpack-python/pull/1551))

## [v244] - 2024-03-13

- Improved the automatic `WEB_CONCURRENCY` feature: ([#1547](https://github.com/heroku/heroku-buildpack-python/pull/1547))
  - Switched to a dynamic calculation based on dyno CPU cores and memory instead of a hardcoded mapping.
  - Decreased default concurrency on `performance-m` / `private-m` / `shield-m` dynos from `8` to `5`.
  - Increased default concurrency on `performance-l` / `private-l` / `shield-l` dynos from `11` to `17`.
  - Added logging of memory/CPU/concurrency information to the app logs (for web dynos only).

## [v243] - 2024-02-07

- Added support for Python 3.11.8 and 3.12.2. ([#1538](https://github.com/heroku/heroku-buildpack-python/pull/1538)).
- Changed the default Python version for new apps from 3.12.1 to 3.12.2. ([#1538](https://github.com/heroku/heroku-buildpack-python/pull/1538))

## [v242] - 2024-01-11

- Updated pip from 23.3.1 to 23.3.2. ([#1524](https://github.com/heroku/heroku-buildpack-python/pull/1524))
- Fixed repeat/cached Pipenv builds of local `file =` dependencies. ([#1526](https://github.com/heroku/heroku-buildpack-python/pull/1526))
- Fixed the caching of editable VCS Pipenv dependency repositories. ([#1528](https://github.com/heroku/heroku-buildpack-python/pull/1528))

## [v241] - 2023-12-08

- Changed the default Python version for new apps from Python 3.11 to Python 3.12. ([#1516](https://github.com/heroku/heroku-buildpack-python/pull/1516)).
- Added support for Python 3.11.7 and 3.12.1. ([#1517](https://github.com/heroku/heroku-buildpack-python/pull/1517) and [#1518](https://github.com/heroku/heroku-buildpack-python/pull/1518)).
- Added a deprecation warning for Python 3.8. ([#1515](https://github.com/heroku/heroku-buildpack-python/pull/1515))

## [v240] - 2023-11-30

- Updated setuptools from 68.0.0 to 68.2.2. ([#1501](https://github.com/heroku/heroku-buildpack-python/pull/1501))
- Updated wheel from 0.41.3 to 0.42.0. ([#1511](https://github.com/heroku/heroku-buildpack-python/pull/1511))
- Updated pipenv from 2023.7.23 to 2023.11.15. ([#1502](https://github.com/heroku/heroku-buildpack-python/pull/1502) and [#1512](https://github.com/heroku/heroku-buildpack-python/pull/1512))

## [v239] - 2023-11-08

- Dropped support for Python 3.7. ([#1508](https://github.com/heroku/heroku-buildpack-python/pull/1508))

## [v238] - 2023-11-06

- Updated pip from 23.2.1 to 23.3.1. ([#1496](https://github.com/heroku/heroku-buildpack-python/pull/1496))
- Updated wheel from 0.41.0 to 0.41.3. ([#1482](https://github.com/heroku/heroku-buildpack-python/pull/1482) and [#1503](https://github.com/heroku/heroku-buildpack-python/pull/1503))

## [v237] - 2023-10-03

- Fixed `pkgutil.find_loader` deprecation warning when using Python 3.12. ([#1493](https://github.com/heroku/heroku-buildpack-python/pull/1493))

## [v236] - 2023-10-02

- Added support for Python 3.12. ([#1490](https://github.com/heroku/heroku-buildpack-python/pull/1490))
- Added support for Python 3.11.6. ([#1491](https://github.com/heroku/heroku-buildpack-python/pull/1491))
- Changed the default Python version for new apps from 3.11.5 to 3.11.6. ([#1491](https://github.com/heroku/heroku-buildpack-python/pull/1491))

## [v235] - 2023-08-25

- Added support for Python 3.8.18, 3.9.18, 3.10.13 and 3.11.5. ([#1477](https://github.com/heroku/heroku-buildpack-python/pull/1477))
- Changed the default Python version for new apps from 3.11.4 to 3.11.5. ([#1477](https://github.com/heroku/heroku-buildpack-python/pull/1477))

## [v234] - 2023-07-24

- Updated pip from 23.1.2 to 23.2.1. ([#1465](https://github.com/heroku/heroku-buildpack-python/pull/1465) and [#1470](https://github.com/heroku/heroku-buildpack-python/pull/1470))
- Updated setuptools from 67.8.0 to 68.0.0. ([#1467](https://github.com/heroku/heroku-buildpack-python/pull/1467))
- Updated wheel from 0.40.0 to 0.41.0. ([#1469](https://github.com/heroku/heroku-buildpack-python/pull/1469))
- Updated pipenv from 2023.2.4 to 2023.7.23. ([#1468](https://github.com/heroku/heroku-buildpack-python/pull/1468) and [#1471](https://github.com/heroku/heroku-buildpack-python/pull/1471))
- Updated the Python 3.7 deprecation message to reflect that it has now reached end-of-life. ([#1460](https://github.com/heroku/heroku-buildpack-python/pull/1460))

## [v233] - 2023-06-07

- Python 3.7.17, 3.8.17, 3.9.17, 3.10.12 and 3.11.4 are now available ([#1454](https://github.com/heroku/heroku-buildpack-python/pull/1454)).
- The default Python version for new apps is now 3.11.4 (previously 3.11.3) ([#1454](https://github.com/heroku/heroku-buildpack-python/pull/1454)).
- Updated setuptools from 67.7.2 to 67.8.0. ([#1456](https://github.com/heroku/heroku-buildpack-python/pull/1456))
- Removed support for Heroku-18. ([#1449](https://github.com/heroku/heroku-buildpack-python/pull/1449))

## [v232] - 2023-04-27

- Updated pip from 23.0.1 to 23.1.2. ([#1441](https://github.com/heroku/heroku-buildpack-python/pull/1441))
- Updated setuptools from 67.6.1 to 67.7.2. ([#1441](https://github.com/heroku/heroku-buildpack-python/pull/1441))
- The pip bootstrap step is now performed using the pip wheel bundled with the Python stdlib, rather than one downloaded from S3. ([#1442](https://github.com/heroku/heroku-buildpack-python/pull/1442) and [#1444](https://github.com/heroku/heroku-buildpack-python/pull/1444))

## [v231] - 2023-04-12

- Updated setuptools from 63.4.3 to 67.6.1. ([#1437](https://github.com/heroku/heroku-buildpack-python/pull/1437))
- Updated wheel from 0.38.4 to 0.40.0. ([#1437](https://github.com/heroku/heroku-buildpack-python/pull/1437))
- Raised curl connection timeout threshold from 5 to 10 seconds. ([#1439](https://github.com/heroku/heroku-buildpack-python/pull/1439))

## [v230] - 2023-04-06

- Python 3.10.11 and 3.11.3 are now available ([#1433](https://github.com/heroku/heroku-buildpack-python/pull/1433)).
- The default Python version for new apps is now 3.11.3 (previously 3.11.2) ([#1433](https://github.com/heroku/heroku-buildpack-python/pull/1433)).

## [v229] - 2023-03-10

- Downgrade pipenv from 2023.2.18 to 2023.2.4 ([#1425](https://github.com/heroku/heroku-buildpack-python/pull/1425)).

## [v228] - 2023-02-21

- Drop support for Python 3.6 ([#1415](https://github.com/heroku/heroku-buildpack-python/pull/1415)).

## [v227] - 2023-02-20

- Update pip from 22.3.1 to 23.0.1 for Python 3.7+ ([#1413](https://github.com/heroku/heroku-buildpack-python/pull/1413)).
- Update pipenv from 2023.2.4 to 2023.2.18 for Python 3.7+ ([#1412](https://github.com/heroku/heroku-buildpack-python/pull/1412)).

## [v226] - 2023-02-14

- Use Python 3.11 as the default Python version for new apps (previously Python 3.10) ([#1408](https://github.com/heroku/heroku-buildpack-python/pull/1408)).
- Update wheel from 0.37.1 to 0.38.4 for Python 3.7+ ([#1409](https://github.com/heroku/heroku-buildpack-python/pull/1409)).

## [v225] - 2023-02-08

- Python 3.10.10 and 3.11.2 are now available ([#1405](https://github.com/heroku/heroku-buildpack-python/pull/1405)).
- The default Python version for new apps is now 3.10.10 (previously 3.10.9) ([#1405](https://github.com/heroku/heroku-buildpack-python/pull/1405)).
- Update Pipenv from 2020.11.15 to: ([#1407](https://github.com/heroku/heroku-buildpack-python/pull/1407))
  - 2022.4.8 for Python 3.6
  - 2023.2.4 for Python 3.7+
- Add a deprecation warning for Python 3.7 ([#1404](https://github.com/heroku/heroku-buildpack-python/pull/1404)).

## [v224] - 2022-12-07

- Python 3.7.16, 3.8.16, 3.9.16, 3.10.9 and 3.11.1 are now available ([#1392](https://github.com/heroku/heroku-buildpack-python/pull/1392)).
- The default Python version for new apps is now 3.10.9 (previously 3.10.8) ([#1392](https://github.com/heroku/heroku-buildpack-python/pull/1392)).

## [v223] - 2022-11-07

- Update pip from 22.2.2 to 22.3.1 for Python 3.7+ ([#1387](https://github.com/heroku/heroku-buildpack-python/pull/1387)).

## [v222] - 2022-10-25

- Add support for Python 3.11 ([#1379](https://github.com/heroku/heroku-buildpack-python/pull/1379)).

## [v221] - 2022-10-12

- Python 3.7.15, 3.8.15, 3.9.15 and 3.10.8 are now available ([#1376](https://github.com/heroku/heroku-buildpack-python/pull/1376)).
- The default Python version for new apps is now 3.10.8 (previously 3.10.7) ([#1376](https://github.com/heroku/heroku-buildpack-python/pull/1376)).
- Fix automatic provisioning of Postgres DB addons ([#1375](https://github.com/heroku/heroku-buildpack-python/pull/1375)).

## [v220] - 2022-09-28

- Improve the wording of the Python 2.7 EOL error message ([#1367](https://github.com/heroku/heroku-buildpack-python/pull/1367)).

## [v219] - 2022-09-26

- Drop support for Python 2.7, 3.4 and 3.5 ([#1364](https://github.com/heroku/heroku-buildpack-python/pull/1364)).
- Drop support for PyPy ([#1364](https://github.com/heroku/heroku-buildpack-python/pull/1364)).
- The Heroku Postgres database auto-provisioning feature now provisions a DB in fewer cases ([#1363](https://github.com/heroku/heroku-buildpack-python/pull/1363)).

## [v218] - 2022-09-07

- Python 3.7.14, 3.8.14 and 3.9.14 are now available ([#1362](https://github.com/heroku/heroku-buildpack-python/pull/1362)).

## [v217] - 2022-09-06

- Python 3.10.7 is now available ([#1361](https://github.com/heroku/heroku-buildpack-python/pull/1361)).
- The default Python version for new apps is now 3.10.7 (previously 3.10.6) ([#1361](https://github.com/heroku/heroku-buildpack-python/pull/1361)).

## [v216] - 2022-08-17

- Ensure path rewriting works when using setuptools v64's new PEP660-based editable install mode ([#1357](https://github.com/heroku/heroku-buildpack-python/pull/1357)).
- Display an EOL warning for Python 3.4, 3.5 and 3.6 ([#1356](https://github.com/heroku/heroku-buildpack-python/pull/1356)).
- Improve the EOL warning for Python 2.7 ([#1356](https://github.com/heroku/heroku-buildpack-python/pull/1356)).
- Display a deprecation warning for PyPy support ([#1356](https://github.com/heroku/heroku-buildpack-python/pull/1356)).

## [v215] - 2022-08-15

- Update pip from 22.1.2 to 22.2.2 for Python 3.7+ ([#1344](https://github.com/heroku/heroku-buildpack-python/pull/1344)).
- Update setuptools from 60.10.0 to 63.4.3 for Python 3.7+ ([#1344](https://github.com/heroku/heroku-buildpack-python/pull/1344)).
- Prevent stray `cp: cannot stat ...` error message in build log output when using Pipenv ([#1350](https://github.com/heroku/heroku-buildpack-python/pull/1350)).
- Remove `BUILD_WITH_GEO_LIBRARIES` sunset messaging ([#1347](https://github.com/heroku/heroku-buildpack-python/pull/1347)).
- Remove outdated Django version warning ([#1345](https://github.com/heroku/heroku-buildpack-python/pull/1345)).
- Remove redundant package install warning checks ([#1348](https://github.com/heroku/heroku-buildpack-python/pull/1348)).

## [v214] - 2022-08-02

- Python 3.10.6 is now available ([#1342](https://github.com/heroku/heroku-buildpack-python/pull/1342)).
- The default Python version for new apps is now 3.10.6 (previously 3.10.5) ([#1342](https://github.com/heroku/heroku-buildpack-python/pull/1342)).

## [v213] - 2022-06-14

- Enable retries and connection timeouts when using `curl` ([#1335](https://github.com/heroku/heroku-buildpack-python/pull/1335)).
- Correct the error message shown when downloading a valid Python version fails ([#1335](https://github.com/heroku/heroku-buildpack-python/pull/1335)).
- Switch to the recommended regional S3 domain instead of the global one ([#1334](https://github.com/heroku/heroku-buildpack-python/pull/1334)).

## [v212] - 2022-06-07

- Python 3.10.5 is now available ([#1332](https://github.com/heroku/heroku-buildpack-python/pull/1332)).
- The default Python version for new apps is now 3.10.5 (previously 3.10.4) ([#1332](https://github.com/heroku/heroku-buildpack-python/pull/1332)).
- Update pip from 22.0.4 to 22.1.2 for Python 3.7+ ([#1331](https://github.com/heroku/heroku-buildpack-python/pull/1331)).
- Add support for Heroku-22 ([#1299](https://github.com/heroku/heroku-buildpack-python/pull/1299)).

## [v211] - 2022-05-17

- Python 3.9.13 is now available ([#1326](https://github.com/heroku/heroku-buildpack-python/pull/1326)).
- Use shared builds + LTO when building Python 3.10 binaries ([#1320](https://github.com/heroku/heroku-buildpack-python/pull/1320)).
  Note: This and the other Python binary changes below will only take effect for future Python
  version releases (or future Heroku stacks) - existing Python binaries are not being recompiled.
- Strip debugging symbols from the Python binary and libraries ([#1321](https://github.com/heroku/heroku-buildpack-python/pull/1321)).
- Switch the pre-generated `.pyc` files for the Python stdlib from `timestamp` to `unchecked-hash` validation mode, for improved compatibility with Cloud Native Buildpacks ([#1322](https://github.com/heroku/heroku-buildpack-python/pull/1322)).
- Stop shipping optimisation level one and two `.pyc` files with the Python stdlib ([#1322](https://github.com/heroku/heroku-buildpack-python/pull/1322)).
- Use the `expat` package from the stack image rather than CPython's vendored version, when building
  Python binaries ([#1319](https://github.com/heroku/heroku-buildpack-python/pull/1319)).

## [v210] - 2022-04-14

- Fix typo in the `BUILD_WITH_GEO_LIBRARIES` end-of-life error message ([#1307](https://github.com/heroku/heroku-buildpack-python/pull/1307)).
- No longer set a fallback value for `$STACK`, since it is always set on Heroku ([#1308](https://github.com/heroku/heroku-buildpack-python/pull/1308)).
- Adjust the configure options and packaging process for Python 3.7 releases, to enable loadable extensions in the `_sqlite` module, and to remove the `idle_test` module ([#1309](https://github.com/heroku/heroku-buildpack-python/pull/1309)). This change will only take effect as of the next Python 3.7 release (3.7.14).
- Update pip from 21.3.1 to 22.0.4 for Python 3.7+ ([#1310](https://github.com/heroku/heroku-buildpack-python/pull/1310))
- Update setuptools from 57.5.0 to: ([#1310](https://github.com/heroku/heroku-buildpack-python/pull/1310))
  - 59.6.0 for Python 3.6
  - 60.10.0 for Python 3.7+
- Update wheel from 0.37.0 to 0.37.1 for Python 2.7 and Python 3.5+ ([#1310](https://github.com/heroku/heroku-buildpack-python/pull/1310))

## [v209] - 2022-03-24

- Python 3.9.12 and 3.10.4 are now available (CPython) ([#1300](https://github.com/heroku/heroku-buildpack-python/pull/1300)).
- The default Python version for new apps is now 3.10.4 (previously 3.10.3) ([#1300](https://github.com/heroku/heroku-buildpack-python/pull/1300)).

## [v208] - 2022-03-23

- Use Python 3.10 as the default Python version for new apps (previously Python 3.9) ([#1296](https://github.com/heroku/heroku-buildpack-python/pull/1296)).

## [v207] - 2022-03-16

- Python 3.7.13, 3.8.13, 3.9.11 and 3.10.3 are now available (CPython) ([#1293](https://github.com/heroku/heroku-buildpack-python/pull/1293)).
- The default Python version for new apps is now 3.9.11 (previously 3.9.10) ([#1293](https://github.com/heroku/heroku-buildpack-python/pull/1293)).
- Adjust the configure options and packaging process for Python 3.8 releases to enable PGO, enable loadable extensions in the `_sqlite` module, and to remove the `idle_test` module ([#1293](https://github.com/heroku/heroku-buildpack-python/pull/1293)). Python 3.8 releases on Heroku prior to 3.8.13 are not affected.

## [v206] - 2022-01-14

- Python 3.9.10 and 3.10.2 are now available (CPython) ([#1281](https://github.com/heroku/heroku-buildpack-python/pull/1281)).
- The default Python version for new apps is now 3.9.10 (previously 3.9.9) ([#1281](https://github.com/heroku/heroku-buildpack-python/pull/1281)).

## [v205] - 2021-12-06

- Python 3.10.1 is now available ([#1271](https://github.com/heroku/heroku-buildpack-python/pull/1271)).

## [v204] - 2021-11-16

- Python 3.9.9 is now available ([#1268](https://github.com/heroku/heroku-buildpack-python/pull/1268)).
- The default Python version for new apps is now 3.9.9 (previously 3.9.8) ([#1268](https://github.com/heroku/heroku-buildpack-python/pull/1268)).

## [v203] - 2021-11-08

- Python 3.9.8 is now available ([#1263](https://github.com/heroku/heroku-buildpack-python/pull/1263)).
- The default Python version for new apps is now 3.9.8 (previously 3.9.7) ([#1263](https://github.com/heroku/heroku-buildpack-python/pull/1263)).
- Adjust the configure options and packaging process for Python 3.9 releases to enable PGO, enable loadable extensions in the `_sqlite` module, and to remove the `idle_test` module ([#1263](https://github.com/heroku/heroku-buildpack-python/pull/1263)). Python 3.9 releases on Heroku prior to 3.9.8 are not affected.

## [v202] - 2021-11-01

- Update pip from 20.2.4 to: ([#1259](https://github.com/heroku/heroku-buildpack-python/pull/1259))
  - 20.3.4 for Python 2.7 and 3.5
  - 21.3.1 for Python 3.6+

## [v201] - 2021-10-20

- Update setuptools from 47.1.1 to: ([#1254](https://github.com/heroku/heroku-buildpack-python/pull/1254))
  - 50.3.2 for Python 3.5
  - 57.5.0 for Python 3.6+
- Update wheel from 0.36.2 to 0.37.0 for Python 2.7 and Python 3.5+ ([#1254](https://github.com/heroku/heroku-buildpack-python/pull/1254)).
- Perform editable package `.pth` and `.egg-link` path rewriting at runtime ([#1252](https://github.com/heroku/heroku-buildpack-python/pull/1252)).

## [v200] - 2021-10-04

- Add support for Python 3.10 ([#1246](https://github.com/heroku/heroku-buildpack-python/pull/1246)).
- Adjust the configure options and packaging process for Python 3.10 to enable PGO, enable loadable extensions in the `_sqlite` module, and to remove the `idle_test` module ([#1246](https://github.com/heroku/heroku-buildpack-python/pull/1246)).

## v199 - 2021-09-05

- Python 3.6.15 and 3.7.12 are now available (CPython) ([#1238](https://github.com/heroku/heroku-buildpack-python/pull/1238)).

## v198 - 2021-08-30

- Python 3.8.12 and 3.9.7 are now available (CPython) ([#1236](https://github.com/heroku/heroku-buildpack-python/pull/1236)).
- The default Python version for new apps is now 3.9.7 (previously 3.9.6) ([#1236](https://github.com/heroku/heroku-buildpack-python/pull/1236)).

## v197 - 2021-06-28

- Python 3.6.14, 3.7.11, 3.8.11 and 3.9.6 are now available (CPython) ([#1219](https://github.com/heroku/heroku-buildpack-python/pull/1219)).
- The default Python version for new apps is now 3.9.6 (previously 3.9.5) ([#1219](https://github.com/heroku/heroku-buildpack-python/pull/1219)).
- Remove testing & binary generation support for Heroku-16 ([#1214](https://github.com/heroku/heroku-buildpack-python/pull/1214)).

## v196 - 2021-05-25

- Django collectstatic is no longer skipped if `DISABLE_COLLECTSTATIC` is set to `0` or the empty string ([#1208](https://github.com/heroku/heroku-buildpack-python/pull/1208)).
- If Django collectstatic is skipped, output the reason why ([#1208](https://github.com/heroku/heroku-buildpack-python/pull/1208)).
- Output a deprecation warning when collectstatic is skipped via the `.heroku/collectstatic_disabled` file ([#1208](https://github.com/heroku/heroku-buildpack-python/pull/1208)).
- Remove redundant "Cedar-14 is unsupported" error ([#1212](https://github.com/heroku/heroku-buildpack-python/pull/1212)).

## v195 - 2021-05-03

- Python 3.8.10 and 3.9.5 are now available (CPython) ([#1204](https://github.com/heroku/heroku-buildpack-python/pull/1204)).

## v194 - 2021-04-26

- Always output the Python version used and reason why ([#1196](https://github.com/heroku/heroku-buildpack-python/pull/1196)).

## v193 - 2021-04-13

- Update pip from 20.1.1 to 20.2.4 for Python 2.7 and Python 3.5+ ([#1192](https://github.com/heroku/heroku-buildpack-python/pull/1192)).
- Update wheel from 0.34.2 to 0.36.2 for Python 2.7 and Python 3.5+ ([#1191](https://github.com/heroku/heroku-buildpack-python/pull/1191)).
- Support build environments where `$BUILD_DIR` is set to a symlink of `/app` ([#992](https://github.com/heroku/heroku-buildpack-python/pull/992)).

## v192 - 2021-04-06

- Python 3.8.9 and 3.9.4 are now available (CPython) ([#1188](https://github.com/heroku/heroku-buildpack-python/pull/1188)).
- Use Python 3.9 as the default Python version for new apps (previously Python 3.6) ([#1187](https://github.com/heroku/heroku-buildpack-python/pull/1187)).
- Remove Airflow `SLUGIFY_USES_TEXT_UNIDECODE` workaround ([#1186](https://github.com/heroku/heroku-buildpack-python/pull/1186)).
- Fix grammar in the Python 2 EOL message ([#1182](https://github.com/heroku/heroku-buildpack-python/pull/1182)).

## v191 - 2021-02-19

- Python 3.8.8 and 3.9.2 are now available (CPython) ([#1178](https://github.com/heroku/heroku-buildpack-python/pull/1178)).

## v190 - 2021-02-16

- Python 3.6.13 and 3.7.10 are now available (CPython) ([#1174](https://github.com/heroku/heroku-buildpack-python/pull/1174)).
- The default Python version for new apps is now 3.6.13 (previously 3.6.12) ([#1174](https://github.com/heroku/heroku-buildpack-python/pull/1174)).

## v189 - 2021-02-12

- Update pipenv from `2018.5.18` to `2020.11.15` ([#1169](https://github.com/heroku/heroku-buildpack-python/pull/1169)).
- Remove pinning of pip to `9.0.2` when using pipenv ([#1169](https://github.com/heroku/heroku-buildpack-python/pull/1169)).

## v188 - 2020-12-21

- Python 3.8.7 is now available (CPython) ([#1125](https://github.com/heroku/heroku-buildpack-python/pull/1125)).

## v187 - 2020-12-08

- Python 3.9.1 is now available (CPython) ([#1127](https://github.com/heroku/heroku-buildpack-python/pull/1127)).

## v186 - 2020-11-18

- Update the `BUILD_WITH_GEO_LIBRARIES` error message ([#1121](https://github.com/heroku/heroku-buildpack-python/pull/1121)).
- Switch NLTK feature detection away from `sp-grep` ([#1119](https://github.com/heroku/heroku-buildpack-python/pull/1119)).
- Switch Django collectstatic feature detection away from `sp-grep` ([#1119](https://github.com/heroku/heroku-buildpack-python/pull/1119)).
- Remove vendored `sp-grep` script ([#1119](https://github.com/heroku/heroku-buildpack-python/pull/1119)).
- Remove vendored `pip-diff` script ([#1118](https://github.com/heroku/heroku-buildpack-python/pull/1118)).
- Remove vendored `pip-grep` script ([#1116](https://github.com/heroku/heroku-buildpack-python/pull/1116)).

## v185 - 2020-11-12

- Error if the unsupported `BUILD_WITH_GEO_LIBRARIES` env var is set ([#1115](https://github.com/heroku/heroku-buildpack-python/pull/1115)).
- Remove deprecated GDAL/GEOS/PROJ support ([#1113](https://github.com/heroku/heroku-buildpack-python/pull/1113)).
- Remove vendored `jq` binary ([#1112](https://github.com/heroku/heroku-buildpack-python/pull/1112)).
- Remove redundant Mercurial install step ([#1111](https://github.com/heroku/heroku-buildpack-python/pull/1111)).
- Remove support for the Cedar-14 stack ([#1110](https://github.com/heroku/heroku-buildpack-python/pull/1110)).

## v184 - 2020-10-21

- Vendor buildpack-stdlib instead of fetching from S3 ([#1100](https://github.com/heroku/heroku-buildpack-python/pull/1100)).
- Fix metric names for metrics emitted within `sub_env` ([#1099](https://github.com/heroku/heroku-buildpack-python/pull/1099)).

## v183 - 2020-10-12

- Add support for Heroku-20 ([#968](https://github.com/heroku/heroku-buildpack-python/pull/968)).

## v182 - 2020-10-06

- Python 3.9.0 is now available (CPython) ([#1090](https://github.com/heroku/heroku-buildpack-python/pull/1090)).
- Migrate from the `lang-python` S3 bucket to `heroku-buildpack-python` ([#1089](https://github.com/heroku/heroku-buildpack-python/pull/1089)).
- Remove `vendor/shunit2` ([#1086](https://github.com/heroku/heroku-buildpack-python/pull/1086)).
- Replace `BUILDPACK_VENDOR_URL` and `USE_STAGING_BINARIES` with `BUILDPACK_S3_BASE_URL` ([#1085](https://github.com/heroku/heroku-buildpack-python/pull/1085)).

## v181 - 2020-09-29

- PyPy 2.7 and 3.6, version 7.3.2 are now available (Note: PyPy support is in beta) ([#1081](https://github.com/heroku/heroku-buildpack-python/pull/1081)).

## v180 - 2020-09-24

- Python 3.8.6 is now available (CPython) ([#1072](https://github.com/heroku/heroku-buildpack-python/pull/1072)).

## v179 - 2020-09-23

- Remove duplicate pipenv metric event ([#1070](https://github.com/heroku/heroku-buildpack-python/pull/1070)).
- Emit metrics for how the Python version was chosen for an app ([#1069](https://github.com/heroku/heroku-buildpack-python/pull/1069)).
- Emit Python version metric events for all builds, not just clean installs ([#1066](https://github.com/heroku/heroku-buildpack-python/pull/1066)).

## v178 - 2020-09-07

- Python 3.5.10 is now available (CPython) ([#1062](https://github.com/heroku/heroku-buildpack-python/pull/1062)).

## v177 - 2020-08-18

- Python 3.6.12 and 3.7.9 are now available (CPython) ([#1054](https://github.com/heroku/heroku-buildpack-python/pull/1054)).
- The default Python version for new apps is now 3.6.12 (previously 3.6.11) ([#1054](https://github.com/heroku/heroku-buildpack-python/pull/1054)).

## v176 - 2020-08-12

- Rebuild the Python 3.4.10 archives with the correct version of Python ([#1048](https://github.com/heroku/heroku-buildpack-python/pull/1048)).
- Fix the security update version check message for apps using PyPy ([#1040](https://github.com/heroku/heroku-buildpack-python/pull/1040)).
- Remove `vendor/test-utils` ([#1043](https://github.com/heroku/heroku-buildpack-python/pull/1043)).

## v175 - 2020-08-05

- Update pip from 20.0.2 to 20.1.1 for Python 2.7 and Python 3.5+ ([#1030](https://github.com/heroku/heroku-buildpack-python/pull/1030)).
- Update setuptools from 39.0.1 to: ([#1024](https://github.com/heroku/heroku-buildpack-python/pull/1024))
  - 44.1.1 for Python 2.7
  - 43.0.0 for Python 3.4
  - 47.1.1 for Python 3.5+
- Switch the `heroku-buildpack-python` repository default branch from `master` to `main` ([#1029](https://github.com/heroku/heroku-buildpack-python/pull/1029)).

## v174 - 2020-07-30

- For repeat builds, also manage the installed versions of setuptools/wheel, rather than just that of pip ([#1007](https://github.com/heroku/heroku-buildpack-python/pull/1007)).
- Install an explicit version of wheel rather than the latest release at the time ([#1007](https://github.com/heroku/heroku-buildpack-python/pull/1007)).
- Output the installed version of pip, setuptools and wheel in the build log ([#1007](https://github.com/heroku/heroku-buildpack-python/pull/1007)).
- Errors installing pip/setuptools/wheel are now displayed in the build output and fail the build early ([#1007](https://github.com/heroku/heroku-buildpack-python/pull/1007)).
- Install pip using itself rather than `get-pip.py` ([#1007](https://github.com/heroku/heroku-buildpack-python/pull/1007)).
- Disable pip's version check + cache when installing pip/setuptools/wheel ([#1007](https://github.com/heroku/heroku-buildpack-python/pull/1007)).
- Install setuptools from PyPI rather than a vendored copy ([#1007](https://github.com/heroku/heroku-buildpack-python/pull/1007)).
- Reduce the number of environment variables exposed to `bin/{pre,post}_compile` and other subprocesses ([#1011](https://github.com/heroku/heroku-buildpack-python/pull/1011)).

## v173 - 2020-07-21

- Python 3.8.5 is now available (CPython).

## v172 - 2020-07-17

- Python 3.8.4 is now available (CPython).

## v171 - 2020-07-07

- Python 3.6.11 and 3.7.8 are now available (CPython).

## v170 - 2020-05-19

- Python 2.7.18, 3.5.9, 3.7.7 and 3.8.3 are now available (CPython).
- PyPy 2.7 and 3.6, version 7.3.1 are now available (Note: PyPy support is in beta).
- Docs: Fix explanation of runtime.txt generation when using pipenv.
- Bugfix: Correctly detect Python version when using a `python_version` of `3.8` in `Pipfile.lock`.

## v169 - 2020-04-22

- Add a Hatchet test for python 3.8.2
- Set Code Owners to `@heroku/languages`
- Bugfix: Caching on subsequent redeploys
- Update tests to support latest version of Python

## v168 - 2020-04-06

- Doc: Update Readme with version numbers
- update Code Owners to include the Heroku Buildpack Maintainers team
- Deprecation warning: `BUILD_WITH_GEO_LIBRARIES` is now deprecated. See warning for details.
- Clean up build log output
- Update Python versions in README to match docs
- Django version detection fixed, link updated

## v167 - 2020-03-26

- Add failcase for cache busting
- Bugfix: Clearing pip dependencies

## v166 - 2020-03-05

- Correct ftp to https in vendored file
- Warn for Django 1.11 approaching EOL, provide link to roadmap

## v165 - 2020-02-27

- Python 3.8.2 now available.

## v164 - 2020-02-20

- Update requirements.txt builds to use pip 20.0.2
- Download get-pip.py to tmpdir instead of root dir

## v163 - 2019-12-23

- New pythons released:
  Python 3.8.1, 3.7.6, 3.6.10 (CPython)
  Beta Release: Pypy 2.7 and 3.6, version 7.2.0

## v162 - 2019-12-06

- Bug fix: fragile sqlite3 install

## v161 - 2019-12-02

- Bug fix: Sqlite3 version bump

## v160 - 2019-10-23

- Bugfix: Pipenv no longer installs twice in CI

## v159 - 2019-10-22

- Python 2.7.17 now available on Heroku 18 and 16.

## v158 - 2019-10-21

- Python 3.7.5 and 3.8.0 now available on Heroku 18 and 16.
- Add support for Python 3.8 branch
- Sqlite3 Update:
  - Test Improvements
- Add support for staging binary testing

## v157 - 2019-09-18

- Typo fixes

## v156 - 2019-09-12

- Python 3.6.9 and 3.7.4 now available.

- Move get-pip utility to S3
- Build utility and documentation updates
- Bump Hatchet tests to point at new default python version.

## v155 - 2019-08-22

add docs and make target for heroku-18 bob builds

## v154 - 2019-07-17

Fix python 3.5.7 formula actually building 3.7.2

## v153 - 2019-06-21

Hotfix for broken heroku-16 deploys

## v152 - 2019-04-04

Python 3.7.3 now available.

## v151 - 2019-03-21

Python 3.5.7 and 3.4.10 now available on all Heroku stacks.

## v150 - 2019-03-13

Python 2.7.16 now available on all Heroku stacks.

## v149 - 2019-03-04

Hotfix for broken Cedar 14 deploys

## v148 - 2019-02-21

No user facing changes, improving internal metrics

## v147 - 2019-02-07

Python 3.7.2 and 3.6.8 now available on all Heroku stacks.

## v146 - 2018-11-11

Python 3.7.1, 3.6.7, 3.5.6 and 3.4.9 now available on all Heroku stacks.

## v145 - 2018-11-08

Testing and tooling expanded to better support new runtimes

## v144 - 2018-10-10

Switch to cautious upgrade for Pipenv install to ensure the pinned pip version
is used with Pipenv

## v143 - 2018-10-09

Add support for detecting `SLUGIFY_USES_TEXT_UNIDECODE`, which is required to
install Apache Airflow version 1.10 or higher.

## v142 - 2018-10-08

Improvements to Python install messaging

## v139, 140, 141

No user-facing changes, documenting for version clarity

## v138 - 2018-08-01

Use stack image SQLite3 instead of vendoring

## v137 - 2018-07-17

Prevent 3.7.0 from appearing as unsupported in buildpack messaging.

## v136 - 2018-06-28

Upgrade to 3.6.6 and support 3.7.0 on all runtimes.

## v135 - 2018-05-29

Upgrade Pipenv to v2018.5.18.

## v134 - 2018-05-02

Default to 3.6.5, bugfixes.

## v133

Fixes for pip 10 release.

## v132

Improve pip installation, with the release of v9.0.2.

## v131

Fix bug with pip.

## v130

Better upgrade strategy for pip.

## v129

Don't upgrade pip (from v128).

## v128

Upgrade pip, pin to Pipenv v11.8.2.

## v127

Pin to Pipenv v11.7.1.

## v126

Bugfixes.

## v125

Bugfixes.

## v124

Update buildpack to automatically install `[dev-packages]` during Heroku CI Pipenv builds.

- Skip installs if Pipfile.lock hasn't changed, and uninstall stale dependencies with Pipenv.
- Set `PYTHONPATH` during collectstatic runs.
- No longer warn if there is no `Procfile`.
- Update Pipenv's "3.6" runtime specifier to point to "3.6.4".

## v123

Update gunicorn `init.d` script to allow overrides.

## v122

Update default Python to v3.6.4.

## v121

Update default Python to v3.6.3.

## v120

Use `$ pipenv --deploy`.

## v119

Improvements to Pipenv support, warning on unsupported Python versions.

- We now warn when a user is not using latest 2.x or 3.x Python.
- Heroku now supports `[requires]` `python_full_version` in addition to `python_version`.

## v118

Improvements to Pipenv support.

## v117

Bug fix.

## v116

Vendoring improvements.

- Geos libraries should work on Heroku-16 now.
- The libffi/libmemcached vendoring step is now skipped on Heroku-16 (since they are installed in the base image).

## v115

Revert a pull request.

- No longer using `sub_env` for `pip install` step.

## v114

- Bugfixes.

Blacklisting `PYTHONHOME` and `PYTHONPATH` for older apps. Upgrades to nltk support.

## v113

Updates to Pipenv support.

## v112

Bugfix.

- Fixed grep output bug.

## v111

Linting, bugfixes.

## v110

Update default Python to 3.6.2.

## v109

Update Default Python to 3.6.1, bugfixes.

- Fixed automatic pip uninstall of dependencies removed from requirements.txt.

## v108

Fix output for collectstatic step.

## v107

Bugfix for C dependency installation.

## v106

Don't install packages that could mess up packaging.

 - The Python buildpack will automatically remove `six`, `pyparsing`, `appdirs`,
   `setuptools`, and `distribute` from a `requirements.txt` file now, as these
   packages are provided by the Python buildpack.

## v105

Improvements to output messaging.

## v104

General improvements.

- Fix for Heroku CI.
- Use `pkg_resources` to check if a distribution is installed instead of
  parsing `requirements.txt`. ([#395](https://github.com/heroku/heroku-buildpack-python/pull/395))

## v103

Bug fixes and improvements.

- Fix for Pipenv.
- Fix for Heroku CI.
- Improve handling of `WEB_CONCURRENCY` when using multiple buildpacks.
- Adjust environment variables set during the build to more closely match those in the dyno environment (`DYNO` is now available, `STACK` is not).
- Restore the build cache prior to running bin/pre_compile.

## v102

Buildpack code cleanup.

- Improved messaging around NLTK.

## v101

Updated setuptools installation method.

- Improved pipenv support.

## v100

Preliminary pipenv support.

## v99

Cleanup.

## v98

Official NLTK support and other improvements.

- Support for `nltk.txt` file for declaring corpora to be downloaded.
- Leading zeros for auto-set `WEB_CONCURRENCY`.

## v97

Improved egg-link functionality.

## v96

Bugfix.

## v95

Improved output support.

## v94

Improved support for PyPy.

## v93

Improved support for PyPy.

## v92

Improved cache functionality and fix egg-links regression.

## v91

Bugfix, rolled back to v88.

## v90

Bugfix.

## v89

Improved cache functionality and fix egg-links regression.

## v88

Fixed bug with editable pip installations.

## v87

Updated default Python 2.7.13.

- Python 2.7.13 uses UCS-4 build, more compatible with linux wheels.
- Updated setuptools to v32.1.0.

## v86

Refactor and multi-buildpack compatibility.

## v85

Packaging fix.

## v84

Updated pip and setuptools.

- Updated pip to v9.0.1.
- Updated setuptools to v28.8.0.

## v83

Support for Heroku CI.

- Cffi support for argon2

## v82 - 2016-08-22

Update to library detection mechanisms (pip-pop).

- Updated setuptools to v25.5.0

## v81 - 2016-06-28

Updated default Python to 2.7.11.

- Updated pip to v8.1.2.
- Updated setuptools to v23.1.0.

## v80 - 2016-04-05

Improved pip-pop compatibility with latest pip releases.

## v79 - 2016-03-22

Compatibility improvements with heroku-apt-buildpack.

## v78 - 2016-03-18

Added automatic configuration of Gunicorn's `FORWARDED_ALLOW_IPS` setting.

Improved detection of libffi dependency when using bcrypt via `Django[bcrypt]`.

Improved GDAL support.

- GDAL dependency detection now checks for pygdal and is case-insensitive.
- The vendored GDAL library has been updated to 1.11.1.
- GDAL bootstrapping now also installs the GEOS and Proj.4 libraries.

Updated pip to 8.1.1 and setuptools to 20.3.

## v77 - 2016-02-10

Improvements to warnings and minor bugfix.

## v76 - 2016-02-08

Improved Django collectstatic support.

- `$ python manage.py collectstatic` will only be run if `Django` is present in `requirements.txt`.
- If collectstatic fails, the build fails. Full traceback is provided.
- `$DISABLE_COLLECTSTATIC`: skip collectstatic step completely (not new).
- `$DEBUG_COLLECTSTATIC`: echo environment variables upon collectstatic failure.
- Updated build output style.
- New warning for outdated Python (via pip `InsecurePlatform` warning).

## v75 - 2016-01-29

Updated pip and Setuptools.

## v74 - 2015-12-29

Added warnings for lack of Procfile.

## v72 - 2015-12-07

Updated default Python to 2.7.11.

## v72 - 2015-12-03

Added friendly warnings for common build failures.

## v70 - 2015-10-29

Improved compatibility with multi and node.js buildpacks.

## v69 - 2015-10-12

Revert to v66.

## v68 - 2015-10-12

Fixed `.heroku/venv` error with modern apps.

## v67 - 2015-10-12

Further improved cache compatibility with multi and node.js buildpacks.

## v66 - 2015-10-09

Improved compatibility with multi and node.js buildpacks.

## v65 - 2015-10-08

Reverted v64.

## v64 - 2015-10-08

Improved compatibility with multi and node.js buildpacks.

## v63 - 2015-10-08

Updated pip and Setuptools.

- Setuptools updated to v18.3.2
- pip updated to v7.1.2

## v62 - 2015-08-07

Updated pip and Setuptools.

- Setuptools updated to v18.1
- pip updated to v7.1.0

## v61 - 2015-06-30

Updated pip and Setuptools.

- Setuptools updated to v18.0.1
- pip updated to v7.0.3

## v60 - 2015-05-27

Default Python is now latest 2.7.10. Updated pip and Distribute.

- Default Python version is v2.7.10
- Setuptools updated to v16.0
- pip updated to v7.0.1

[unreleased]: https://github.com/heroku/heroku-buildpack-python/compare/v294...main
[v294]: https://github.com/heroku/heroku-buildpack-python/compare/v293...v294
[v293]: https://github.com/heroku/heroku-buildpack-python/compare/v292...v293
[v292]: https://github.com/heroku/heroku-buildpack-python/compare/v291...v292
[v291]: https://github.com/heroku/heroku-buildpack-python/compare/v290...v291
[v290]: https://github.com/heroku/heroku-buildpack-python/compare/v289...v290
[v289]: https://github.com/heroku/heroku-buildpack-python/compare/v288...v289
[v288]: https://github.com/heroku/heroku-buildpack-python/compare/v287...v288
[v287]: https://github.com/heroku/heroku-buildpack-python/compare/v286...v287
[v286]: https://github.com/heroku/heroku-buildpack-python/compare/v285...v286
[v285]: https://github.com/heroku/heroku-buildpack-python/compare/v284...v285
[v284]: https://github.com/heroku/heroku-buildpack-python/compare/v283...v284
[v283]: https://github.com/heroku/heroku-buildpack-python/compare/v282...v283
[v282]: https://github.com/heroku/heroku-buildpack-python/compare/v281...v282
[v281]: https://github.com/heroku/heroku-buildpack-python/compare/v280...v281
[v280]: https://github.com/heroku/heroku-buildpack-python/compare/v279...v280
[v279]: https://github.com/heroku/heroku-buildpack-python/compare/v278...v279
[v278]: https://github.com/heroku/heroku-buildpack-python/compare/v277...v278
[v277]: https://github.com/heroku/heroku-buildpack-python/compare/v276...v277
[v276]: https://github.com/heroku/heroku-buildpack-python/compare/v275...v276
[v275]: https://github.com/heroku/heroku-buildpack-python/compare/v274...v275
[v274]: https://github.com/heroku/heroku-buildpack-python/compare/v273...v274
[v273]: https://github.com/heroku/heroku-buildpack-python/compare/v272...v273
[v272]: https://github.com/heroku/heroku-buildpack-python/compare/v271...v272
[v271]: https://github.com/heroku/heroku-buildpack-python/compare/v270...v271
[v270]: https://github.com/heroku/heroku-buildpack-python/compare/v269...v270
[v269]: https://github.com/heroku/heroku-buildpack-python/compare/v268...v269
[v268]: https://github.com/heroku/heroku-buildpack-python/compare/v267...v268
[v267]: https://github.com/heroku/heroku-buildpack-python/compare/v266...v267
[v266]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v265...v266
[v265]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v264...archive/v265
[v264]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v263...archive/v264
[v263]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v262...archive/v263
[v262]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v261...archive/v262
[v261]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v260...archive/v261
[v260]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v259...archive/v260
[v259]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v258...archive/v259
[v258]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v257...archive/v258
[v257]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v256...archive/v257
[v256]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v255...archive/v256
[v255]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v254...archive/v255
[v254]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v253...archive/v254
[v253]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v252...archive/v253
[v252]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v251...archive/v252
[v251]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v250...archive/v251
[v250]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v249...archive/v250
[v249]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v248...archive/v249
[v248]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v247...archive/v248
[v247]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v246...archive/v247
[v246]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v245...archive/v246
[v245]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v244...archive/v245
[v244]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v243...archive/v244
[v243]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v242...archive/v243
[v242]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v241...archive/v242
[v241]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v240...archive/v241
[v240]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v239...archive/v240
[v239]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v238...archive/v239
[v238]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v237...archive/v238
[v237]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v236...archive/v237
[v236]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v235...archive/v236
[v235]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v234...archive/v235
[v234]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v233...archive/v234
[v233]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v232...archive/v233
[v232]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v231...archive/v232
[v231]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v230...archive/v231
[v230]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v229...archive/v230
[v229]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v228...archive/v229
[v228]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v227...archive/v228
[v227]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v226...archive/v227
[v226]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v225...archive/v226
[v225]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v224...archive/v225
[v224]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v223...archive/v224
[v223]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v222...archive/v223
[v222]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v221...archive/v222
[v221]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v220...archive/v221
[v220]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v219...archive/v220
[v219]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v218...archive/v219
[v218]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v217...archive/v218
[v217]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v216...archive/v217
[v216]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v215...archive/v216
[v215]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v214...archive/v215
[v214]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v213...archive/v214
[v213]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v212...archive/v213
[v212]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v211...archive/v212
[v211]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v210...archive/v211
[v210]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v209...archive/v210
[v209]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v208...archive/v209
[v208]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v207...archive/v208
[v207]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v206...archive/v207
[v206]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v205...archive/v206
[v205]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v204...archive/v205
[v204]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v203...archive/v204
[v203]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v202...archive/v203
[v202]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v201...archive/v202
[v201]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v200...archive/v201
[v200]: https://github.com/heroku/heroku-buildpack-python/compare/archive/v199...archive/v200
