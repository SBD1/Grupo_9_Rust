/* -------------------------------------------------- 

SGBD 1 - GRUPO 9

Script DDL - Criação das tabelas do projeto

----------------------------------------------------- */

CREATE TABLE Map { 
  mapID INTEGER NOT NULL PRIMARY KEY
};

CREATE TABLE Structures { 
  structureID INTEGER NOT NULL PRIMARY KEY,
  monument VARCHAR(100) NOT NULL
};

CREATE TABLE Region { 
  coordinates INTEGER NOT NULL PRIMARY KEY,
  biome VARCHAR(30) NOT NULL,
  dangerLevel SMALLINT NOT NULL,
  monument INTEGER NOT NULL PRIMARY KEY,
  FOREIGN KEY (monument) REFERENCES Structures(structureID)
}

CREATE TABLE HaveMapRegion { 
  mapID INTEGER NOT NULL PRIMARY KEY,
  coordinates INTEGER NOT NULL PRIMARY KEY,
  FOREIGN KEY (mapID) REFERENCES Map(mapID),
  FOREIGN KEY (coordinates) REFERENCES Region(coordinates)
};

CREATE TABLE Climate { 
  climateID INTEGER NOT NULL PRIMARY KEY,
  temperature DECIMAL(4,1) NOT NULL,
  event VARCHAR(30) NOT NULL, 
  statusEffect VARCHAR(30) NOT NULL,
  visibility ENUM('HIGH','MEDIUM', 'LOW') NOT NULL
}

CREATE TABLE Biomes { 
  biomesID INTEGER NOT NULL PRIMARY KEY,
  coordinates INTEGER NOT NULL,
  resourceAbundance ENUM('true','false') NOT NULL,
  resourceAvailability ENUM('true','false') NOT NULL,
  type VARCHAR(30) NOT NULL,
  climate INTEGER NOT NULL,
  FOREIGN KEY (climate) REFERENCES Climate(climateID)
}

CREATE TABLE Flora { 
  flora VARCHAR(30) NOT NULL PRIMARY KEY,
  biomes INTEGER NOT NULL,
  FOREIGN KEY (biomes) REFERENCES Biomes(biomesID)
}

CREATE TABLE Fauna { 
  fauna VARCHAR(30) NOT NULL PRIMARY KEY,
  biomes INTEGER NOT NULL,
  FOREIGN KEY (biomes) REFERENCES Biomes(biomesID)
}

CREATE TABLE Characters { 
  charactersID INTEGER NOT NULL PRIMARY KEY,
  name VARCHAR(100) NOT NULL,
  position INTEGER NOT NULL,
  characterModel VARCHAR(30) NOT NULL,
  climate INTEGER NOT NULL,
  type VARCHAR(30) NOT NULL,
  item VARCHAR(30) NOT NULL,
  FOREIGN KEY (climate) REFERENCES Climate(climateID)
};

CREATE TABLE GatherYield { 
  character INTEGER NOT NULL PRIMARY KEY, 
  gatherYield VARCHAR(30) NOT NULL PRIMARY KEY,
  FOREIGN KEY (character) REFERENCES Characters(charactersID)
};

CREATE TABLE EnterCombatCharacters { 
  enterCombatCharactersID INTEGER NOT NULL PRIMARY KEY,
  firstCharacter INTEGER NOT NULL,
  secondCharacter INTEGER NOT NULL,
  FOREIGN KEY (firstCharacter) REFERENCES Characters(charactersID),
  FOREIGN KEY (secondCharacter) REFERENCES Characters(charactersID),
};

CREATE TABLE CombatLog { 
  enterCombatCharacters INTEGER NOT NULL PRIMARY KEY,
  indexLog INTEGER NOT NULL PRIMARY KEY,
  log VARCHAR(100) NOT NULL
};

CREATE TABLE PlayerCharacters { 
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
  FOREIGN KEY (charactersID) REFERENCES Characters(charactersID)
};

CREATE TABLE RecruitableCharacters { 
  charactersID INTEGER NOT NULL PRIMARY KEY,
  specialization VARCHAR(30) NOT NULL,
  recruited ENUM('true','false') NOT NULL,
  FOREIGN KEY (charactersID) REFERENCES Characters(charactersID)
};

CREATE TABLE MainCharacter { 
  charactersID INTEGER NOT NULL PRIMARY KEY,
  owner INTEGER NOT NULL PRIMARY KEY,
  FOREIGN KEY (charactersID) REFERENCES Characters(charactersID)
};

