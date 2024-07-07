create or replace function fnc_persons_female() returns setof person as $$
select * from person where gender = 'female';
$$ language sql;

create or replace function fnc_persons_male() returns setof person as $$
select * from person where gender = 'male';
$$ language sql;

SELECT *
FROM fnc_persons_female();

SELECT *
FROM fnc_persons_male();
