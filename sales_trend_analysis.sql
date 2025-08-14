CREATE TABLE ecommerce_orders (order_id INT, user_id INT, product_id INT, category VARCHAR(50),
price DECIMAL, qty INT, total_price DECIMAL, order_date TIMESTAMP, country VARCHAR(50), customer_segment VARCHAR(50));

COPY ecommerce_orders FROM 'C:/Program Files/PostgreSQL/17/data/import/ecommerce_orders.csv' DELIMITER ',' CSV HEADER;

SELECT * FROM ecommerce_orders;

-- Analyzing monthly revenue and order volume
SELECT EXTRACT(YEAR  FROM order_date) AS year, EXTRACT(MONTH FROM order_date) AS month, SUM(total_price) AS revenue, 
COUNT(DISTINCT order_id) AS order_volume FROM ecommerce_orders 
WHERE order_date BETWEEN '2023-01-01' AND '2023-12-31'
GROUP BY year, month ORDER BY year, month;