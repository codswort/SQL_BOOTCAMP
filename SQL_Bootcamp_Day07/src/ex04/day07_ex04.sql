with one as (select person.name, count(pizzeria_id) as count
from person_visits
join person on person.id = person_visits.person_id
group by person.name having count(pizzeria_id) > 3)
select * from one;
