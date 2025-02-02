/* 1. Design a database which keeps track of the products in a store. Design the relationships between tables and establish the attributes of each entity, as well as the optionality of each attribute. */

CREATE DATABASE store;

USE store;

CREATE TABLE category
(id_category INT PRIMARY KEY AUTO_INCREMENT,
name_category VARCHAR(50) UNIQUE NOT NULL DEFAULT 'Miscellaneous',
number_entries INT);

CREATE TABLE supplier
(id_supplier INT PRIMARY KEY AUTO_INCREMENT,
name_supplier VARCHAR(50) UNIQUE NOT NULL,
city_supplier VARCHAR(50) NOT NULL,
phone_supplier BIGINT(10) UNIQUE NOT NULL);

CREATE TABLE product
(id_product INT PRIMARY KEY AUTO_INCREMENT,
name_product VARCHAR(50) NOT NULL,
price_current DECIMAL(5,2) NOT NULL,
quantity_available INT,
id_supplier INT,
id_category INT,
CONSTRAINT fk_product_supplier FOREIGN KEY (id_supplier) REFERENCES supplier (id_supplier),
CONSTRAINT fk_product_category FOREIGN KEY (id_category) REFERENCES category (id_category));

CREATE TABLE customer
(id_customer INT PRIMARY KEY AUTO_INCREMENT,
last_name VARCHAR(50) NOT NULL,
first_name VARCHAR(50) NOT NULL,
city_customer VARCHAR(50),
phone_customer BIGINT(10) UNIQUE NOT NULL);

CREATE TABLE orders
(id_order INT PRIMARY KEY AUTO_INCREMENT,
date_order DATETIME NOT NULL,
STATUS VARCHAR(50) NOT NULL,
value_order DECIMAL(5,2) NOT NULL,
id_customer INT,
CONSTRAINT fk_order_customer FOREIGN KEY (id_customer) REFERENCES customer(id_customer));

CREATE TABLE invoice
(id_invoice INT PRIMARY KEY AUTO_INCREMENT,
date_issued DATETIME NOT NULL,
id_customer INT,
id_supplier INT,
id_product INT,
CONSTRAINT fk_invoice_customer FOREIGN KEY (id_customer) REFERENCES customer(id_customer),
CONSTRAINT fk_invoice_supplier FOREIGN KEY (id_supplier) REFERENCES supplier(id_supplier),
CONSTRAINT fk_invoice_product FOREIGN KEY (id_product) REFERENCES product(id_product),
price_acquisition DECIMAL(5,2) NOT NULL,
quantity_ordered INT NOT NULL,
value_invoice DECIMAL(5,2) NOT NULL,
id_order INT,
CONSTRAINT fk_invoice_order FOREIGN KEY (id_order) REFERENCES orders(id_order));

/* 2. Perform 5 operations to modify the structure of the tables after they have been created and add some constraints on some of their fields. */

RENAME TABLE category TO aisle;

ALTER TABLE aisle RENAME TO category;

ALTER TABLE customer ADD email VARCHAR(50) UNIQUE;

ALTER TABLE customer MODIFY email VARCHAR(50) UNIQUE NOT NULL;

ALTER TABLE customer DROP email;

/* 3. Insert data into all the tables of the database. */ 

INSERT INTO supplier
(name_supplier, city_supplier, phone_supplier) VALUES 
('Milcov Valley', 'Valea Milcovului', 1111111111), 
('Red Steer', 'Satu Nou', 2222222222), 
('Spice Spicey', 'Budeni', 3333333333), 
('Shawa Twasa', 'Andreiasu', 4444444444), 
('Food Nation', 'Rachitasu', 5555555555), 
('Bread Pizza', 'Nereju', 6666666666), 
('Third Time Lucky', 'Fetig', 7777777777), 
('Pljeskraljica', 'Valcani', 8888888888), 
('Kozunakery', 'Ursoaia', 9999999999), 
("Thalassa's Treasures", 'Ghebari', 1234567890);

