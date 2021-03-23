with
    selected as (
        select
            customer_id
            , contact_name
            , phone
            , company_name
            , contact_title
            , address
            , city
            , country
            , postal_code
            , region
            , fax
        from {{ ref('stg__customers') }}
    )
    
    , transformed as (
        select 
            row_number () over (order by customer_id) as customer_sk
            , *
        from selected
    )
select * 
from transformed
