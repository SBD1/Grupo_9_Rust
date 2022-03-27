CREATE TYPE loot_grade AS ENUM('resource','barrel','basic','military','tool','food','elite');
CREATE TYPE item_type as ENUM('ranged', 'resource','melee','clothes','component','consumable','tea');
CREATE TYPE fire_mode as ENUM('single','auto','semi-auto','full-auto','charged-fire','pump');
CREATE TYPE equipment_slot as ENUM('face','head','chest','chest-armour','feet','legs','leg-armour','whole-body')
CREATE TYPE status_type as ENUM('health','mining','woodcutting','radiation','scrap');