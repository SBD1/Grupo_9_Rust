CREATE OR REPLACE FUNCTION delete_player_character() RETURNS trigger
    AS $delete_player_character$
BEGIN
    DELETE FROM Characters
    WHERE charactersID = old.charactersID;
    RETURN NULL;
END;

CREATE OR REPLACE FUNCTION delete_main_character() RETURNS trigger
    AS $delete_main_character$
BEGIN
    DELETE FROM Characters
    WHERE charactersID = old.charactersID;
    RETURN NULL;
END;

CREATE OR REPLACE FUNCTION delete_recruitable_character() RETURNS trigger
    AS $delete_recruitable_character$
BEGIN
    DELETE FROM Characters
    WHERE charactersID = old.charactersID;
    RETURN NULL;
END;

CREATE OR REPLACE FUNCTION delete_npcs_character() RETURNS trigger
    AS $delete_npcs_character$
BEGIN
    DELETE FROM Characters
    WHERE charactersID = old.charactersID;
    RETURN NULL;
END;

CREATE OR REPLACE FUNCTION delete_animals_character() RETURNS trigger
    AS $delete_animals_character$
BEGIN
    DELETE FROM Characters
    WHERE charactersID = old.charactersID;
    RETURN NULL;
END;

CREATE OR REPLACE FUNCTION delete_scientists_character() RETURNS trigger
    AS $delete_scientists_character$
BEGIN
    DELETE FROM Characters
    WHERE charactersID = old.charactersID;
    RETURN NULL;
END;