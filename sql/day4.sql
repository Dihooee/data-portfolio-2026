-- =========================
-- Day 4 — Top customer per city (CTE + window function)
-- =========================

-- Schema
CREATE TABLE customers (
  customer TEXT,
  city TEXT,
  tier TEXT
);

CREATE TABLE sales (
  order_id INTEGER,
  order_date TEXT,
  customer TEXT,
  category TEXT,
  amount REAL
);

-- Data
INSERT INTO customers (customer, city, tier) VALUES
('Jennifer', 'London',  'Standard'),
('Sam',      'London',  'VIP'),
('Alan',     'Oxford',  'Standard'),
('Cathy',    'London',  'VIP'),
('Vicky',    'Bristol', 'Standard');

INSERT INTO sales (order_id, order_date, customer, category, amount) VALUES
(9,  '2026-01-30', 'Jennifer', 'Food',   12.0),
(10, '2026-01-30', 'Sam',      'Beauty', 35.5),
(11, '2026-01-30', 'Alan',     'Food',   18.0),
(12, '2026-01-31', 'Sam',      'Food',   22.0),
(13, '2026-02-01', 'Cathy',    'Beauty', 55.0),
(14, '2026-02-01', 'Vicky',    'Food',   12.5),
(15, '2026-02-02', 'Cathy',    'Tech',   199.0),
(16, '2026-02-02', 'Alan',     'Food',   8.5);

-- Q1: Top customer per city
WITH spend_by_customer_city AS (
  SELECT
    c.city,
    s.customer,
    SUM(s.amount) AS total_spent
  FROM sales s
  JOIN customers c
    ON s.customer = c.customer
  GROUP BY c.city, s.customer
),
ranked AS (
  SELECT
    city,
    customer,
    total_spent,
    ROW_NUMBER() OVER (PARTITION BY city ORDER BY total_spent DESC) AS rn
  FROM spend_by_customer_city
)
SELECT city, customer, total_spent
FROM ranked
WHERE rn = 1
ORDER BY total_spent DESC;
