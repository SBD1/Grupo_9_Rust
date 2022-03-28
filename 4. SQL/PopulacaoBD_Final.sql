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


INSERT INTO Biomes VALUES 
('1', 'xyz1', '1', '1','Temperate Grassland Plains', 'climate1'),
('2', 'xyz2', '1', '1','Temperate Grassland Hills', 'climate2'),
('3', 'xyz3', '1', '1','Temperate Forest', 'climate3'),
('4', 'xyz4', '1', '1','Desert', 'climate4'),
('5', 'xyz5', '1', '1','Snow', 'climate5'),
('6', 'xyz6', '1', '1','Trivia', 'climate6'),
('7', 'xyz7', '1', '1','Beach', 'climate7'),
('8', 'xyz8', '1', '1','Lake', 'climate8'),
('9', 'xyz9', '1', '1','River', 'climate9'),
('10', 'xyz10', '1', '1','Ocean', 'climate10');

INSERT INTO Resources (maxStackSize,isPrimary, itemType,itemName,isRefinable,lootGrade) VALUES 
	(1000,true,'resource','Wood',False,'primary'),
	(1000,true,'resource','Stone',False,'primary'),
	(1000,true,'resource','Bone Fragments',False,'primary'),
	(1000,true,'resource','Leather',False,'primary'),
	(1000,true,'resource','Cloth',False,'primary'),
	(1000,true,'resource','Scrap',False,'primary'),
	(100,true,'resource','High Quality Metal Ore',true,'primary'),
	(500,true,'resource','Animal Fat',true,'primary'),
	(500,true,'resource','Crude Oil',true,'primary'),
	(1000,true,'resource','Metal Ore',true,'primary'),
	(1000,true,'resource','Sulfur Ore',true,'primary'),
	(100,false,'resource','High Quality Metal',false,'resource'),
	(500,false,'resource','Low Grade Fuel',false,'resource'),
	(1000,false,'resource','Metal Fragments',false,'resource'),
	(1000,false,'resource','Sulfur',false,'resource'),
	(1000,false,'resource','Charcoal',false,'resource'),
	(1000,false,'resource','Gunpowder',false,'resource');

INSERT INTO RangedWeapons(maxStackSize, itemName, itemType, lootGrade, 
attackRange, headDamage,chestDamage,legDamage,armsDamage, accuracyModifier, fireRate,
fireMode, modSlots, ammoCapacity, recoil) VALUES
(1,'Hunting Bow','ranged','basic',150,80, 50,35,40,0.5,0.5,'single',0,1,0),
(1,'Crossbow','ranged','basic',200,102, 60,45,45,0.75,0.3,'single',2,1,0),
(1,'Compound Bow','ranged','basic',250,100, 50,40,40,0.65,0.5,'charged-fire',0,1,0),
(1,'Waterpipe Shotgun','ranged','basic',10,210,180,75,75,1,0.4,'single',0,1,2),
(1,'Pump Shotgun','ranged','military',10,280, 210,80,80,1,1,'pump',2,6,2),
(1,'Eoka Pistol','ranged','basic',10,210, 180,75,75,1,0.2,'single',0,1,2),
(1,'Double Barrel Shotgun','ranged','basic',10,210, 180,75,75,1,1,'semi-auto',2,2,2),
(1,'Nailgun','ranged','basic',60,36, 18,12,8,2,3,'semi-auto',0,16,0.5),
(1,'Python Revolver','ranged','military',350,110, 55,45,45,2,2,'semi-auto',3,6,4),
(1,'Revolver','ranged','basic',250,70, 35,26,26,2,2,'semi-auto',1,8,1.5),
(1,'Custom SMG','ranged','military',200,60, 35,30,35,2,3,'full-auto',3,24,3),
(1,'Thompson','ranged','military',250,76, 38,30,30,2.5,2.5,'full-auto',3,20,2.8),
(1,'MP5A4','ranged','elite',350,70, 35,29,35,3,2.5,'full-auto',3,30,2),
(1,'Semi-Automatic Pistol','ranged','military',250,80, 40,30,40,3,1.5,'semi-auto',3,10,1.5),
(1,'Semi-Automatic Rifle','ranged','military',350,80, 40,30,40,3,1.5,'semi-auto',3,16,2),
(1,'LR-300 Assault Rifle','ranged','elite',400,80, 40,30,40,3,2.5,'semi-auto',3,30,2),
(1,'AK47 Assault Rifle','ranged','elite',450,85, 45,35,45,3,3,'full-auto',3,30,3.5),
(1,'Bolt Action Rifle','ranged','elite',900,150, 75,50,50,5,0.8,'single',3,4,5);

