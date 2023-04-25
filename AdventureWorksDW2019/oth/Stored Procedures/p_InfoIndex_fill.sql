--exec [oth].[p_InfoIndex_fill]
CREATE procedure [oth].[p_InfoIndex_fill]
as
begin
	declare		 @name varchar(max) = '['+ OBJECT_SCHEMA_NAME(@@PROCID)+'].['+OBJECT_NAME(@@PROCID)+']'
				,@description varchar(500) = 'обслуживание бд'
				,@input_parametrs varchar(500) =  ''

		begin try
		--------------------------------------------------------------------------------------------------
		--  Запускаем процедуру логирования
		--------------------------------------------------------------------------------------------------
		exec [oth].[fill_sup_log] @name = @name,	@state_name = 'start', @sp_id = @@SPID, @description = @description, @input_parametrs  = @input_parametrs
		--------------------------------------------------------------------------------------------------
	    --------------------------------------------------------------------------------------------------
		--Таблица для логирования обслуживания
		--------------------------------------------------------------------------------------------------	
		truncate table [oth].[InfoIndex]

		insert into [oth].[InfoIndex]
				(
				 [TableName]
				,[ObjectID]
				,[IndexName]
				,[IndexId]
				,[Partition_number]
				,[PageCount]
				,[RowCount]
				)
		select 
						   s.name +'.' + o.name as [TableName], 
					       o.id as  [ObjectID],
						   si.name as [IndexName], 
						   si.index_id as [IndexId], 
						   ps.partition_number as [Partition_number],
						   max(ps.used_page_count) as [PageCount], 
						   max(ps.row_count) as [RowCount]
		from sys.sysobjects o 
		inner join sys.schemas s  
			on o.uid= s.schema_id
		inner join sys.stats  st  
			on st.object_id = o.id
		inner join sys.dm_db_partition_stats ps  
			on st.object_id=ps.object_id
		inner join sys.indexes si  
			on o.id = si.object_id and st.name=si.name 
		where o.type='U' --отсеиваем системные таблицы
		group by  o.id, 
				  s.name +'.' + o.name, 
				  si.name, 
				  si.index_id, 
				  ps.partition_number
		having max(ps.row_count)<> 0 
		--------------------------------------------------------------------------------------------------
		--  Завершаем процедуру логирования:
		--------------------------------------------------------------------------------------------------
		exec [oth].[fill_sup_log] @name = @name, @state_name = 'finish', @sp_id = @@SPID, @description = @description, @input_parametrs = @input_parametrs
	end try      
	begin catch
		exec [oth].[fill_sup_log] @name = @name, @state_name = 'error', @sp_id = @@SPID, @description = @description, @input_parametrs = @input_parametrs
	end catch 
 end
