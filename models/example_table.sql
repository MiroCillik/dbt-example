{{ config(materialized='table') }}

SELECT 
    seq4() AS id,
    'Customer ' || seq4() AS customer_name,
    UNIFORM(100, 10000, RANDOM())::NUMBER(10,2) AS revenue,
    DATEADD('day', -UNIFORM(0, 365, RANDOM()), CURRENT_DATE()) AS created_at
FROM TABLE(GENERATOR(ROWCOUNT => 100))

