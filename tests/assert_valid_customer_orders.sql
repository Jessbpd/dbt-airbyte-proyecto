-- Test singular: verifica que no existan órdenes sin cliente asociado
select *
from {{ ref('int_customer_orders') }}
where customer_name is null
  or customer_email is null