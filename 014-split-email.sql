-- display records by email domain
SELECT
	  RIGHT(Email, LEN(Email) - CHARINDEX('@', Email)) AS Domain
	, Email
FROM
	dbo.Person
WHERE
	(Email LIKE '%@%')	
ORDER BY
	LEN(RIGHT(Email, LEN(Email) - CHARINDEX('-', Email)))
DESC