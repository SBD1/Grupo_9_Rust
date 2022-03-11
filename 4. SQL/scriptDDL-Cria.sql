/* -------------------------------------------------- 

SGBD 1 - GRUPO 9

Script DDL - Criação das tabelas do projeto

----------------------------------------------------- */

CREATE TYPE ENUM_STATUS AS ENUM('HIGH','MEDIUM', 'LOW');
CREATE TYPE ENUM_BOOLEAN AS ENUM('true','false');

CREATE TABLE Maps ( 
  mapID INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE Structures ( 
  structureID INTEGER NOT NULL PRIMARY KEY,
  monument VARCHAR(100) NOT NULL
);

CREATE TABLE Region ( 
  coordinates INTEGER NOT NULL,
  biome VARCHAR(30) NOT NULL,
  dangerLevel SMALLINT NOT NULL,
  monument INTEGER NOT NULL,
  CONSTRAINT pk_Region PRIMARY KEY(coordinates,monument),
  FOREIGN KEY (monument) REFERENCES Structures(structureID)
);

CREATE TABLE HaveMapRegion ( 
  mapID INTEGER NOT NULL,
  coordinates INTEGER NOT NULL,
  CONSTRAINT pk_HaveMapRegion PRIMARY KEY(mapID,coordinates),
  CONSTRAINT fk_mapID_HaveMapRegion FOREIGN KEY (mapID) REFERENCES Maps(mapID),
  CONSTRAINT fk_coordinates_HaveMapRegion FOREIGN KEY (coordinates) REFERENCES Structures(structureID)
);

CREATE TABLE Climate ( 
  climateID INTEGER NOT NULL PRIMARY KEY,
  temperature DECIMAL(4,1) NOT NULL,
  event VARCHAR(30) NOT NULL, 
  statusEffect VARCHAR(30) NOT NULL,
  visibility ENUM_STATUS NOT NULL
);

CREATE TABLE Biomes ( 
  biomesID INTEGER NOT NULL PRIMARY KEY,
  coordinates INTEGER NOT NULL,
  resourceAbundance ENUM_BOOLEAN NOT NULL,
  resourceAvailability ENUM_BOOLEAN NOT NULL,
  type VARCHAR(30) NOT NULL,
  climate INTEGER NOT NULL,
  CONSTRAINT fk_Biomes_Climate FOREIGN KEY (climate) REFERENCES Climate(climateID)
);

CREATE TABLE Flora ( 
  flora VARCHAR(30) NOT NULL PRIMARY KEY,
  biomes INTEGER NOT NULL,
  CONSTRAINT fk_Flora_Biomes FOREIGN KEY (biomes) REFERENCES Biomes(biomesID)
);

CREATE TABLE Fauna ( 
  fauna VARCHAR(30) NOT NULL PRIMARY KEY,
  biomes INTEGER NOT NULL,
  CONSTRAINT fk_Fauna_Biomes FOREIGN KEY (biomes) REFERENCES Biomes(biomesID)
);

CREATE TABLE Characters ( 
  charactersID INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  position INTEGER NOT NULL,
  characterModel VARCHAR(30) NOT NULL,
  climate INTEGER NOT NULL,
  type VARCHAR(30) NOT NULL,
  item VARCHAR(30) NOT NULL,
  CONSTRAINT fk_Characters_Climate FOREIGN KEY (climate) REFERENCES Climate(climateID)
);

CREATE TABLE GatherYield ( 
  character INTEGER NOT NULL, 
  gatherYield VARCHAR(30) NOT NULL,
  CONSTRAINT pk_GatherYield PRIMARY KEY(character,gatherYield),
  CONSTRAINT fk_GatherYield_Characters FOREIGN KEY (character) REFERENCES Characters(charactersID)
);

CREATE TABLE EnterCombatCharacters ( 
  enterCombatCharactersID INTEGER NOT NULL PRIMARY KEY,
  firstCharacter INTEGER NOT NULL,
  secondCharacter INTEGER NOT NULL,
  CONSTRAINT fk_EnterCombatCharacters_Characters_1 FOREIGN KEY (firstCharacter) REFERENCES Characters(charactersID)
/*  CONSTRAINT fk_EnterCombatCharacters_Characters_2 FOREIGN KEY (secondCharacter) REFERENCES Characters(charactersID)*/
);

CREATE TABLE CombatLog ( 
  enterCombatCharacters INTEGER NOT NULL,
  indexLog INTEGER NOT NULL,
  CONSTRAINT pk_CombatLog PRIMARY KEY(enterCombatCharacters,indexLog),
  log VARCHAR(100) NOT NULL
);

CREATE TABLE PlayerCharacters ( 
  charactersID INTEGER NOT NULL PRIMARY KEY,
  hydration INTEGER NOT NULL,
  poisoned INTEGER NOT NULL,
  hunger INTEGER NOT NULL,
  type VARCHAR(30) NOT NULL,
  equipedItems1 INTEGER,
  equipedItems2 INTEGER,
  equipedItems3 INTEGER,
  equipedItems4 INTEGER,
  equipedItems5 INTEGER,
  backpack INTEGER NOT NULL,
  CONSTRAINT fk_PlayerCharacters_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID)
);

