DROP TABLE IF EXISTS d_products CASCADE;

CREATE TABLE d_product_brand (
    brand_id SERIAL PRIMARY KEY,
    brand_name VARCHAR(50) NOT NULL
);

CREATE TABLE d_product_category (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE d_product_size (
    size_id SERIAL PRIMARY KEY,
    size_name VARCHAR(50) NOT NULL
);

CREATE TABLE d_product_color (
    color_id SERIAL PRIMARY KEY,
    color_name VARCHAR(50) NOT NULL
);

CREATE TABLE d_product_material (
    material_id SERIAL PRIMARY KEY,
    material_name VARCHAR(50) NOT NULL
);

CREATE TABLE d_product_expiry_date (
    expiry_date_id SERIAL PRIMARY KEY,
    expiry_date DATE NOT NULL
);

CREATE TABLE d_product_release_date (
    release_date_id SERIAL PRIMARY KEY,
    release_date DATE NOT NULL
);

CREATE TABLE d_products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    product_price REAL NOT NULL,
    product_quantity INTEGER NOT NULL,
    product_weight REAL NOT NULL,
    product_description VARCHAR(1024) NOT NULL,
    product_rating REAL NOT NULL,
    product_reviews INTEGER NOT NULL,
    product_color_id INTEGER,
    product_size_id INTEGER,
    product_brand_id INTEGER,
    product_material_id INTEGER,
    product_category_id INTEGER,
    product_release_date_id INTEGER,
    product_expiry_date_id INTEGER,

    CONSTRAINT fk_product_color FOREIGN KEY (product_color_id) REFERENCES d_product_color(color_id),
    CONSTRAINT fk_product_size FOREIGN KEY (product_size_id) REFERENCES d_product_size(size_id),
    CONSTRAINT fk_product_brand FOREIGN KEY (product_brand_id) REFERENCES d_product_brand(brand_id),
    CONSTRAINT fk_product_material FOREIGN KEY (product_material_id) REFERENCES d_product_material(material_id),
    CONSTRAINT fk_product_category FOREIGN KEY (product_category_id) REFERENCES d_product_category(category_id),
    CONSTRAINT fk_product_release_date FOREIGN KEY (product_release_date_id) REFERENCES d_product_release_date(release_date_id),
    CONSTRAINT fk_product_expiry_date FOREIGN KEY (product_expiry_date_id) REFERENCES d_product_expiry_date(expiry_date_id)  
);



