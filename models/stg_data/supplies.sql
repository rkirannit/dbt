{{ config(
    materialized='ephemeral') 
    }}

WITH source  as(
 select *
        from {{source('datafeed_shared_schema','STG_SUPPLIES_DATA')}}
        ),
    renamed as (
    
    select
        {{ dbt_utils.generate_surrogate_key(['id', 'sku']) }} as supply_uuid,
        id as supply_id,
        sku as product_id,
        name as supply_name,
        {{ cents_to_dollars('cost') }} as supply_cost,
        perishable as is_perishable_supply

    from source
)
select * from renamed
