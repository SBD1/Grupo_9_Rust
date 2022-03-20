/* -------------------------------------------------- 

SGBD 1 - GRUPO 9

Script DML - População do banco de dados

----------------------------------------------------- */

\connect rust;

INSERT INTO Characters VALUES (1, 'Character1', '10', 'model1', 1, 'type1', 'item1'),(2, 'Character2', '5', 'model2', 2, 'type2', 'item2'),(3, 'Character3', '20', 'model3', 3, 'type3', 'item3');
	
INSERT INTO PlayerCharacters VALUES (1, 10, 20, 30, 'type1', 1, 2, 3, 4, 5, 1),(2, 30, 20, 10, 'type2', 1, 5, 4, 3, 2, 2),(3, 30, 10, 20, 'type3', 1, 3, 5, 4, 2, 3);

INSERT INTO NPCs VALUES (1, 'false', '30', '50', 'type1'),(2, 'true', '40', '60', 'type2'),(3, 'false', '80', '70', 'type3');
	
INSERT INTO Animals VALUES (1, 'roar, roooor', 'aligator'),(2, 'ssssss', 'snake'),(3, 'auuu', 'wolf');
	
INSERT INTO Scientists VALUES (1, 'true'),(2, 'false'),(3, 'true');
	
INSERT INTO RecruitableCharacters VALUES (1, 'Melee Weapons','true'),(2, 'Bows','false'),(3, 'Handguns','true');

INSERT INTO MainCharacter VALUES (1, 1),(3, 2),(2, 3);

/* 
SELECT * FROM Characters;
SELECT * FROM PlayerCharacters;
SELECT * FROM NPCs;
SELECT * FROM Animals;
SELECT * FROM Scientists;
SELECT * FROM RecruitableCharacters;
SELECT * FROM MainCharacter;
*/
