-- 1. Справочники по питомцам
INSERT INTO d_pet_type (pet_type_name)
SELECT DISTINCT customer_pet_type
FROM mock_data
WHERE customer_pet_type IS NOT NULL;

INSERT INTO d_pet_breed (pet_breed_name)
SELECT DISTINCT customer_pet_breed
FROM mock_data
WHERE customer_pet_breed IS NOT NULL;

INSERT INTO d_pet_category (pet_category_name)
SELECT DISTINCT pet_category
FROM mock_data
WHERE pet_category IS NOT NULL;

-- 2. Таблица питомцев
INSERT INTO d_pets (pet_name, pet_breed_id, pet_type_id, pet_category_id)
SELECT DISTINCT
    m.customer_pet_name,
    b.pet_breed_id,
    t.pet_type_id,
    c.pet_category_id
FROM mock_data m
LEFT JOIN d_pet_breed b ON m.customer_pet_breed = b.pet_breed_name
LEFT JOIN d_pet_type t ON m.customer_pet_type = t.pet_type_name
LEFT JOIN d_pet_category c ON m.pet_category = c.pet_category_name
WHERE m.customer_pet_name IS NOT NULL;

-- 3. Справочники по стране и почтовому коду
INSERT INTO d_customer_country (country_name)
SELECT DISTINCT customer_country
FROM mock_data
WHERE customer_country IS NOT NULL;

INSERT INTO d_customer_postal_code (postal_code)
SELECT DISTINCT customer_postal_code
FROM mock_data
WHERE customer_postal_code IS NOT NULL;

-- 4. Основная таблица d_customer
INSERT INTO d_customer (
    first_name,
    last_name,
    age,
    email,
    country_id,
    postal_code_id,
    pet_id
)
SELECT
    m.customer_first_name,
    m.customer_last_name,
    m.customer_age,
    m.customer_email,
    c.country_id,
    p.postal_code_id,
    pt.pet_id
FROM mock_data m
LEFT JOIN d_customer_country c ON m.customer_country = c.country_name
LEFT JOIN d_customer_postal_code p ON m.customer_postal_code = p.postal_code
LEFT JOIN d_pets pt ON m.customer_pet_name = pt.pet_name
    AND pt.pet_breed_id = (SELECT b.pet_breed_id FROM d_pet_breed b WHERE b.pet_breed_name = m.customer_pet_breed LIMIT 1)
    AND pt.pet_type_id = (SELECT t.pet_type_id FROM d_pet_type t WHERE t.pet_type_name = m.customer_pet_type LIMIT 1)
    AND pt.pet_category_id = (SELECT pc.pet_category_id FROM d_pet_category pc WHERE pc.pet_category_name = m.pet_category LIMIT 1)
WHERE m.customer_first_name IS NOT NULL
  AND m.customer_last_name IS NOT NULL
  AND m.customer_email IS NOT NULL
  AND m.customer_age IS NOT NULL;