INSERT INTO category
(name_category, number_entries) VALUES
('Kitchenware', 3),
('Toiletries', 3),
('Containers', 2),
('Lactate', 2),
('Food', 4),
('Sweets', 6),
('Fruits', 2), 
('Clothes', 4), 
('Alcohol', 2), 
('Laundry', 2);

INSERT INTO product
(name_product, price_current, quantity_available, id_supplier, id_category) VALUES
('Forks', 1.5, 30, 9, 1), 
('Slip', 23, 10, 8, 8), 
('Cookies', 25, 15, 4, 6), 
('Bucket', 6.5, 12, 10, 3), 
('Gel', 14, 18, 1, 2), 
('Jam', 9, 8, 6, 5), 
('Pickles', 9.5, 14, 6, 5), 
('Grill', 14, 6, 9, 1), 
('Cheese', 45, 19, 3, 4), 
('Crackers', 3.5, 50, 4, 6), 
('Gum', 2.5, 100, 4, 6), 
('Biscuits', 4.5, 27, 4, 6), 
('Toilet paper', 1.5, 70, 1, 2), 
('Caviar', 3, 25, 6, 5), 
('Shoes', 60, 4, 8, 8), 
('Tights', 32, 13, 8, 8), 
('Ice cream', 2.5, 35, 4, 6), 
('Ham', 42, 10, 6, 5), 
('Kiwi', 8, 17, 5, 7), 
('Kinder Surprise', 5, 40, 4, 6), 
('Detergent', 28, 5, 2, 10), 
('Lemons', 9, 11, 5, 7), 
('Blades', 1.5, 45, 1, 2), 
('Coniac', 23, 23, 7, 9), 
('Milk', 7, 20, 3, 4), 
('Jacket', 125, 7, 8, 8), 
('Balm', 7, 28, 2, 10), 
('Liquour', 18, 32, 7, 9), 
('Basin', 14, 12, 10, 3), 
('Spoons', 2, 30, 9, 1);

INSERT INTO customer
(last_name, first_name, city_customer, phone_customer) VALUES 
('Mladic', 'Ratko', 'Bozanivici', 1000000000), 
('Karadzic', 'Radovan', 'Petnjica', 2000000000), 
('Tudjman', 'Franjo', 'Veliko Trgovisce', 3000000000), 
('Raznatovic', 'Zeljko', 'Resnik', 4000000000), 
('Izetbegovic', 'Alija', 'Bosanski Samac', 5000000000), 
('Vasiljkovic', 'Dragan', 'Belgrade', 6000000000), 
('Savic', 'Ljubisa', 'Bijeljina', 7000000000), 
('Ulemek', 'Milorad', 'Belgrade', 8000000000), 
('Pelevic', 'Borislav', 'Bubije', 9000000000), 
('Milosevic', 'Slobodan', 'Pozarevac', 9876543210); 

INSERT INTO orders
(date_order, STATUS, value_order, id_customer) VALUES
('1991-08-25 09-23-21', 'Delivered', 390.5, 6),
('1992-04-03 09-04-17', 'Cancelled', 101.5, 2),
('1992-05-25 13-30-57', 'Delivered', 197.5, 10),
('1992-06-24 08-43-41', 'Delivered', 350, 4),
('1993-04-12 17-40-16', 'Delivered', 80.5, 8),
('1993-11-05 12-15-34', 'Cancelled', 99, 9),
('1994-11-04 08-11-47', 'Delivered', 174, 5),
('1995-05-01 16-27-09', 'Delivered', 176, 3),
('1995-09-13 21-14-26', 'Cancelled', 185, 1),
('1995-09-18 12-51-43', 'Delivered', 68, 7);

