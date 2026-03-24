-- Select Databse
USE DataWarehouseAnalytics;

-- Explore all objects in database
SELECT
    *
FROM
    INFORMATION_SCHEMA.TABLES;

-- Explore all columns in database
SELECT
    *
FROM
    INFORMATION_SCHEMA.COLUMNS;

-- Explore specific table columns in DB
SELECT
    *
FROM
    INFORMATION_SCHEMA.COLUMNS
WHERE
    TABLE_NAME = 'dim_customers';

-- --------------------- DIMENSIONS EXPLORATION --------------------------------------------
-- Explore unique values: Countries, all major divisions
SELECT
    DISTINCT Country
FROM
    gold.dim_customers;

SELECT
    DISTINCT category,
    subCategory,
    product_name
FROM
    gold.dim_products
ORDER BY
    1,
    2,
    3;

-- --------------------- DATE EXPLORATION --------------------------------------------
-- First and last order dates
SELECT
    MIN(order_date) AS FirstOrder,
    MAX(order_date) AS LastOrder,
    DATEDIFF(month, MIN(order_date), MAX(order_date)) AS OrderrangeInYear
FROM
    gold.fact_sales;

-- Youngest and oldest Customer
SELECT
    MIN(birthdate) AS oldest_date,
    MAX(birthdate) As youngest_date,
    DATEDIFF(year, MIN(birthdate), GETDATE()) AS oldest_customer_age,
    DATEDIFF(year, MAX(birthdate), GETDATE()) AS youngest_customer_age
FROM
    gold.dim_customers;

-- --------------------- MEASURE EXPLORATION ----------------------------------------------
-- Total Sales
SELECT
    SUM(sales_amount) AS total_Sale
FROM
    gold.fact_sales;

-- How many items sold
SELECT
    SUM(quantity) total_quantity
FROM
    gold.fact_sales;

-- Total no of Orders
SELECT
    COUNT(DISTINCT order_number) AS total_orders_count
FROM
    gold.fact_sales;

-- Average Selling price 
SELECT
    AVG(price) avg_selling_price
FROM
    gold.fact_sales;

-- Total no of Products
SELECT
    COUNT(DISTINCT product_key) AS total_products
FROM
    gold.fact_sales;

-- Total no of Customers
SELECT
    COUNT(customer_key) AS total_customers
FROM
    gold.dim_customers;

-- Total no of customers that placed order
SELECT
    COUNT(DISTINCT customer_key) AS total_customer_ordered
FROM
    gold.fact_sales;