DROP TABLE IF EXISTS d_stores CASCADE;

CREATE TABLE d_store_cities (
    store_city_id SERIAL PRIMARY KEY,
    store_city VARCHAR(50)
);

CREATE TABLE d_store_countries (
    store_country_id SERIAL PRIMARY KEY,
    store_country_name VARCHAR(50)
);

CREATE TABLE d_store_states (
    store_state_id SERIAL PRIMARY KEY,
    store_state VARCHAR(50)
);

CREATE TABLE d_store_locations (
    store_location_id SERIAL PRIMARY KEY,
    store_location VARCHAR(50)
);

CREATE TABLE d_store_phones (
    store_phone_id SERIAL PRIMARY KEY,
    store_phone VARCHAR(50)
);

CREATE TABLE d_store_emails (
    store_email_id SERIAL PRIMARY KEY,
    store_email VARCHAR(50)
);

CREATE TABLE d_stores (
    store_id SERIAL PRIMARY KEY,
    store_name VARCHAR(50),

    store_location_id INTEGER,
    store_city_id INTEGER,
    store_state_id INTEGER,
    store_country_id INTEGER,
    store_phone_id INTEGER,
    store_email_id INTEGER,

    CONSTRAINT fk_store_location FOREIGN KEY (store_location_id) REFERENCES d_store_locations(store_location_id),
    CONSTRAINT fk_store_city FOREIGN KEY (store_city_id) REFERENCES d_store_cities(store_city_id),
    CONSTRAINT fk_store_state FOREIGN KEY (store_state_id) REFERENCES d_store_states(store_state_id),
    CONSTRAINT fk_store_country FOREIGN KEY (store_country_id) REFERENCES d_store_countries(store_country_id),
    CONSTRAINT fk_store_phone FOREIGN KEY (store_phone_id) REFERENCES d_store_phones(store_phone_id),
    CONSTRAINT fk_store_email FOREIGN KEY (store_email_id) REFERENCES d_store_emails(store_email_id)
);