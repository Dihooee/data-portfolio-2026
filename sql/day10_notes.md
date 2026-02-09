# Day 10 — SQL: Customer Profile (Repeat Purchase + Recency)

## What I built
A one-row-per-customer summary table that answers:
- How active is each customer? (`active_days`)
- How valuable are they? (`total_spent`)
- How recent is their activity? (`last_purchase_date`)
- Are they a repeat customer? (`is_repeat_customer`)

## Key SQL patterns
- `COUNT(DISTINCT order_date)` → number of purchase days (repeat vs one-off)
- `SUM(amount)` → total value
- `MAX(order_date)` → recency / last seen date
- `CASE WHEN ... THEN ... ELSE ... END` → turn a condition into a label (0/1)

## Results (from this dataset)
- Repeat customers (active_days ≥ 2): **Cathy, Sam, Alan**
- Highest spender: **Cathy (254)**
- Most recent last_purchase_date: **2026-02-02** (Cathy, Alan)
