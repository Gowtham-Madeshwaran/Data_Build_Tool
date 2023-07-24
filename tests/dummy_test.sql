WITH CTE as(
    SELECT * FROM {{ref('stg_dim_student_address')}}
)

select ADDRESS from CTE
WHERE
ID > 5