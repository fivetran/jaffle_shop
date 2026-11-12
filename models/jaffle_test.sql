with customers as (

    select * from {{ ref('customers') }}

),

orders as (

    select * from {{ ref('orders') }}

),

final as (

    select
        orders.order_id,
        orders.order_date,
        orders.status,
        orders.amount,
        orders.customer_id,
        customers.first_name,
        customers.last_name

    from orders

    left join customers
        on orders.customer_id = customers.customer_id

)

select * from final
