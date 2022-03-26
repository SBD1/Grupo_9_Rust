CREATE TYPE monument_tier AS ENUM(0,1,2,3);
CREATE TYPE enemy_grade AS ENUM('scientist', 'outpost-scientist', 'heavy-scientist', 'bandit');

CREATE TABLE Monuments (
    monumentSize INT,
    id SERIAL PRIMARY KEY UNIQUE,
    lootGrade monument_tier,
    enemyGrade enemy_grade,
    regions VARCHAR(5),
    name VARCHAR(10)
);

CREATE TABLE LootCrates (
    quantifyOfItens INT,
    id SERIAL PRIMARY KEY UNIQUE,
    grade loot_grade
);

