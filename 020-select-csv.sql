IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Persons_PhonesCsv') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.Persons_PhonesCsv
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.Persons_PhonesCsv
AS

SET NOCOUNT ON;

SELECT 
	  Person.FirstName
	, Person.LastName
	, List.Phones
FROM
	dbo.Person
	INNER JOIN Phone ON Person.PersonId = Phone.PersonId
	OUTER APPLY
	(
		SELECT PhoneType + '|' + Phone + ',' FROM dbo.Phone WHERE PersonId = Person.PersonId FOR XML PATH('') 
	) List(Phones)
