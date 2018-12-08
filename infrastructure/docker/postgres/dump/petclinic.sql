--
-- PostgreSQL database dump
--

-- Dumped from database version 10.4 (Debian 10.4-2.pgdg90+1)
-- Dumped by pg_dump version 10.4 (Debian 10.4-2.pgdg90+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: petclinic_app; Type: SCHEMA; Schema: -; Owner: petclinicuser
--

CREATE SCHEMA IF NOT EXISTS petclinic_app;


ALTER SCHEMA petclinic_app OWNER TO petclinicuser;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: owners; Type: TABLE; Schema: petclinic_app; Owner: petclinicuser
--

CREATE TABLE petclinic_app.owners (
    id bigint NOT NULL,
    first_name text,
    last_name text,
    address text,
    city text,
    telephone text
);


ALTER TABLE petclinic_app.owners OWNER TO petclinicuser;

--
-- Name: owners_id_seq; Type: SEQUENCE; Schema: petclinic_app; Owner: petclinicuser
--

CREATE SEQUENCE petclinic_app.owners_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE petclinic_app.owners_id_seq OWNER TO petclinicuser;

--
-- Name: owners_id_seq; Type: SEQUENCE OWNED BY; Schema: petclinic_app; Owner: petclinicuser
--

ALTER SEQUENCE petclinic_app.owners_id_seq OWNED BY petclinic_app.owners.id;


--
-- Name: pets; Type: TABLE; Schema: petclinic_app; Owner: petclinicuser
--

CREATE TABLE petclinic_app.pets (
    id bigint NOT NULL,
    name text,
    birth_date date,
    type_id bigint NOT NULL,
    owner_id bigint NOT NULL
);


ALTER TABLE petclinic_app.pets OWNER TO petclinicuser;

--
-- Name: pets_id_seq; Type: SEQUENCE; Schema: petclinic_app; Owner: petclinicuser
--

CREATE SEQUENCE petclinic_app.pets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE petclinic_app.pets_id_seq OWNER TO petclinicuser;

--
-- Name: pets_id_seq; Type: SEQUENCE OWNED BY; Schema: petclinic_app; Owner: petclinicuser
--

ALTER SEQUENCE petclinic_app.pets_id_seq OWNED BY petclinic_app.pets.id;


--
-- Name: specialties; Type: TABLE; Schema: petclinic_app; Owner: petclinicuser
--

CREATE TABLE petclinic_app.specialties (
    id bigint NOT NULL,
    name text
);


ALTER TABLE petclinic_app.specialties OWNER TO petclinicuser;

--
-- Name: specialties_id_seq; Type: SEQUENCE; Schema: petclinic_app; Owner: petclinicuser
--

CREATE SEQUENCE petclinic_app.specialties_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE petclinic_app.specialties_id_seq OWNER TO petclinicuser;

--
-- Name: specialties_id_seq; Type: SEQUENCE OWNED BY; Schema: petclinic_app; Owner: petclinicuser
--

ALTER SEQUENCE petclinic_app.specialties_id_seq OWNED BY petclinic_app.specialties.id;


--
-- Name: types; Type: TABLE; Schema: petclinic_app; Owner: petclinicuser
--

CREATE TABLE petclinic_app.types (
    id bigint NOT NULL,
    name text
);


ALTER TABLE petclinic_app.types OWNER TO petclinicuser;

--
-- Name: types_id_seq; Type: SEQUENCE; Schema: petclinic_app; Owner: petclinicuser
--

CREATE SEQUENCE petclinic_app.types_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE petclinic_app.types_id_seq OWNER TO petclinicuser;

--
-- Name: types_id_seq; Type: SEQUENCE OWNED BY; Schema: petclinic_app; Owner: petclinicuser
--

ALTER SEQUENCE petclinic_app.types_id_seq OWNED BY petclinic_app.types.id;


--
-- Name: vet_specialties; Type: TABLE; Schema: petclinic_app; Owner: petclinicuser
--

CREATE TABLE petclinic_app.vet_specialties (
    vet_id bigint NOT NULL,
    specialty_id bigint NOT NULL
);


ALTER TABLE petclinic_app.vet_specialties OWNER TO petclinicuser;

--
-- Name: vets; Type: TABLE; Schema: petclinic_app; Owner: petclinicuser
--

CREATE TABLE petclinic_app.vets (
    id bigint NOT NULL,
    first_name text,
    last_name text
);


ALTER TABLE petclinic_app.vets OWNER TO petclinicuser;

--
-- Name: vets_id_seq; Type: SEQUENCE; Schema: petclinic_app; Owner: petclinicuser
--

CREATE SEQUENCE petclinic_app.vets_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE petclinic_app.vets_id_seq OWNER TO petclinicuser;

--
-- Name: vets_id_seq; Type: SEQUENCE OWNED BY; Schema: petclinic_app; Owner: petclinicuser
--

ALTER SEQUENCE petclinic_app.vets_id_seq OWNED BY petclinic_app.vets.id;


--
-- Name: visits; Type: TABLE; Schema: petclinic_app; Owner: petclinicuser
--

CREATE TABLE petclinic_app.visits (
    id bigint NOT NULL,
    pet_id bigint NOT NULL,
    visit_date date,
    description text
);


ALTER TABLE petclinic_app.visits OWNER TO petclinicuser;

--
-- Name: visits_id_seq; Type: SEQUENCE; Schema: petclinic_app; Owner: petclinicuser
--

CREATE SEQUENCE petclinic_app.visits_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE petclinic_app.visits_id_seq OWNER TO petclinicuser;

--
-- Name: visits_id_seq; Type: SEQUENCE OWNED BY; Schema: petclinic_app; Owner: petclinicuser
--

ALTER SEQUENCE petclinic_app.visits_id_seq OWNED BY petclinic_app.visits.id;


--
-- Name: owners id; Type: DEFAULT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.owners ALTER COLUMN id SET DEFAULT nextval('petclinic_app.owners_id_seq'::regclass);


--
-- Name: pets id; Type: DEFAULT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.pets ALTER COLUMN id SET DEFAULT nextval('petclinic_app.pets_id_seq'::regclass);


--
-- Name: specialties id; Type: DEFAULT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.specialties ALTER COLUMN id SET DEFAULT nextval('petclinic_app.specialties_id_seq'::regclass);


--
-- Name: types id; Type: DEFAULT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.types ALTER COLUMN id SET DEFAULT nextval('petclinic_app.types_id_seq'::regclass);


--
-- Name: vets id; Type: DEFAULT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.vets ALTER COLUMN id SET DEFAULT nextval('petclinic_app.vets_id_seq'::regclass);


--
-- Name: visits id; Type: DEFAULT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.visits ALTER COLUMN id SET DEFAULT nextval('petclinic_app.visits_id_seq'::regclass);


--
-- Data for Name: owners; Type: TABLE DATA; Schema: petclinic_app; Owner: petclinicuser
--

COPY petclinic_app.owners (id, first_name, last_name, address, city, telephone) FROM stdin;
1	George	Franklin	110 W. Liberty St.	Madison	6085551023
2	Betty	Davis	638 Cardinal Ave.	Sun Prairie	6085551749
3	Eduardo	Rodriquez	2693 Commerce St.	McFarland	6085558763
4	Harold	Davis	563 Friendly St.	Windsor	6085553198
5	Peter	McTavish	2387 S. Fair Way	Madison	6085552765
6	Jean	Coleman	105 N. Lake St.	Monona	6085552654
7	Jeff	Black	1450 Oak Blvd.	Monona	6085555387
8	Maria	Escobito	345 Maple St.	Madison	6085557683
9	David	Schroeder	2749 Blackhawk Trail	Madison	6085559435
10	Carlos	Estaban	2335 Independence La.	Waunakee	6085555487
\.


--
-- Data for Name: pets; Type: TABLE DATA; Schema: petclinic_app; Owner: petclinicuser
--

COPY petclinic_app.pets (id, name, birth_date, type_id, owner_id) FROM stdin;
1	Leo	2000-09-07	1	1
2	Basil	2002-08-06	6	2
3	Rosy	2001-04-17	2	3
4	Jewel	2000-03-07	2	3
5	Iggy	2000-11-30	3	4
6	George	2000-01-20	4	5
7	Samantha	1995-09-04	1	6
8	Max	1995-09-04	1	6
9	Lucky	1999-08-06	5	7
10	Mulligan	1997-02-24	2	8
11	Freddy	2000-03-09	5	9
12	Lucky	2000-06-24	2	10
13	Sly	2002-06-08	1	10
\.


--
-- Data for Name: specialties; Type: TABLE DATA; Schema: petclinic_app; Owner: petclinicuser
--

COPY petclinic_app.specialties (id, name) FROM stdin;
1	radiology
2	surgery
3	dentistry
\.


--
-- Data for Name: types; Type: TABLE DATA; Schema: petclinic_app; Owner: petclinicuser
--

COPY petclinic_app.types (id, name) FROM stdin;
1	cat
2	dog
3	lizard
4	snake
5	bird
6	hamster
\.


--
-- Data for Name: vet_specialties; Type: TABLE DATA; Schema: petclinic_app; Owner: petclinicuser
--

COPY petclinic_app.vet_specialties (vet_id, specialty_id) FROM stdin;
2	1
3	2
4	2
5	1
\.


--
-- Data for Name: vets; Type: TABLE DATA; Schema: petclinic_app; Owner: petclinicuser
--

COPY petclinic_app.vets (id, first_name, last_name) FROM stdin;
1	James	Carter
2	Helen	Leary
3	Linda	Douglas
4	Rafael	Ortega
5	Henry	Stevens
6	Sharon	Jenkins
\.


--
-- Data for Name: visits; Type: TABLE DATA; Schema: petclinic_app; Owner: petclinicuser
--

COPY petclinic_app.visits (id, pet_id, visit_date, description) FROM stdin;
1	7	2010-03-04	rabies shot
2	8	2011-03-04	rabies shot
3	8	2009-06-04	neutered
4	7	2008-09-04	spayed
\.


--
-- Name: owners_id_seq; Type: SEQUENCE SET; Schema: petclinic_app; Owner: petclinicuser
--

SELECT pg_catalog.setval('petclinic_app.owners_id_seq', 1, false);


--
-- Name: pets_id_seq; Type: SEQUENCE SET; Schema: petclinic_app; Owner: petclinicuser
--

SELECT pg_catalog.setval('petclinic_app.pets_id_seq', 1, false);


--
-- Name: specialties_id_seq; Type: SEQUENCE SET; Schema: petclinic_app; Owner: petclinicuser
--

SELECT pg_catalog.setval('petclinic_app.specialties_id_seq', 1, false);


--
-- Name: types_id_seq; Type: SEQUENCE SET; Schema: petclinic_app; Owner: petclinicuser
--

SELECT pg_catalog.setval('petclinic_app.types_id_seq', 1, false);


--
-- Name: vets_id_seq; Type: SEQUENCE SET; Schema: petclinic_app; Owner: petclinicuser
--

SELECT pg_catalog.setval('petclinic_app.vets_id_seq', 1, false);


--
-- Name: visits_id_seq; Type: SEQUENCE SET; Schema: petclinic_app; Owner: petclinicuser
--

SELECT pg_catalog.setval('petclinic_app.visits_id_seq', 1, false);


--
-- Name: owners owners_pkey; Type: CONSTRAINT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.owners
    ADD CONSTRAINT owners_pkey PRIMARY KEY (id);


--
-- Name: pets pets_pkey; Type: CONSTRAINT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.pets
    ADD CONSTRAINT pets_pkey PRIMARY KEY (id);


--
-- Name: specialties specialties_pkey; Type: CONSTRAINT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.specialties
    ADD CONSTRAINT specialties_pkey PRIMARY KEY (id);


--
-- Name: types types_pkey; Type: CONSTRAINT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.types
    ADD CONSTRAINT types_pkey PRIMARY KEY (id);


--
-- Name: vet_specialties vet_specialties_pkey; Type: CONSTRAINT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.vet_specialties
    ADD CONSTRAINT vet_specialties_pkey PRIMARY KEY (vet_id);


--
-- Name: vets vets_pkey; Type: CONSTRAINT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.vets
    ADD CONSTRAINT vets_pkey PRIMARY KEY (id);


--
-- Name: visits visits_pkey; Type: CONSTRAINT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.visits
    ADD CONSTRAINT visits_pkey PRIMARY KEY (id);


--
-- Name: owners_first_name_idx; Type: INDEX; Schema: petclinic_app; Owner: petclinicuser
--

CREATE INDEX owners_first_name_idx ON petclinic_app.owners USING btree (lower(first_name));


--
-- Name: owners_last_name_idx; Type: INDEX; Schema: petclinic_app; Owner: petclinicuser
--

CREATE INDEX owners_last_name_idx ON petclinic_app.owners USING btree (lower(last_name));


--
-- Name: pets_name_idx; Type: INDEX; Schema: petclinic_app; Owner: petclinicuser
--

CREATE INDEX pets_name_idx ON petclinic_app.pets USING btree (lower(name));


--
-- Name: types_name_idx; Type: INDEX; Schema: petclinic_app; Owner: petclinicuser
--

CREATE INDEX types_name_idx ON petclinic_app.types USING btree (lower(name));


--
-- Name: vet_first_name_idx; Type: INDEX; Schema: petclinic_app; Owner: petclinicuser
--

CREATE INDEX vet_first_name_idx ON petclinic_app.vets USING btree (lower(first_name));


--
-- Name: vet_id_specialty_id; Type: INDEX; Schema: petclinic_app; Owner: petclinicuser
--

CREATE UNIQUE INDEX vet_id_specialty_id ON petclinic_app.vet_specialties USING btree (vet_id, specialty_id);


--
-- Name: vet_last_name_idx; Type: INDEX; Schema: petclinic_app; Owner: petclinicuser
--

CREATE INDEX vet_last_name_idx ON petclinic_app.vets USING btree (lower(last_name));


--
-- Name: pets pets_owner_id_fkey; Type: FK CONSTRAINT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.pets
    ADD CONSTRAINT pets_owner_id_fkey FOREIGN KEY (owner_id) REFERENCES petclinic_app.owners(id);


--
-- Name: pets pets_type_id_fkey; Type: FK CONSTRAINT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.pets
    ADD CONSTRAINT pets_type_id_fkey FOREIGN KEY (type_id) REFERENCES petclinic_app.types(id);


--
-- Name: vet_specialties vet_specialties_specialty_id_fkey; Type: FK CONSTRAINT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.vet_specialties
    ADD CONSTRAINT vet_specialties_specialty_id_fkey FOREIGN KEY (specialty_id) REFERENCES petclinic_app.specialties(id);


--
-- Name: vet_specialties vet_specialties_vet_id_fkey; Type: FK CONSTRAINT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.vet_specialties
    ADD CONSTRAINT vet_specialties_vet_id_fkey FOREIGN KEY (vet_id) REFERENCES petclinic_app.vets(id);


--
-- Name: visits visits_pet_id_fkey; Type: FK CONSTRAINT; Schema: petclinic_app; Owner: petclinicuser
--

ALTER TABLE ONLY petclinic_app.visits
    ADD CONSTRAINT visits_pet_id_fkey FOREIGN KEY (pet_id) REFERENCES petclinic_app.pets(id);


--
-- PostgreSQL database dump complete
--

