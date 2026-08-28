
--Q9. What is the Average Order Value (AOV)? (How much money does a customer spend per order on average)

SELECT 
	ROUND(SUM(payment_value)/ COUNT(DISTINCT order_id),2) AS avg_order_value
FROM order_payments


-- Q10. Which product category generates the most revenue?

SELECT 
	pct.product_category_name_english AS product_category, 
	SUM(oi.price + oi.freight_value) AS total_revenue
FROM order_items oi
JOIN products p
	ON oi.product_id = p.product_id
JOIN product_category_translation pct
	ON p.product_category_name = pct.product_category_name_english
GROUP BY pct.product_category_name_english
ORDER BY total_revenue DESC
LIMIT 10;


--Q11. How long does it take for the customers to get get their packages? (Minimum, Maximum, and Average Delivery Time (Days))

SELECT 
	MIN(order_delivered_customer_date::date - order_purchase_timestamp::date) AS min_days,
	MAX(order_delivered_customer_date::date - order_purchase_timestamp::date) AS max_days,
	ROUND(AVG(order_delivered_customer_date::date -
            order_purchase_timestamp::date),2) AS avg_delivery_days
FROM orders
WHERE order_delivered_customer_date IS NOT NULL;


---Q12. What percentage of deliveries are late, and which states have delays?

SELECT 
	c.customer_state,
	COUNT(*) AS total_orders,
	COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 END) AS late_orders,
	ROUND(COUNT(CASE WHEN order_delivered_customer_date > order_estimated_delivery_date THEN 1 END) * 100.00 / COUNT(*),2)
	AS late_percentage
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
WHERE o.order_status = 'delivered' AND o.order_delivered_customer_date IS NOT NULL
GROUP BY c.customer_state
ORDER BY late_percentage DESC;

---Q13. How do late deliveries impact review scores?
 
 SELECT
    CASE
        WHEN o.order_delivered_customer_date <= o.order_estimated_delivery_date
            THEN 'On Time'
        WHEN o.order_delivered_customer_date > o.order_estimated_delivery_date
            THEN 'Late'
    END AS delivery_status,
    r.review_score,
    COUNT(*) AS total_reviews
FROM orders o
JOIN order_reviews r
    ON o.order_id = r.order_id
WHERE o.order_delivered_customer_date IS NOT NULL
GROUP BY delivery_status, r.review_score
ORDER BY delivery_status, r.review_score;


---Q14.Count orders per customer

SELECT c.customer_unique_id, COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_unique_id
ORDER BY total_orders DESC;

---Q15. Classify Customers-Repeat/One time customers
	
WITH order_count AS(
	SELECT c.customer_unique_id, COUNT(DISTINCT o.order_id) AS total_orders
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
GROUP BY c.customer_unique_id
)

SELECT 
	CASE WHEN total_orders = 1 THEN 'One-time customer'
	ELSE 'Repeat customer'
	END AS customer_type,
	COUNT(customer_unique_id) AS total_customers
FROM order_count
GROUP BY customer_type;
