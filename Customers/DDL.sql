DROP TABLE IF EXISTS d_customer CASCADE;

CREATE TABLE d_pet_type (
    pet_type_id SERIAL PRIMARY KEY,
    pet_type_name VARCHAR(50) NOT NULL
);

CREATE TABLE d_pet_breed (
    pet_breed_id SERIAL PRIMARY KEY,
    pet_breed_name VARCHAR(50) NOT NULL
);

CREATE TABLE d_pet_category (
    pet_category_id SERIAL PRIMARY KEY,
    pet_category_name VARCHAR(50) NOT NULL
);

CREATE TABLE d_pets (
    pet_id SERIAL PRIMARY KEY,
    pet_name VARCHAR(50) NOT NULL,
    pet_breed_id INTEGER,
    pet_type_id INTEGER,
    pet_category_id INTEGER,
   CONSTRAINT fk_pet_breed FOREIGN KEY (pet_breed_id) REFERENCES d_pet_breed(pet_breed_id),
   CONSTRAINT fk_pet_type FOREIGN KEY (pet_type_id) REFERENCES d_pet_type(pet_type_id),
   CONSTRAINT fk_pet_category FOREIGN KEY (pet_category_id) REFERENCES d_pet_category(pet_category_id)
);

CREATE TABLE d_customer_country (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(50) NOT NULL
);

CREATE TABLE d_customer_postal_code (
    postal_code_id SERIAL PRIMARY KEY,
    postal_code VARCHAR(50) NOT NULL
);

CREATE TABLE d_customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    age INTEGER NOT NULL,
    email VARCHAR(50) NOT NULL,
    country_id INTEGER,
    postal_code_id INTEGER,
    pet_id INTEGER NULL,
    CONSTRAINT fk_customer_country FOREIGN KEY (country_id) REFERENCES d_customer_country(country_id),
    CONSTRAINT fk_customer_postal_code FOREIGN KEY (postal_code_id) REFERENCES d_customer_postal_code(postal_code_id),
    CONSTRAINT fk_customer_pet FOREIGN KEY (pet_id) REFERENCES d_pets(pet_id)
);

