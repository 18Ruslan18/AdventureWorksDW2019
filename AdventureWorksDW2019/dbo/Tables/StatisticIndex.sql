CREATE TABLE [dbo].[StatisticIndex] (
    [TableName]                      VARCHAR (512) NULL,
    [ObjectID]                       BIGINT        NULL,
    [IndexName]                      VARCHAR (512) NULL,
    [IndexId]                        INT           NULL,
    [Partition_number]               INT           NULL,
    [index_type_desc]                VARCHAR (128) NULL,
    [avg_fragmentation_in_percent]   FLOAT (53)    NULL,
    [fragment_count]                 INT           NULL,
    [avg_page_space_used_in_percent] FLOAT (53)    NULL
);

