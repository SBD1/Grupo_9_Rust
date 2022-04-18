CREATE TRIGGER instanciateCharacter
AFTER INSERT ON characters
AS 
    INSERTO INTO Backpack (ownerID)
    SELECT charactersID FROM inserted;