INSERT INTO MeleeWeapons(maxStackSize, itemName, itemType, lootGrade,
attackRange, headDamage,chestDamage,legDamage,armsDamage,
treeGatherRate,oreGatherRate, fleshGatherRate,canBeThrown) VALUES
(1,'Machete','melee','tool',1.5,70,35,29,35,0,0,0.8,true),
(1,'Salvage Sword','melee','basic',1.5,100,50,45,50,0,0,0.8,true),
(1,'Salvage Cleaver','melee','basic',1.5,120,60,50,55,0,0,0.7,true),
(1,'Longsword','melee','military',2,150,75,36,45,0,0,0.6,true),
(1,'Mace','melee','basic',1.5,100,50,45,50,0,0,0,true),
(1,'Stone Spear','melee','basic',2.2,70,35,35,28,0,0,0,true),
(1,'Spear','melee','primary',2.2,30,25,25,13,0,0,0,true),
(1,'Rock','melee','resource',1.25,20,10,8,8,0.5,0.5,0.5,true),
(1,'Stone Hatchet','melee','resource',1.5,20,10,8,8,0.75,0,0.75,true),
(1,'Stone Pickaxe','melee','resource',1.5,20,10,8,8,0,0.75,0.75,true),
(1,'Hatchet','melee','resource',1.5,30,25,13,25,1,0,1,true),
(1,'Pickaxe','melee','resource',1.5,30,25,13,25,0,1,0.65,true);

INSERT INTO Clothing(maxStackSize, itemName, itemType, lootGrade,
coldResistance,radResistance,explosionResistance,meleeResistance,
rangedResistance,biteResistance,equipmentSlot,wetResistance) VALUES
(1,'Bandana Mask','clothes','barrel',0.1,0.03,0,0.1,0.05,0.03,'face',0),
(1,'Wolf Headdress','clothes','basic',0.06,0.04,0.13,0.6,0.3,0.1,'head',0),
(1,'Wood Armour Helmet','clothes','basic',0.07,0.02,0,0.25,0.15,0.03,'head',0),
(1,'Coffee Can Helmet','clothes','military',0.0,0.05,0.08,0.5,0.35,0.08,'head',0),
(1,'Riot Helmet','clothes','basic',0.06,0.05,0.08,0.8,0.25,0.13,'head',0),
(1,'Bucket Helmet','clothes','basic',0.06,0.04,0.08,0.5,0.2,0.08,'head',0),
(1,'Facemask','clothes','elite',-0.04,0.0,0.08,0.7,0.5,0.08,'head',0),
(1,'Boonie Hat','clothes','barrel',0.07,0.02,0.0,0.15,0.15,0.03,'head',0),
(1,'Beanie','clothes','barrel',0.07,0.01,0.0,0.1,0.1,0.03,'head',0),
(1,'Cap','clothes','barrel',0.07,0.01,0.0,0.1,0.1,0.03,'head',0),
(1,'Tank Top','clothes','barrel',0.05,0.02,0.0,0.05,0.05,0.03,'chest',0),
(1,'Burlap Shirt','clothes','barrel',0.07,0.02,0.0,0.1,0.1,0.03,'chest',0),
(1,'Hide Vest','clothes','barrel',0.05,0.02,0.0,0.1,0.15,0.08,'chest',0),
(1,'T-Shirt','clothes','basic',0.04,0.03,0.0,0.1,0.1,0.04,'chest',0),
(1,'Hoodie','clothes','basic',0.08,0.05,0.0,0.15,0.15,0.06,'chest',0),
(1,'Hide Poncho','clothes','basic',0.08,0.05,0.0,0.1,0.1,0.05,'chest-armour',0),
(1,'Wood Chestplate','clothes','basic',0.0,0.05,0.05,0.4,0.1,0.05,'chest-armour',0),
(1,'Metal Chestplate','clothes','elite',-0.08,0.0,0.0,0.2,0.25,0.03,'chest-armour',0),
(1,'Jacker','clothes','military',0.1,0.05,0.0,0.2,0.15,0.07,'chest-armour',0),
(1,'Roadsign Jacket','clothes','military',-0.08,0.0,0.0,0.25,0.20,0.1,'chest-armour',0),
(1,'Shorts','clothes','barrel',0.07,0.02,0.0,0.1,0.10,0.03,'legs',0),
(1,'Pants','clothes','basic',0.08,0.05,0.0,0.15,0.15,0.03,'legs',0),
(1,'Hide Pants','clothes','barrel',0.04,0.02,0.0,0.1,0.1,0.08,'legs',0),
(1,'Burlap Trousers','clothes','barrel',0.07,0.02,0.0,0.1,0.1,0.03,'legs',0),
(1,'Frog Boots','clothes','elite',0.08,0.05,0.0,0.0,0.0,0.0,'feet',1),
(1,'Hide Boots','clothes','basic',0.05,0.02,0.0,0.05,0.05,0.03,'feet',0),
(1,'Burlap Shoes','clothes','barrel',0.03,0.02,0.0,0.05,0.05,0.02,'feet',0),
(1,'Boots','clothes','military',0.08,0.03,0.0,0.1,0.1,0.03,'feet',0),
(1,'Leather Gloves','clothes','barrel',0.03,0.02,0.0,0.05,0.05,0.02,'hands',0),
(1,'Road Sign Gloves','clothes','military',0.0,0.04,0.02,0.1,0.1,0.05,'hands',0),
(1,'Wood Armour Pants','clothes','basic',0.0,0.05,0.05,0.4,0.1,0.05,'leg-armour',0),
(1,'Road Sign Kilt','clothes','military',-0.08,0.0,0.0,0.25,0.2,0.1,'leg-armour',0),
(1,'Bone Armour','clothes','basic',0.0,0.08,0.07,0.4,0.25,0.13,'whole-body',0),
(1,'Hazmat Suit','clothes','military',0.08,0.5,0.05,0.3,0.3,0.08,'whole-body',0),
(1,'Heavy Hazmat Suit','clothes','elite',0.12,0.7,0.1,0.5,0.5,0.15,'whole-body',0);

