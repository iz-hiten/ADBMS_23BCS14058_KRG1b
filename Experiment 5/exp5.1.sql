CREATE TABLE transaction_data (
    id INT,
    value NUMERIC
);

INSERT INTO transaction_data (id, value)
SELECT 1, (random() * 100)::numeric
FROM generate_series(1, 1000000);

INSERT INTO transaction_data (id, value)
SELECT 2, (random() * 100)::numeric
FROM generate_series(1, 1000000);

CREATE OR REPLACE VIEW hiten_sales_summary AS
SELECT 
    id,
    COUNT(*) AS total_orders,
    SUM(value) AS total_sales,
    SUM(value) AS total_quantity_sold
FROM transaction_data
GROUP BY id;

CREATE MATERIALIZED VIEW hiten_sales_summary_mv AS
SELECT 
    id,
    COUNT(*) AS total_orders,
    SUM(value) AS total_sales,
    SUM(value) AS total_quantity_sold
FROM transaction_data
GROUP BY id;

EXPLAIN ANALYZE
SELECT * FROM hiten_sales_summary;

EXPLAIN ANALYZE
SELECT * FROM hiten_sales_summary_mv;
