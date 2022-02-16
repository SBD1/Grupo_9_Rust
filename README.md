# Rust - Grupo 09

**Disciplina**: Sistema de Banco de Dados 1<br>
**Código da Disciplina**: FGA0137<br>

## Alunos
|Matrícula | Aluno | GitHub |
| -- | -- | -- |
| 16/0124735 | Iago Oliveira | [@iagoomr](https://github.com/iagoomr) |
| 18/0145088 | Gabriel Bonifácio Perez Nunes | [@gabrielbpn](https://github.com/gabrielbpn) |
| 16/0037522 | Nilo Mendonça de Brito Júnior | [@NiloMendonca](https://github.com/NiloMendonca) |
| 16/0038090 | Pedro Daniel Carvalho Matias | [@pdaniel37](https://github.com/pdaniel37) |
| 15/0149948 | Thiago Ferreira | [@thiagoiferreira](https://github.com/thiagoiferreira) |

## Sobre
<p align="justify">
&nbsp;&nbsp;Repositório direcionado para o desenvolvimento do projeto do Grupo 09 na disciplina SBD1 com o professor Maurício Serrano. O projeto visa o desenvolvimento de um jogo de Rust no estilo MUD (Multi-user dungeon).
</p>

<p align="center">
  <img src="images/rust.jpg" title="Capa do Jogo Rust">
</p>

## Módulo 1 - Modelo Entidade Relacionamento
<p align="justify">
&nbsp;&nbsp;O Modelo Entidade Relacionamento, se caracteriza como um modelo conceitual utilizado na Engenharia de Software que busca descrever as entidades (objetos) envolvidas em um domínio de negócios, com seus atributos (características) e como elas se relacionam entre si (relacionamentos). Representando de forma abstrata a estrutura que possuirá o  banco de dados da aplicação.
</p>

### Diagrama
<p align="center">
  <img src="images/MER--v1.0.jpg" title="Diagrama MER">
</p>

## Módulo 2 - Modelo Relacional
<p align="justify">
&nbsp;&nbsp;O modelo relacional é um modelo de dados representativo, que se baseia no princípio de que todos os dados estão armazenados em relações (tabelas). Toda sua definição é teórica e baseada na lógica de predicados e na teoria dos conjuntos.
</p>

### Representação
```
Map = { mapID }

HaveMapRegion = { mapID, coordinates }

Region = { coordinates*¹, biome, monument, dangerLevel, monument*¹º }

Biomes = { biomesID*², coordinates*¹, resourceAbundance, resourceAvailability, type, climate*³ }

Flora = { biomes*², flora }

Fauna = { biomes*², fauna }

Climate = { climateID*³, temperature, event, statusEffect, visibility }

Characters = { charactersID*⁴, name, position, gatherYield, characterModel, health, speed, visibility, climate*³, type, item }

EnterCombatCharacters = { enterCombatCharactersID*⁵, firstCharacter*⁴, secondCharacter*⁴ }

CombatLog = { enterCombatCharacters*⁵, indexLog, log }

PlayerCharacters = { charactersID*⁴, comfort, wet, radiation, oxygen, hydration, poisoned, temperature, hunger, coldResistance, type, equipedItems1, equipedItems2, equipedItems3, equipedItems4, equipedItems5, backpack*¹³ }

RecruitableCharacters = { charactersID*⁴, specialization, recruited, loyalty }

MainCharacter = { charactersID*⁴, owner*⁶ }

RespawmLocation = { ownerID*⁶, description, timer, X, Y }

NPCs = { charactersID*⁴, isAgressive, aggroRange, enemyGrade, type }

Animals = { charactersID*⁴, sound, modelType }

Scientists = { charactersID*⁴, hasDialogue }

DialogueText = { character*⁴, dialogue }


Items = { itemsID*⁷, stackSize, lootGrade*⁸, name, type, quantity, durability, craftable, type, backpack*¹³ }

Ingredients = { items*⁷, lootGrade*⁸, ingredient }

DropCharactersItems = { dropCharactersItemsID, item*⁷, lootGrade*⁸, character*⁴ }

Weapons = { itemsID*⁷, armsDamage, legDamage, chestDamage, headDamage, range, type }

Melee = { itemsID*⁷, canBeThrown, fleshGatherRate, oreGatherRate, treeGatherRate }

Ranged = { itemsID*⁷. recoil, attackRange, amnoCapacity, modSlots, fireMode, fireRate, accuracyModifier }

Consumables = { itemsID*⁷, instantHeal, healOverTime, hidrationYield, bleedingYield, radiationYield, poisonYield, hungerYield, hungerYield, vomitChance, type }

Teas = { itemsID*⁷, statusUpgradeType, upgradePercentage }

Clothing = { itemsID*⁷, coldResistance, radResistance, explosionResistance, meleeResistance, rangedResistance, biteResistance, equipmentSlot, wetResistance }

Components = { itemsID*⁷ }

Resources = { itemsID*⁷, isPrimary, isProcessed }

WeaponsAreComposedOfComponentsResources = { weapons*⁷, components*⁷, resouces*⁷ }

ConsumablesAreComposedOfComponentsResources = { consumables*⁷, components*⁷, resouces*⁷ }

ClothingAreComposedOfComponentsResources = { clothing*⁷, components*⁷, resouces*⁷ }

ResourceNodes = { resourceNodesID*⁹, nodeType, maxYield, durabilityDamage, biomes*² }

ResourceNodesGenerateItems = { resourceNodes*⁹, item*⁷ }

Monuments = { name*¹º, monumentSize, lootGrade, enemyGrade, regions }

Structures = { structureID*¹¹ , monument*¹º }

LootCrates = { lootCratesID*¹², grade, quantityOfItems }

StructuresContainsLootCrates = {  structure*¹¹, lootCrates*¹² }

Party = { capacity } 

Backpack = { ownerID*¹³, availableSlots, slot1, slot2, slot3, slot4, slot5, totalSlots }
```
