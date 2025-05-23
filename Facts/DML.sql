INSERT INTO f_sales (
    sale_date_id,
    sale_customer_id,
    sale_seller_id,
    sale_product_id,
    sale_store_id,
    supplier_id,
    sale_quantity,
    sale_total_price
)
SELECT
    dd.date_id,
    dc.customer_id,
    ds.seller_id,
    dp.product_id,
    dst.store_id,
    dsup.supplier_id,
    m.sale_quantity,
    m.sale_total_price
FROM mock_data m

LEFT JOIN d_date dd ON dd.date = m.sale_date

LEFT JOIN d_customer dc ON m.sale_customer_id = dc.customer_id

LEFT JOIN d_sellers ds ON m.sale_seller_id = ds.seller_id

LEFT JOIN d_products dp ON m.sale_product_id = dp.product_id

LEFT JOIN d_stores dst ON m.store_name = dst.store_name

LEFT JOIN d_suppliers dsup ON m.supplier_name = dsup.supplier_name;