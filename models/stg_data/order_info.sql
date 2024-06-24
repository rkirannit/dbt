{{ config(
    materialized='incremental'
)}}

select *

from {{source('datafeed_shared_schema','STG_ORDER_INFO')}}

{% if is_incremental() %}

  -- this filter will only be applied on an incremental run
  where order_datetime > (select max(order_datetime) from {{ this }})

{% endif %}
