with
    source as (
        select
            /*Primary key*/
            product_id

             /*Foreing key*/
            , supplier_id
            , category_id
            
            , product_name
            , unit_price
            , quantity_per_unit
            , units_in_stock
            , units_on_order
            , reorder_level
            , 
                case 
                    when discontinued = 1 then True
                    else False 
                end as is_discontinued
            

             /* Stich columns*/
            , _sdc_table_version
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_batched_at
            , _sdc_extracted_at as last_etl_run

        from {{ source('northwind_etl','products') }}
    )

select * from source
