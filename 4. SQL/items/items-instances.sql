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
(1,'Hunting Bow','ranged','basic','150','80', '50','35','40','0.5','0.5','single','0','1','0'),
(1,'Crossbow','ranged','basic','200','102', '60','45','45','0.75','0.3','single','2','1','0'),
(1,'Compound Bow','ranged','basic','250','100', '50','40','40','0.65','0.5','charged','0','1','0'),
(1,'Waterpipe Shotgun','ranged','basic','10','210', '180','75','75','1','0.4','single','0','1','2'),
(1,'Pump Shotgun','ranged','military','10','280', '210','80','80','1','1','pump','2','6','2'),
(1,'Eoka Pistol','ranged','basic','10','210', '180','75','75','1','0.2','single','0','1','2'),
(1,'Double Barrel Shotgun','ranged','basic','10','210', '180','75','75','1','1','semi-auto','2','2','2'),
(1,'Nailgun','ranged','basic','60','36', '18','12','8','2','3','semi-auto','0','16','0.5'),
(1,'Python Revolver','ranged','military','350','110', '55','45','45','2','2','semi-auto','3','6','4'),
(1,'Revolver','ranged','basic','250','70', '35','26','26','2','2','semi-auto','1','8','1.5'),
(1,'Custom SMG','ranged','military','200','60', '35','30','35','2','3','full-auto','3','24','3'),
(1,'Thompson','ranged','military','250','76', '38','30','30','2.5','2.5','full-auto','3','20','2.8'),
(1,'MP5A4','ranged','elite','350','70', '35','29','35','3','2.5','full-auto','3','30','2'),
(1,'Semi-Automatic Pistol','ranged','military','250','80', '40','30','40','3','1.5','semi-auto','3','10','1.5'),
(1,'Semi-Automatic Rifle','ranged','military','350','80', '40','30','40','3','1.5','semi-auto','3','16','2'),
(1,'LR-300 Assault Rifle','ranged','elite','400','80', '40','30','40','3','2.5','semi-auto','3','30','2'),
(1,'AK47 Assault Rifle','ranged','elite','450','85', '45','35','45','3','3','full-auto','3','30','3.5'),
(1,'Bolt Action Rifle','ranged','elite','900','150', '75','50','50','5','0.8','single','3','4','5');

INSERT INTO MeleeWeapons(maxStackSize, itemName, itemType, lootGrade,
attackRange, headDamage,chestDamage,legDamage,armsDamage,
treeGatherRate,oreGatherRate, fleshGatherRate,canBeThrown) VALUES
('1','Machete','melee','tool','1.5','70','35','29','35','0','0','0.8',true),
('1','Salvage Sword','melee','basic','1.5','100','50','45','50','0','0','0.8',true),
('1','Salvage Cleaver','melee','basic','1.5','120','60','50','55','0','0','0.7',true),
('1','Longsword','melee','military','2','150','75','36','45','0','0','0.6',true),
('1','Mace','melee','basic','1.5','100','50','45','50','0','0','0',true),
('1','Stone Spear','melee','basic','2.2','70','35','35','28','0','0','0',true),
('1','Spear','melee','primary','2.2','30','25','25','13','0','0','0',true),
('1','Rock','melee','resource','1.25','20','10','8','8','0.5','0.5','0.5',true),
('1','Stone Hatchet','melee','resource','1.5','20','10','8','8','0.75','0','0.75',true),
('1','Stone Pickaxe','melee','resource','1.5','20','10','8','8','0','0.75','0.75',true),
('1','Hatchet','melee','resource','1.5','30','25','13','25','1','0','1',true),
('1','Pickaxe','melee','resource','1.5','30','25','13','25','0','1','0.65',true);

