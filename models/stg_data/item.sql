{{ config(
    materialized='table') 
    }}

with
source as (
    select * from {{source('datafeed_shared_schema','STG_ITEMS_DATA')}}
),
renamed as (
    select
        id as order_item_id,
        order_id,
        sku as product_id
    from source
)
select * from renamed
