CREATE TYPE ENUM_STATUS AS ENUM ('HIGH','MEDIUM', 'LOW');

CREATE TABLE Climate ( 
  climateID int,
  temperature DECIMAL(4,1),
  event VARCHAR(30), 
  statusEffect VARCHAR(30),
  visibility ENUM_STATUS
);