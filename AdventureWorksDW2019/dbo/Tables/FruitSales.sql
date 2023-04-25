CREATE TABLE [dbo].[FruitSales] (
    [Id]         INT          IDENTITY (1, 1) NOT NULL,
    [Name]       VARCHAR (20) NULL,
    [SalesTotal] FLOAT (53)   NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);