INSERT INTO invoice
(date_issued, id_customer, id_supplier, id_product, price_acquisition, quantity_ordered, value_invoice, id_order) VALUES
('1992-06-24 08-56-47', 4, 7, 28, 18, 12, 216, 4),
('1992-06-24 09-01-23', 4, 1, 23, 1.5, 6, 9, 4),
('1992-06-24 09-02-12', 4, 8, 26, 125, 1, 125, 4),
('1991-08-25 09-32-01', 6, 7, 24, 23, 13, 299, 1),
('1991-08-25 09-33-54', 6, 4, 12, 4.5, 7, 31.5, 1),
('1991-08-25 09-35-11', 6, 6, 14, 3, 20, 60, 1),
('1994-11-04 08-31-37', 5, 8, 2, 23, 4, 92, 7),
('1994-11-04 08-32-14', 5, 8, 16, 32, 1, 32, 7),
('1994-11-04 08-34-17', 5, 4, 20, 5, 10, 50, 7),
('1992-04-03 09-17-19', 2, 4, 17, 2.5, 2, 5, 2),
('1992-04-03 09-19-09', 2, 10, 4, 6.5, 1, 6.5, 2),
('1992-04-03 09-20-07', 2, 3, 9, 45, 2, 90, 2),
('1993-04-12 17-57-35', 8, 2, 21, 28, 1, 28, 5),
('1993-04-12 18-00-00', 8, 9, 1, 1.5, 3, 4.5, 5),
('1993-04-12 18-09-40', 8, 5, 19, 8, 6, 48, 5),
('1995-05-01 16-41-24', 3, 9, 8, 14, 1, 14, 8),
('1995-05-01 16-42-04', 3, 6, 18, 42, 1, 42, 8),
('1995-05-01 16-43-33', 3, 8, 15, 60, 2, 120, 8),
('1995-09-18 13-13-13', 7, 2, 27, 7, 4, 28, 10),
('1995-09-18 13-17-51', 7, 9, 30, 2, 13, 26, 10),
('1995-09-18 13-18-36', 7, 3, 25, 7, 2, 14, 10),
('1992-05-25 13-47-27', 10, 5, 22, 9, 7, 63, 3),
('1992-05-25 13-50-59', 10, 4, 11, 2.5, 16, 40, 3),
('1992-05-25 13-52-49', 10, 4, 10, 3.5, 27, 94.5, 3),
('1993-11-05 12-33-44', 9, 6, 7, 9.5, 4, 38, 6),
('1993-11-05 12-34-34', 9, 6, 6, 9, 4, 36, 6),
('1993-11-05 12-37-43', 9, 4, 3, 25, 1, 25, 6),
('1995-09-13 21-37-56', 1, 10, 29, 14, 1, 14, 9),
('1995-09-13 21-39-06', 1, 1, 13, 1.5, 30, 45, 9),
('1995-09-13 21-40-00', 1, 1, 5, 14, 9, 126, 9);

/* 4. Execute 2 updates of certain records on two different tables. */ 

UPDATE product SET price_current = price_current + (10 / 100 * price_current) WHERE id_category = 9; /* increase the price of products in a certain category by 10%. */

UPDATE supplier SET city_supplier= 'Reghiu' WHERE city_supplier = 'Valea Milcovului'; /* change the address of a supplier. */

/* 5. Implement 2 instructions of record deletion on two different tables.*/ 

DELETE FROM invoice WHERE id_customer = 1; /* delete an invoice. */

DELETE FROM orders WHERE id_customer = 1; /* delete an order. */

/* 6. Implement 5 simple queries. */ 

SELECT name_product, id_category FROM product WHERE id_category = 2; /* show the products from a certain category. */

SELECT last_name, first_name, city_customer FROM customer WHERE city_customer = 'Belgrade'; /* show the clients from a certain city. */

SELECT name_product, price_current FROM product ORDER BY price_current DESC LIMIT 1; /* show the most expensive product. */

SELECT name_product, price_current*quantity_available AS value_stock FROM product GROUP BY name_product ORDER BY value_stock; /* show the stock value of each products. */

SELECT id_invoice, date_issued FROM invoice WHERE date_issued BETWEEN '1994-11-04' AND '1995-09-18'; /* show the invoices from a certain period of time. */

/* 7. Implement 5 queries using MySQL operators and functions. */ 

