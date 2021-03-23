with
    source as (
        select
            /*Primary key*/
            order_id

            /*Foreing key*/
            , employee_id
            , customer_id

            , ship_region
            , shipped_date
            , ship_country
            , ship_name
            , order_date
            , ship_postal_code
            , ship_city
            , freight
            , ship_via as shipper_id
            , cast (required_date as timestamp) as required_date
            , ship_address

            /* Stich columns*/
            , _sdc_batched_at
            , _sdc_extracted_at as last_etl_run
            , _sdc_table_version
            , _sdc_sequence
            , _sdc_received_at

        from {{ source('northwind_etl','orders') }}
    )

select * from source
