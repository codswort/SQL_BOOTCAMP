drop table if exists tour;
create table tour
(
    id     bigint primary key,
    point1 varchar,
    point2 varchar,
    cost   numeric
);

insert into tour
values (1, 'a', 'b', 10);
insert into tour
values (2, 'b', 'a', 10);
insert into tour
values (3, 'a', 'c', 15);
insert into tour
values (4, 'c', 'a', 15);
insert into tour
values (5, 'a', 'd', 20);
insert into tour
values (6, 'd', 'a', 20);
insert into tour
values (7, 'b', 'c', 35);
insert into tour
values (8, 'c', 'b', 35);
insert into tour
values (9, 'b', 'd', 25);
insert into tour
values (10, 'd', 'b', 25);
insert into tour
values (11, 'c', 'd', 30);
insert into tour
values (12, 'd', 'c', 30);


with new_table as (with recursive a_table as (
    select point1 as tour_a, point1, point2, cost, cost as summ
    from tour
    where point1 = 'a'
    union all

    select concat(parrent.tour_a, ',', child.point1) as trace,
           child.point1,
           child.point2,
           child.cost,
           parrent.summ + child.cost                 as summ
    from tour as child
             inner join a_table as parrent on child.point1 = parrent.point2
    where tour_a not like concat('%', child.point1, '%')
)
                   select *
                   from a_table
                   where length(tour_a) =
                         ((select count(*) from (select tour.point1 from tour group by tour.point1) as town) * 2 -
                          1)
                     and point2 = 'a')

select summ as total_cost, concat('{', tour_a, ',', point2, '}') as tour
from new_table
where summ = (select min(summ) from new_table)
order by 2;


