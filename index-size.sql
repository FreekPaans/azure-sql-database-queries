select o1.name table_name,o1.object_id,si.name index_name,dm.reserved_page_count * 8.0/1024 mbsize
from sys.objects o1 
join sys.dm_db_partition_stats dm on dm.object_id=o1.object_id
join sys.indexes si on si.object_id=o1.object_id and dm.index_id=si.index_id
where o1.object_id>255
order by mbsize desc
