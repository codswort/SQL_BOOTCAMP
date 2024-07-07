select person.address,
       round(max(age) - (cast(min(age) as numeric) / cast(max(age) as numeric)), 2) as formula,
       round(avg (age), 2) as average,
       case when (cast(max(age) as numeric) - (cast(min(age) as numeric) / cast(max(age) as numeric))) > round(avg (age), 2) then true
       else false end as comparison
from person
group by person.address
order by 1;
