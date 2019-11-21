-- add another default value
ALTER TABLE dbo.Person ADD CONSTRAINT DF_Person_BirthYear DEFAULT(2019) FOR BirthYear