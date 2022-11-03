/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts INTEGER,
  neutered BOOLEAN NOT NULL,
  weight_kg DOUBLE PRECISION NOT NULL,
	species VARCHAR(50) NOT NULL
);

/* wednesday */
/* New table for owners */
CREATE TABLE owners (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	full_name VARCHAR(100) NOT NULL,
	age INTEGER NOT NULL
);

/*New table for species */
CREATE TABLE species (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

/*Modify table */
CREATE TABLE animals (
  id BIGSERIAL NOT NULL PRIMARY KEY,
  name varchar(100) NOT NULL,
  date_of_birth DATE NOT NULL,
  escape_attempts INT NOT NULL,
  neutered BOOLEAN NOT NULL,
  weight_kg DOUBLE PRECISION NOT NULL
  species_id INT NULL REFERENCES species(id) ON DELETE CASCADE,
  owner_id INT NULL REFERENCES owners(id) ON DELETE CASCADE,
);