SELECT CONCAT_WS(' ',first_name,last_name) as name_customer FROM customer; /* concatenate some fields of the character type. */

SELECT AVG(price_current*quantity_available) AS average_products, id_category FROM product WHERE id_category = 4; /* calculate the average price of products from a certain category. */

SELECT id_invoice, ROUND(value_invoice) AS value_invoice_rounded FROM invoice WHERE id_invoice = 5; /* show the rounded value of an invoice. */

SELECT city_customer, COUNT(id_customer) AS number_customeri FROM customer WHERE city_customer = 'Belgrade'; /* show the number of clients from Belgrade. */

SELECT id_invoice, MONTHNAME(date_issued) as month_issued FROM invoice WHERE MONTH(date_issued) = 5; /* show the invoices from a certain month. */

/* 8. Implement 5 complex queries using joins and unions. */ 

SELECT a.last_name, a.first_name, a.city_customer, b.id_invoice, b.date_issued FROM customer a JOIN invoice b USING (id_customer) WHERE YEAR(b.date_issued) BETWEEN '1991' AND '1992'; /* display customer names and addresses as well as invoices issued to them over a certain period of time. */

SELECT a.last_name, a.first_name FROM customer a LEFT JOIN orders b ON a.id_customer=b.id_customer WHERE b.id_customer IS NULL; /* show the clients without orders. */
 
SELECT a.name_category, b.name_product FROM category a, product b WHERE a.id_category=b.id_category AND name_category = 'Sweets'; /* show the name of the category and the name of the products from that category. */

SELECT a.first_name, a.last_name FROM customer a JOIN invoice b ON a.id_customer=b.id_customer JOIN product c ON b.id_product=c.id_product JOIN category d ON c.id_category=d.id_category WHERE d.name_category = 'Alcohol'; /* show the clients which ordered products from a certain category. */

SELECT a.name_category, SUM(b.quantity_available) AS number_products FROM category a JOIN product b USING (id_category) GROUP BY a.name_category; /* the number of products from each category. */

/* 9. Implement 3 subqueries. */ 

SELECT last_name, first_name FROM customer WHERE LENGTH(last_name) = (SELECT MIN(LENGTH(last_name)) FROM customer); /* show the customer with the shortest name. */

SELECT name_supplier, id_supplier FROM supplier WHERE id_supplier IN (SELECT id_supplier FROM invoice WHERE YEAR(date_issued) = '1993' AND id_customer IN (SELECT id_customer FROM orders WHERE STATUS != 'Cancelled')); /* show the suppliers of the products ordered in certain year. */

SELECT name_product, price_current FROM product WHERE id_product IN (SELECT id_product FROM invoice WHERE id_order IN (SELECT id_order FROM orders WHERE STATUS = 'Delivered')) ORDER BY price_current DESC; /* show the products ordered in a descending order of price.  */

/* 10. Implement 3 views. */ 

CREATE VIEW customers_Belgrade AS SELECT last_name, first_name, city_customer FROM customer WHERE city_customer = 'Belgrade'; /* view with all the customers from Belgrade. */

CREATE VIEW last_invoices AS SELECT id_invoice, date_issued FROM invoice ORDER BY date_issued DESC LIMIT 5; /* view with the last five invoices issued. */

CREATE VIEW last_products AS SELECT id_product, name_product FROM product ORDER BY id_product DESC LIMIT 3; /* view with the last three products added. */

/* 11. Insert data into a view. Modify and delete data in a table on which you have implemented a view. Display the data in the view. */ 

INSERT INTO customers_Belgrade VALUES ('Vucic', 'Aleksandar', 'Belgrade');

UPDATE customer SET phone_customer = 987654321 WHERE name = 'Vucic'; 

DELETE FROM customer WHERE name = 'Vucic';

/* 12. Create two indexes and one complex index on indexable columns. */ 

CREATE INDEX index_invoice ON invoice (date_issued); 

CREATE INDEX index_order ON orders (date_order);

CREATE UNIQUE INDEX index_product ON product (name_product);
