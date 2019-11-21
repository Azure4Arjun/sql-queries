-- creates a database named demo
CREATE DATABASE demo
GO

-- switches to use the demo database
Use demo
GO

-- create a user account using alpha-numeric characters and a strong password (16 chars)
CREATE LOGIN demo_app_2019 WITH PASSWORD = 'D3m0_Appl*c@t*0n_2019!!'
GO

-- make the login user the database owner
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = N'demo_app_2019')
BEGIN
    CREATE USER demo_app_2019 FOR LOGIN demo_app_2019
    EXEC sp_addrolemember N'db_owner', N'demo_app_2019'
END;
GO
