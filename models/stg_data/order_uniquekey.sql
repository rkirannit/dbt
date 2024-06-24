{{ config(
    materialized="incremental",
    unique_key='order_id',
) }}

select * from {{source('datafeed_shared_schema','STG_ORDER_INFO')}}
