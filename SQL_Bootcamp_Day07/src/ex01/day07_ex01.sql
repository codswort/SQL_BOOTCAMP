select person.name, count (pizzeria_id) as count_of_visits
from person_visits
join person on person.id = person_visits.person_id
group by person.name
order by 2 desc, 1 limit 4;
