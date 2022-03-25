CREATE TABLE Backpacks (
    ownerID INT,
    id SERIAL PRIMARY KEY UNIQUE,
    avaliableSlots INT,
    slot SMALLINT,
    totalSlots SMALLINT
);

CREATE TABLE Respawn Location (
    ownerID INT,
    id SERIAL PRIMARY KEY UNIQUE,
    description VARCHAR(300),
    timer INT,
    coordinateX INT,
    coordinateY INT
);

CREATE TYPE node_type as ENUM('sulfur', 'stone', 'metal');

CREATE TABLE Resouce Nodes (
    id SERIAL PRIMARY KEY UNIQUE,
    nodeType node_type,
    maxYield INT,
    durabilityDamage FLOAT
);



