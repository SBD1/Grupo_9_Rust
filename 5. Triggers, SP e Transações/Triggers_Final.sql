/* --------------------------------------------------

SGBD 1 - GRUPO 9
Script DDL - Triggers

----------------------------------------------------- */

/*
MAP
*/

CREATE TRIGGER insertMap
BEFORE INSERT ON Maps
FOR EACH ROW EXECUTE PROCEDURE insert_map();

/*
STRUCTURES
*/

CREATE TRIGGER insertStructures
BEFORE INSERT ON Structures
FOR EACH ROW EXECUTE PROCEDURE insert_structures();

/*
MONUMENTS
*/

CREATE TRIGGER insertMonuments
BEFORE INSERT ON Monuments
FOR EACH ROW EXECUTE PROCEDURE insert_monuments();

/*
REGION
*/

CREATE TRIGGER insertRegion
BEFORE INSERT ON Region
FOR EACH ROW EXECUTE PROCEDURE insert_region();

/*
PARTY
*/

CREATE TRIGGER insertParty
BEFORE INSERT ON Party
FOR EACH ROW EXECUTE PROCEDURE insert_party();

/*
*/

CREATE TRIGGER instanciateCharacter
AFTER INSERT ON characters
AS 
    INSERT INTO Backpack (new.charactersID);

CREATE TRIGGER insertBackpack
AFTER INSERT ON Backpack
FOR EACH ROW EXECUTE PROCEDURE insert_Backpack();