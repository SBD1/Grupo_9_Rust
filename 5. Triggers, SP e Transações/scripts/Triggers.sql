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
REGION
*/

CREATE TRIGGER insertRegion
BEFORE INSERT ON Region
FOR EACH ROW EXECUTE PROCEDURE insert_region();

/*
BIOMES
*/

CREATE TRIGGER insertBiomes
BEFORE INSERT ON Biomes
FOR EACH ROW EXECUTE PROCEDURE insert_biomes();

/*
CLIMATE


CREATE TRIGGER insertClimate
BEFORE INSERT ON Climate
FOR EACH ROW EXECUTE PROCEDURE insert_climate();
*/
/*
PARTY
*/

CREATE TRIGGER insertParty
BEFORE INSERT ON Party
FOR EACH ROW EXECUTE PROCEDURE insert_party();