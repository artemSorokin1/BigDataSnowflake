DROP TABLE IF EXISTS d_suppliers CASCADE;

CREATE TABLE IF NOT EXISTS d_supplier_cities (
    city_id SERIAL PRIMARY KEY,
    city_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS d_supplier_countries (
    country_id SERIAL PRIMARY KEY,
    country_name VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS d_supplier_emails (
    email_id SERIAL PRIMARY KEY,
    email VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS d_supplier_phones (
    phone_id SERIAL PRIMARY KEY,
    phone_number VARCHAR(50)
);
CREATE TABLE IF NOT EXISTS d_supplier_addresses (
    address_id SERIAL PRIMARY KEY,
    address VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS d_suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(50),
    supplier_contact VARCHAR(50),
    supplier_email_id INT,
    supplier_country_id INT,
    supplier_address_id INT,
    supplier_phone_id INT,
    supplier_city_id INT,

    CONSTRAINT fk_supplier_email FOREIGN KEY (supplier_email_id) REFERENCES d_supplier_emails(email_id),  
    CONSTRAINT fk_supplier_country FOREIGN KEY (supplier_country_id) REFERENCES d_supplier_countries(country_id),    
    CONSTRAINT fk_supplier_address FOREIGN KEY (supplier_address_id) REFERENCES d_supplier_addresses(address_id),    
    CONSTRAINT fk_supplier_phone FOREIGN KEY (supplier_phone_id) REFERENCES d_supplier_phones(phone_id),    
    CONSTRAINT fk_supplier_city FOREIGN KEY (supplier_city_id) REFERENCES d_supplier_cities(city_id)
);