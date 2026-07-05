-- =====================================================
-- 02_exploratory_analysis.sql
-- Project: Commercial Performance & Returns Analysis
-- Purpose: Calculate key commercial performance indicators
-- =====================================================

-- =====================================================
-- SECTION 1: EXECUTIVE KPI SUMMARY
-- Purpose: Calculate the core commercial performance metrics
-- =====================================================

-- 1. Calculate total sales revenue
SELECT
    ROUND(SUM(Sales), 2) AS total_sales
FROM orders;

-- 2. Calculate total profit
SELECT
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders;

-- 3. Calculate total quantity sold
SELECT
    SUM(Quantity) AS total_quantity_sold
FROM orders;

-- 4. Calculate total customer orders
SELECT
    COUNT(DISTINCT "Order ID") AS total_orders
FROM orders;

-- 5. Calculate average order value
SELECT
    ROUND(SUM(Sales) / COUNT(DISTINCT "Order ID"), 2) AS average_order_value
FROM orders;

-- 6. Calculate average profit per order
SELECT
    ROUND(SUM(Profit) / COUNT(DISTINCT "Order ID"), 2) AS average_profit_per_order
FROM orders;

-- 7. Calculate average discount
SELECT
    ROUND(AVG(Discount), 2) AS average_discount
FROM orders;

-- 8. Calculate average shipping cost
SELECT
    ROUND(AVG("Shipping Cost"), 2) AS average_shipping_cost
FROM orders;

-- =====================================================
-- SECTION 2: SALES PERFORMANCE ANALYSIS
-- Purpose: Understand where the business generates revenue and profit
-- =====================================================

-- 9. Calculate total sales by category
SELECT
    Category,
    ROUND(SUM(Sales), 2) AS total_sales
FROM orders
GROUP BY Category
ORDER BY total_sales DESC;

-- 10. Calculate total profit by category
SELECT
    Category,
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY Category
ORDER BY total_profit DESC;

-- 11. Calculate average discount by category
SELECT
    Category,
    ROUND(AVG(Discount), 2) AS average_discount
FROM orders
GROUP BY Category
ORDER BY average_discount DESC;

-- 12. Calculate average shipping cost by category
SELECT
    Category,
    ROUND(AVG("Shipping Cost"), 2) AS average_shipping_cost
FROM orders
GROUP BY Category
ORDER BY average_shipping_cost DESC;

-- 13. Calculate sales by sub-category
SELECT
    "Sub-Category",
    ROUND(SUM(Sales), 2) AS total_sales
FROM orders
GROUP BY "Sub-Category"
ORDER BY total_sales DESC;

-- 14. Calculate profit by sub-category
SELECT
    "Sub-Category",
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY "Sub-Category"
ORDER BY total_profit DESC;

-- 15. Top 10 products by sales
SELECT
    "Product Name",
    ROUND(SUM(Sales), 2) AS total_sales
FROM orders
GROUP BY "Product Name"
ORDER BY total_sales DESC
LIMIT 10;

-- 16. Top 10 products by profit
SELECT
    "Product Name",
    ROUND(SUM(Profit), 2) AS total_profit
FROM orders
GROUP BY "Product Name"
ORDER BY total_profit DESC
LIMIT 10;