INSERT INTO Consumables(maxStackSize, itemName, itemType, lootGrade,
instantHeal,healOverTime,hidrationYield,bleedingYield,radiationYield,poisonYield,hungerYield,vomitChance) VALUES
(20,'Apple','consumable','food',2,0,15,0,0,0,30,0),
(20,'Mushroom','consumable','food',3,0,5,0,0,0,15,0),
(20,'Raspberry','consumable','food',10,0,20,0,0,-5,40,0),
(20,'Blueberry','consumable','food',10,0,20,0,0,-5,30,0),
(20,'Cactus Flesh','consumable','food',0,3,20,0,0,0,20,0),
(20,'Tune Can','consumable','food',0,2,15,0,0,0,50,0),
(20,'Can of Beans','consumable','food',0,4,25,0,0,0,100,0),
(20,'Chocolate Bar','consumable','food',0,2,1,0,0,0,100,0),
(20,'Chicken Breast','consumable','food',0,10,3,0,0,0,40,0),
(20,'Deer Meat','consumable','food',0,10,3,0,0,0,40,0),
(20,'Wolf Meat','consumable','food',0,5,1,0,0,0,60,0),
(20,'Pork Meat','consumable','food',0,5,1,0,0,0,60,0),
(20,'Bear Meat','consumable','food',0,5,1,0,0,0,100,0),
(20,'Corn','consumable','food',0,6,5,0,0,0,40,0),
(20,'Pumpkin','consumable','food',0,10,30,0,0,0,100,0),
(5,'Water Bottle','consumable','food',0,0,200,-20,0,0,0,0),
(10,'Anti-Radiation','consumable','food',0,0,-50,0,-25,0,0,0),
(10,'Bandage','consumable','food',0,5,0,-5,0,-2,0,0),
(5,'Medical Syringe','consumable','food',15,20,0,0,-10,0,-2,0),
(2,'Large Medkit','consumable','food',0,100,-15,-15,-10,0,-10,0);

INSERT INTO TEAS (maxStackSize, itemName, itemType, lootGrade,
instantHeal,healOverTime,hidrationYield,
bleedingYield,radiationYield,poisonYield,hungerYield,vomitChance,
statusUpgradeType, upgradePercentage) VALUES 
(5,'Normal Max Health Tea','tea','food',0,0,0,0,0,0,0,0,'health',0.05),
(5,'Advanced Max Health Tea','tea','food',0,0,0,0,0,0,0,0,'health',0.125),
(5,'Pure Max Health Tea','tea','food',0,0,0,0,0,0,0,0,'health',0.2),
(5,'Normal Healing Tea','tea','food',0,0,30,0,0,0,0,0,'health',0),
(5,'Advanced Healing Tea','tea','food',0,45,0,0,0,0,0,0,'health',0),
(5,'Pure Healing Tea','tea','food',0,60,0,0,0,0,0,0,'health',0),
(5,'Normal Ore Tea','tea','food',0,0,0,0,0,0,0,0,'mining',0.1),
(5,'Advanced Ore Tea','tea','food',0,0,0,0,0,0,0,0,'mining',0.3),
(5,'Pure Ore Tea','tea','food',0,0,0,0,0,0,0,0,'mining',0.5),
(5,'Normal Wood Tea','tea','food',0,0,0,0,0,0,0,0,'woodcutting',0.1),
(5,'Advanced Wood Tea','tea','food',0,0,0,0,0,0,0,0,'woodcutting',0.3),
(5,'Pure Wood Tea','tea','food',0,0,0,0,0,0,0,0,'woodcutting',0.5),
(5,'Normal Scrap Tea','tea','food',0,0,0,0,0,0,0,0,'scrap',0.1),
(5,'Advanced Scrap Tea','tea','food',0,0,0,0,0,0,0,0,'scrap',0.3),
(5,'Pure Scrap Tea','tea','food',0,0,0,0,0,0,0,0,'scrap',0.5),
(5,'Normal Radiation Tea','tea','food',0,0,0,0,-60,0,0,0,'radiation',0),
(5,'Advanced Radiation Tea','tea','food',0,0,0,-80,0,0,0,0,'radiation',0),
(5,'Pure Radiation Tea','tea','food',0,0,0,0,0,0,-100,0,'radiation',0),
(5,'Normal Radiation Resistance Tea','tea','food',0,0,0,0,0,0,0,0,'radiation',0.1),
(5,'Advanced Radiation Resistance Tea','tea','food',0,0,0,0,0,0,0,0,'radiation',0.3),
(5,'Pure Radiation Resistance Tea','tea','food',0,0,0,0,0,0,0,0,'radiation',0.5);
