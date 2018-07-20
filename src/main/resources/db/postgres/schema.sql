--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name:petclinic_app; Type: SCHEMA; Schema: -; Owner: petclinicuser
--

CREATE SCHEMA IF NOT EXISTS petclinic_app;

ALTER SCHEMA petclinic_app OWNER TO petclinicuser;

SET search_path = petclinic_app, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

CREATE TABLE IF NOT EXISTS vets (
  id BIGSERIAL PRIMARY KEY,
  first_name TEXT,
  last_name TEXT
) ;

ALTER TABLE vets OWNER TO petclinicuser;
CREATE INDEX IF NOT EXISTS vet_last_name_idx ON vets ((lower(last_name)));
CREATE INDEX IF NOT EXISTS vet_first_name_idx ON vets ((lower(first_name)));

--
-- Name: specialties; Type: TABLE; Schema: petclinic_app; Owner: petclinicuser
--
CREATE TABLE IF NOT EXISTS specialties (
  id    BIGSERIAL PRIMARY KEY,
  name  TEXT
);

ALTER TABLE specialties OWNER TO petclinicuser;
CREATE INDEX IF NOT EXISTS specialty_name_idx ON vets ((lower(name)));

CREATE TABLE IF NOT EXISTS vet_specialties (
  vet_id        BIGINT PRIMARY KEY,
  specialty_id  BIGINT NOT NULL
);

ALTER TABLE vet_specialties OWNER TO petclinicuser;

CREATE UNIQUE INDEX vet_id_specialty_id ON vet_specialties (vet_id,specialty_id);

ALTER TABLE vet_specialties
   ADD CONSTRAINT fk_vet_specialities_vet_id
   FOREIGN KEY (vet_id)
   REFERENCES vets(id);

ALTER TABLE vet_specialties
  ADD CONSTRAINT fk_vet_specialities_specialty_id
  FOREIGN KEY (specialty_id)
  REFERENCES specialties(id);

CREATE TABLE IF NOT EXISTS types (
  id    BIGSERIAL PRIMARY KEY,
  name  TEXT
);
ALTER TABLE types OWNER TO petclinicuser;

CREATE INDEX IF NOT EXISTS types_name_idx ON types ((lower(name)));

CREATE TABLE IF NOT EXISTS owners (
  id            BIGSERIAL PRIMARY KEY,
  first_name    TEXT,
  last_name TEXT,
  address TEXT,
  city TEXT,
  telephone TEXT
);
ALTER TABLE owners OWNER TO petclinicuser;

CREATE INDEX IF NOT EXISTS owners_last_name_idx ON owners ((lower(last_name)));

CREATE INDEX IF NOT EXISTS owners_first_name_idx ON owners ((lower(first_name)));

CREATE TABLE IF NOT EXISTS pets (
  id BIGINT NOT NULL,
  name TEXT,
  birth_date DATE,
  type_id BIGINT NOT NULL,
  owner_id BIGINT NOT NULL
) ;

ALTER TABLE pets OWNER TO petclinicuser;

CREATE INDEX IF NOT EXISTS pets_name_idx ON pets ((lower(name)));

ALTER TABLE pets OWNER TO petclinicuser;

ALTER TABLE pets
   ADD CONSTRAINT fk_pets_owners_owner_id
   FOREIGN KEY (owner_id)
   REFERENCES owners(id);

ALTER TABLE pets
  ADD CONSTRAINT fk_pets_types_type_id
  FOREIGN KEY (type_id)
  REFERENCES types(id);

-- visits type: TABLE
CREATE TABLE IF NOT EXISTS visits (
  id BIGSERIAL PRIMARY KEY,
  pet_id BIGINT NOT NULL,
  visit_date DATE,
  description TEXT
);

ALTER TABLE visits OWNER TO petclinicuser;

ALTER TABLE visits
  ADD CONSTRAINT fk_visits_pets_pet_id FOREIGN KEY (pet_id) REFERENCES pets(id);
