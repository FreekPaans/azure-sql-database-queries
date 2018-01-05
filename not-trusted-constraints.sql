--from https://www.brentozar.com/blitz/foreign-key-trusted/
--https://blog.sqlauthority.com/2015/01/09/sql-server-what-is-is_not_trusted-in-sys-foreign_keys/


SELECT '[' + s.name + '].[' + o.name + '].[' + i.name + ']' AS keyname
from sys.foreign_keys i
INNER JOIN sys.objects o ON i.parent_object_id = o.object_id
INNER JOIN sys.schemas s ON o.schema_id = s.schema_id
WHERE i.is_not_trusted = 1 AND i.is_not_for_replication = 0;
GO
 
SELECT '[' + s.name + '].[' + o.name + '].[' + i.name + ']' AS keyname
from sys.check_constraints i
INNER JOIN sys.objects o ON i.parent_object_id = o.object_id
INNER JOIN sys.schemas s ON o.schema_id = s.schema_id
WHERE i.is_not_trusted = 1 AND i.is_not_for_replication = 0 AND i.is_disabled = 0;
GO

select is_not_trusted,is_disabled,* from sys.foreign_keys
