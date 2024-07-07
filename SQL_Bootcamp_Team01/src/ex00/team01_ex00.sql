with usd as (select * from currency where name = 'USD' order by updated desc limit 1),
     eur as (select * from currency where name = 'EUR' order by updated desc limit 1),
     jpy as (select * from currency where name = 'JPY' order by updated desc limit 1),

union_money as ( select * from usd union select * from eur union select * from jpy),
new_table as (select
        coalesce("user".name, 'not defined') as name,
        coalesce("user".lastname, 'not defined') as lastname,
        balance.type as type,
        sum(balance.money) as volume,
        coalesce(union_money.name, 'not defined') as currency_name,
        coalesce(union_money.rate_to_usd, 1) as last_rate_to_usd,
        case when union_money.rate_to_usd is not null then union_money.rate_to_usd * sum(balance.money) else sum(balance.money) * 1 end as total_volume_in_usd
    from "user"
    full join balance on "user".id = balance.user_id
    full join union_money on balance.currency_id = union_money.id
    group by "user".name, "user".lastname, balance.type, currency_name, union_money.rate_to_usd
    )
select * from new_table
order by 1 desc, 2, 3;
