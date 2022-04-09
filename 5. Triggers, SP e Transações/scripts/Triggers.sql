/* -------------------------------------------------- 

SGBD 1 - GRUPO 9

Script DDL - Triggers

----------------------------------------------------- */

CREATE TRIGGER deletePlayerCharacter
AFTER DELETE ON PlayerCharacters
FOR EACH ROW EXECUTE PROCEDURE delete_player_character();

CREATE TRIGGER deleteMainCharacter
AFTER DELETE ON MainCharacter
FOR EACH ROW EXECUTE PROCEDURE delete_main_character();

CREATE TRIGGER deleteRecruitableCharacter
AFTER DELETE ON RecruitableCharacters
FOR EACH ROW EXECUTE PROCEDURE delete_recruitable_character();

CREATE TRIGGER deleteNpcsCharacter
AFTER DELETE ON NPCs
FOR EACH ROW EXECUTE PROCEDURE delete_npcs_character();

CREATE TRIGGER deleteAnimalsCharacter
AFTER DELETE ON Animals
FOR EACH ROW EXECUTE PROCEDURE delete_animals_character();

CREATE TRIGGER deleteScientistsCharacter
AFTER DELETE ON Scientists
FOR EACH ROW EXECUTE PROCEDURE delete_scientists_character();

CREATE TRIGGER insertPlayerCharacter
BEFORE INSERT ON PlayerCharacters
FOR EACH ROW EXECUTE PROCEDURE insert_player_character();

CREATE TRIGGER insertMainCharacter
BEFORE INSERT ON MainCharacter
FOR EACH ROW EXECUTE PROCEDURE insert_main_character();

CREATE TRIGGER insertRecruitableCharacter
BEFORE INSERT ON RecruitableCharacters
FOR EACH ROW EXECUTE PROCEDURE insert_recruitable_character();

CREATE TRIGGER insertNpcsCharacter
BEFORE INSERT ON NPCs
FOR EACH ROW EXECUTE PROCEDURE insert_npcs_character();

CREATE TRIGGER insertAnimalsCharacter
BEFORE INSERT ON Animals
FOR EACH ROW EXECUTE PROCEDURE insert_animals_character();

CREATE TRIGGER insertScientistsCharacter
BEFORE INSERT ON Scientists
FOR EACH ROW EXECUTE PROCEDURE insert_scientists_character();