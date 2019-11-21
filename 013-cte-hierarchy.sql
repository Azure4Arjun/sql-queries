-- use a Common Table Expression (CTE) to display hierarchical information
WITH Persons (ParentId, PersonId, FullName, LevelDepth, SortPath) AS (
	-- Anchor member definition
    SELECT
		 -1 ParentId
		, 0 PersonId
		, REPLICATE('-', 100) AS FullName
		, 0 LevelDepth
		, CAST(CAST(-1 AS BINARY(4)) AS VARBINARY(8000)) 
    UNION ALL
	-- Recursive member definition
    SELECT
		  person.ParentId
		, person.PersonId
		, CAST(person.FirstName + ' ' + person.LastName AS VARCHAR(100))
		, LevelDepth + 1
		, CAST(persons.SortPath + CAST(person.PersonId AS BINARY(4)) AS VARBINARY(8000)) AS SortPath
    FROM dbo.Person
    JOIN Persons
        ON person.ParentId = persons.PersonId
)
-- Statement that executes the CTE
SELECT ParentId, PersonId, LevelDepth, SPACE(LevelDepth * 4) + FullName 'FullName' FROM Persons ORDER BY SortPath