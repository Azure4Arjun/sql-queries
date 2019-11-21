IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'dbo.Person_ByEmail') AND type in (N'P', N'PC'))
	DROP PROCEDURE dbo.Person_ByEmail
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE dbo.Person_ByEmail
(
	@Email VARCHAR(60) = ''
)
AS

SET NOCOUNT ON;

SELECT 
	  FirstName
	, LastName
FROM
	dbo.Person
WHERE
	Email = @Email