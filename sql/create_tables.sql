CREATE TABLE retail_sales (
    order_id INTEGER PRIMARY KEY,
    order_date DATE,
    region VARCHAR(50),
    category VARCHAR(50),
    customer_id INTEGER,
    sales_amount NUMERIC(10,2),
    profit NUMERIC(10,2)
);



ALTER TABLE retail_sales
ALTER COLUMN order_date TYPE timestamp USING order_date::timestamp;


