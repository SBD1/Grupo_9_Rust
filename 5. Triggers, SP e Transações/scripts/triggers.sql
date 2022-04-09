$delete_player_character$ LANGUAGE plpgsql;
CREATE TRIGGER deletePlayerCharacter
AFTER DELETE ON PlayerCharacters
FOR EACH ROW EXECUTE PROCEDURE delete_player_character();

$delete_main_character$ LANGUAGE plpgsql;
CREATE TRIGGER deleteMainCharacter
AFTER DELETE ON MainCharacter
FOR EACH ROW EXECUTE PROCEDURE delete_main_character();

$delete_recruitable_character$ LANGUAGE plpgsql;
CREATE TRIGGER deleteRecruitableCharacter
AFTER DELETE ON RecruitableCharacters
FOR EACH ROW EXECUTE PROCEDURE delete_recruitable_character();

$delete_npcs_character$ LANGUAGE plpgsql;
CREATE TRIGGER deleteNpcsCharacter
AFTER DELETE ON NPCs
FOR EACH ROW EXECUTE PROCEDURE delete_npcs_character();

$delete_animals_character$ LANGUAGE plpgsql;
CREATE TRIGGER deleteAnimalsCharacter
AFTER DELETE ON Animals
FOR EACH ROW EXECUTE PROCEDURE delete_animals_character();

$delete_scientists_character$ LANGUAGE plpgsql;
CREATE TRIGGER deleteScientistsCharacter
AFTER DELETE ON Scientists
FOR EACH ROW EXECUTE PROCEDURE delete_scientists_character();

-- Characters
-- PlayerCharacters
-- MainCharacter
-- RecruitableCharacters
-- NPCs
-- Animals 
-- Scientists

-- DELETE FROM PlayerCharacters WHERE charactersID = 9;
-- DELETE FROM MainCharacter WHERE charactersID = 9;
-- DELETE FROM RecruitableCharacters WHERE charactersID = 9;
-- DELETE FROM NPCs WHERE charactersID = 9;
-- DELETE FROM Animals WHERE charactersID = 9;
-- DELETE FROM Scientists WHERE charactersID = 9;

-- INSERT INTO Characters VALUES (9, 'Character9', '6', 'model4', 'type4', 'item4');