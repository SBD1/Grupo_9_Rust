/* -------------------------------------------------- 

SGBD 1 - GRUPO 9
Script DDL - Stored Procedures

----------------------------------------------------- */

/*
MAP
*/

CREATE OR REPLACE FUNCTION instanciateCharacterFunction()
RETURNS trigger as $charCreation$
BEGIN
IF (TG_OP = 'INSERT') THEN
INSERT INTO Backpack VALUES (NEW.charactersID);
RETURN NEW;
END IF;
IF (TG_OP = 'DELETE') THEN 
DELETE FROM BACKPACK
WHERE ownerID = deleted.charactersID;
RETURN OLD;
END IF;
END;
$charCreation$ LANGUAGE plpgsql;

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
CLIMATE
*/

CREATE OR REPLACE FUNCTION insert_climate() RETURNS trigger AS $insert_climate$
BEGIN
    PERFORM * FROM Climate WHERE climateID = new.climateID;
    IF FOUND THEN
        RAISE EXCEPTION 'Climate already exists';
    END IF;
    RETURN NEW;
END;
$insert_climate$ LANGUAGE plpgsql;

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

CREATE OR REPLACE FUNCTION delete_player_character() RETURNS trigger AS $delete_player_character$
BEGIN
    DELETE FROM Characters
    WHERE charactersID = old.charactersID;
    RETURN NULL;
END;
$delete_player_character$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_main_character() RETURNS trigger AS $delete_main_character$
BEGIN
    DELETE FROM Characters
    WHERE charactersID = old.charactersID;
    RETURN NULL;
END;
$delete_main_character$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_recruitable_character() RETURNS trigger AS $delete_recruitable_character$
BEGIN
    DELETE FROM Characters
    WHERE charactersID = old.charactersID;
    RETURN NULL;
END;
$delete_recruitable_character$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_npcs_character() RETURNS trigger AS $delete_npcs_character$
BEGIN
    DELETE FROM Characters
    WHERE charactersID = old.charactersID;
    RETURN NULL;
END;
$delete_npcs_character$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_animals_character() RETURNS trigger AS $delete_animals_character$
BEGIN
    DELETE FROM Characters
    WHERE charactersID = old.charactersID;
    RETURN NULL;
END;
$delete_animals_character$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION delete_scientists_character() RETURNS trigger AS $delete_scientists_character$
BEGIN
    DELETE FROM Characters
    WHERE charactersID = old.charactersID;
    RETURN NULL;
END;
$delete_scientists_character$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_player_character() RETURNS trigger AS $insert_player_character$
BEGIN
    PERFORM * FROM Scientists WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM MainCharacter WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM RecruitableCharacters WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM NPCs WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM Animals WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    RETURN NEW;
END;
$insert_player_character$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_main_character() RETURNS trigger AS $insert_main_character$
BEGIN
    PERFORM * FROM PlayerCharacters WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM Scientists WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM RecruitableCharacters WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM NPCs WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM Animals WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    RETURN NEW;
END;
$insert_main_character$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_recruitable_character() RETURNS trigger AS $insert_recruitable_character$
BEGIN
    PERFORM * FROM PlayerCharacters WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM RecruitableCharacters WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM Scientists WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM NPCs WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM Animals WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    RETURN NEW;
END;
$insert_recruitable_character$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_npcs_character() RETURNS trigger AS $insert_npcs_character$
BEGIN
    PERFORM * FROM PlayerCharacters WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM RecruitableCharacters WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM RecruitableCharacters WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM Scientists WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM Animals WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    RETURN NEW;
END;
$insert_npcs_character$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_animals_character() RETURNS trigger AS $insert_animals_character$
BEGIN
    PERFORM * FROM PlayerCharacters WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM RecruitableCharacters WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM RecruitableCharacters WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM NPCs WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM Scientists WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    RETURN NEW;
END;
$insert_animals_character$ LANGUAGE plpgsql;

CREATE OR REPLACE FUNCTION insert_scientists_character() RETURNS trigger AS $insert_scientists_character$
BEGIN
    PERFORM * FROM PlayerCharacters WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM MainCharacter WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM RecruitableCharacters WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM NPCs WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    PERFORM * FROM Animals WHERE charactersID = new.charactersID;
    IF FOUND THEN
        RAISE EXCEPTION 'Character already exists';
    END IF;
    RETURN NEW;
END;
$insert_scientists_character$ LANGUAGE plpgsql;