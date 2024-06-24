with code as
(
    select * from {{ref('countrycode')}}
)
select * from code