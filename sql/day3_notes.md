# Day 3 — SQL: JOIN (customers + sales)

## What I learned
- Real-world data is often split across tables (e.g., `sales` vs `customers`)
- `JOIN ... ON ...` combines rows from two tables by matching a key (here: `customer`)

## Business questions answered
1) Attach customer attributes (city, tier) to each order
2) Total sales by city
3) Total sales by customer tier (VIP vs Standard)

## Quick findings (based on Q2–Q3)
- Highest city sales: **London = 323.5** (Q2)
- Tier sales: **VIP = 311.5**, **Standard = 51.0** (Q3)

## Key takeaway
JOIN lets me analyse sales using customer attributes that are stored in a separate table.
