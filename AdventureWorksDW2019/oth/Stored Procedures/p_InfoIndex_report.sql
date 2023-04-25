--exec [oth].[p_InfoIndex_report]
CREATE procedure [oth].[p_InfoIndex_report]
as
begin	
		SET NOCOUNT ON;
		select 
						   row_number() over(order by o.id ) as [Id],
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
 end
