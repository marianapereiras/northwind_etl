with
    selected as (
        select
            employee_id
            , first_name
            , last_name
            , address
            , city
            , country
            , postal_code
            , hire_date
            , extension
            , birth_date
            , region
            , photo_path
            , title
            , title_of_courtesy
            , notes
            , home_phone
            , reports_to
        from {{ ref('stg__employees') }}
    )
    , transformed as (
        select 
            row_number () over (order by employee_id) as employee_sk
            , *
        from selected
    )
select * from transformed
