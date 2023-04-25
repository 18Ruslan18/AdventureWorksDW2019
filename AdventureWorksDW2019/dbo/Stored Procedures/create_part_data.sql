--Abdullin
CREATE procedure dbo.create_part_data
	 @date_from date = '2015-01-01'
	,@date_to date = '2030-01-01'
	,@date_id nvarchar(2) = 'MM'
as
begin

	declare  @date_from_int int = format(@date_from,'yyyyMMdd')
			,@date_to_int int =  format(@date_to,'yyyyMMdd')
		


	declare @sql_part_func nvarchar(max) = '
	create partition function [F_part_'+@date_id+'] (int) 
		as 
			range right for values ('

	declare @sql_part_sch nvarchar(max) = '
	create partition scheme [S_part_'+@date_id+']
		as 
			partition [F_part_'+@date_id+'] to ([PRIMARY],'



	while @date_from_int < @date_to_int
		begin
			select @sql_part_func = @sql_part_func + cast(@date_from_int as nvarchar) + ','
			select @sql_part_sch = @sql_part_sch + '[PRIMARY],'

			if @date_id='dd'  
				select @date_from = dateadd(dd,1,@date_from)
			if @date_id='mm'  
				select @date_from = dateadd(mm,1,@date_from)
			if @date_id='qq'  
				select @date_from = dateadd(qq,1,@date_from)			
	 
			select @date_from_int = format(@date_from,'yyyyMMdd')
		end

	select @sql_part_func = left(@sql_part_func,len(@sql_part_func)-1) + ')'
	select @sql_part_sch = left(@sql_part_sch,len(@sql_part_sch)-1) + ')'

	exec(@sql_part_func)  
	exec(@sql_part_sch)

	select 'partition function: ' + '[F_part_'+@date_id+']'
	select 'partition scheme: ' + '[S_part_'+@date_id+']'
end