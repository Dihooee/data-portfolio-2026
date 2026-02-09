# Day 11 — Customer Insights Report (SQL Portfolio)

## Dataset
A small demo dataset I created to practice SQL reporting (orders with date, customer, category, amount).

## Business questions
1) Who are the most valuable customers?
2) Who are repeat customers vs one-time customers?
3) What drives revenue by tier, city, and category?
4) Are there spikes in daily sales, and how do rolling metrics behave?

## Key findings (from SQL)
- **Top spender:** Cathy (£254 total). A single **Tech** purchase (£199) on **2026-02-02** drives the spike.
- **Repeat customers (active_days ≥ 2):** Cathy, Sam, Alan.
- **One-time customers:** Jennifer, Vicky.
- **VIP vs Standard revenue:** VIP (£311.5) vs Standard (£51.0).
- **Daily sales spike:** 2026-02-02 daily_sales = £207.5, which pushes rolling averages up sharply.
- **By city (top category):** London = Tech (£199), Oxford = Food (£26.5), Bristol = Food (£12.5).

## Evidence (links to queries + results)
- **Customer profile (repeat + recency):** [SQL](../sql/day10.sql) · [Results](../sql/day10_results.md)
- **Running totals per customer:** [SQL](../sql/day9.sql) · [Results](../sql/day9_results.md)
- **Rolling metrics (baseline):** [SQL](../sql/day7.sql) · [Results](../sql/day7_results.md)
- **Rolling metrics with missing dates filled:** [SQL](../sql/day8.sql) · [Results](../sql/day8_results.md)
- **City/category insight:** [SQL](../sql/day5.sql) · [Results](../sql/day5_results.md)
- **Tier × category breakdown:** [SQL](../sql/day6.sql) · [Results](../sql/day6_results.md)

## What I would do next
- Scale up the dataset (more customers + longer time range) and compute **7-day rolling averages**.
- Add retention-style metrics: time since last purchase, active weeks, and repeat rate over time.
- Add product-level detail to explain category spikes (which products drive Tech/Beauty revenue).
