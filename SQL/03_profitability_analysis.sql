-- =====================================================
-- SECTION 3: PROFITABILITY ANALYSIS
-- Purpose: Identify the most and least profitable areas
-- =====================================================

-- 1. Profit margin by category
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin_percent
FROM orders
GROUP BY Category
ORDER BY profit_margin_percent DESC;

-- 2. Profit margin by sub-category
SELECT
    "Sub-Category",
    ROUND(SUM(Sales), 2) AS total_sales,
    ROUND(SUM(Profit), 2) AS total_profit,
    ROUND((SUM(Profit) / SUM(Sales)) * 100, 2) AS profit_margin_percent
FROM orders
GROUP BY "Sub-Category"
ORDER BY profit_margin_percent DESC;

-- 3. Most profitable countries
SELECT
    Country,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Country
ORDER BY total_profit DESC
LIMIT 10;

-- 4. Least profitable countries
SELECT
    Country,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Country
ORDER BY total_profit ASC
LIMIT 10;

-- 5. Profit by market
SELECT
    Market,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Market
ORDER BY total_profit DESC;

-- 6. Profit by region
SELECT
    Region,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Region
ORDER BY total_profit DESC;