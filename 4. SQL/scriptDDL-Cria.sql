/* -------------------------------------------------- 

SGBD 1 - GRUPO 9

Script DDL - Criação das tabelas do projeto

----------------------------------------------------- */

CREATE TYPE ENUM_STATUS AS ENUM('HIGH','MEDIUM', 'LOW');
CREATE TYPE ENUM_BOOLEAN AS ENUM('true','false');

CREATE TABLE Maps ( 
  mapID INTEGER NOT NULL,
  CONSTRAINT pk_Maps PRIMARY KEY(mapID)
);

CREATE TABLE Structures ( 
  structureID INTEGER NOT NULL,
  monument VARCHAR(100) NOT NULL,
  CONSTRAINT pk_Structures PRIMARY KEY(structureID)
);

CREATE TABLE Monuments ( 
  name VARCHAR(30) NOT NULL,
  monumentSize INTEGER NOT NULL,
  lootGrade INTEGER NOT NULL,
  enemyGrade INTEGER NOT NULL,
  CONSTRAINT pk_Monuments PRIMARY KEY(name)
);

CREATE TABLE Region ( 
  coordinates INTEGER NOT NULL,
  biome VARCHAR(30) NOT NULL,
  dangerLevel SMALLINT NOT NULL,
  monument VARCHAR(30) NOT NULL,
  CONSTRAINT pk_Region PRIMARY KEY(coordinates,monument),
  FOREIGN KEY (monument) REFERENCES Monuments(name) ON DELETE RESTRICT
);

CREATE TABLE HaveMapRegion ( 
  mapID INTEGER NOT NULL,
  coordinates INTEGER NOT NULL,
  CONSTRAINT pk_HaveMapRegion PRIMARY KEY(mapID,coordinates),
  CONSTRAINT fk_mapID_HaveMapRegion FOREIGN KEY (mapID) REFERENCES Maps(mapID) ON DELETE RESTRICT,
  CONSTRAINT fk_coordinates_HaveMapRegion FOREIGN KEY (coordinates) REFERENCES Structures(structureID) ON DELETE RESTRICT
);

CREATE TABLE Climate ( 
  climateID INTEGER NOT NULL,
  temperature DECIMAL(4,1) NOT NULL,
  event VARCHAR(30) NOT NULL, 
  statusEffect VARCHAR(30) NOT NULL,
  visibility ENUM_STATUS NOT NULL,
  CONSTRAINT pk_Climate PRIMARY KEY(climateID)
);

CREATE TABLE Biomes ( 
  biomesID INTEGER NOT NULL,
  coordinates INTEGER NOT NULL,
  resourceAbundance ENUM_BOOLEAN NOT NULL,
  resourceAvailability ENUM_BOOLEAN NOT NULL,
  type VARCHAR(30) NOT NULL,
  climate INTEGER NOT NULL,
  CONSTRAINT pk_Biomes PRIMARY KEY(biomesID),
  CONSTRAINT fk_Biomes_Climate FOREIGN KEY (climate) REFERENCES Climate(climateID) ON DELETE RESTRICT
);

CREATE TABLE Flora ( 
  flora VARCHAR(30) NOT NULL,
  biomes INTEGER NOT NULL,
  CONSTRAINT pk_Flora PRIMARY KEY(flora),
  CONSTRAINT fk_Flora_Biomes FOREIGN KEY (biomes) REFERENCES Biomes(biomesID) ON DELETE RESTRICT
);

CREATE TABLE Fauna ( 
  fauna VARCHAR(30) NOT NULL,
  biomes INTEGER NOT NULL,
  CONSTRAINT pk_Fauna PRIMARY KEY(fauna),
  CONSTRAINT fk_Fauna_Biomes FOREIGN KEY (biomes) REFERENCES Biomes(biomesID) ON DELETE RESTRICT
);

