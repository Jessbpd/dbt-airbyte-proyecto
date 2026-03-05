-- Staging: limpia y estandariza las órdenes cargadas por Airbyte

with source as (

    select * from {{ source('orders_source', 'orders') }}

),

renamed as (

    select
        order_id,
        customer_id,
        product                         as product_name,
        category                        as product_category,
        cast(quantity as integer)       as quantity,
        cast(unit_price as decimal(10,2)) as unit_price,
        quantity * unit_price           as total_amount,
        cast(order_date as date)        as order_date,
        lower(status)                   as status

    from source

)

select * from renamed