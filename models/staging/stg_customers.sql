-- Staging: limpia y estandariza los clientes cargados por Airbyte

with source as (

    select * from {{ source('customers_source', 'customers') }}

),

renamed as (

    select
        customer_id,
        name                        as full_name,
        lower(trim(email))          as email,
        country,
        cast(signup_date as date)   as signup_date,
        lower(plan)                 as plan

    from source

)

select * from renamed