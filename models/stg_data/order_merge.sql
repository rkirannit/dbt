--unique_key='order_id', if we don't have unique_key records will insert multiple times. 
{{ config(
    materialized="incremental",
    incremental_strategy="merge",
                                  
) }}

select * from {{source('datafeed_shared_schema','STG_ORDER_INFO')}}
