-- CHECK FOR NULL VALUES

SELECT
	SUM(CASE WHEN customer_zip_code_prefix IS NULL THEN 1 ELSE 0 END) AS customer_zip_code_null,
	SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) AS customer_id_null,
	SUM(CASE WHEN customer_unique_id IS NULL THEN 1 ELSE 0 END) AS customer_unique_id_null,
	SUM(CASE WHEN customer_city IS NULL THEN 1 ELSE 0 END) AS customer_city_null,
	SUM(CASE WHEN customer_state IS NULL THEN 1 ELSE 0 END) AS customer_state_null
FROM customers;

-- No null values in customer table

SELECT
	SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) as order_id_null,
	SUM(CASE WHEN customer_id IS NULL THEN 1 ELSE 0 END) as customer_id_null,
	SUM(CASE WHEN order_status IS NULL THEN 1 ELSE 0 END) AS order_status_null,
	SUM(CASE WHEN order_purchase_timestamp IS NULL THEN 1 ELSE 0 END) AS order_purchase_timestamp_null,
	SUM(CASE WHEN order_approved_at IS NULL THEN 1 ELSE 0 END) AS order_approved_null,
	SUM(CASE WHEN order_delivered_carrier_date IS NULL THEN 1 ELSE 0 END) AS order_delivered_null,
	SUM(CASE WHEN order_estimated_delivery_date IS NULL THEN 1 ELSE 0 END) AS order_estimated_null
FROM orders;

-- order_approved_at column : 160 null values
-- order_delivered_carrier_date : 1783 null values in the orders table

SELECT order_status, COUNT(*) AS total_orders
FROM orders
WHERE order_approved_at IS NULL
GROUP BY order_status
ORDER BY total_orders DESC;

SELECT order_status, COUNT(*) AS total_orders
FROM orders
WHERE order_delivered_carrier_date IS NULL
GROUP BY order_status
ORDER BY total_orders DESC;

--- These null values in the orders table are valid so no changes made

SELECT
	SUM(CASE WHEN shipping_limit_date IS NULL THEN 1 ELSE 0 END) AS shipping_limit_date_null,
	SUM(CASE WHEN price IS NULL THEN 1 ELSE 0 END) AS price_null,
	SUM(CASE WHEN freight_value IS NULL THEN 1 ELSE 0 END) AS freight_value_null,
	SUM(CASE WHEN order_item_id IS NULL THEN 1 ELSE 0 END) AS order_item_id_null,
	SUM(CASE WHEN seller_id IS NULL THEN 1 ELSE 0 END) AS seller_id_null,
	SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS product_id_null,
	SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS order_id_null
FROM order_items;

-- No null values found in order_items table

SELECT
	SUM(CASE WHEN product_width_cm IS NULL THEN 1 ELSE 0 END) AS product_width_null,
	SUM(CASE WHEN product_length_cm IS NULL THEN 1 ELSE 0 END) AS product_length_null,
	SUM(CASE WHEN product_height_cm IS NULL THEN 1 ELSE 0 END) AS product_height_null,
	SUM(CASE WHEN product_name_lenght IS NULL THEN 1 ELSE 0 END) AS product_name_lenght_null,
	SUM(CASE WHEN product_description_lenght IS NULL THEN 1 ELSE 0 END) AS product_description_lenght_null,
	SUM(CASE WHEN product_photos_qty IS NULL THEN 1 ELSE 0 END) AS product_photos_qty_null,
	SUM(CASE WHEN product_weight_g IS NULL THEN 1 ELSE 0 END) AS product_weight_g_null,
	SUM(CASE WHEN product_category_name IS NULL THEN 1 ELSE 0 END) AS product_category_name_null,
	SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END) AS product_id_null
FROM products;

--product_width_cm : 2 null values
--product_length_cm : 2 null values
--product_height_cm : 2 null values
--product_name_lenght : 610 null values
--product_description_lenght : 610 null values
--product_photos_qty : 610 null values
--product_weight_g : 2 null values
--product_category_name : 610 null values
-- These null values in the products table are valid so no changes made

SELECT
	SUM(CASE WHEN seller_id IS NULL THEN 1 ELSE 0 END) AS seller_id_null,
	SUM(CASE WHEN seller_zip_code_prefix IS NULL THEN 1 ELSE 0 END) AS seller_zip_code_null,
	SUM(CASE WHEN seller_city IS NULL THEN 1 ELSE 0 END) AS seller_city_null,
	SUM(CASE WHEN seller_state IS NULL THEN 1 ELSE 0 END) AS seller_state_null
