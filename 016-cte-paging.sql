-- Common Table Expression (CTE) to page through records
DECLARE
	  @PageNumber	INT = 1
	, @PageSize		INT = 3
	, @EndRow		INT
	, @StartRow		INT

SET @StartRow = (@PageNumber - 1) * @PageSize
SET @EndRow = ((@PageNumber - 1) * @PageSize) + @PageSize
	
;WITH Persons AS
(
	SELECT
		  PersonId
		, FirstName
		, LastName
		, ROW_NUMBER() OVER (ORDER BY PersonId) AS RowNumber
		, TotalRows = COUNT(*) OVER()
	FROM
		dbo.Person
)
SELECT
	  PersonId
	, FirstName
	, LastName
	, RowNumber
	, TotalRows
FROM
	Persons
WHERE
	RowNumber > @StartRow AND RowNumber <= @EndRow