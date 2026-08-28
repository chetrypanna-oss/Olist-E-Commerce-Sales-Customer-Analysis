--- Olist E-Commerce Analysis
--- Postgresql
--- DATA EXPLORATION & UNDERSTANDING

-- Check Row Counts

SELECT COUNT(*) AS total_customers FROM customers;
SELECT COUNT(*) AS total_orders FROM orders;
SELECT COUNT(*) AS total_order_items FROM order_items;
SELECT COUNT(*) AS total_products FROM products;
SELECT COUNT(*) AS total_sellers FROM sellers;
SELECT COUNT(*) AS total_payments FROM order_payments;
SELECT COUNT(*) AS total_reviews FROM order_reviews;
SELECT COUNT(*) AS total_geolocations FROM geolocation;
SELECT COUNT(*) AS total_categories FROM product_category_translation;


-- SAMPLE DATA

SELECT * FROM customers LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM order_items LIMIT 10;
SELECT * FROM products LIMIT 10;
SELECT * FROM sellers LIMIT 10;
SELECT * FROM order_payments LIMIT 10;
SELECT * FROM order_reviews LIMIT 10;
SELECT * FROM geolocation LIMIT 10;
SELECT * FROM product_category_translation LIMIT 10;


-- Inspect Table Structure

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'customers';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'orders';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'order_items';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'products';

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'sellers'

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'order_payments'

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'order_reviews'

SELECT column_name, data_type
FROM information_schema.columns
WHERE table_name = 'product_category_translation'
