-- =====================================================
-- 01_database_validation.sql
-- Project: Commercial Performance & Returns Analysis
-- Purpose: Validate that all source tables imported correctly
-- =====================================================

-- =====================================================
-- SECTION 1: IMPORT VALIDATION
-- =====================================================

-- 1. Check row count for orders table
SELECT COUNT(*) AS total_order_rows
FROM orders;

-- 2. Check row count for returns table
SELECT COUNT(*) AS total_return_rows
FROM returns;

-- 3. Check row count for people table
SELECT COUNT(*) AS total_people_rows
FROM people;

-- =====================================================
-- SECTION 2: DATABASE STRUCTURE VALIDATION
-- Purpose: Understand the size and structure of the dataset
-- =====================================================

-- 4. Check number of unique customer orders
SELECT COUNT(DISTINCT "Order ID") AS unique_orders
FROM orders;

-- 5. Check number of unique customers
SELECT COUNT(DISTINCT "Customer ID") AS unique_customers
FROM orders;

-- 6. Check number of unique products
SELECT COUNT(DISTINCT "Product ID") AS unique_products
FROM orders;

-- 7. Check number of countries
SELECT COUNT(DISTINCT Country) AS countries
FROM orders;

-- 8. Check number of regions
SELECT COUNT(DISTINCT Region) AS regions
FROM orders;

-- 9. Check number of markets
SELECT COUNT(DISTINCT Market) AS markets
FROM orders;

-- 10. Check number of product categories
SELECT COUNT(DISTINCT Category) AS categories
FROM orders;

-- 11. Check number of product sub-categories
SELECT COUNT(DISTINCT "Sub-Category") AS sub_categories
FROM orders;