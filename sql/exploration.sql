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

-- --------------------- MAGNITUDE EXPLORATION --------------------------------------------
-- Total customers by countries
SELECT
    country,
    COUNT(customer_key) total_customer
FROM
    gold.dim_customers
GROUP BY
    country
ORDER BY
    total_customer DESC;

-- Total customers by gender
SELECT
    gender,
    COUNT(customer_key) total_customer
FROM
    gold.dim_customers
GROUP BY
    gender
ORDER BY
    total_customer DESC;

-- Total products by categories
SELECT
    category,
    COUNT(product_id) total_product
FROM
    gold.dim_products
GROUP BY
    category
ORDER BY
    total_product DESC;

-- Averge cost in each categories
SELECT
    category,
    AVG(cost) avergae_cost
FROM
    gold.dim_products
GROUP BY
    category
ORDER BY
    avergae_cost DESC;

-- Total revenue geneated for each categories
SELECT
    p.category,
    SUM(s.sales_amount) total_revenue
FROM
    gold.fact_sales s
    LEFT JOIN gold.dim_products p ON p.product_key = s.product_key
GROUP BY
    p.category
ORDER BY
    total_revenue DESC;

-- Total revenue genearted by each customers
SELECT
    d.customer_key,
    d.first_name,
    d.last_name,
    SUM(f.sales_amount) total_revenue
FROM
    gold.fact_sales f
    LEFT JOIN gold.dim_customers d ON d.customer_key = f.customer_key
GROUP BY
    d.customer_key,
    d.first_name,
    d.last_name
ORDER BY
    total_revenue DESC;

-- Distribution of items sold across countries
SELECT
    c.country,
    SUM(sales_amount) total_sales
FROM
    gold.fact_sales f
    LEFT JOIN gold.dim_customers c ON c.customer_key = f.customer_key
GROUP BY
    c.country
ORDER BY
    total_sales DESC;

-- --------------------- RANKING --------------------------------------------
-- Top 5 product that generates highest revenue
SELECT
    TOP 5 p.product_name,
    SUM(s.sales_amount) total_revenue
FROM
    gold.fact_sales s
    LEFT JOIN gold.dim_products p ON p.product_key = s.product_key
GROUP BY
    p.product_name
ORDER BY
    total_revenue DESC;

-- Bottom 5 product that generates worest revenue
SELECT
    TOP 5 p.product_name,
    SUM(s.sales_amount) total_revenue
FROM
    gold.fact_sales s
    LEFT JOIN gold.dim_products p ON p.product_key = s.product_key
GROUP BY
    p.product_name
ORDER BY
    total_revenue ASC;

-- Top 5 product that generate highest revenue uisng window function 
SELECT
    *
FROM
    (
        SELECT
            p.product_name,
            SUM(s.sales_amount) total_revenue,
            ROW_NUMBER() OVER(
                ORDER BY
                    SUM(s.sales_amount) DESC
            ) rank_product
        FROM
            gold.fact_sales s
            LEFT JOIN gold.dim_products p ON p.product_key = s.product_key
        GROUP BY
            p.product_name
    ) t
WHERE
    rank_product <= 5;