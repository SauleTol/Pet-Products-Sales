CREATE TABLE products (
product_id INTEGER AUTO_INCREMENT PRIMARY KEY,
product_name VARCHAR(300),
category VARCHAR(300),
price REAL,
stock_quantity INTEGER
);

CREATE TABLE customers (
customer_id INTEGER AUTO_INCREMENT PRIMARY KEY,
customer_name VARCHAR(300),
customer_email VARCHAR(300),
customer_phone VARCHAR(30)
);

CREATE TABLE suppliers (
supplier_id INTEGER AUTO_INCREMENT PRIMARY KEY,
product_id INTEGER,
FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

CREATE TABLE sales (
sale_id INTEGER AUTO_INCREMENT PRIMARY KEY,
product_id INTEGER,
customer_id INTEGER,
sale_date DATE,
quantity_sold INTEGER,
FOREIGN KEY (product_id) REFERENCES products(product_id),
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

