with
source as (select * from {{ source("faker_airbyte", "products") }}),

renamed as (

    select

        -- ids
        id as products_product_id,
        year as products_model_year,

        -- strings
        _airbyte_raw_id as products_airbyte_unique_id,
        _airbyte_meta as products_airbyte_meta,
        model as products_car_model,
        make as products_car_make,

        -- numerics
        price as products_price_usd,

        -- booleans (there are no booleans in the source data)
        -- dates (there are no dates in the source data)
        -- timestamps
        created_at as products_created_at,
        updated_at as products_updated_at,
        _airbyte_extracted_at as products_airbyte_extracted_at,

        -- json
        -- the column '_airbyte_meta' is not extracted from the source data
      
    from source

)

select *
from renamed
