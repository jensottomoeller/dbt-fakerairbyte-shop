with
source as (select * from {{ source("faker_airbyte", "purchases") }}),

renamed as (

    select

        -- ids
        id as purchase_id,
        product_id,
        user_id,

        -- strings
        _airbyte_raw_id as airbyte_unique_id,

        -- numerics (there are no numerics in the source data)
        -- booleans (there are no booleans in the source data)
        -- dates (there are no dates in the source data)
        -- timestamps
        purchased_at,
        returned_at as purchase_returned_at,
        created_at as purchase_created_at,
        updated_at as purchase_updated_at,
        added_to_cart_at,
        _airbyte_extracted_at as purchase_airbyte_extracted_at

        -- json
        -- the column '_airbyte_meta' is not extracted
    from source

)

select *
from renamed
