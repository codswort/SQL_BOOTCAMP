create or replace function fnc_person_visits_and_eats_on_date(
    IN pperson varchar default 'Dmitriy',
    IN pprice numeric default 500,
    IN pdate date default '2022-01-08') returns setof varchar as $fnc_person_visits_and_eats_on_date$
begin
    return query
    select pizzeria.name as pizzeria_name
    from pizzeria
    join menu on menu.pizzeria_id = pizzeria.id
    join person_visits on person_visits.pizzeria_id = pizzeria.id
    join person on person.id = person_visits.person_id
    where (person_visits.visit_date = pdate AND person.name = pperson AND price < pprice);
end
$fnc_person_visits_and_eats_on_date$ language plpgsql;

select *
from fnc_person_visits_and_eats_on_date(pprice := 800);

select *
from fnc_person_visits_and_eats_on_date(pperson := 'Anna',pprice := 1300,pdate := '2022-01-01');
