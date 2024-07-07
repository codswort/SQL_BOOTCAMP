select person_id, count (pizzeria_id) as count_of_visits
from person_visits
group by person_id
order by 2 desc, 1;
