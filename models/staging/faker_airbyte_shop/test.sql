with

    source as (select * from {{ source("faker_airbyte", "products") }}),

    renamed as (

        select
            id as product_id,
        from source

    )

select *
from renamed