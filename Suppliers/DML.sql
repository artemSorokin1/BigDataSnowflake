-- 1. Заполняем справочники

INSERT INTO d_supplier_cities (city_name)
SELECT DISTINCT supplier_city
FROM mock_data
WHERE supplier_city IS NOT NULL;

INSERT INTO d_supplier_countries (country_name)
SELECT DISTINCT supplier_country
FROM mock_data
WHERE supplier_country IS NOT NULL;

INSERT INTO d_supplier_emails (email)
SELECT DISTINCT supplier_email
FROM mock_data
WHERE supplier_email IS NOT NULL;

INSERT INTO d_supplier_phones (phone_number)
SELECT DISTINCT supplier_phone
FROM mock_data
WHERE supplier_phone IS NOT NULL;

INSERT INTO d_supplier_addresses (address)
SELECT DISTINCT supplier_address
FROM mock_data
WHERE supplier_address IS NOT NULL;

-- 2. Заполняем таблицу d_suppliers

INSERT INTO d_suppliers (
    supplier_name,
    supplier_contact,
    supplier_email_id,
    supplier_country_id,
    supplier_address_id,
    supplier_phone_id,
    supplier_city_id
)
SELECT
    m.supplier_name,
    m.supplier_contact,
    e.email_id,
    ctr.country_id,
    a.address_id,
    p.phone_id,
    c.city_id
FROM mock_data m
LEFT JOIN d_supplier_emails e ON m.supplier_email = e.email
LEFT JOIN d_supplier_countries ctr ON m.supplier_country = ctr.country_name
LEFT JOIN d_supplier_addresses a ON m.supplier_address = a.address
LEFT JOIN d_supplier_phones p ON m.supplier_phone = p.phone_number
LEFT JOIN d_supplier_cities c ON m.supplier_city = c.city_name
WHERE m.supplier_name IS NOT NULL;