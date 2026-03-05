-- Test singular: verifica que todos los ingresos sean positivos
select *
from {{ ref('mart_sales_summary') }}
where total_revenue <= 0
