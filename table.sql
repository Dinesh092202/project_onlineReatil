
CREATE TABLE customers (
id serial PRIMARY KEY,
email varchar(255) NOT NULL UNIQUE,
first_name varchar(100) NOT NULL,
last_name varchar(100),
phone varchar(20),
created_at timestamptz NOT NULL DEFAULT now()
);


CREATE TABLE addresses (
id serial PRIMARY KEY,
customer_id int NOT NULL REFERENCES customers(id) ON DELETE CASCADE,
type varchar(20) NOT NULL,
line1 varchar(255) NOT NULL,
line2 varchar(255),
city varchar(100),
state varchar(100),
country varchar(100) NOT NULL,
postal_code varchar(20),
created_at timestamptz NOT NULL DEFAULT now(),
CHECK (type IN ('shipping','billing'))
);


CREATE TABLE categories (
id serial PRIMARY KEY,
name varchar(100) NOT NULL UNIQUE,
description text
);


CREATE TABLE products (
id serial PRIMARY KEY,
sku varchar(50) NOT NULL UNIQUE,
name varchar(255) NOT NULL,
description text,
price numeric(12,2) NOT NULL CHECK (price >= 0),
active boolean NOT NULL DEFAULT true,
created_at timestamptz NOT NULL DEFAULT now()
);


CREATE TABLE product_categories (
product_id int NOT NULL REFERENCES products(id) ON DELETE CASCADE,
category_id int NOT NULL REFERENCES categories(id) ON DELETE CASCADE,
PRIMARY KEY (product_id, category_id)
);


CREATE TABLE orders (
id serial PRIMARY KEY,
order_number varchar(50) NOT NULL UNIQUE,
customer_id int NOT NULL REFERENCES customers(id),
shipping_address_id int REFERENCES addresses(id),
billing_address_id int REFERENCES addresses(id),
status varchar(30) NOT NULL,
total_amount numeric(14,2) NOT NULL CHECK (total_amount >= 0),
placed_at timestamptz NOT NULL DEFAULT now()
);


CREATE TABLE order_items (
id serial PRIMARY KEY,
order_id int NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
product_id int NOT NULL REFERENCES products(id),
unit_price numeric(12,2) NOT NULL CHECK (unit_price >= 0),
quantity int NOT NULL CHECK (quantity > 0),
line_total numeric(14,2) NOT NULL CHECK (line_total = unit_price * quantity)
);


CREATE TABLE payments (
id serial PRIMARY KEY,
order_id int NOT NULL REFERENCES orders(id) ON DELETE CASCADE,
payment_method varchar(50) NOT NULL,
amount numeric(14,2) NOT NULL CHECK (amount >= 0),
currency varchar(10) NOT NULL DEFAULT 'USD',
CREATE INDEX idx_products_sku ON products(sku);
