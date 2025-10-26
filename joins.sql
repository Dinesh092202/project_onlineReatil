a) Simple sales query — order with items and payment

SELECT o.order_number, o.placed_at, c.email, oi.product_id, p.name AS product_name,
oi.quantity, oi.unit_price, oi.line_total, pay.status AS payment_status
FROM orders o
JOIN customers c ON c.id = o.customer_id
JOIN order_items oi ON oi.order_id = o.id
JOIN products p ON p.id = oi.product_id
LEFT JOIN payments pay ON pay.order_id = o.id;

b) Daily sales totals (aggregated)
SELECT date_trunc('day', o.placed_at) AS day,
COUNT(DISTINCT o.id) AS orders_count,
SUM(o.total_amount) AS revenue
FROM orders o
WHERE o.placed_at >= now() - interval '30 days'
GROUP BY 1
ORDER BY 1 DESC;

c) Top selling products (by quantity)
SELECT p.id, p.sku, p.name, SUM(oi.quantity) AS total_sold
FROM order_items oi
JOIN products p ON p.id = oi.product_id
GROUP BY p.id, p.sku, p.name
ORDER BY total_sold DESC
LIMIT 20;

d) Customer lifetime value (CLV)
SELECT c.id, c.email,
COUNT(DISTINCT o.id) AS orders_count,
SUM(o.total_amount) AS lifetime_value
FROM customers c
LEFT JOIN orders o ON o.customer_id = c.id
GROUP BY c.id, c.email
ORDER BY lifetime_value DESC;

e) View: sales_by_day
CREATE VIEW sales_by_day AS
SELECT date_trunc('day', o.placed_at) AS day,
COUNT(DISTINCT o.id) AS orders_count,
SUM(o.total_amount) AS revenue,
SUM(COALESCE(pay.amount,0)) AS payments_received
FROM orders o
LEFT JOIN payments pay ON pay.order_id = o.id AND pay.status = 'completed'
GROUP BY 1;

f) View: product_performance
CREATE VIEW product_performance AS
SELECT p.id, p.sku, p.name,
SUM(oi.quantity) AS total_quantity_sold,
SUM(oi.line_total) AS total_revenue
FROM products p
JOIN order_items oi ON oi.product_id = p.id
GROUP BY p.id, p.sku, p.name;
