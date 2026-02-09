-- =========================
-- Day 7 — Rolling metrics (2-day window)
-- =========================

-- Schema
CREATE TABLE sales (
  order_id INTEGER,
  order_date TEXT,
  customer TEXT,
  category TEXT,
  amount REAL
);

-- Data
INSERT INTO sales (order_id, order_date, customer, category, amount) VALUES
(9,  '2026-01-30', 'Jennifer', 'Food',   12.0),
(10, '2026-01-30', 'Sam',      'Beauty', 35.5),
(11, '2026-01-30', 'Alan',     'Food',   18.0),
(12, '2026-01-31', 'Sam',      'Food',   22.0),
(13, '2026-02-01', 'Cathy',    'Beauty', 55.0),
(14, '2026-02-01', 'Vicky',    'Food',   12.5),
(15, '2026-02-02', 'Cathy',    'Tech',   199.0),
(16, '2026-02-02', 'Alan',     'Food',   8.5);

-- Q1: Daily sales totals + rolling window metrics
WITH daily AS (
  SELECT
    order_date,
    SUM(amount) AS daily_sales
  FROM sales
  GROUP BY order_date
)
SELECT
  order_date,
  daily_sales,
  SUM(daily_sales) OVER (
    ORDER BY order_date
    ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
  ) AS rolling_2day_sales,
  ROUND(AVG(daily_sales) OVER (
    ORDER BY order_date
    ROWS BETWEEN 1 PRECEDING AND CURRENT ROW
  ), 2) AS rolling_2day_avg
FROM daily
ORDER BY order_date;
