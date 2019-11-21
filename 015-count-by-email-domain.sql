SELECT
	  RIGHT(Email, LEN(Email) - CHARINDEX('@', Email)) AS Domain
	, COUNT(RIGHT(Email, LEN(Email) - CHARINDEX('@', Email))) AS Totals
FROM
	dbo.Person
GROUP BY
	RIGHT(Email, LEN(Email) - CHARINDEX('@', Email))
ORDER BY
	Totals
DESC