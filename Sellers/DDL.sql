DROP TABLE IF EXISTS d_sellers CASCADE;

CREATE TABLE d_seller_countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(50)
);

CREATE TABLE d_seller_postal_codes (
    postal_code_id SERIAL PRIMARY KEY,
    postal_code VARCHAR(50)
);

CREATE TABLE d_seller_email (
    email_id SERIAL PRIMARY KEY,
    email VARCHAR(50)
);

CREATE TABLE d_sellers (
    seller_id SERIAL PRIMARY KEY,
    seller_first_name VARCHAR(50) NULL,
    seller_last_name VARCHAR(50) NULL,
    seller_country_id INTEGER NULL,
    seller_email_id INTEGER NULL,
    seller_postal_code_id INTEGER NULL,
    CONSTRAINT fk_seller_country FOREIGN KEY (seller_country_id) REFERENCES d_seller_countries(country_id),
    CONSTRAINT fk_seller_postal_code FOREIGN KEY (seller_postal_code_id) REFERENCES d_seller_postal_codes(postal_code_id),
    CONSTRAINT fk_seller_email FOREIGN KEY (seller_email_id) REFERENCES d_seller_email(email_id)
);