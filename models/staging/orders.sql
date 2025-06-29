WITH tb1 as(
    select id,
    order_date,
    user_id,
    status

    from {{source('parvez','raw_order')}})
select * from tb1
