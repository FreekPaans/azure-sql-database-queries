select
	sys.indexes.is_disabled,
    sys.objects.name,
    sys.indexes.*

from sys.indexes
    inner join sys.objects on sys.objects.object_id = sys.indexes.object_id
--where sys.indexes.is_disabled = 1
order by
    sys.objects.name,
    sys.indexes.name

	select 
     [Table]     = o2.name, 
     [Constraint] = o.name, 
     [Enabled]   = case when ((C.Status & 0x4000)) = 0 then 1 else 0 end
from sys.sysconstraints C
     inner join sys.sysobjects o on  o.id = c.constid -- and o.xtype='F'
     inner join sys.sysobjects o2 on o2.id = o.parent_obj
