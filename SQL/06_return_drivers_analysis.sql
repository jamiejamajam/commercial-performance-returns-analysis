-- =====================================================
-- 06_return_drivers_analysis.sql
-- Project: Commercial Performance & Returns Analysis
-- Purpose: Identify commercial factors associated with product returns
-- =====================================================

-- =====================================================
-- SECTION 1: DISCOUNT ANALYSIS
-- =====================================================

-- 1. Average discount for returned vs non-returned orders
SELECT
    CASE
        WHEN r."Order ID" IS NOT NULL THEN 'Returned'
        ELSE 'Not Returned'
    END AS return_status,
    ROUND(AVG(o.Discount), 2) AS average_discount
FROM orders o
LEFT JOIN returns r
ON o."Order ID" = r."Order ID"
GROUP BY return_status;

-- =====================================================
-- SECTION 2: SALES VALUE ANALYSIS
-- =====================================================

-- 2. Average sales value for returned vs non-returned orders
SELECT
    CASE
        WHEN r."Order ID" IS NOT NULL THEN 'Returned'
        ELSE 'Not Returned'
    END AS return_status,
    ROUND(AVG(o.Sales), 2) AS average_sales
FROM orders o
LEFT JOIN returns r
ON o."Order ID" = r."Order ID"
GROUP BY return_status;

-- =====================================================
-- SECTION 3: PROFIT ANALYSIS
-- =====================================================

-- 3. Average profit for returned vs non-returned orders
SELECT
    CASE
        WHEN r."Order ID" IS NOT NULL THEN 'Returned'
        ELSE 'Not Returned'
    END AS return_status,
    ROUND(AVG(o.Profit), 2) AS average_profit
FROM orders o
LEFT JOIN returns r
ON o."Order ID" = r."Order ID"
GROUP BY return_status;

-- =====================================================
-- SECTION 4: SHIPPING COST ANALYSIS
-- =====================================================

-- 4. Average shipping cost for returned vs non-returned orders
SELECT
    CASE
        WHEN r."Order ID" IS NOT NULL THEN 'Returned'
        ELSE 'Not Returned'
    END AS return_status,
    ROUND(AVG(o."Shipping Cost"), 2) AS average_shipping_cost
FROM orders o
LEFT JOIN returns r
ON o."Order ID" = r."Order ID"
GROUP BY return_status;

-- =====================================================
-- SECTION 5: SHIPPING MODE
-- =====================================================

-- 5. Return rate by shipping mode
SELECT
    o."Ship Mode",
    COUNT(DISTINCT r."Order ID") AS returned_orders,
    COUNT(DISTINCT o."Order ID") AS total_orders,
    ROUND(
        COUNT(DISTINCT r."Order ID") * 100.0 /
        COUNT(DISTINCT o."Order ID"),
        2
    ) AS return_rate_percent
FROM orders o
LEFT JOIN returns r
ON o."Order ID" = r."Order ID"
GROUP BY o."Ship Mode"
ORDER BY return_rate_percent DESC;