# Day 7 — SQL: Rolling Metrics (Window Functions)

## What I practiced
- Turn raw transactions into a daily time series
- Use window functions to compute rolling (moving) metrics

## Query structure
1) `WITH daily AS (...)`
   - `GROUP BY order_date` to get one row per day
2) `OVER (ORDER BY order_date ...)`
   - treat days as an ordered sequence
3) `ROWS BETWEEN 1 PRECEDING AND CURRENT ROW`
   - rolling window = current day + previous day (2 days)

## Results (2-day window)
- 2026-01-30: daily 65.5 | rolling sum 65.5 | rolling avg 65.5
- 2026-01-31: daily 22.0 | rolling sum 87.5 | rolling avg 43.75
- 2026-02-01: daily 67.5 | rolling sum 89.5 | rolling avg 44.75
- 2026-02-02: daily 207.5 | rolling sum 275.0 | rolling avg 137.5

## Key takeaway
Rolling metrics help smooth trends, but one large transaction can still create spikes (e.g., the 207.5 day).
