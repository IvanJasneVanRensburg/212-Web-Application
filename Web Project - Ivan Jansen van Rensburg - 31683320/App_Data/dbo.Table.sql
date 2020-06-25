CREATE TABLE [dbo].[UserTable]
(
	[Email] NVARCHAR(50) NOT NULL PRIMARY KEY, 
    [FirstName] NVARCHAR(50) NULL, 
    [LastName] NVARCHAR(50) NULL, 
    [Password] NCHAR(10) NULL
)
