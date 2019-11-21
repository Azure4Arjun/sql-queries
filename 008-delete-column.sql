-- drop constraint
ALTER TABLE dbo.Person DROP CONSTRAINT DF_Person_BirthYear
GO
-- drop column
ALTER TABLE dbo.Person DROP COLUMN BirthYear