{{ config(
    materialized="incremental",
    unique_key='order_id',
    merge_update_columns=['order_value','order_status','order_payment_method']
) }}

select * from {{source('datafeed_shared_schema','STG_ORDER_INFO')}}
