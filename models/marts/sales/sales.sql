-- STEP 1: IMPORTS (import of data)

with

purchases as (

    select * from {{ ref('stg_faker_airbyte_shop_purchases') }}

),

products as (

    select * from {{ ref('stg_faker_airbyte_shop_products') }}

),


users as (

    select * from {{ ref('stg_faker_airbyte_shop_users') }}

),

-- STEP 2: CUSTOM LOGIC (CTEs holding custom logic for transformations)

-- all purchases

all_purchases as (

    select
        purchases_purchase_id,
        purchases_product_id,
        purchases_user_id,
        purchases_airbyte_unique_id,
        purchases_airbyte_extracted_at,
        purchases_purchased_at,
        purchases_returned_at,
        purchases_created_at,
        purchases_updated_at,
        purchases_added_to_cart_at

    from purchases

),

--all products

all_products as (

    select
        products_product_id,
        products_model_year,
        products_airbyte_unique_id,
        products_airbyte_extracted_at,
        products_car_model,
        products_car_make,
        products_price_usd,
        products_created_at,
        products_updated_at

    from products

),

--all users

all_users as (

    select
        users_user_id,
        users_airbyte_unique_id,
        users_airbyte_extracted_at,
        users_occupation,
        users_gender,
        users_academic_degree,
        users_language,
        users_telephone,
        users_title,
        users_nationality,
        users_blood_type,
        users_name,
        users_email,
        users_height,
        users_weight,
        users_age,
        users_created_at,
        users_updated_at,
        users_postal_code,
        users_street_number,
        users_city,
        users_country_code,
        users_province,
        users_state,
        users_street_name

    from users
),

-- STEP 3: FINAL CTE

purchases_products_users_joined as (

    select *
    from all_purchases

    left join all_products
        on all_purchases.purchases_product_id = all_products.products_product_id

    left join all_users
        on all_purchases.purchases_user_id = all_users.users_user_id

)

-- STEP 4: SELECT * FROM FINAL
{# may seem redundant, but makes future troubleshooting much easier
by swapping final with the result from another block, e.g. 'select * from all_purchases)
#}

select * from purchases_products_users_joined
