CREATE TABLE [oth].[InfoIndex] (
    [Id]               INT           IDENTITY (1, 1) NOT NULL,
    [TableName]        VARCHAR (512) NULL,
    [ObjectID]         BIGINT        NULL,
    [IndexName]        VARCHAR (512) NULL,
    [IndexId]          INT           NULL,
    [Partition_number] INT           NULL,
    [PageCount]        BIGINT        NULL,
    [RowCount]         BIGINT        NULL
);

