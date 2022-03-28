/* ------------------------------------------------- 

SGBD 1 - GRUPO 9

Script DML - População do banco de dados

---------------------------------------------------- */

INSERT INTO Maps VALUES (1,1),(2,2),(3,3);

INSERT INTO Structures VALUES (1,'Structure1'),(2,'Structure2'),(3,'Structure3');

INSERT INTO Monuments VALUES (1,1,'0','scientist','lest','Monument1'),(1,2,'1','scientist','lest','Monument2'),(1,3,'2','scientist','lest','Monument3');

INSERT INTO Climate VALUES (1, 30.3, 'event1', 'status1'),(2, 5.4, 'event2', 'status2'),(3, 20.2, 'event3', 'status3');

INSERT INTO Biomes VALUES (1, 1, false, true,'Temperate Grassland Plains', 1),(2, 1, false, true,'Temperate Grassland Hills', 2),(3, 1, false, true,'Temperate Forest', 3);

INSERT INTO Characters VALUES (1, 'Character1', '10', 'model1', 1, 'type1', 'item1'),(2, 'Character2', '5', 'model2', 2, 'type2', 'item2'),(3, 'Character3', '20', 'model3', 3, 'type3', 'item3');

INSERT INTO Backpack VALUES (1, 1, 4, 2, 4),(2, 2, 4, 2, 4),(3, 3, 4, 2, 4);

INSERT INTO PlayerCharacters VALUES (1, 10, 20, 30, 'type1', 1, 2, 3, 4, 5, 1),(2, 30, 20, 10, 'type2', 1, 5, 4, 3, 2, 2),(3, 30, 10, 20, 'type3', 1, 3, 5, 4, 2, 3);

INSERT INTO RecruitableCharacters VALUES (1, 'Melee Weapons','true'),(2, 'Bows','false'),(3, 'Handguns','true');

INSERT INTO MainCharacter VALUES (1, 1),(3, 2),(2, 3);

INSERT INTO NPCs VALUES (1, 'false', '30', '50', 'type1'),(2, 'true', '40', '60', 'type2'),(3, 'false', '80', '70', 'type3');

INSERT INTO Animals VALUES (1, 'roar, roooor', 'aligator'),(2, 'ssssss', 'snake'),(3, 'auuu', 'wolf');

INSERT INTO Scientists VALUES (1, 'true'),(2, 'false'),(3, 'true');
	
INSERT INTO ResourceNodes (nodeType, maxYield, durabilityDamage) VALUES ('sulfur', 300, 7.5),('stone', 1000, 7.5),('metal',600, 7.5),('tree', 500, 3.75),('cactus', 3, 2.5);