----- EXPLORATORY DATA ANALYSIS(EDA)

-- Q1. We'll find: Total Customers / Total Orders / Total Products / Total Sellers / Total Revenue

SELECT
	(SELECT COUNT(*) FROM customers) AS total_customers, 
	(SELECT COUNT(*) FROM orders) AS total_orders,
	(SELECT COUNT(*) FROM products) AS total_products,
	(SELECT COUNT(*) FROM sellers) AS total_sellers,
	(SELECT SUM(price + freight_value) FROM order_items) AS total_revenue;

--- Q2. Order status distribution

SELECT 
	order_status, count(*) AS total_orders
FROM orders
GROUP BY order_status
ORDER BY total_orders DESC;

--- Q3. Payment types: Which payment method customers prefers the most?

SELECT 
	payment_type, COUNT(*) AS total_each_payment_types
FROM order_payments
GROUP BY payment_type
ORDER BY total_each_payment_types DESC;

--- Q4. Revenue by Payment Type: Which payment method generates the most revenue.

SELECT 
	payment_type, SUM(payment_value) AS revenue
FROM order_payments
GROUP BY payment_type
ORDER BY revenue DESC; 

--- Q5. Top 10 States/Cities by Customers : Where are most of the customers located?

SELECT 
	customer_state, COUNT(*) AS total_customers
FROM customers
GROUP BY customer_state
ORDER BY total_customers DESC 
LIMIT 10;

SELECT 
	customer_city, COUNT(*) AS total_customers
FROM customers
GROUP BY customer_city
ORDER BY total_customers DESC
LIMIT 10;

--- Q6. Top 10 Sellers by Revenue

SELECT 
	seller_id, SUM(price) AS total_sales
FROM order_items
GROUP BY seller_id
ORDER BY total_sales DESC
LIMIT 10;

--Q7. What is the monthly and yearly sales trend?

SELECT 
	EXTRACT(YEAR FROM o.order_purchase_timestamp) AS years, 
	SUM(oi.price + oi.freight_value) AS yearly_sales
FROM orders o
JOIN order_items oi
ON o.order_id=oi.order_id
GROUP BY 
	EXTRACT(YEAR FROM o.order_purchase_timestamp)
ORDER BY yearly_sales DESC;

SELECT 
	TO_CHAR(o.order_purchase_timestamp, 'Month') AS months, 
	SUM(oi.price + oi.freight_value) AS monthly_sales
FROM orders o
JOIN order_items oi
ON o.order_id=oi.order_id
GROUP BY 
	TO_CHAR(o.order_purchase_timestamp, 'Month'), 
	EXTRACT(MONTH FROM o.order_purchase_timestamp)
ORDER BY 
	EXTRACT(MONTH FROM o.order_purchase_timestamp);


--Q8.Which months had the highest number of orders?


SELECT 
	TO_CHAR(order_purchase_timestamp, 'Month') AS months, 
	COUNT(*) AS total_orders
FROM orders
GROUP BY TO_CHAR(order_purchase_timestamp, 'Month')
ORDER BY total_orders DESC;
