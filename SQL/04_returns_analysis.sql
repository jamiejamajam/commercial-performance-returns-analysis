-- =====================================================
-- 04_returns_analysis.sql
-- Project: Commercial Performance & Returns Analysis
-- Purpose: Analyse product return performance and financial impact
-- =====================================================

-- =====================================================
-- SECTION 1: RETURN RATE OVERVIEW
-- =====================================================

-- 1. Overall return rate
SELECT
    COUNT(DISTINCT r."Order ID") AS returned_orders,
    COUNT(DISTINCT o."Order ID") AS total_orders,
    ROUND(
        COUNT(DISTINCT r."Order ID") * 100.0 /
        COUNT(DISTINCT o."Order ID"), 2
    ) AS return_rate_percent
FROM orders o
LEFT JOIN returns r
ON o."Order ID" = r."Order ID";

-- 2. Return rate by category
SELECT
    o.Category,
    COUNT(DISTINCT r."Order ID") AS returned_orders,
    COUNT(DISTINCT o."Order ID") AS total_orders,
    ROUND(
        COUNT(DISTINCT r."Order ID") * 100.0 /
        COUNT(DISTINCT o."Order ID"), 2
    ) AS return_rate_percent
FROM orders o
LEFT JOIN returns r
ON o."Order ID" = r."Order ID"
GROUP BY o.Category
ORDER BY return_rate_percent DESC;

-- 3. Return rate by sub-category
SELECT
    o."Sub-Category",
    COUNT(DISTINCT r."Order ID") AS returned_orders,
    COUNT(DISTINCT o."Order ID") AS total_orders,
    ROUND(
        COUNT(DISTINCT r."Order ID") * 100.0 /
        COUNT(DISTINCT o."Order ID"), 2
    ) AS return_rate_percent
FROM orders o
LEFT JOIN returns r
ON o."Order ID" = r."Order ID"
GROUP BY o."Sub-Category"
ORDER BY return_rate_percent DESC;

-- 4. Return rate by market
SELECT
    o.Market,
    COUNT(DISTINCT r."Order ID") AS returned_orders,
    COUNT(DISTINCT o."Order ID") AS total_orders,
    ROUND(
        COUNT(DISTINCT r."Order ID") * 100.0 /
        COUNT(DISTINCT o."Order ID"), 2
    ) AS return_rate_percent
FROM orders o
LEFT JOIN returns r
ON o."Order ID" = r."Order ID"
GROUP BY o.Market
ORDER BY return_rate_percent DESC;

-- 5. Return rate by customer segment
SELECT
    o.Segment,
    COUNT(DISTINCT r."Order ID") AS returned_orders,
    COUNT(DISTINCT o."Order ID") AS total_orders,
    ROUND(
        COUNT(DISTINCT r."Order ID") * 100.0 /
        COUNT(DISTINCT o."Order ID"), 2
    ) AS return_rate_percent
FROM orders o
LEFT JOIN returns r
ON o."Order ID" = r."Order ID"
GROUP BY o.Segment
ORDER BY return_rate_percent DESC;

