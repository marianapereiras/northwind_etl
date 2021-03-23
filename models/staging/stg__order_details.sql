with
    source as (
        select
            /*Foreing key*/
            order_id
            , product_id

            , discount		
            , unit_price		
            , quantity	
		
            /* Stich columns*/
            , _sdc_batched_at
            , _sdc_extracted_at as last_etl_run
            , _sdc_table_version
            , _sdc_sequence
            , _sdc_received_at

        from {{ source('northwind_etl','order_details') }}
    )

select * from source
