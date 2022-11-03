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
CREATE TABLE owners (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	full_name VARCHAR(100) NOT NULL,
	age INTEGER NOT NULL
);

CREATE TABLE species (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	name VARCHAR(100) NOT NULL
);

/* wednesday */

alter table animals drop column species; /*DELETE COLUMN species*/
alter table animals add column species_id INT NULL REFERENCES species(id) ON DELETE CASCADE; /*ADD COLUMN species_id, which is a foreign key referencing species table*/
alter table animals add column owner_id INT NULL REFERENCES owners(id) ON DELETE CASCADE; /*ADD COLUMN owner_id, which is a foreign key referencing owners table*/
