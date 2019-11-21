-- Common Table Expression implemented using Dynamic SQL
-- to page through records and sort by column header

--#######################################################
--#######################################################
-- WARNING -- USING DYNAMIC SQL CAN OPEN YOUR DATABASE
--            UP TO POTENTIAL VULNERABILITIES INCLUDING
--            BUT NOT LIMITED TO SQL INJECTION
--#######################################################
--#######################################################
DECLARE
	  @IsDebug				BIT = 0
	, @PageNumber			INT = 1
	, @PageSize				INT = 3
	, @SortColumn			VARCHAR(50) = 'LastName'
	, @SortDirection		INT = 0 -- 1 is desc
	, @EndRow				INT
	, @StartRow				INT
	, @SQL					NVARCHAR(MAX)
	, @SQLDirection			VARCHAR(4)
	, @SQLParams			NVARCHAR(MAX)
	, @SQLSort				NVARCHAR(MAX)

SET @StartRow = (@PageNumber - 1) * @PageSize
SET @EndRow	= ((@PageNumber - 1) * @PageSize) + @PageSize
SET @SQLDirection = CASE WHEN @SortDirection = 1 THEN 'DESC' ELSE 'ASC' END

SELECT
	  @SQL = ''
	, @SQLParams = '  @StartRow INT
					, @EndRow INT
					, @PageNumber INT
					, @PageSize INT'

IF @SortColumn = 'LastName'
	SET @SQLSort = 'Row_Number() OVER (ORDER BY LastName ' + @SQLDirection + ')'
ELSE
	SET @SQLSort = 'Row_Number() OVER (ORDER BY FirstName ' + @SQLDirection + ')'

SET @SQL = '
; WITH Persons AS
(
	SELECT
		  PersonId
		, FirstName
		, LastName
		, TotalRows = COUNT(*) OVER()
		, ' + @SQLSort + ' AS RowNumber
	FROM         
		dbo.Person
)
SELECT
	  PersonId
	, FirstName
	, LastName
	, TotalRows
	, RowNumber
FROM
	Persons
WHERE
	RowNumber > @StartRow AND RowNumber <= @EndRow '

IF @IsDebug = 1
	PRINT @SQL

EXECUTE sp_executesql 
	  @SQL
	, @SQLParams
	, @StartRow
	, @EndRow
	, @PageNumber
	, @PageSize