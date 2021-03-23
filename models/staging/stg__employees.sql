with
    source as (
        select
            /*Primary key*/
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

            /* Stich columns*/
            , _sdc_batched_at
            , _sdc_extracted_at as last_etl_run
            , _sdc_table_version
            , _sdc_sequence
            , _sdc_received_at

        from {{ source('northwind_etl','employees') }}
    )

select * from source
