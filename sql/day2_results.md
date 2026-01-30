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
    -- Day 2: add a category column
    -- =========================
    
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

There are no results to be displayed.

---
**Query #2**

    
    
    -- Q1: View all rows
    SELECT * FROM sales;

| order_id | order_date | customer | category | amount |
| -------- | ---------- | -------- | -------- | ------ |
| 9        | 2026-01-30 | Jennifer | Food     | 12     |
| 10       | 2026-01-30 | Sam      | Beauty   | 35.5   |
| 11       | 2026-01-30 | Alan     | Food     | 18     |
| 12       | 2026-01-31 | Sam      | Food     | 22     |
| 13       | 2026-02-01 | Cathy    | Beauty   | 55     |
| 14       | 2026-02-01 | Vicky    | Food     | 12.5   |
| 15       | 2026-02-02 | Cathy    | Tech     | 199    |
| 16       | 2026-02-02 | Alan     | Food     | 8.5    |

---
**Query #3**

    
    
    -- Q2: Total sales by category (which category earns the most?)
    SELECT category, SUM(amount) AS total_sales
    FROM sales
    GROUP BY category
    ORDER BY total_sales DESC;

| category | total_sales |
| -------- | ----------- |
| Tech     | 199         |
| Beauty   | 90.5        |
| Food     | 73          |

---
**Query #4**

    
    
    -- Q3: Orders per category + average order value
    SELECT category,
           COUNT(*) AS order_count,
           ROUND(AVG(amount), 2) AS avg_order_value
    FROM sales
    GROUP BY category
    ORDER BY order_count DESC;

| category | order_count | avg_order_value |
| -------- | ----------- | --------------- |
| Food     | 5           | 14.6            |
| Beauty   | 2           | 45.25           |
| Tech     | 1           | 199             |

---
**Query #5**

    
    
    -- Q4: Customer spending by category
    SELECT customer, category, SUM(amount) AS total_spent
    FROM sales
    GROUP BY customer, category
    ORDER BY customer, total_spent DESC;

| customer | category | total_spent |
| -------- | -------- | ----------- |
| Alan     | Food     | 26.5        |
| Cathy    | Tech     | 199         |
| Cathy    | Beauty   | 55          |
| Jennifer | Food     | 12          |
| Sam      | Beauty   | 35.5        |
| Sam      | Food     | 22          |
| Vicky    | Food     | 12.5        |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/hdHg58fWRbufH1w8dgjKgu/0)
