# Day 5 — SQL: Top Category per City

## What I practiced
- “Top N per group” pattern again, but for **category** instead of **customer**
- Steps:
  1) aggregate revenue by (city, category)
  2) rank categories within each city using `ROW_NUMBER()`
  3) keep `rn = 1`

## Results
- London: **Tech — 199.0**
- Oxford: **Food — 26.5**
- Bristol: **Food — 12.5**

## Key takeaway
Top-per-group queries are reusable: I can swap the grouped entity (customer → category) while keeping the same structure.
