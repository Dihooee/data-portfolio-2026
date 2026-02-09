-- =========================
-- Day 8 — Realistic rolling metrics
-- Fill missing dates with 0, then compute rolling window
-- =========================

-- Schema
CREATE TABLE sales (
  order_id INTEGER,
  order_date TEXT,
  customer TEXT,
  category TEXT,
  amount REAL
);

-- Data (note: order_id 12 removed to simulate a missing day: 2026-01-31)
INSERT INTO sales (order_id, order_date, customer, category, amount) VALUES
(9,  '2026-01-30', 'Jennifer', 'Food',   12.0),
(10, '2026-01-30', 'Sam',      'Beauty', 35.5),
(11, '2026-01-30', 'Alan',     'Food',   18.0),
-- (12, '2026-01-31', 'Sam',      'Food',   22.0), -- removed
(13, '2026-02-01', 'Cathy',    'Beauty', 55.0),
(14, '2026-02-01', 'Vicky',    'Food',   12.5),
(15, '2026-02-02', 'Cathy',    'Tech',   199.0),
(16, '2026-02-02', 'Alan',     'Food',   8.5);

-- Q1: Daily series with missing dates filled, then rolling metrics
WITH
daily AS (
  SELECT
    order_date,
    SUM(amount) AS daily_sales
  FROM sales
  GROUP BY order_date
),
bounds AS (
  SELECT
    MIN(order_date) AS start_date,
    MAX(order_date) AS end_date
  FROM daily
),
calendar AS (
  SELECT start_date AS date
  FROM bounds
  UNION ALL
  SELECT date(date, '+1 day')
  FROM calendar, bounds
  WHERE date < end_date
),
series AS (
  SELECT
    c.date AS order_date,
    COALESCE(d.daily_sales, 0) AS daily_sales
  FROM calendar c
  LEFT JOIN daily d
    ON d.order_date = c.date
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
FROM series
ORDER BY order_date;
