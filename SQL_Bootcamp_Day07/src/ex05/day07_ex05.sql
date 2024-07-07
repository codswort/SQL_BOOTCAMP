select distinct (select person.name from person where person_order.person_id = person.id) as name
from person_order
order by 1;
