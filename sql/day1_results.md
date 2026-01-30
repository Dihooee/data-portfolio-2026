**Schema (SQLite v3.46)**

    CREATE TABLE sales (
      order_id INTEGER,
      order_date TEXT,
      customer TEXT,
      amount REAL
    );

---

**Query #1**

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

There are no results to be displayed.

---
**Query #2**

    
    
    -- =========================
    -- Queries (practice)
    -- =========================
    
    -- Q1: View all rows
    SELECT * FROM sales;

| order_id | order_date | customer | amount |
| -------- | ---------- | -------- | ------ |
| 9        | 2026-01-30 | Jennifer | 12     |
| 10       | 2026-01-30 | Sam      | 35.5   |
| 11       | 2026-01-30 | Alan     | 18     |
| 12       | 2026-01-31 | Sam      | 22     |
| 13       | 2026-02-01 | Cathy    | 55     |
| 14       | 2026-02-01 | Vicky    | 12.5   |
| 15       | 2026-02-02 | Cathy    | 199    |
| 16       | 2026-02-02 | Alan     | 8.5    |

---
**Query #3**

    
    
    -- Q2: Only show some columns
    SELECT order_date, customer, amount
    FROM sales;

| order_date | customer | amount |
| ---------- | -------- | ------ |
| 2026-01-30 | Jennifer | 12     |
| 2026-01-30 | Sam      | 35.5   |
| 2026-01-30 | Alan     | 18     |
| 2026-01-31 | Sam      | 22     |
| 2026-02-01 | Cathy    | 55     |
| 2026-02-01 | Vicky    | 12.5   |
| 2026-02-02 | Cathy    | 199    |
| 2026-02-02 | Alan     | 8.5    |

---
**Query #4**

    
    
    -- Q3: Orders over 50
    SELECT *
    FROM sales
    WHERE amount > 50;

| order_id | order_date | customer | amount |
| -------- | ---------- | -------- | ------ |
| 13       | 2026-02-01 | Cathy    | 55     |
| 15       | 2026-02-02 | Cathy    | 199    |

---
**Query #5**

    
    
    -- Q4: Sort by amount (high to low)
    SELECT *
    FROM sales
    ORDER BY amount DESC;

| order_id | order_date | customer | amount |
| -------- | ---------- | -------- | ------ |
| 15       | 2026-02-02 | Cathy    | 199    |
| 13       | 2026-02-01 | Cathy    | 55     |
| 10       | 2026-01-30 | Sam      | 35.5   |
| 12       | 2026-01-31 | Sam      | 22     |
| 11       | 2026-01-30 | Alan     | 18     |
| 14       | 2026-02-01 | Vicky    | 12.5   |
| 9        | 2026-01-30 | Jennifer | 12     |
| 16       | 2026-02-02 | Alan     | 8.5    |

---
**Query #6**

    
    
    -- Q5: Top 3 orders
    SELECT *
    FROM sales
    ORDER BY amount DESC
    LIMIT 3;

| order_id | order_date | customer | amount |
| -------- | ---------- | -------- | ------ |
| 15       | 2026-02-02 | Cathy    | 199    |
| 13       | 2026-02-01 | Cathy    | 55     |
| 10       | 2026-01-30 | Sam      | 35.5   |

---
**Query #7**

    
    
    -- Q6: Total spent by each customer
    SELECT customer, SUM(amount) AS total_spent
    FROM sales
    GROUP BY customer
    ORDER BY total_spent DESC;

| customer | total_spent |
| -------- | ----------- |
| Cathy    | 254         |
| Sam      | 57.5        |
| Alan     | 26.5        |
| Vicky    | 12.5        |
| Jennifer | 12          |

---
**Query #8**

    
    
    -- Q7: Daily sales total
    SELECT order_date, SUM(amount) AS daily_sales
    FROM sales
    GROUP BY order_date
    ORDER BY order_date;

| order_date | daily_sales |
| ---------- | ----------- |
| 2026-01-30 | 65.5        |
| 2026-01-31 | 22          |
| 2026-02-01 | 67.5        |
| 2026-02-02 | 207.5       |

---
**Query #9**

    
    
    -- Q8: Count how many orders each customer made
    SELECT customer, COUNT(*) AS order_count
    FROM sales
    GROUP BY customer
    ORDER BY order_count DESC;

| customer | order_count |
| -------- | ----------- |
| Sam      | 2           |
| Cathy    | 2           |
| Alan     | 2           |
| Vicky    | 1           |
| Jennifer | 1           |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/hdHg58fWRbufH1w8dgjKgu/0)
