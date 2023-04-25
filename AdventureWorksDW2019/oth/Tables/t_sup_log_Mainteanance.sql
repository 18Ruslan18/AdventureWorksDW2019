CREATE TABLE [oth].[t_sup_log_Mainteanance] (
    [date_time]     DATETIME       NULL,
    [table_name]    VARCHAR (512)  NULL,
    [object_name]   VARCHAR (512)  NULL,
    [type]          VARCHAR (32)   NULL,
    [stat_name]     VARCHAR (32)   NULL,
    [part_number]   INT            NULL,
    [query]         VARCHAR (2048) NULL,
    [duration]      TIME (7)       NULL,
    [database_name] NVARCHAR (64)  CONSTRAINT [DF_t_sup_log_Mainteanance_database_name] DEFAULT (db_name()) NULL
);

