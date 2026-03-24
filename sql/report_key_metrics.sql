-- Select Databse
USE DataWarehouseAnalytics;

-- REPORT that shows all key metrics of the business
SELECT
    'Total Sales' AS measure_name,
    SUM(sales_amount) AS measure_value
FROM
    gold.fact_sales
UNION
ALL
SELECT
    'Total Quantity' AS measure_name,
    SUM(quantity) AS measure_value
FROM
    gold.fact_sales
UNION
ALL
SELECT
    'Average Selling Price' AS measure_name,
    AVG(price) AS measure_value
FROM
    gold.fact_sales
UNION
ALL
SELECT
    'Total Orders' AS measure_name,
    COUNT(DISTINCT order_number) AS measure_value
FROM
    gold.fact_sales
UNION
ALL
SELECT
    'Total Products' AS measure_name,
    COUNT(DISTINCT product_key) AS measure_value
FROM
    gold.fact_sales
UNION
ALL
SELECT
    'Total Customers' AS measure_name,
    COUNT(customer_key) AS measure_value
FROM
    gold.dim_customers
UNION
ALL
SELECT
    'Total Customer Order' AS measure_name,
    COUNT(DISTINCT customer_key) AS measure_value
FROM
    gold.fact_sales;