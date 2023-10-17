with
    source as (select * from {{ source('faker_airbyte', 'products') }}),

    renamed as (

        select
            id as product_id,
            model as car_model,
            make as car_make,
            price as price_usd
        from source

    )

select *
from renamed