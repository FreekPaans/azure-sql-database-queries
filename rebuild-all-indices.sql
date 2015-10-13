DECLARE @DatabaseName SYSNAME   = DB_NAME(),  @TableName VARCHAR(256)  
DECLARE @DynamicSQL NVARCHAR(max) = 
 'DECLARE curAllTablesInDB CURSOR FOR SELECT TABLE_SCHEMA + 
 ''.'' + TABLE_NAME AS TABLENAME   
 FROM ' + @DatabaseName + '.INFORMATION_SCHEMA.TABLES WHERE 
 TABLE_TYPE = ''BASE TABLE'''   
BEGIN  
  EXEC sp_executeSQL @DynamicSQL  -- create tables cursor
  OPEN curAllTablesInDB   
  FETCH NEXT FROM curAllTablesInDB INTO @TableName   
  WHILE (@@FETCH_STATUS = 0)  
  BEGIN   
       SET @DynamicSQL = 'ALTER INDEX ALL ON ' + @TableName +  ' REBUILD'  
       PRINT @DynamicSQL
      EXEC sp_executeSQL @DynamicSQL  
       FETCH NEXT FROM curAllTablesInDB INTO @TableName   
   END   -- cursor WHILE
   CLOSE curAllTablesInDB   
   DEALLOCATE curAllTablesInDB  
END
