INSERT INTO d_product_brand (brand_name)
SELECT DISTINCT product_brand
FROM mock_data
WHERE product_brand IS NOT NULL;

INSERT INTO d_product_category (category_name)
SELECT DISTINCT product_category
FROM mock_data
WHERE product_category IS NOT NULL;

INSERT INTO d_product_size (size_name)
SELECT DISTINCT product_size
FROM mock_data
WHERE product_size IS NOT NULL;

INSERT INTO d_product_color (color_name)
SELECT DISTINCT product_color
FROM mock_data
WHERE product_color IS NOT NULL;

INSERT INTO d_product_material (material_name)
SELECT DISTINCT product_material
FROM mock_data
WHERE product_material IS NOT NULL;

INSERT INTO d_product_release_date (release_date)
SELECT DISTINCT TO_DATE(product_release_date, 'MM-DD-YYYY')
FROM mock_data
WHERE product_release_date IS NOT NULL;

INSERT INTO d_product_expiry_date (expiry_date)
SELECT DISTINCT TO_DATE(product_expiry_date, 'MM-DD-YYYY')
FROM mock_data
WHERE product_expiry_date IS NOT NULL;

INSERT INTO d_products (
    product_name,
    product_price,
    product_quantity,
    product_weight,
    product_description,
    product_rating,
    product_reviews,
    product_color_id,
    product_size_id,
    product_brand_id,
    product_material_id,
    product_category_id,
    product_release_date_id,
    product_expiry_date_id
)
SELECT
    m.product_name,
    m.product_price,
    m.product_quantity,
    m.product_weight,
    m.product_description,
    m.product_rating,
    m.product_reviews,
    c.color_id,
    s.size_id,
    b.brand_id,
    mtrl.material_id,
    cat.category_id,
    r.release_date_id,
    e.expiry_date_id
FROM mock_data m
LEFT JOIN d_product_color c ON m.product_color = c.color_name
LEFT JOIN d_product_size s ON m.product_size = s.size_name
LEFT JOIN d_product_brand b ON m.product_brand = b.brand_name
LEFT JOIN d_product_material mtrl ON m.product_material = mtrl.material_name
LEFT JOIN d_product_category cat ON m.product_category = cat.category_name
LEFT JOIN d_product_release_date r ON TO_DATE(m.product_release_date, 'MM-DD-YYYY') = r.release_date
LEFT JOIN d_product_expiry_date e ON TO_DATE(m.product_expiry_date, 'MM-DD-YYYY') = e.expiry_date
GROUP BY
    m.product_name,
    m.product_price,
    m.product_quantity,
    m.product_weight,
    m.product_description,
    m.product_rating,
    m.product_reviews,
    c.color_id,
    s.size_id,
    b.brand_id,
    mtrl.material_id,
    cat.category_id,
    r.release_date_id,
    e.expiry_date_id;