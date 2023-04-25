
  create view [dbo].[v_DimCurrency]
	as
	SELECT 
	   [CurrencyKey]
      ,[CurrencyAlternateKey]
      ,[CurrencyName]
	FROM [AdventureWorksDW2019].[dbo].[DimCurrency]