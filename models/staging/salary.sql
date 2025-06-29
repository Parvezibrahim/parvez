{{config(
    materialized = 'table',
    transient = 'false'
)}}

with sal as (
    select id,
    emp_name,
    salary_tax,
    tax,
    ({{cal_macro('salary_tax','tax')}})as Total_salary
    from {{source("parvez","raw_sal")}})
select *  from sal