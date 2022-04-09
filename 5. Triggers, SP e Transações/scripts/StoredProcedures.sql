/* -------------------------------------------------- 

SGBD 1 - GRUPO 9

Script DDL - Stored Procedures

----------------------------------------------------- */

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