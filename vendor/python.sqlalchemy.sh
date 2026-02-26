#!/usr/bin/env bash

set_sql_alchemy_url() {
	local database_url="${1}"
	local env_var="${2}"

	if grep --ignore-case --silent --no-messages "sqlalchemy" \
		"requirements.txt" "Pipfile" "pyproject.toml" \
		&& [[ "${database_url}" =~ "postgres://" ]]
	then
		# Replace 'postgres://' with 'postgresql://':
		local full_database_url="${database_url/postgres:\/\//postgresql://}"

		export "${env_var}=${full_database_url}"
	fi
}

for database_url_variable in $( env | awk -F "=" '{print $1}' | grep "SCALINGO_POSTGRESQL_URL" ); do
	set_sql_alchemy_url "$( eval echo "\$${database_url_variable}" )" "${database_url_variable//_URL/}_ALCHEMY_URL"
done
