
{{ config(
    materialized='table') 
    }}

WITH source  as(
 select *
        from {{source('datafeed_shared_schema','STG_CUSTOMER_DATA')}}
        ),
    renamed as (

    select  id as customer_id, name as customer_name

    from source

)
select * from renamed

