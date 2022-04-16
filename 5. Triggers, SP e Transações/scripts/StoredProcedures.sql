/* -------------------------------------------------- 
SGBD 1 - GRUPO 9
Script DDL - Stored Procedures
----------------------------------------------------- */

/*
MAP
*/

CREATE OR REPLACE FUNCTION insert_map() RETURNS trigger AS $insert_map$
BEGIN
    PERFORM * FROM Maps WHERE mapID = new.mapID;
    IF FOUND THEN
        RAISE EXCEPTION 'Map already exists';
    END IF;
    RETURN NEW;
END;
$insert_map$ LANGUAGE plpgsql;

/*
REGION
*/

CREATE OR REPLACE FUNCTION insert_region() RETURNS trigger AS $insert_region$
BEGIN
    PERFORM * FROM Region WHERE name = new.name;
    IF FOUND THEN
        RAISE EXCEPTION 'Region already exists';
    END IF;
    RETURN NEW;
END;
$insert_region$ LANGUAGE plpgsql;

/*
BIOMES
*/

CREATE OR REPLACE FUNCTION insert_biomes() RETURNS trigger AS $insert_biomes$
BEGIN
    PERFORM * FROM Biomes WHERE biomesID = new.biomesID;
    IF FOUND THEN
        RAISE EXCEPTION 'Biome already exists';
    END IF;
    RETURN NEW;
END;
$insert_biomes$ LANGUAGE plpgsql;

/*
PARTY
*/

CREATE OR REPLACE FUNCTION insert_party() RETURNS trigger AS $insert_party$
BEGIN
    PERFORM * FROM Party WHERE partyID = new.partyID;
    IF FOUND THEN
        RAISE EXCEPTION 'Party already exists';
    END IF;
    PERFORM * FROM Party where character = new.character;
    IF FOUND THEN
        RAISE EXCEPTION 'Character is already in a party';
    END IF;
    PERFORM * FROM Party where capacity = 8;
    IF FOUND THEN
        RAISE EXCEPTION 'Party is already full';
    END IF;
    RETURN NEW;
END;
$insert_party$ LANGUAGE plpgsql;

