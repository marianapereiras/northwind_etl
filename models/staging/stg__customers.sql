with
    source as (
        select
            /*Primary key*/
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

            /* Stich columns*/
            , _sdc_batched_at
            , _sdc_extracted_at as last_etl_run
            , _sdc_table_version
            , _sdc_sequence
            , _sdc_received_at

        from {{ source('northwind_etl','customers') }}
    )

select * from source
