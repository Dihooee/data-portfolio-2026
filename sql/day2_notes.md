# Day 2 — SQL: Adding a Category Dimension

## What changed
- Added a new column: `category`
- Re-inserted sample data with categories (Beauty / Food / Tech)

## New business questions answered
1) Which category generates the most revenue?
2) How many orders does each category have, and what is the average order value?
3) For each customer, how much do they spend in each category?

## Quick findings (based on Q2–Q4)
- Top category by revenue: **Tech = 199.0** (driven by a single large order). (Q2)
- Cathy’s biggest spend is in: **Tech = 199.0**. (Q4)
- Interpretation: category-level results can be heavily influenced by outliers (one large transaction).

## Key takeaway
Adding a dimension (category) makes the analysis closer to real business reporting.
