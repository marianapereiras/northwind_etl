with
    suppliers as (
        select *
        from {{ ref('stg__suppliers') }}
    )

    , divisons as (
        select *
        from {{ ref('seed_supplier_division')}}
    )

    , transformed as (
        select
            row_number () over (order by supplier_id) as supplier_sk
            , suppliers.supplier_id
            , suppliers.country
            , suppliers.city
            , suppliers.fax
            , suppliers.postal_code
            , suppliers.homepage
            , suppliers.address
            , suppliers.region
            , suppliers.contact_name
            , suppliers.phone
            , suppliers.company_name
            , suppliers.contact_title
            , divisons.divison

        from suppliers
        left join divisons on suppliers.country = divisons.country

    )
select *
from transformed
