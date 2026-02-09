**Schema (SQLite v3.46)**

    CREATE TABLE sales (
      order_id INTEGER,
      order_date TEXT,
      customer TEXT,
      category TEXT,
      amount REAL
    );

---

**Query #1**

    -- =========================
    -- Day 8 — Realistic rolling metrics
    -- (fill missing dates with 0, then compute rolling window)
    -- =========================
    
    -- Data
    INSERT INTO sales (order_id, order_date, customer, category, amount) VALUES
    (9,  '2026-01-30', 'Jennifer', 'Food',   12.0),
    (10, '2026-01-30', 'Sam',      'Beauty', 35.5),
    (11, '2026-01-30', 'Alan',     'Food',   18.0),
    (13, '2026-02-01', 'Cathy',    'Beauty', 55.0),
    (14, '2026-02-01', 'Vicky',    'Food',   12.5),
    (15, '2026-02-02', 'Cathy',    'Tech',   199.0),
    (16, '2026-02-02', 'Alan',     'Food',   8.5);

There are no results to be displayed.

---
**Query #2**

    
    
    -- Q1: Realistic daily series + rolling metrics
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
      -- Recursive CTE: generate one row per day from start_date to end_date
      SELECT start_date AS date
      FROM bounds
      UNION ALL
      SELECT date(date, '+1 day')
      FROM calendar, bounds
      WHERE date < end_date
    ),
    series AS (
      -- Left join so missing days show up; COALESCE turns NULL into 0
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

| order_date | daily_sales | rolling_2day_sales | rolling_2day_avg |
| ---------- | ----------- | ------------------ | ---------------- |
| 2026-01-30 | 65.5        | 65.5               | 65.5             |
| 2026-01-31 | 0           | 65.5               | 32.75            |
| 2026-02-01 | 67.5        | 67.5               | 33.75            |
| 2026-02-02 | 207.5       | 275                | 137.5            |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/hdHg58fWRbufH1w8dgjKgu/0)