CREATE TABLE Characters ( 
  charactersID INTEGER NOT NULL UNIQUE,
  name VARCHAR(100) NOT NULL,
  position INTEGER NOT NULL,
  characterModel VARCHAR(30) NOT NULL,
  climate INTEGER NOT NULL,
  type VARCHAR(30) NOT NULL,
  item VARCHAR(30) NOT NULL,
  CONSTRAINT pk_Characters PRIMARY KEY(charactersID),
  CONSTRAINT fk_Characters_Climate FOREIGN KEY (climate) REFERENCES Climate(climateID) ON DELETE RESTRICT
);

CREATE TABLE GatherYield ( 
  character INTEGER NOT NULL, 
  gatherYield VARCHAR(30) NOT NULL,
  CONSTRAINT pk_GatherYield PRIMARY KEY(character,gatherYield),
  CONSTRAINT fk_GatherYield_Characters FOREIGN KEY (character) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE EnterCombatCharacters ( 
  enterCombatCharactersID INTEGER NOT NULL,
  firstCharacter INTEGER NOT NULL,
  secondCharacter INTEGER NOT NULL,
  CONSTRAINT pk_EnterCombatCharacters PRIMARY KEY(enterCombatCharactersID),
  CONSTRAINT fk_EnterCombatCharacters_Characters_1 FOREIGN KEY (firstCharacter) REFERENCES Characters(charactersID) ON DELETE RESTRICT,
  CONSTRAINT fk_EnterCombatCharacters_Characters_2 FOREIGN KEY (secondCharacter) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE CombatLog ( 
  enterCombatCharacters INTEGER NOT NULL,
  indexLog INTEGER NOT NULL,
  CONSTRAINT pk_CombatLog PRIMARY KEY(enterCombatCharacters,indexLog),
  log VARCHAR(100) NOT NULL
);

CREATE TABLE Backpack ( 
  ownerID INTEGER NOT NULL,
  slot1 INTEGER,
  slot2 INTEGER,
  slot3 INTEGER,
  slot4 INTEGER,
  CONSTRAINT pk_Backpack PRIMARY KEY(ownerID)
);

CREATE TABLE PlayerCharacters ( 
  charactersID INTEGER NOT NULL,
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
  CONSTRAINT pk_PlayerCharacters PRIMARY KEY(charactersID),
  CONSTRAINT fk_PlayerCharacters_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID) ON DELETE RESTRICT,
  CONSTRAINT fk_PlayerCharacters_Backpack FOREIGN KEY (backpack) REFERENCES Backpack(ownerID) ON DELETE RESTRICT
);

CREATE TABLE RecruitableCharacters ( 
  charactersID INTEGER NOT NULL,
  specialization VARCHAR(30) NOT NULL,
  recruited ENUM_BOOLEAN NOT NULL,
  CONSTRAINT pk_RecruitableCharacters PRIMARY KEY(charactersID),
  CONSTRAINT fk_RecruitableCharacters_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE MainCharacter ( 
  charactersID INTEGER NOT NULL,
  owner INTEGER NOT NULL,
  CONSTRAINT pk_MainCharacter PRIMARY KEY(charactersID,owner),
  CONSTRAINT fk_MainCharacter_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE RespawnLocation ( 
  ownerID INTEGER NOT NULL,
  description VARCHAR(100) NOT NULL,
  timer INTEGER NOT NULL,
  X INTEGER NOT NULL,
  Y INTEGER NOT NULL,
  CONSTRAINT pk_RespawnLocation PRIMARY KEY(ownerID)
);

CREATE TABLE NPCs ( 
  charactersID INTEGER NOT NULL,
  isAgressive ENUM_BOOLEAN NOT NULL,
  aggroRange VARCHAR(30) NOT NULL, 
  enemyGrade VARCHAR(30) NOT NULL,
  type VARCHAR(30) NOT NULL,
  CONSTRAINT pk_NPCs PRIMARY KEY(charactersID),
  CONSTRAINT fk_NPCs_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE Animals ( 
  charactersID INTEGER NOT NULL,
  sound VARCHAR(100) NOT NULL,
  modelType VARCHAR(30) NOT NULL,
  CONSTRAINT pk_Animals PRIMARY KEY(charactersID),
  CONSTRAINT fk_Animals_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE Scientists ( 
  charactersID INTEGER NOT NULL,
  hasDialogue ENUM_BOOLEAN NOT NULL,
  CONSTRAINT pk_Scientists PRIMARY KEY(charactersID),
  CONSTRAINT fk_Scientists_Characters FOREIGN KEY (charactersID) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE DialogueText ( 
  dialogue VARCHAR(100) NOT NULL,
  character INTEGER NOT NULL,
  CONSTRAINT pk_DialogueText PRIMARY KEY(dialogue),
  CONSTRAINT fk_DialogueText_Characters FOREIGN KEY (character) REFERENCES Characters(charactersID) ON DELETE RESTRICT
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
  CONSTRAINT fk_Items_Characters FOREIGN KEY (character) REFERENCES Characters(charactersID) ON DELETE RESTRICT,
  CONSTRAINT fk_Items_Backpack FOREIGN KEY (backpack) REFERENCES Backpack(ownerID) ON DELETE RESTRICT
/*  FOREIGN KEY (lootGrade) REFERENCES Characters(lootGradeID)  Faltando */
);

CREATE TABLE Ingredients ( 
  ingredient VARCHAR(30) NOT NULL PRIMARY KEY, 
  items INTEGER NOT NULL,
  lootGrade INTEGER NOT NULL,
  CONSTRAINT fk_Ingredients_Items FOREIGN KEY (items) REFERENCES Items(itemsID) ON DELETE RESTRICT
/*  FOREIGN KEY (lootGrade) REFERENCES Characters(lootGradeID)  Faltando */
);

CREATE TABLE Weapons ( 
  itemsID INTEGER NOT NULL,
  type VARCHAR(30) NOT NULL,
  CONSTRAINT pk_Weapons PRIMARY KEY(itemsID),
  CONSTRAINT fk_Weapons_Items FOREIGN KEY (itemsID) REFERENCES Items(itemsID) ON DELETE RESTRICT
);

CREATE TABLE Melee ( 
  itemsID INTEGER NOT NULL,
  canBeThrown ENUM_BOOLEAN NOT NULL,
  fleshGatherRate INTEGER NOT NULL,
  oreGatherRate INTEGER NOT NULL,
  treeGatherRate INTEGER NOT NULL,
  CONSTRAINT pk_Melee PRIMARY KEY(itemsID),
  CONSTRAINT fk_Melee_Items FOREIGN KEY (itemsID) REFERENCES Items(itemsID) ON DELETE RESTRICT
);

CREATE TABLE Ranged ( 
  itemsID INTEGER NOT NULL,
  recoil INTEGER NOT NULL,
  attackRange INTEGER NOT NULL,
  amnoCapacity INTEGER NOT NULL,
  modSlots INTEGER NOT NULL,
  fireMode ENUM_BOOLEAN NOT NULL,
  fireRate INTEGER NOT NULL,
  accuracyModifier INTEGER NOT NULL,
  CONSTRAINT pk_Ranged PRIMARY KEY(itemsID),
  CONSTRAINT fk_Ranged_Items FOREIGN KEY (itemsID) REFERENCES Items(itemsID) ON DELETE RESTRICT
);

CREATE TABLE Consumables ( 
  itemsID INTEGER NOT NULL,
  instantHeal INTEGER NOT NULL,
  healOverTime INTEGER NOT NULL,
  hidratationYield INTEGER NOT NULL,
  bleedingYield INTEGER NOT NULL,
  radiationYield INTEGER NOT NULL,
  poisonYield INTEGER NOT NULL,
  hungerYield INTEGER NOT NULL,
  vomitChance INTEGER NOT NULL,
  type VARCHAR(30) NOT NULL,
  CONSTRAINT pk_Consumables PRIMARY KEY(itemsID)
);

CREATE TABLE Teas ( 
  itemsID INTEGER NOT NULL,
  statusUpgradeType INTEGER NOT NULL,
  upgradePercentage INTEGER NOT NULL,
  CONSTRAINT pk_Teas PRIMARY KEY(itemsID),
  CONSTRAINT fk_Teas_Items FOREIGN KEY (itemsID) REFERENCES Items(itemsID) ON DELETE RESTRICT
);

CREATE TABLE Clothing ( 
  itemsID INTEGER NOT NULL,
  coldResistance INTEGER NOT NULL,
  radResistance INTEGER NOT NULL,
  explosionResistance INTEGER NOT NULL,
  meleeResistance INTEGER NOT NULL,
  rangedResistance INTEGER NOT NULL,
  biteResistance INTEGER NOT NULL,
  equipmentSlot INTEGER NOT NULL,
  wetResistance INTEGER NOT NULL,
  CONSTRAINT pk_Clothing PRIMARY KEY(itemsID),
  CONSTRAINT fk_Clothing_Items FOREIGN KEY (itemsID) REFERENCES Items(itemsID) ON DELETE RESTRICT
);

CREATE TABLE Components ( 
  itemsID INTEGER NOT NULL UNIQUE,
  CONSTRAINT pk_Components PRIMARY KEY(itemsID),
  CONSTRAINT fk_Components_Items FOREIGN KEY (itemsID) REFERENCES Items(itemsID) ON DELETE RESTRICT
);

CREATE TABLE Resources ( 
  itemsID INTEGER NOT NULL,
  isPrimary ENUM_BOOLEAN NOT NULL,
  CONSTRAINT pk_Resources PRIMARY KEY(itemsID),
  CONSTRAINT fk_Resources_Items FOREIGN KEY (itemsID) REFERENCES Items(itemsID) ON DELETE RESTRICT
);

CREATE TABLE DropCharactersItems ( 
  dropCharactersItemsID INTEGER NOT NULL,
  item INTEGER NOT NULL,
  lootGrade INTEGER NOT NULL, 
  character INTEGER NOT NULL,
  CONSTRAINT pk_DropCharactersItems PRIMARY KEY(dropCharactersItemsID),
  CONSTRAINT fk_DropCharactersItems_Items FOREIGN KEY (item) REFERENCES Items(itemsID) ON DELETE RESTRICT,
  CONSTRAINT fk_DropCharactersItems_Characters FOREIGN KEY (character) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE PlayerCharactersGeneratesItem ( 
  character INTEGER NOT NULL, 
  items INTEGER NOT NULL,
  CONSTRAINT pk_PlayerCharactersGeneratesItem PRIMARY KEY(character, items),
  CONSTRAINT fk_PlayerCharactersGeneratesItem_Items FOREIGN KEY (items) REFERENCES Items(itemsID) ON DELETE RESTRICT,
  CONSTRAINT fk_PlayerCharactersGeneratesItem_Characters FOREIGN KEY (character) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);

CREATE TABLE WeaponsAreComposedOfComponentsResources (
  components INTEGER NOT NULL,
  resouces INTEGER NOT NULL,
  weapons INTEGER NOT NULL,
  CONSTRAINT pk_WeaponsAreComposedOfComponentsResources PRIMARY KEY(components, resouces),
  CONSTRAINT fk_WeaponsAreComposedOfComponentsResources_Items1 FOREIGN KEY (components) REFERENCES Items(itemsID) ON DELETE RESTRICT,
  CONSTRAINT fk_WeaponsAreComposedOfComponentsResources_Items2 FOREIGN KEY (resouces) REFERENCES Items(itemsID) ON DELETE RESTRICT,
  CONSTRAINT fk_WeaponsAreComposedOfComponentsResources_Items3 FOREIGN KEY (weapons) REFERENCES Items(itemsID) ON DELETE RESTRICT
);

CREATE TABLE ConsumablesAreComposedOfComponentsResources ( 
  components INTEGER NOT NULL,
  resouces INTEGER NOT NULL,
  consumables INTEGER NOT NULL,
  CONSTRAINT pk_ConsumablesAreComposedOfComponentsResources PRIMARY KEY(components, resouces),
  CONSTRAINT fk_ConsumablesAreComposedOfComponentsResources_Items1 FOREIGN KEY (components) REFERENCES Items(itemsID) ON DELETE RESTRICT,
  CONSTRAINT fk_ConsumablesAreComposedOfComponentsResources_Items2 FOREIGN KEY (resouces) REFERENCES Items(itemsID) ON DELETE RESTRICT,
  CONSTRAINT fk_ConsumablesAreComposedOfComponentsResources_Items3 FOREIGN KEY (consumables) REFERENCES Items(itemsID) ON DELETE RESTRICT
);

CREATE TABLE ClothingAreComposedOfComponentsResources ( 
  components INTEGER NOT NULL,
  resouces INTEGER NOT NULL,
  clothing INTEGER NOT NULL,
  CONSTRAINT pk_ClothingAreComposedOfComponentsResources PRIMARY KEY(components, resouces),
  CONSTRAINT fk_ClothingAreComposedOfComponentsResources_Items1 FOREIGN KEY (components) REFERENCES Items(itemsID) ON DELETE RESTRICT,
  CONSTRAINT fk_ClothingAreComposedOfComponentsResources_Items2 FOREIGN KEY (resouces) REFERENCES Items(itemsID) ON DELETE RESTRICT,
  CONSTRAINT fk_ClothingAreComposedOfComponentsResources_Items3 FOREIGN KEY (clothing) REFERENCES Items(itemsID) ON DELETE RESTRICT
);

CREATE TABLE ResourceNodes (
  resourceNodesID INTEGER NOT NULL,
  nodeType VARCHAR(30) NOT NULL,
  maxYield INTEGER NOT NULL,
  durabilityDamage INTEGER NOT NULL,
  biomes INTEGER NOT NULL,
  CONSTRAINT pk_ResourceNodes PRIMARY KEY(resourceNodesID),
  CONSTRAINT fk_ResourceNodes_Biomes FOREIGN KEY (biomes) REFERENCES Biomes(BiomesID) ON DELETE RESTRICT
);

CREATE TABLE ResourceNodesGenerateItems ( 
  resourceNodes INTEGER NOT NULL,
  item INTEGER NOT NULL,
  CONSTRAINT pk_ResourceNodesGenerateItems PRIMARY KEY(resourceNodes, item),
  CONSTRAINT fk_ResourceNodesGenerateItems_ResourceNodes FOREIGN KEY (resourceNodes) REFERENCES ResourceNodes(resourceNodesID) ON DELETE RESTRICT,
  CONSTRAINT fk_ResourceNodesGenerateItems_Items FOREIGN KEY (item) REFERENCES Items(itemsID) ON DELETE RESTRICT
);

CREATE TABLE RegionsMonuments ( 
  name VARCHAR(30) NOT NULL,
  regionMonument VARCHAR(30) NOT NULL,
  CONSTRAINT pk_RegionsMonuments PRIMARY KEY(name, regionMonument),
  CONSTRAINT fk_RegionsMonuments_Monuments FOREIGN KEY (name) REFERENCES Monuments(name) ON DELETE RESTRICT
);

CREATE TABLE LootCrates ( 
  lootCratesID INTEGER NOT NULL,
  grade INTEGER NOT NULL,
  CONSTRAINT pk_LootCrates PRIMARY KEY(lootCratesID)
);

CREATE TABLE StructuresContainsLootCrates ( 
  structure INTEGER NOT NULL,
  lootCrates INTEGER NOT NULL,
  CONSTRAINT pk_StructuresContainsLootCrates PRIMARY KEY(structure, lootCrates),
  CONSTRAINT fk_StructuresContainsLootCrates_Structures FOREIGN KEY (structure) REFERENCES Structures(structureID) ON DELETE RESTRICT,
  CONSTRAINT fk_StructuresContainsLootCrates_LootCrates FOREIGN KEY (lootCrates) REFERENCES LootCrates(lootCratesID) ON DELETE RESTRICT
);

CREATE TABLE Party ( 
  partyID INTEGER NOT NULL,
  character INTEGER NOT NULL,
  capacity INTEGER NOT NULL,
  CONSTRAINT pk_Party PRIMARY KEY(partyID),
  CONSTRAINT fk_Party_Characters FOREIGN KEY (character) REFERENCES Characters(charactersID) ON DELETE RESTRICT
);