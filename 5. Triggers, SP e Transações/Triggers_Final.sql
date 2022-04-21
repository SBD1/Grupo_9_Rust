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
PARTY
*/

CREATE TRIGGER insertParty
BEFORE INSERT ON Party
FOR EACH ROW EXECUTE PROCEDURE insert_party();

/*
*/

CREATE TRIGGER instanciateCharacter
AFTER INSERT ON PlayerCharacters
FOR EACH ROW EXECUTE PROCEDURE insertCharacter_backpack();

CREATE TRIGGER insertBackpack
AFTER INSERT ON Backpack
FOR EACH ROW EXECUTE PROCEDURE insertBackpack();