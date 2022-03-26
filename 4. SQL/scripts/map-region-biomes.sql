CREATE TABLE Map ( 
    id SERIAL PRIMARY KEY UNIQUE,
    mapID int
);

CREATE TABLE Region ( 
    name VARCHAR(30),
    coordinates int,
    biome VARCHAR(30),
    dangerLevel SMALLINT,
    monument VARCHAR(30),
    FOREIGN KEY (monument) REFERENCES Monuments(name) ON DELETE RESTRICT
);

CREATE TABLE Biomes ( 
  biomesID int,
  coordinates int,
  resourceAbundance boolean,
  resourceAvailability boolean,
  type VARCHAR(30),
  climate int
);