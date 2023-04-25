CREATE TABLE [dbo].[FactCurrencyRate] (
    [CurrencyKey]  INT        NOT NULL,
    [DateKey]      INT        NOT NULL,
    [AverageRate]  FLOAT (53) NOT NULL,
    [EndOfDayRate] FLOAT (53) NOT NULL,
    [Date]         DATETIME   NULL
) ON [F_Month_PS] ([DateKey]);


GO
CREATE CLUSTERED COLUMNSTORE INDEX [cci_FactCurrencyRate]
    ON [dbo].[FactCurrencyRate]
    ON [F_Month_PS] ([DateKey]);


GO
CREATE STATISTICS [stat_FactCurrencyRate]
    ON [dbo].[FactCurrencyRate]([CurrencyKey], [DateKey], [AverageRate], [EndOfDayRate], [Date])
    WITH INCREMENTAL = ON;

