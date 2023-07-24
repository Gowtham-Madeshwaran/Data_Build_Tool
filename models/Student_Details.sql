{{ config(materialized='table')}}


WITH PRIM_STUDENT_details as(
SELECT * FROM {{ref('stg_dim_prim_student_details')}}
),
STudent_Address as(
SELECT * FROM {{ref('stg_dim_student_address')}}
),
Student_Mark as (
SELECT * from {{ref('stg_dim_student_score')}}
)

SELECT PSD.STUDENT_ID,PSD.STUDENT_NAME,SA.Address,SM.STU_SCORE from PRIM_STUDENT_details AS PSD
LEFT join STUDENT_ADDRESS AS SA 
ON SA.ID = PSD.STUDENT_ID
LEft join STUDENT_MARK AS SM
ON SM.ID=PSD.STUDENT_ID