FROM sellers;

-- No null value found in sellers table

SELECT
	SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS order_id_null,
	SUM(CASE WHEN payment_sequential IS NULL THEN 1 ELSE 0 END) AS payment_sequential_null,
	SUM(CASE WHEN payment_type IS NULL THEN 1 ELSE 0 END) AS payment_type_null,
	SUM(CASE WHEN payment_installments IS NULL THEN 1 ELSE 0 END) AS payment_installments_null,
	SUM(CASE WHEN payment_value IS NULL THEN 1 ELSE 0 END) AS payment_value_null
FROM order_payments;

-- No null value found in order_payments table

SELECT
	SUM(CASE WHEN review_id IS NULL THEN 1 ELSE 0 END) AS review_id_null,
	SUM(CASE WHEN order_id IS NULL THEN 1 ELSE 0 END) AS order_id_null,
	SUM(CASE WHEN review_score IS NULL THEN 1 ELSE 0 END) AS review_score_null,
	SUM(CASE WHEN review_comment_title IS NULL THEN 1 ELSE 0 END) AS review_comment_title_null,
	SUM(CASE WHEN review_comment_message IS NULL THEN 1 ELSE 0 END) AS review_comment_message_null,
	SUM(CASE WHEN review_creation_date IS NULL THEN 1 ELSE 0 END) AS review_creation_date_null,
	SUM(CASE WHEN review_answer_timestamp IS NULL THEN 1 ELSE 0 END) AS review_answer_timestamp_null
FROM order_reviews;

--review_comment_title : 87656 null values
--review_comment_message : 58247 null values
---These null values are valid as some of the customer don't leave any comments in review. They only rate it.

SELECT
	SUM(CASE WHEN geolocation_zip_code_prefix IS NULL THEN 1 ELSE 0 END) AS geolocation_zip_code_prefix_null,
	SUM(CASE WHEN geolocation_lat IS NULL THEN 1 ELSE 0 END) AS geolocation_lat_null,
	SUM(CASE WHEN geolocation_lng IS NULL THEN 1 ELSE 0 END) AS geolocation_lng_null,
	SUM(CASE WHEN geolocation_city IS NULL THEN 1 ELSE 0 END) AS geolocation_city_null,
	SUM(CASE WHEN geolocation_state IS NULL THEN 1 ELSE 0 END) AS geolocation_state_null
FROM geolocation;

-- No null value found in geolocation table

SELECT
	SUM(CASE WHEN product_category_name IS NULL THEN 1 ELSE 0 END) AS product_category_name_null,
	SUM(CASE WHEN product_category_name_english IS NULL THEN 1 ELSE 0 END) AS product_category_name_english_null
FROM product_category_translation;

-- No null value found in product_category_translation table

-- DUPLICATE DATA

SELECT customer_id, count(*)
FROM customers
GROUP BY customer_id 
HAVING count(*)>1;

-- No duplicate rows in customers table

SELECT order_id, count(*)
FROM orders
GROUP BY order_id
HAVING count(*)>1;

-- No duplicate rows in orders table

SELECT order_id, order_item_id, count(*)
FROM order_items
GROUP BY order_id, order_item_id
HAVING count(*)>1;

-- No duplicate rows in order_items table (Unique key here is order_id and order_items_id)

SELECT product_id, count(*)
FROM products
GROUP BY product_id
HAVING count(*)>1;

-- No duplicate rows in products table

SELECT seller_id, count(*)
FROM sellers
GROUP BY seller_id
HAVING count(*)>1;

-- No duplicate rows in sellers table

SELECT order_id, payment_sequential, count(*)
FROM order_payments
GROUP BY order_id, payment_sequential
HAVING count(*)>1;

-- No duplicate rows in order_payments table

SELECT review_id, order_id, count(*)
FROM order_reviews
GROUP BY review_id, order_id
HAVING count(*)>1;
	
-- No duplicate rows in order_reviews table

--- Duplicates are expected in geolocation table

SELECT product_category_name, count(*)
FROM product_category_translation
GROUP BY product_category_name
HAVING count(*)>1;

-- No duplicate rows in product_category_translation table
