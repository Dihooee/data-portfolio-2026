# Day 6 — SQL: Tier × Category Breakdown

## What I practiced
- A common reporting pattern: break down revenue by **two dimensions**
  - customer segment (`tier`)
  - product type (`category`)
- This requires:
  - `JOIN` (tier is in `customers`)
  - `GROUP BY tier, category`
  - `SUM(amount)` for revenue

## Key results
### VIP breakdown
- Tech: **199.0**
- Beauty: **90.5**
- Food: **22.0**

### Totals (sanity check)
- VIP total: **311.5**
- Standard total: **51.0**

## Key takeaway
Using a “detail table” (tier × category) plus a “total table” is a reliable way to validate aggregation logic.
