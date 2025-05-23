INSERT INTO d_date_day (day_name)
SELECT DISTINCT EXTRACT(DAY FROM TO_DATE(sale_date, 'MM-DD-YYYY'))::INTEGER
FROM mock_data;

INSERT INTO d_date_month (month_name)
SELECT DISTINCT EXTRACT(MONTH FROM TO_DATE(sale_date, 'MM-DD-YYYY'))::INTEGER
FROM mock_data;

INSERT INTO d_date (date, day_id, month_id, year)
SELECT 
    sale_date,
    dd.day_id,
    dm.month_id,
    EXTRACT(YEAR FROM TO_DATE(m.sale_date, 'MM-DD-YYYY'))::INTEGER
FROM mock_data m
JOIN d_date_day dd 
  ON dd.day_name = EXTRACT(DAY FROM TO_DATE(m.sale_date, 'MM-DD-YYYY'))::INTEGER
JOIN d_date_month dm 
  ON dm.month_name = EXTRACT(MONTH FROM TO_DATE(m.sale_date, 'MM-DD-YYYY'))::INTEGER
GROUP BY sale_date, dd.day_id, dm.month_id;