CREATE TABLE RecruitableCharacters ( 
  charactersID INTEGER NOT NULL PRIMARY KEY,
  specialization VARCHAR(30) NOT NULL,
  recruited ENUM_BOOLEAN NOT NULL,
  CONSTRAINT fk_RecruitableCharacters_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID)
);

CREATE TABLE MainCharacter ( 
  charactersID INTEGER NOT NULL,
  owner INTEGER NOT NULL,
  CONSTRAINT pk_MainCharacter PRIMARY KEY(charactersID,owner),
  CONSTRAINT fk_MainCharacter_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID)
);

CREATE TABLE RespawnLocation ( 
  ownerID INTEGER NOT NULL PRIMARY KEY,
  description VARCHAR(100) NOT NULL,
  timer INTEGER NOT NULL,
  X INTEGER NOT NULL,
  Y INTEGER NOT NULL
);

CREATE TABLE NPCs ( 
  charactersID INTEGER NOT NULL PRIMARY KEY,
  isAgressive ENUM_BOOLEAN NOT NULL,
  aggroRange VARCHAR(30) NOT NULL, 
  enemyGrade VARCHAR(30) NOT NULL,
  type VARCHAR(30) NOT NULL,
  CONSTRAINT fk_NPCs_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID)
);

CREATE TABLE Animals ( 
  charactersID INTEGER NOT NULL PRIMARY KEY,
  sound VARCHAR(100) NOT NULL,
  modelType VARCHAR(30) NOT NULL,
  CONSTRAINT fk_Animals_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID)
);

CREATE TABLE Scientists ( 
  charactersID INTEGER NOT NULL PRIMARY KEY,
  hasDialogue ENUM_BOOLEAN NOT NULL,
  CONSTRAINT fk_Scientists_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID)
);

CREATE TABLE DialogueText ( 
  dialogue VARCHAR(100) NOT NULL PRIMARY KEY,
  character INTEGER NOT NULL,
  CONSTRAINT fk_DialogueText_Characters FOREIGN KEY (character) REFERENCES Characters(charactersID)
);

CREATE TABLE Items ( 
  itemsID INTEGER NOT NULL UNIQUE,
  stackSize INTEGER NOT NULL,
  lootGrade INTEGER NOT NULL,
  name VARCHAR(30) NOT NULL,
  type VARCHAR(30) NOT NULL,
  quantity INTEGER NOT NULL,
  durability INTEGER NOT NULL,
  craftable ENUM_BOOLEAN NOT NULL,
  backpack INTEGER NOT NULL , 
  character INTEGER NOT NULL,
  CONSTRAINT pk_Items PRIMARY KEY(itemsID,lootGrade),
  CONSTRAINT fk_Items_Characters FOREIGN KEY (character) REFERENCES Characters(charactersID)
/*  FOREIGN KEY (lootGrade) REFERENCES Characters(lootGradeID)  Faltando */
);

CREATE TABLE Ingredients ( 
  ingredient VARCHAR(30) NOT NULL PRIMARY KEY, 
  items INTEGER NOT NULL,
  lootGrade INTEGER NOT NULL,
  CONSTRAINT fk_Ingredients_Items FOREIGN KEY (items) REFERENCES Items(itemsID)
/*  FOREIGN KEY (lootGrade) REFERENCES Characters(lootGradeID)  Faltando */
);

