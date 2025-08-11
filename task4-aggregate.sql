USE data;               


-- Createing the tables
CREATE TABLE sales (
  id INTEGER PRIMARY KEY,
  region TEXT,
  product TEXT,
  qty INTEGER,
  price REAL,
  sale_date DATE
);

-- Insert sample rows
INSERT INTO sales (id, region, product, qty, price, sale_date) VALUES
(1, 'North', 'Tea', 10, 20.0, '2025-07-01'),
(2, 'South', 'Coffee', 5, 50.0, '2025-07-02'),
(3, 'North', 'Tea', 7, 20.0, '2025-07-03'),
(4, 'East',  'Sugar', 20, 30.0, '2025-07-03'),
(5, 'South', 'Tea', 3, 20.0, '2025-07-04');

SELECT * FROM sales;

-- Total revenue (sum of qty * price)
SELECT SUM(qty * price) AS total_revenue FROM sales;

SELECT product, SUM(qty) AS total_qty, SUM(qty * price) AS revenue
FROM sales
GROUP BY product
ORDER BY revenue DESC;


-- Count total orders
SELECT COUNT(*) AS total_orders FROM sales;

-- Count distinct products
SELECT COUNT(DISTINCT product) AS distinct_products FROM sales;

SELECT product,
       AVG(price) AS avg_price,
       MIN(price) AS min_price,
       MAX(price) AS max_price
FROM sales
GROUP BY product;

-- Only show products with revenue > 1000
SELECT product, SUM(qty * price) AS revenue
FROM sales
GROUP BY product
HAVING SUM(qty * price) > 1000
ORDER BY revenue DESC;

-- Revenue by region and product
SELECT region, product, SUM(qty * price) AS revenue
FROM sales
GROUP BY region, product
ORDER BY region, revenue DESC;

-- SQLite: revenue per month (YYYY-MM)
SELECT strftime('%Y-%m', sale_date) AS month, SUM(qty * price) AS month_revenue
FROM sales
GROUP BY month
ORDER BY month;

-- MySQL equivalent:
-- SELECT DATE_FORMAT(sale_date, '%Y-%m') AS month, SUM(qty*price) AS month_revenue
-- FROM sales
-- GROUP BY month
-- ORDER BY month;

SELECT product, SUM(qty * price) AS revenue
FROM sales
GROUP BY product
ORDER BY revenue DESC;  -- highest revenue first



