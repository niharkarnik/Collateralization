
select 	a.value as 'field1', 
		b.value as 'field2', 
		c.value as 'field3', 
		d.value as 'field4', 
		e.value as 'field5'
from 	source_domain a , 
		source_domain b , 
		source_domain c , 
		source_domain d , 
		source_domain e

where a.field = 'field1' 
	and b.field='field2'
	and c.field='field3'
	and d.field='field4'
	and e.field='field5'
order by field1, field2, field3, field4, field5
;