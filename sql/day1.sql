-- =========================
-- Day 1: Basic SQL Workbook
-- =========================

-- Schema
CREATE TABLE sales (
  order_id INTEGER,
  order_date TEXT,
  customer TEXT,
  amount REAL
);

-- Data + Queries
-- =========================
-- Data inserts (sample rows)
-- =========================

INSERT INTO sales (order_id, order_date, customer, amount) VALUES
(9,  '2026-01-30', 'Jennifer', 12.0),
(10, '2026-01-30', 'Sam',    35.5),
(11, '2026-01-30', 'Alan',      18.0),
(12, '2026-01-31', 'Sam',    22.0),
(13, '2026-02-01', 'Cathy',     55.0),
(14, '2026-02-01', 'Vicky',      12.5),
(15, '2026-02-02', 'Cathy',     199.0),
(16, '2026-02-02', 'Alan',      8.5);

-- =========================
-- Queries (practice)
-- =========================

-- Q1: View all rows
SELECT * FROM sales;

-- Q2: Only show some columns
SELECT order_date, customer, amount
FROM sales;

-- Q3: Orders over 50
SELECT *
FROM sales
WHERE amount > 50;

-- Q4: Sort by amount (high to low)
SELECT *
FROM sales
ORDER BY amount DESC;

-- Q5: Top 3 orders
SELECT *
FROM sales
ORDER BY amount DESC
LIMIT 3;

-- Q6: Total spent by each customer
SELECT customer, SUM(amount) AS total_spent
FROM sales
GROUP BY customer
ORDER BY total_spent DESC;

-- Q7: Daily sales total
SELECT order_date, SUM(amount) AS daily_sales
FROM sales
GROUP BY order_date
ORDER BY order_date;

-- Q8: Count how many orders each customer made
SELECT customer, COUNT(*) AS order_count
FROM sales
GROUP BY customer
ORDER BY order_count DESC;
