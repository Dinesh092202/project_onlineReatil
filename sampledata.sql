-- Customers
INSERT INTO customers (email, first_name, last_name, phone)
VALUES
('abeye@example.com','abeye','Kumar','+91-9000000001'),
('anurag@example.com','anurag','Sharma','+91-9000000002');


-- Addresses
INSERT INTO addresses (customer_id, type, line1, city, state, country, postal_code)
VALUES
(1,'shipping','12 MG Road','Bengaluru','Karnataka','India','560001'),
(1,'billing','12 MG Road','Bengaluru','Karnataka','India','560001'),
(2,'shipping','45 Park St','Kolkata','West Bengal','India','700016');


-- Categories
INSERT INTO categories (name, description)
VALUES ('Electronics','Gadgets and devices'),('Apparel','Clothing and accessories');


-- Products
INSERT INTO products (sku, name, description, price)
VALUES
('SKU-1001','Wireless Mouse','Optical wireless mouse',499.00),
('SKU-2001','T-Shirt','Cotton t-shirt (M)',399.00);


-- Product categories
INSERT INTO product_categories (product_id, category_id)
VALUES (1,1),(2,2);


-- Orders
INSERT INTO orders (order_number, customer_id, shipping_address_id, billing_address_id, status, total_amount)
VALUES
('ORD-0001',1,1,2,'paid',998.00);


-- Order items (capture price at time of order)
INSERT INTO order_items (order_id, product_id, unit_price, quantity, line_total)
VALUES (1,1,499.00,1,499.00),(1,2,399.00,1,399.00);


-- Payments
INSERT INTO payments (order_id, payment_method, amount, currency, status, transaction_id, paid_at)
VALUES (1,'card',998.00,'INR','completed','txn_abc123', now());


-- Inventory
INSERT INTO inventories (product_id, sku, quantity_on_hand, last_restocked)
VALUES (1,'SKU-1001',50, now()),(2,'SKU-2001',100, now());
