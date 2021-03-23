with
    source as (
        select
            /*Primary key*/
            supplier_id

            , company_name
            , contact_name
            , phone
            , contact_title
            , homepage
            , address
            , city
            , country
            , fax
            , postal_code
            , region

            /* Stich columns*/
            , _sdc_batched_at
            , _sdc_extracted_at as last_etl_run
            , _sdc_table_version
            , _sdc_sequence
            , _sdc_received_at

        from {{ source('northwind_etl','suppliers') }}
    )

select * from source
