INSERT INTO d_store_cities (store_city)
SELECT DISTINCT store_city
FROM mock_data
WHERE store_city IS NOT NULL;

INSERT INTO d_store_countries (store_country_name)
SELECT DISTINCT store_country
FROM mock_data
WHERE store_country IS NOT NULL;

INSERT INTO d_store_states (store_state)
SELECT DISTINCT store_state
FROM mock_data
WHERE store_state IS NOT NULL;

INSERT INTO d_store_locations (store_location)
SELECT DISTINCT store_location
FROM mock_data
WHERE store_location IS NOT NULL;

INSERT INTO d_store_phones (store_phone)
SELECT DISTINCT store_phone
FROM mock_data
WHERE store_phone IS NOT NULL;

INSERT INTO d_store_emails (store_email)
SELECT DISTINCT store_email
FROM mock_data
WHERE store_email IS NOT NULL;

INSERT INTO d_stores (
    store_name,
    store_location_id,
    store_city_id,
    store_state_id,
    store_country_id,
    store_phone_id,
    store_email_id
)
SELECT
    m.store_name,
    l.store_location_id,
    c.store_city_id,
    s.store_state_id,
    ctr.store_country_id,
    p.store_phone_id,
    e.store_email_id
FROM mock_data m
LEFT JOIN d_store_locations l ON m.store_location = l.store_location
LEFT JOIN d_store_cities c ON m.store_city = c.store_city
LEFT JOIN d_store_states s ON m.store_state = s.store_state
LEFT JOIN d_store_countries ctr ON m.store_country = ctr.store_country_name
LEFT JOIN d_store_phones p ON m.store_phone = p.store_phone
LEFT JOIN d_store_emails e ON m.store_email = e.store_email

GROUP BY
    m.store_name,
    l.store_location_id,
    c.store_city_id,
    s.store_state_id,
    ctr.store_country_id,
    p.store_phone_id,
    e.store_email_id;