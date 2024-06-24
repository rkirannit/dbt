{{ config(
    materialized="incremental",
    incremental_strategy="delete_insert",
    
) }}

select * from {{source('datafeed_shared_schema','STG_ORDER_INFO')}}
