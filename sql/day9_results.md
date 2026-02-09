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
    -- Day 9 — Running total per customer
    -- =========================
    
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

There are no results to be displayed.

---
**Query #2**

    
    
    -- Q1: Daily spend per customer (one row per customer per day)
    WITH customer_daily AS (
      SELECT
        customer,
        order_date,
        SUM(amount) AS daily_spend
      FROM sales
      GROUP BY customer, order_date
    )
    SELECT
      customer,
      order_date,
      daily_spend,
      SUM(daily_spend) OVER (
        PARTITION BY customer
        ORDER BY order_date
        ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
      ) AS running_total
    FROM customer_daily
    ORDER BY customer, order_date;

| customer | order_date | daily_spend | running_total |
| -------- | ---------- | ----------- | ------------- |
| Alan     | 2026-01-30 | 18          | 18            |
| Alan     | 2026-02-02 | 8.5         | 26.5          |
| Cathy    | 2026-02-01 | 55          | 55            |
| Cathy    | 2026-02-02 | 199         | 254           |
| Jennifer | 2026-01-30 | 12          | 12            |
| Sam      | 2026-01-30 | 35.5        | 35.5          |
| Sam      | 2026-01-31 | 22          | 57.5          |
| Vicky    | 2026-02-01 | 12.5        | 12.5          |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/hdHg58fWRbufH1w8dgjKgu/0)
