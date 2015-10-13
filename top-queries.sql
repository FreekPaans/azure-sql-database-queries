SELECT TOP 25
    q.[text],
    (total_logical_reads/execution_count) AS avg_logical_reads, 
    (total_logical_writes/execution_count) AS avg_logical_writes, 
    (total_physical_reads/execution_count) AS avg_phys_reads, 
	total_physical_reads,
	creation_time,
	last_execution_time,
    Execution_count,
	execution_count/ datediff(mi,creation_time,getdate()) as avg_execs_per_minute
FROM sys.dm_exec_query_stats   
    cross apply sys.dm_exec_sql_text(plan_handle) AS q 
ORDER BY

total_physical_reads desc
