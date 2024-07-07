-- Session #1
show transaction isolation level;

-- Session #2
show transaction isolation level;

-- Session #1
begin;

-- Session #2
begin;

-- Session #1
select * from pizzeria where name = 'Pizza Hut';

-- Session #2
update pizzeria set rating = 3.6 where name = 'Pizza Hut';
commit;

-- Session #1
select * from pizzeria where name = 'Pizza Hut';
commit;
select * from pizzeria where name = 'Pizza Hut';

-- Session #2
select * from pizzeria where name = 'Pizza Hut';
