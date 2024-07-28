INSERT INTO products (product_name, category,price,stock_quantity) VALUES 
('Dog Food', 'Food', 25.99, 150),
('Cat Food', 'Food', 19.99, 100),
('Bird Seed', 'Food', 12.49, 80),
('Fish Flakes', 'Food', 8.99, 60),
('Cat Toy', 'Toys', 5.99, 200),
('Dog Leash', 'Accessories', 15.49, 120),
('Dog Collar', 'Accessories', 9.99, 90),
('Bird Cage', 'Housing', 79.99, 20),
('Aquarium', 'Housing', 149.99, 10),
('Cat Scratching Post', 'Toys', 39.99, 30),
('Fish Tank Filter', 'Accessories', 24.99, 50);


INSERT INTO suppliers (supplier_name, contact_email) VALUES 
('Kika', 'kika@gmail.com'),
('PetCity', 'petcity@gmail.com'),
('Pet24', 'pet24@bestpetproducts.com');

INSERT INTO customers (customer_name,customer_email,customer_phone) VALUES
('Antanas Antanaitis', 'antanaitis@gmail.com', '+3700000000'),
('Jonas Jonaitis', 'jonaitis@gmail.com', '+3700000001'),
('Aukse Auksaite', 'auksaite@gmail.com', '+3700000007');

INSERT INTO sales (product_id,supplier_id, customer_id, sale_date, quantity_sold) VALUES 
(1, 1, 3, '2024-06-01', 30),
(2, 2, 3, '2024-06-01', 20),
(3, 3, 1, '2024-06-01', 25),
(4, 1, 2, '2024-06-01', 15),
(5, 2, 1, '2024-06-01', 50),
(6, 3, 1, '2024-06-01', 40),
(7, 1, 2, '2024-06-02', 10),
(8, 2, 3, '2024-06-02', 5),
(9, 3, 1, '2024-06-02', 3),
(10, 1, 2, '2024-06-02', 7),
(11, 2, 3, '2024-06-02', 12);