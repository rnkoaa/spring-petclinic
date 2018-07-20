#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER petclinicuser WITH PASSWORD 'petclinicuser';
    CREATE DATABASE petclinic;
    GRANT ALL PRIVILEGES ON DATABASE petclinic TO petclinicuser;
    CREATE SCHEMA petclinic.petclinic_app
EOSQL
