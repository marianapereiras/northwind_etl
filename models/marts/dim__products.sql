with
    selected as (
        select
            product_id
            , supplier_id
            , category_id            
            , product_name
            , unit_price
            , quantity_per_unit
            , units_in_stock
            , units_on_order
            , is_discontinued
            , reorder_level
        from {{ ref('stg__products') }}
    )
    , transformed as (
        select 
            row_number () over (order by product_id) as product_sk
            , *
        from selected
    )
select * from transformed

