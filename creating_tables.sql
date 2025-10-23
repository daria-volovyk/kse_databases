DROP DATABASE if exists assigment2;
CREATE DATABASE assigment2;
use assigment2;

CREATE TABLE customers (
  customer_id   INT PRIMARY KEY,
  signup_date   DATE NOT NULL,
  region        ENUM('north','south','east','west','central') NOT NULL,
  vip_flag      INT
);

CREATE TABLE orders (
  order_id      INT PRIMARY KEY,
  customer_id   INT NOT NULL,
  order_date    DATETIME NOT NULL,
  status        ENUM('pending','shipped','delivered','canceled','returned') NOT NULL,
  total_amount  DECIMAL(10,2) NOT NULL
);

CREATE TABLE order_items (
  item_id       INT PRIMARY KEY,
  order_id      INT NOT NULL,
  product_sku   VARCHAR(16) NOT NULL,
  quantity      INT NOT NULL,
  unit_price    DECIMAL(10,2) NOT NULL
); 

SELECT * FROM customers LIMIT 20;
SELECT * FROM order_items LIMIT 20;
SELECT * FROM orders LIMIT 20;