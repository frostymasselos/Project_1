DROP TABLE animals;
DROP TABLE owners;
DROP TABLE vets;


CREATE TABLE vets (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR (225)
);

CREATE TABLE owners (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR (225),
  address VARCHAR (225),
  phone VARCHAR(225)
);

CREATE TABLE animals (
  id SERIAL8 PRIMARY KEY,
  name VARCHAR (225),
  d_o_b VARCHAR (225),
  type VARCHAR(225),
  notes TEXT,
  vet_id INT4 REFERENCES vets(id),
  owner_id INT4 REFERENCES owners(id)
);

  -- Am I right in thinking that animals table MUST be
  -- created after the rows it references?
