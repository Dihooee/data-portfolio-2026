# Day 9 — SQL: Running Total (Customer Spend Over Time)

## What I practiced
- Convert transactions into a per-customer daily time series
- Compute a cumulative (running) total using a window function

## Query structure
1) `GROUP BY customer, order_date` → one row per customer per day (`daily_spend`)
2) `SUM(daily_spend) OVER (PARTITION BY customer ORDER BY order_date ...)`
   - `PARTITION BY customer`: each customer has their own running total
   - `ORDER BY order_date`: accumulate over time
   - `UNBOUNDED PRECEDING`: start from the first day and keep accumulating

## Observations from results
- Cathy has 2 rows (two purchase days): 55.0 → 254.0
- Sam has 2 rows: 35.5 → 57.5
- Customers with only one purchase day appear once (Jennifer, Vicky)
