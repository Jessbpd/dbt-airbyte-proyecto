-- Mart (OBT): resumen de ventas por cliente, producto y fecha

with base as (

    select * from {{ ref('int_customer_orders') }}

),

summary as (

    select
        -- Dimensiones
        order_date,
        customer_id,
        customer_name,
        customer_email,
        country,
        customer_plan,
        product_name,
        product_category,
        unit_price,

        -- Métricas
        count(order_id)             as total_orders,
        sum(quantity)               as total_units_sold,
        sum(total_amount)           as total_revenue,
        avg(total_amount)           as avg_order_value

    from base
    group by
        order_date,
        customer_id,
        customer_name,
        customer_email,
        country,
        customer_plan,
        product_name,
        product_category,
        unit_price

)

select * from summary