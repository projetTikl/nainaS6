SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP SCHEMA public CASCADE;
CREATE SCHEMA public;
ALTER SCHEMA public OWNER TO postgres;
COMMENT ON SCHEMA public IS 'standard public schema';
CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
SET search_path = public, pg_catalog;
SET default_tablespace = '';
SET default_with_oids = false;

CREATE TABLE admin (
    id_admin integer NOT NULL,
    login_admin character varying(255),
    pass_admin character varying(255)
);
ALTER TABLE admin OWNER TO postgres;

CREATE TABLE amis (
    id_amis integer NOT NULL,
    id_membre1 integer,
    id_membre2 integer,
    etat_amis integer
);
ALTER TABLE amis OWNER TO postgres;

CREATE TABLE discussion (
    id_discussion integer NOT NULL,
    id_login integer,
    etat_discussion boolean
);
ALTER TABLE discussion OWNER TO postgres;

CREATE TABLE login (
    id_login integer NOT NULL,
    id_membre integer,
    pseudo_login character varying(255),
    pass_login character varying(255)
);
ALTER TABLE login OWNER TO postgres;

CREATE TABLE membre (
    id_membre integer NOT NULL,
    nom_membre character varying(255),
    prenom_membre character varying(255),
    sexe_membre character varying(255),
    date_naissance_membre date
);
ALTER TABLE membre OWNER TO postgres;


ALTER TABLE ONLY admin
    ADD CONSTRAINT admin_pkey PRIMARY KEY (id_admin);

ALTER TABLE ONLY amis
    ADD CONSTRAINT amis_pkey PRIMARY KEY (id_amis);

ALTER TABLE ONLY discussion
    ADD CONSTRAINT discussion_pkey PRIMARY KEY (id_discussion);

ALTER TABLE ONLY login
    ADD CONSTRAINT login_pkey PRIMARY KEY (id_login);

ALTER TABLE ONLY membre
    ADD CONSTRAINT membre_pkey PRIMARY KEY (id_membre);

ALTER TABLE ONLY amis
    ADD CONSTRAINT amis_id_membre1_fkey FOREIGN KEY (id_membre1) REFERENCES membre(id_membre);

ALTER TABLE ONLY amis
    ADD CONSTRAINT amis_id_membre2_fkey FOREIGN KEY (id_membre2) REFERENCES membre(id_membre);

ALTER TABLE ONLY discussion
    ADD CONSTRAINT discussion_id_login_fkey FOREIGN KEY (id_login) REFERENCES login(id_login);

ALTER TABLE ONLY login
    ADD CONSTRAINT login_id_membre_fkey FOREIGN KEY (id_membre) REFERENCES membre(id_membre);

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
