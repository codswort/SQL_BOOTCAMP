insert into currency values (100, 'EUR', 0.85, '2022-01-01 13:29');
insert into currency values (100, 'EUR', 0.79, '2022-01-08 13:29');

with one as (
    select distinct
       coalesce(u.name, 'not defined') as num,
       coalesce(u.lastname, 'not defined') as last,
       currency.name as currency_name,
       balance.currency_id,
       (select
        case when (select rate_to_usd from currency
        where balance.currency_id = currency.id and currency.updated < balance.updated
        order by currency.updated desc
        limit 1)
            is not null then
            (select rate_to_usd from currency
             where balance.currency_id = currency.id and currency.updated < balance.updated
             order by currency.updated desc
            limit 1) * balance.money
        else
            (select rate_to_usd from currency
             where balance.currency_id = currency.id and currency.updated > balance.updated
             order by currency.updated
              limit 1) * balance.money
        end as currency_in_usd) as currency_in_usd
from "user" as u
full join balance on balance.user_id = u.id
full join currency on currency.id = balance.currency_id
)

select num as name,
       last as lastname,
       currency_name,
       currency_in_usd
from one
except
select
       num as name,
       last as lastname,
       currency_name,
       currency_in_usd
from one
left join currency
on one.currency_id = currency.id
where currency.id is null
order by 1 desc, 2, 3;
