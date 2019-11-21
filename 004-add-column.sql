-- Add Nullable Column
ALTER TABLE dbo.Person ADD ParentId INT

-- Add Non-Nullable Column
ALTER TABLE dbo.Person ADD BirthYear INT NOT NULL

-- Add Non-Nullable Column with Default Value using a default constraint
ALTER TABLE dbo.Person ADD Age INT NOT NULL CONSTRAINT DF_Persons_Age DEFAULT(0)