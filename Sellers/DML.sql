INSERT INTO d_seller_countries (country_name)
SELECT DISTINCT seller_country
FROM mock_data
WHERE seller_country IS NOT NULL;

INSERT INTO d_seller_postal_codes (postal_code)
SELECT DISTINCT seller_postal_code
FROM mock_data
WHERE seller_postal_code IS NOT NULL;

INSERT INTO d_seller_email (email)
SELECT DISTINCT seller_email
FROM mock_data
WHERE seller_email IS NOT NULL;

INSERT INTO d_sellers (
    seller_first_name,
    seller_last_name,
    seller_country_id,
    seller_email_id,
    seller_postal_code_id
)
SELECT
    DISTINCT m.seller_first_name,
    m.seller_last_name,
    c.country_id,
    e.email_id,
    p.postal_code_id
FROM mock_data m
LEFT JOIN d_seller_countries c ON m.seller_country = c.country_name
LEFT JOIN d_seller_email e ON m.seller_email = e.email
LEFT JOIN d_seller_postal_codes p ON m.seller_postal_code = p.postal_code
GROUP BY
    m.seller_first_name,
    m.seller_last_name,
    c.country_id,
    e.email_id,
    p.postal_code_id;