#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER petclinicuser WITH PASSWORD 'petclinicuser';
    CREATE DATABASE petclinic;
    GRANT ALL PRIVILEGES ON DATABASE petclinic TO petclinicuser;
EOSQL

# psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
# psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
#     CREATE USER $PETCLINIC_USER WITH PASSWORD 'PETCLINIC_PASS';
#     CREATE DATABASE $PETCLINIC_DB;
#     GRANT ALL PRIVILEGES ON DATABASE $PETCLINIC_DB TO $PETCLINIC_USER;
# EOSQL
# CREATE SCHEMA $PETCLINIC_DB.petclinic_app

# Executes the main routine with environment variables
# passed through the command line. We don't use them in
# this script but now you know 🤓
# main "$@"
