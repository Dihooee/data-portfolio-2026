# Day 4 — SQL: Top Customer per City (Window Function)

## What I learned
- Some business questions require “top N within each group” (e.g., top customer in each city)
- A common pattern is:
  1) aggregate first (`GROUP BY city, customer`)
  2) rank within each group using a window function
  3) filter to keep only rank = 1

## Query pattern used
- CTEs (`WITH ...`) to break the logic into readable steps
- `ROW_NUMBER() OVER (PARTITION BY city ORDER BY total_spent DESC)` to rank customers inside each city

## Results
- London: **Cathy — 254.0**
- Oxford: **Alan — 26.5**
- Bristol: **Vicky — 12.5**

## Key takeaway
Window functions are a clean way to answer “top performer per group” questions.
