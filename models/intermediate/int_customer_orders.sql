-- Intermediate: enriquece las órdenes con datos del cliente

with orders as (

    select * from {{ ref('stg_orders') }}

),

customers as (

    select * from {{ ref('stg_customers') }}

),

enriched as (

    select
        o.order_id,
        o.customer_id,
        c.full_name          as customer_name,
        c.email              as customer_email,
        c.country,
        c.plan               as customer_plan,
        o.product_name,
        o.product_category,
        o.quantity,
        o.unit_price,
        o.total_amount,
        o.order_date,
        o.status

    from orders o
    left join customers c
        on o.customer_id = c.customer_id

)

select * from enriched