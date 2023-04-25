create view queryReport
as
	select 
		c.FirstName,
		c.LastName,
		g.EnglishCountryRegionName,
		g.City,
		p.EnglishProductName,
		s.SalesAmount
	from [dbo].[FactInternetSales] s
	inner join [dbo].[DimCustomer] c
		on s.CustomerKey = c.CustomerKey
	inner join [dbo].[DimGeography] g
		on c.GeographyKey = g.GeographyKey
	inner join [dbo].[DimProduct] p
		on s.ProductKey = p.ProductKey
