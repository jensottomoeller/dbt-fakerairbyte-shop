with
source as (select * from {{ source("faker_airbyte", "products") }}),

renamed as (

    select

        -- ids
        id as product_id,
        year as model_year,

        -- strings
        _airbyte_raw_id as airbyte_unique_id,
        model as car_model,
        make as car_make,

        -- numerics
        price as price_usd,

        -- booleans (there are no booleans in the source data)
        -- dates (there are no dates in the source data)
        -- timestamps
        created_at as product_created_at,
        updated_at as product_updated_at,
        _airbyte_extracted_at as product_airbyte_extracted_at

        -- json
        -- the column '_airbyte_meta' is not extracted
    from source

)

select *
from renamed
