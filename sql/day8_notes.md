# Day 8 — SQL: Realistic Rolling Metrics (Fill Missing Dates)

## Why this is more realistic
In real data, some dates have **no transactions**. If we compute rolling metrics only from existing rows, the window can “skip days” and produce misleading trends.

## Approach
1) Aggregate transactions into daily totals (`daily`)
2) Find the date range (`bounds`)
3) Generate a continuous calendar (recursive CTE `calendar`)
4) LEFT JOIN calendar to daily totals and fill missing days with 0 (`COALESCE`)
5) Compute rolling metrics on the continuous time series

## What I tested
- I removed order_id 12 (2026-01-31, amount 22.0) to simulate a missing day.
- The output still includes 2026-01-31 with `daily_sales = 0`.

## Results (2-day rolling window)
- 2026-01-30: daily 65.5 | rolling sum 65.5 | rolling avg 65.5
- 2026-01-31: daily 0.0  | rolling sum 65.5 | rolling avg 32.75
- 2026-02-01: daily 67.5 | rolling sum 67.5 | rolling avg 33.75
- 2026-02-02: daily 207.5| rolling sum 275.0| rolling avg 137.5

## Key takeaway
For rolling metrics, **build a complete date series first**, then calculate windows on top of it.
