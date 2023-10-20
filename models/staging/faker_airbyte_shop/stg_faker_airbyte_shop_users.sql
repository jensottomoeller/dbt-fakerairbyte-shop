with
    source as (select * from {{ source("faker_airbyte", "users") }}),

    renamed as (

        select

            -- ids
            id as user_id,

            -- strings
            _airbyte_raw_id as airbyte_unique_id,
            occupation,
            gender,
            academic_degree,
            language,
            telephone,
            title,
            nationality,
            blood_type,
            name,
            email,
            height,

            -- numerics (there are no numerics in the source data)
            -- booleans (there are no booleans in the source data)
            -- dates (there are no dates in the source data)
            -- timestamps
            _airbyte_extracted_at as user_airbyte_extracted_at,
            created_at as user_created_at,
            updated_at as user_updated_at,

            -- json
            string(json_query(address, '$.city')) as city,
            string(json_query(address, '$.country_code')) as country_code,
            cast(string(json_query(address, '$.postal_code')) as int64) as postal_code,
            string(json_query(address, '$.province')) as province,
            string(json_query(address, '$.state')) as state,
            string(json_query(address, '$.street_name')) as street_name,
            cast(
                string(json_query(address, '$.street_number')) as int64
            ) as street_number,

        -- the column '_airbyte_meta' is not extracted
        from source

    )

select *
from renamed
