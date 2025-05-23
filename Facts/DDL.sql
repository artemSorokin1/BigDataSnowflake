DROP TABLE IF EXISTS f_sales;

CREATE TABLE public.f_sales (
    sale_id Serial PRIMARY KEY,
    sale_date_id INTEGER NULL,
    sale_customer_id integer NULL,
    sale_seller_id integer NULL,
    sale_product_id integer NULL,
    sale_store_id integer null,

    supplier_id integer null,

    sale_quantity integer NULL,
    sale_total_price real NULL,

    CONSTRAINT fk_customer FOREIGN KEY (sale_customer_id) REFERENCES public.d_customer(customer_id),
    CONSTRAINT fk_seller FOREIGN KEY (sale_seller_id) REFERENCES public.d_sellers(seller_id),
    CONSTRAINT fk_product FOREIGN KEY (sale_product_id) REFERENCES public.d_products(product_id),
    CONSTRAINT fk_store FOREIGN KEY (sale_store_id) REFERENCES public.d_stores(store_id),
    CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) REFERENCES public.d_suppliers(supplier_id),
    CONSTRAINT fk_date FOREIGN KEY (sale_date_id) REFERENCES public.d_date(date_id)
);