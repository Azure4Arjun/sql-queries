-- create a table named Person with the schema of dbo (Database Owner)
-- creates an auto incremented Primary Key (clustered index) and multiple
-- columns which do not allow null values
CREATE TABLE dbo.Person (
    PersonId INT IDENTITY(1,1) PRIMARY KEY,
    FirstName VARCHAR(255)  NOT NULL,
	LastName VARCHAR(255) NOT NULL,
	Email VARCHAR(60) NOT NULL
)
GO
-- create a table named Phone with the schema of dbo (Database Owner)
CREATE TABLE dbo.Phone (
    PhoneId INT IDENTITY(1,1) PRIMARY KEY,
    PersonId INT NOT NULL,
	PhoneNumber VARCHAR(10) NOT NULL,
	PhoneType VARCHAR(6)
)
GO
-- create a Foreign Key reference from dbo.Phone to dbo.Person requiring a valid PersonId to exist
-- in dbo.Person
ALTER TABLE dbo.Phone ADD CONSTRAINT FK_Phone_Person FOREIGN KEY (PersonId) REFERENCES Person(PersonId);