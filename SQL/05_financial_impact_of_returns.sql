-- =====================================================
-- 05_financial_impact_of_returns.sql
-- Project: Commercial Performance & Returns Analysis
-- Purpose: Quantify the financial impact of product returns
-- =====================================================

-- =====================================================
-- SECTION 1: OVERALL FINANCIAL IMPACT
-- =====================================================

-- 1. Revenue associated with returned orders
SELECT
    ROUND(SUM(o.Sales),2) AS returned_sales
FROM orders o
INNER JOIN returns r
ON o."Order ID" = r."Order ID";

-- 2. Profit associated with returned orders
SELECT
    ROUND(SUM(o.Profit),2) AS returned_profit
FROM orders o
INNER JOIN returns r
ON o."Order ID" = r."Order ID";

-- 3. Returned sales by category
SELECT
    o.Category,
    ROUND(SUM(o.Sales),2) AS returned_sales
FROM orders o
INNER JOIN returns r
ON o."Order ID" = r."Order ID"
GROUP BY o.Category
ORDER BY returned_sales DESC;

-- 4. Returned profit by category
SELECT
    o.Category,
    ROUND(SUM(o.Profit),2) AS returned_profit
FROM orders o
INNER JOIN returns r
ON o."Order ID" = r."Order ID"
GROUP BY o.Category
ORDER BY returned_profit DESC;

-- 5. Returned sales by sub-category
SELECT
    o."Sub-Category",
    ROUND(SUM(o.Sales),2) AS returned_sales
FROM orders o
INNER JOIN returns r
ON o."Order ID" = r."Order ID"
GROUP BY o."Sub-Category"
ORDER BY returned_sales DESC;

-- 6. Returned profit by sub-category
SELECT
    o."Sub-Category",
    ROUND(SUM(o.Profit),2) AS returned_profit
FROM orders o
INNER JOIN returns r
ON o."Order ID" = r."Order ID"
GROUP BY o."Sub-Category"
ORDER BY returned_profit DESC;