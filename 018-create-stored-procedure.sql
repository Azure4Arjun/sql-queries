-- stored procedure labeled dbo.Person_Get, categorically by person, then verb/action Get
-- when you have many stored procedures this helps group similar items
-- stored procedures prefixed with an sp_ are marked by Microsoft as System Procedures

-- check and drop the stored procedure if it exists
-- the drop command helps if managing multiple databases
-- alternatively, you may use ALTER PROCEDURE dbo.Persons_Get
IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Persons_Get') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.Persons_Get
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.Persons_Get
AS

-- disable SQL message from being returned, slightly improves performance
SET NOCOUNT ON;

SELECT
	  PersonId
	, FirstName
	, LastName
FROM
	dbo.Person
ORDER BY
	  LastName
	, FirstName