INSERT INTO Clothing(maxStackSize, itemName, itemType, lootGrade,
coldResistance,radResistance,explosionResistance,meleeResistance,
rangedResistance,biteResistance,equipmentSlot,wetResistance) VALUES
(1,'Bandana Mask','clothing','barrel',0.1,0.03,0,0.1,0.05,0.03,'face',0),
(1,'Wolf Headdress','clothing','basic',0.06,0.04,0.13,0.6,0.3,0.1,'head',0),
(1,'Wood Armour Helmet','clothing','basic',0.07,0.02,0,0.25,0.15,0.03,'head',0),
(1,'Coffee Can Helmet','clothing','military',0.0,0.05,0.08,0.5,0.35,0.08,'head',0),
(1,'Riot Helmet','clothing','basic',0.06,0.05,0.08,0.8,0.25,0.13,'head',0),
(1,'Bucket Helmet','clothing','basic',0.06,0.04,0.08,0.5,0.2,0.08,'head',0),
(1,'Facemask','clothing','elite',-0.04,0.0,0.08,0.7,0.5,0.08,'head',0),
(1,'Boonie Hat','clothing','barrel',0.07,0.02,0.0,0.15,0.15,0.03,'head',0),
(1,'Beanie','clothing','barrel',0.07,0.01,0.0,0.1,0.1,0.03,'head',0),
(1,'Cap','clothing','barrel',0.07,0.01,0.0,0.1,0.1,0.03,'head',0),
(1,'Tank Top','clothing','barrel',0.05,0.02,0.0,0.05,0.05,0.03,'chest',0),
(1,'Burlap Shirt','clothing','barrel',0.07,0.02,0.0,0.1,0.1,0.03,'chest',0),
(1,'Hide Vest','clothing','barrel',0.05,0.02,0.0,0.1,0.15,0.08,'chest',0),
(1,'T-Shirt','clothing','basic',0.04,0.03,0.0,0.1,0.1,0.04,'chest',0),
(1,'Hoodie','clothing','basic',0.08,0.05,0.0,0.15,0.15,0.06,'chest',0),
(1,'Hide Poncho','clothing','basic',0.08,0.05,0.0,0.1,0.1,0.05,'chest-armour',0),
(1,'Wood Chestplate','clothing','basic',0.0,0.05,0.05,0.4,0.1,0.05,'chest-armour',0),
(1,'Metal Chestplate','clothing','elite',-0.08,0.0,0.0,0.2,0.25,0.03,'chest-armour',0),
(1,'Jacker','clothing','military',0.1,0.05,0.0,0.2,0.15,0.07,'chest-armour',0),
(1,'Roadsign Jacket','clothing','military',-0.08,0.0,0.0,0.25,0.20,0.1,'chest-armour',0),
(1,'Shorts','clothing','barrel',0.07,0.02,0.0,0.1,0.10,0.03,'legs',0),
(1,'Pants','clothing','basic',0.08,0.05,0.0,0.15,0.15,0.03,'legs',0),
(1,'Hide Pants','clothing','barrel',0.04,0.02,0.0,0.1,0.1,0.08,'legs',0),
(1,'Burlap Trousers','clothing','barrel',0.07,0.02,0.0,0.1,0.1,0.03,'legs',0),
(1,'Frog Boots','clothing','elite',0.08,0.05,0.0,0.0,0.0,0.0,'feet',1),
(1,'Hide Boots','clothing','basic',0.05,0.02,0.0,0.05,0.05,0.03,'feet',0),
(1,'Burlap Shoes','clothing','barrel',0.03,0.02,0.0,0.05,0.05,0.02,'feet',0),
(1,'Boots','clothing','military',0.08,0.03,0.0,0.1,0.1,0.03,'feet',0),
(1,'Leather Gloves','clothing','barrel',0.03,0.02,0.0,0.05,0.05,0.02,'hands',0),
(1,'Road Sign Gloves','clothing','military',0.0,0.04,0.02,0.1,0.1,0.05,'hands',0),
(1,'Wood Armour Pants','clothing','basic',0.0,0.05,0.05,0.4,0.1,0.05,'leg-armour',0),
(1,'Road Sign Kilt','clothing','military',-0.08,0.0,0.0,0.25,0.2,0.1,'leg-armour',0),
(1,'Bone Armour','clothing','basic',0.0,0.08,0.07,0.4,0.25,0.13,'whole-body-armour',0),
(1,'Hazmat Suit','clothing','military',0.08,0.5,0.05,0.3,0.3,0.08,'whole-body-armour',0),
(1,'Heavy Hazmat Suit','clothing','elite',0.12,0.7,0.1,0.5,0.5,0.15,'whole-body-armour',0);




































































