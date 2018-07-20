CREATE USER petclinicuser WITH PASSWORD 'petclinicuser';
CREATE DATABASE petclinic;
GRANT ALL PRIVILEGES ON DATABASE petclinic TO petclinicuser;
CREATE SCHEMA petclinic.petclinic_app
