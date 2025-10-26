// DBML for dbdiagram.io
Table customers {
id serial [pk]
email varchar(255) [not null, unique]
first_name varchar(100) [not null]
last_name varchar(100)
phone varchar(20)
created_at timestamptz [default: `now()`]
}


Table addresses {
id serial [pk]
customer_id int [ref: > customers.id]
type varchar(20) [note: 'shipping'|'billing']
line1 varchar(255) [not null]
line2 varchar(255)
city varchar(100)
state varchar(100)
country varchar(100) [not null]
postal_code varchar(20)
created_at timestamptz [default: `now()`]
}


Table categories {
id serial [pk]
name varchar(100) [not null, unique]
description text
}


Table products {
id serial [pk]
sku varchar(50) [not null, unique]
name varchar(255) [not null]
description text
price numeric(12,2) [not null]
active boolean [default: true]
created_at timestamptz [default: `now()`]
}


Table product_categories {
product_id int [ref: > products.id]
category_id int [ref: > categories.id]
indexes { (product_id, category_id) [pk] }
}


Table orders {
id serial [pk]
order_number varchar(50) [not null, unique]
customer_id int [ref: > customers.id]
shipping_address_id int [ref: > addresses.id]
billing_address_id int [ref: > addresses.id]
status varchar(30) [not null] [note: 'pending','paid','shipped','cancelled']
total_amount numeric(14,2) [not null]
placed_at timestamptz [default: `now()`]
}


Table order_items {
id serial [pk]
order_id int [ref: > orders.id]
product_id int [ref: > products.id]
unit_price numeric(12,2) [not null]
}
