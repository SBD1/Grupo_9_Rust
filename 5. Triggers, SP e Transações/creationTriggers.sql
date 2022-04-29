CREATE TRIGGER instanciateCharacter
AFTER INSERT ON characters
AS
    INSERT INTO Backpack (ownerID)
    SELECT id FROM inserted;