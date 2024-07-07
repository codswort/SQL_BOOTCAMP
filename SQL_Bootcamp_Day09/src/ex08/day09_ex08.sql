create or replace function fnc_fibonacci(pstop integer default 10) returns table (num_fibonacci integer) as $$
    with recursive fibonacci(one, two) as (
        values (0, 1)
            union
        select two, one + two from fibonacci
        where two < pstop
    )
select one from fibonacci;
$$ language sql;

select * from fnc_fibonacci(100);
select * from fnc_fibonacci();
