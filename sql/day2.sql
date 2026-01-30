-- =========================
-- Day 2 — Adding a Category Dimension
-- =========================

-- Schema
CREATE TABLE sales (
  order_id INTEGER,
  order_date TEXT,
  customer TEXT,
  category TEXT,
  amount REAL
);

-- Data inserts
INSERT INTO sales (order_id, order_date, customer, category, amount) VALUES
(9,  '2026-01-30', 'Jennifer', 'Food',   12.0),
(10, '2026-01-30', 'Sam',      'Beauty', 35.5),
(11, '2026-01-30', 'Alan',     'Food',   18.0),
(12, '2026-01-31', 'Sam',      'Food',   22.0),
(13, '2026-02-01', 'Cathy',    'Beauty', 55.0),
(14, '2026-02-01', 'Vicky',    'Food',   12.5),
(15, '2026-02-02', 'Cathy',    'Tech',   199.0),
(16, '2026-02-02', 'Alan',     'Food',   8.5);

-- Queries
-- Q1: View all rows
SELECT * FROM sales;

-- Q2: Total sales by category
SELECT category, SUM(amount) AS total_sales
FROM sales
GROUP BY category
ORDER BY total_sales DESC;

-- Q3: Orders per category + average order value
SELECT category,
       COUNT(*) AS order_count,
       ROUND(AVG(amount), 2) AS avg_order_value
FROM sales
GROUP BY category
ORDER BY order_count DESC;

-- Q4: Customer spending by category
SELECT customer, category, SUM(amount) AS total_spent
FROM sales
GROUP BY customer, category
ORDER BY customer, total_spent DESC;
