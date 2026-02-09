**Schema (SQLite v3.46)**

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

---

**Query #1**

    -- =========================
    -- Day 6 — Tier x Category sales breakdown
    -- =========================
    
    -- Data
    INSERT INTO customers (customer, city, tier) VALUES
    ('Jennifer', 'London',  'Standard'),
    ('Sam',      'London',  'VIP'),
    ('Alan',     'Oxford',  'Standard'),
    ('Cathy',    'London',  'VIP'),
    ('Vicky',    'Bristol', 'Standard');

There are no results to be displayed.

---
**Query #2**

    
    
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
**Query #3**

    
    
    -- Q1: Tier × Category revenue (long format)
    SELECT
      c.tier,
      s.category,
      SUM(s.amount) AS total_sales
    FROM sales s
    JOIN customers c
      ON s.customer = c.customer
    GROUP BY c.tier, s.category
    ORDER BY c.tier, total_sales DESC;

| tier     | category | total_sales |
| -------- | -------- | ----------- |
| Standard | Food     | 51          |
| VIP      | Tech     | 199         |
| VIP      | Beauty   | 90.5        |
| VIP      | Food     | 22          |

---
**Query #4**

    
    
    -- Q2: Tier totals (sanity check)
    SELECT
      c.tier,
      SUM(s.amount) AS tier_sales
    FROM sales s
    JOIN customers c
      ON s.customer = c.customer
    GROUP BY c.tier
    ORDER BY tier_sales DESC;

| tier     | tier_sales |
| -------- | ---------- |
| VIP      | 311.5      |
| Standard | 51         |

---

[View on DB Fiddle](https://www.db-fiddle.com/f/hdHg58fWRbufH1w8dgjKgu/0)
