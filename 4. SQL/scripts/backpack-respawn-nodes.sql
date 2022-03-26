CREATE TABLE Backpacks (
    ownerID INT,
    id SERIAL PRIMARY KEY UNIQUE,
    avaliableSlots INT,
    slot SMALLINT,
    totalSlots SMALLINT
);

CREATE TABLE RespawnLocation (
    ownerID INT,
    id SERIAL PRIMARY KEY UNIQUE,
    description VARCHAR(300),
    timer INT,
    coordinateX VARCHAR(5),
    coordinateY VARCHAR(5)
);

CREATE TYPE node_type as ENUM('sulfur', 'stone', 'metal', 'tree', 'cactus');

CREATE TABLE ResouceNodes (
    id SERIAL PRIMARY KEY UNIQUE,
    nodeType node_type,
    maxYield INT,
    durabilityDamage FLOAT
);