CREATE TABLE RespawnLocation { 
  ownerID INTEGER NOT NULL PRIMARY KEY,
  description VARCHAR(100) NOT NULL,
  timer INTEGER NOT NULL,
  X INTEGER NOT NULL,
  Y INTEGER NOT NULL
};
















CREATE TABLE NPCs { 
  charactersID INTEGER NOT NULL PRIMARY KEY,
  isAgressive ENUM('true','false') NOT NULL,
  aggroRange, 
  enemyGrade, 
  type 
};

CREATE TABLE Animals { 
  charactersID INTEGER NOT NULL PRIMARY KEY,
  sound VARCHAR(100) NOT NULL,
  modelType 
};

CREATE TABLE Scientists { 
  charactersID INTEGER NOT NULL PRIMARY KEY,
  hasDialogue 
};

CREATE TABLE DialogueText { 
  dialogue, 
  character 
};

CREATE TABLE Items { 
  itemsID INTEGER NOT NULL PRIMARY KEY,
  stackSize, 
  lootGrade, 
  name, 
  type, 
  quantity, 
  durability, 
  craftable,
  type, 
  backpack, 
  character 
};

CREATE TABLE Ingredients { 
  ingredient, 
  items, 
  lootGrade 
};

CREATE TABLE Weapons { 
  itemsID INTEGER NOT NULL PRIMARY KEY,
  type
};

CREATE TABLE Melee { 
  itemsID INTEGER NOT NULL PRIMARY KEY,
  canBeThrown, 
  fleshGatherRate, 
  oreGatherRate,
  treeGatherRate 
};

CREATE TABLE Ranged { 
  itemsID INTEGER NOT NULL PRIMARY KEY,
  recoil, 
  attackRange, 
  amnoCapacity, 
  modSlots, 
  fireMode,
  CREATE TABLE 
  fireRate, 
  accuracyModifier 
};

CREATE TABLE Consumables { 
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
};

CREATE TABLE Teas { 
  itemsID INTEGER NOT NULL PRIMARY KEY,
  statusUpgradeType, 
  upgradePercentage 
};

CREATE TABLE Clothing { 
  itemsID INTEGER NOT NULL PRIMARY KEY,
  coldResistance, 
  radResistance, 
  explosionResistance,
  meleeResistance, 
  rangedResistance, 
  biteResistance, 
  equipmentSlot,
  wetResistance
};

CREATE TABLE Components { 
  itemsID INTEGER NOT NULL PRIMARY KEY
};

CREATE TABLE Resources { 
  itemsID INTEGER NOT NULL PRIMARY KEY,
  isPrimary 
};

CREATE TABLE DropCharactersItems { 
  dropCharactersItemsID INTEGER NOT NULL PRIMARY KEY,
  item, 
  lootGrade, 
  character 
};

CREATE TABLE PlayerCharactersGeneratesItem { 
  character, 
  items 
};

CREATE TABLE WeaponsAreComposedOfComponentsResources {
  components, 
  resouces,
  weapons
};

CREATE TABLE ConsumablesAreComposedOfComponentsResources { 
  components, 
  resouces,
  consumables 
};

CREATE TABLE ClothingAreComposedOfComponentsResources { 
  components, 
  resouces,
  clothing
};

CREATE TABLE ResourceNodes {
  resourceNodesID INTEGER NOT NULL PRIMARY KEY,
  nodeType, 
  maxYield, 
  durabilityDamage,
  biomes 
};

CREATE TABLE ResourceNodesGenerateItems { 
  resourceNodes, 
  item 
};

CREATE TABLE Monuments { 
  name, 
  monumentSize, 
  lootGrade, 
  enemyGrade 
};

CREATE TABLE regionsMonuments { 
  name, 
  regionMonument 
};

CREATE TABLE LootCrates { 
  lootCratesID INTEGER NOT NULL PRIMARY KEY,
  grade 
};

CREATE TABLE StructuresContainsLootCrates { 
  structure,
  lootCrates 
};

CREATE TABLE Party { 
  partyID INTEGER NOT NULL PRIMARY KEY,
  character, 
  capacity 
};

CREATE TABLE Backpack { 
  ownerID INTEGER NOT NULL PRIMARY KEY,
  slot1,
  slot2,
  slot3,
  slot4
};
