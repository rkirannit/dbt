{{ config(
    materialized="incremental",
    incremental_strategy='insert_overwrite'
    
) }}

select * from {{source('datafeed_shared_schema','STG_ORDER_INFO')}}
