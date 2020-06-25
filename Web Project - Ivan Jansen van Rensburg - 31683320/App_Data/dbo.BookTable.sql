CREATE TABLE [dbo].[BookTable]
(
	[ID] INT NOT NULL PRIMARY KEY IDENTITY, 
    [Name] NVARCHAR(MAX) NULL, 
    [Author] NVARCHAR(50) NULL, 
    [Year] NVARCHAR(50) NULL, 
    [Faculty] NVARCHAR(50) NULL, 
    [Price] NCHAR(5) NULL
)
