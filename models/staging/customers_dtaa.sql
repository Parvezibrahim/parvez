
WITH tb1 as(
    select
    id ,
    first_name,
    last_name
    from {{source('parvez','raw_customer_data')}})
select * from tb1
