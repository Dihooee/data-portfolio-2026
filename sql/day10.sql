-- =========================
-- Day 10 — Customer profile: repeat purchase + recency
-- =========================

-- Schema
CREATE TABLE sales (
  order_id INTEGER,
  order_date TEXT,
  customer TEXT,
  category TEXT,
  amount REAL
);

-- Data (full set)
INSERT INTO sales (order_id, order_date, customer, category, amount) VALUES
(9,  '2026-01-30', 'Jennifer', 'Food',   12.0),
(10, '2026-01-30', 'Sam',      'Beauty', 35.5),
(11, '2026-01-30', 'Alan',     'Food',   18.0),
(12, '2026-01-31', 'Sam',      'Food',   22.0),
(13, '2026-02-01', 'Cathy',    'Beauty', 55.0),
(14, '2026-02-01', 'Vicky',    'Food',   12.5),
(15, '2026-02-02', 'Cathy',    'Tech',   199.0),
(16, '2026-02-02', 'Alan',     'Food',   8.5);

-- Q1: Customer profile table
SELECT
  customer,
  COUNT(DISTINCT order_date) AS active_days,
  SUM(amount) AS total_spent,
  MAX(order_date) AS last_purchase_date,
  CASE
    WHEN COUNT(DISTINCT order_date) >= 2 THEN 1
    ELSE 0
  END AS is_repeat_customer
FROM sales
GROUP BY customer
ORDER BY total_spent DESC;
