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

    -- Insert customers (dimension table)
    INSERT INTO customers (customer, city, tier) VALUES
    ('Jennifer', 'London',  'Standard'),
    ('Sam',      'London',  'VIP'),
    ('Alan',     'Oxford',  'Standard'),
    ('Cathy',    'London',  'VIP'),
    ('Vicky',    'Bristol', 'Standard');

There are no results to be displayed.

---
**Query #2**

    
    
    -- Insert sales (fact table)
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

    
    
    -- Q1: Join every order with customer info
    SELECT
      s.order_id,
      s.order_date,
      s.customer,
      c.city,
      c.tier,
      s.category,
      s.amount
    FROM sales s
    JOIN customers c
      ON s.customer = c.customer
    ORDER BY s.order_id;

| order_id | order_date | customer | city    | tier     | category | amount |
| -------- | ---------- | -------- | ------- | -------- | -------- | ------ |
| 9        | 2026-01-30 | Jennifer | London  | Standard | Food     | 12     |
| 10       | 2026-01-30 | Sam      | London  | VIP      | Beauty   | 35.5   |
| 11       | 2026-01-30 | Alan     | Oxford  | Standard | Food     | 18     |
| 12       | 2026-01-31 | Sam      | London  | VIP      | Food     | 22     |
| 13       | 2026-02-01 | Cathy    | London  | VIP      | Beauty   | 55     |
| 14       | 2026-02-01 | Vicky    | Bristol | Standard | Food     | 12.5   |
| 15       | 2026-02-02 | Cathy    | London  | VIP      | Tech     | 199    |
| 16       | 2026-02-02 | Alan     | Oxford  | Standard | Food     | 8.5    |

---
**Query #4**

    
    
    -- Q2: Total sales by city
    SELECT c.city, SUM(s.amount) AS city_sales
    FROM sales s
    JOIN customers c
      ON s.customer = c.customer
    GROUP BY c.city
    ORDER BY city_sales DESC;

| city    | city_sales |
| ------- | ---------- |
| London  | 323.5      |
| Oxford  | 26.5       |
| Bristol | 12.5       |

---
**Query #5**

    
    
    -- Q3: Total sales by tier (VIP vs Standard)
    SELECT c.tier, SUM(s.amount) AS tier_sales
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
