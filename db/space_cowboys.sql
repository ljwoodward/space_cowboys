DROP TABLE IF EXISTS bounties;

CREATE TABLE bounties (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  species VARCHAR(255),
  favourite_weapon VARCHAR(255),
  collected_by VARCHAR(255)
);
