with
source as (select * from {{ source("faker_airbyte", "users") }}),

renamed as (

    select

        -- ids
        id as users_user_id,

        -- strings
        _airbyte_raw_id as users_airbyte_unique_id,
        _airbyte_meta as users_airbyte_meta,
        occupation as users_occupation,
        gender as users_gender,
        academic_degree as users_academic_degree,
        language as users_language,
        telephone as users_telephone,
        title as users_title,
        nationality as users_nationality,
        blood_type as users_blood_type,
        name as users_name,
        email as users_email,
        height as users_height,

        -- numerics
        weight as users_weight,
        age as users_age,

        -- booleans (there are no booleans in the source data)
        -- dates (there are no dates in the source data)
        -- timestamps
        _airbyte_extracted_at as users_airbyte_extracted_at,
        created_at as users_created_at,
        updated_at as users_updated_at,

        -- json
        -- the 'json_query' function is used to extract the data from JSON format to a field/column. 
        -- the cast function is used to convert text to numbers (integer).
        cast(string(json_query(address, '$.postal_code')) as int64)
            as users_postal_code,
        cast(string(json_query(address, '$.street_number')) as int64)
            as users_street_number,
        string(json_query(address, '$.city')) as users_city,
        string(json_query(address, '$.country_code')) as users_country_code,
        string(json_query(address, '$.province')) as users_province,
        string(json_query(address, '$.state')) as users_state,
        string(json_query(address, '$.street_name')) as users_street_name


    from source

)

select *
from renamed
