{{ config(
    materialized="incremental",
    incremental_strategy= "merge",
    cluster_by = "order_status"
) }}
select * from {{source('datafeed_shared_schema','STG_ORDER_INFO')}}
