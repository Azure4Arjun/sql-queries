-- Alter column on table with existing records
IF COL_LENGTH('dbo.Person','ParentId') IS NULL
	ALTER TABLE Person ADD ParentId INT

-- To update large quanitties of data you use a cursor to update chuncks at a time 
DECLARE @Start				INT = 0
DECLARE @End				INT = 5
DECLARE @RecordsPerUpdate	INT = 3
DECLARE @TotalRecords INT
SELECT @TotalRecords = COUNT(*) FROM [Person]

WHILE @Start < @TotalRecords
BEGIN -- example using conditional statement in a while block
    SET @Start = @Start + 1
	
	UPDATE Person SET ParentId = 0 WHERE ParentId IS NULL AND PersonId >= @Start AND PersonId <= @End

	SET @Start = @End
	SET @End = @End + @RecordsPerUpdate
	print @End
	--waitfor DELAY  '00:00:01'
END
GO

-- once NULL records no longer exist, add a default value
ALTER TABLE Person ADD CONSTRAINT DF_Person_ParentId DEFAULT(0) FOR ParentId
GO

-- once NULL records no longer exist, ensure column cannot be null
ALTER TABLE Person ALTER COLUMN ParentId INT NOT NULL