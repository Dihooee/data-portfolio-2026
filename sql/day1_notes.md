# Day 1 — SQL Practice Notes

## What I did
- Created a simple `sales` table (order_id, order_date, customer, amount)
- Inserted 8 sample rows
- Wrote multiple queries to explore, filter, sort, and aggregate the data

## Key SQL patterns learned
- `SELECT` chooses columns (`*` = all columns)
- `WHERE` filters rows by conditions
- `ORDER BY` sorts results
- `LIMIT` returns top N rows
- `GROUP BY` + `SUM()` aggregates totals by group
- `COUNT(*)` counts rows

## Quick findings (based on Q3–Q8)

- High-value orders (> 50): **2 orders** — Cathy (55.0) and Cathy (199.0).  (Q3)
- Top 3 orders by amount: **199.0 (Cathy)**, **55.0 (Cathy)**, **35.5 (Sam)**.  (Q5)
- Top customer by total spending: **Cathy = 254.0**. (Q6)
- Daily sales totals:
  - 2026-01-30: **65.5**
  - 2026-01-31: **22.0**
  - 2026-02-01: **67.5**
  - 2026-02-02: **207.5**  (Q7)
- Orders per customer: Sam **2**, Alan **2**, Cathy **2**, Vicky **1**, Jennifer **1**.  (Q8)