CREATE TABLE Weapons ( 
  itemsID INTEGER NOT NULL PRIMARY KEY,
  type VARCHAR(30) NOT NULL,
  CONSTRAINT fk_Weapons_Items FOREIGN KEY (itemsID) REFERENCES Items(itemsID)
);

CREATE TABLE Melee ( 
  itemsID INTEGER NOT NULL PRIMARY KEY,
  canBeThrown ENUM_BOOLEAN NOT NULL,
  fleshGatherRate INTEGER NOT NULL,
  oreGatherRate INTEGER NOT NULL,
  treeGatherRate INTEGER NOT NULL,
  CONSTRAINT fk_Melee_Items FOREIGN KEY (itemsID) REFERENCES Items(itemsID)
);

CREATE TABLE Ranged ( 
  itemsID INTEGER NOT NULL PRIMARY KEY,
  recoil INTEGER NOT NULL,
  attackRange INTEGER NOT NULL,
  amnoCapacity INTEGER NOT NULL,
  modSlots INTEGER NOT NULL,
  fireMode ENUM_BOOLEAN NOT NULL,
  fireRate INTEGER NOT NULL,
  accuracyModifier INTEGER NOT NULL,
  CONSTRAINT fk_Ranged_Items FOREIGN KEY (itemsID) REFERENCES Items(itemsID)
);
/* Falta completar
CREATE TABLE Consumables ( 
  itemsID INTEGER NOT NULL PRIMARY KEY,
  instantHeal, 
  healOverTime, 
  hidratationYield,
  CREATE TABLE 
  bleedingYield, 
  radiationYield, 
  poisonYield, 
  hungerYield, 
  vomitChance, 
  type 
);

CREATE TABLE Teas ( 
  itemsID INTEGER NOT NULL PRIMARY KEY,
  statusUpgradeType, 
  upgradePercentage 
);

CREATE TABLE Clothing ( 
  itemsID INTEGER NOT NULL PRIMARY KEY,
  coldResistance, 
  radResistance, 
  explosionResistance,
  meleeResistance, 
  rangedResistance, 
  biteResistance, 
  equipmentSlot,
  wetResistance
);

CREATE TABLE Components ( 
  itemsID INTEGER NOT NULL PRIMARY KEY
);

CREATE TABLE Resources ( 
  itemsID INTEGER NOT NULL PRIMARY KEY,
  isPrimary 
);

CREATE TABLE DropCharactersItems ( 
  dropCharactersItemsID INTEGER NOT NULL PRIMARY KEY,
  item, 
  lootGrade, 
  character 
);

CREATE TABLE PlayerCharactersGeneratesItem ( 
  character, 
  items 
);

CREATE TABLE WeaponsAreComposedOfComponentsResources (
  components, 
  resouces,
  weapons
);

CREATE TABLE ConsumablesAreComposedOfComponentsResources ( 
  components, 
  resouces,
  consumables 
);

CREATE TABLE ClothingAreComposedOfComponentsResources ( 
  components, 
  resouces,
  clothing
);

CREATE TABLE ResourceNodes (
  resourceNodesID INTEGER NOT NULL PRIMARY KEY,
  nodeType, 
  maxYield, 
  durabilityDamage,
  biomes 
);

CREATE TABLE ResourceNodesGenerateItems ( 
  resourceNodes, 
  item 
);

CREATE TABLE Monuments ( 
  name, 
  monumentSize, 
  lootGrade, 
  enemyGrade 
);

CREATE TABLE regionsMonuments ( 
  name, 
  regionMonument 
);

CREATE TABLE LootCrates ( 
  lootCratesID INTEGER NOT NULL PRIMARY KEY,
  grade 
);

CREATE TABLE StructuresContainsLootCrates ( 
  structure,
  lootCrates 
);

CREATE TABLE Party ( 
  partyID INTEGER NOT NULL PRIMARY KEY,
  character, 
  capacity 
);

CREATE TABLE Backpack ( 
  ownerID INTEGER NOT NULL PRIMARY KEY,
  slot1,
  slot2,
  slot3,
  slot4
);
*/
