{{config(materialized='table',
        transient='false')}}

with customers as (
  select
  id as customer_id,
  first_name,
  last_name

from {{source('parvez','raw_customer_data')}}

),

orders as (
    select
    id as customer_id,
    min(order_date) as first_order_date,
    max(order_date) as most_recent_order_date,
    count(id) as number_of_orders,
    status
    from {{ref('orders')}}
    group by id ,status
),

final as (

select
customers.customer_id,
customers.first_name,
customers.last_name,
orders.first_order_date,
orders.most_recent_order_date,
coalesce(orders.number_of_orders, 0) as number_of_orders
from customers
left join orders using (customer_id)
)

select * from final
