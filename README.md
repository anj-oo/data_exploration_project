📊 Data Exploration & Business Insights using SQL

🔹 Problem
Businesses often struggle to understand their sales performance, customer behaviour, and product trends due to scattered or unstructured data.
In this project, the goal was to explore a data warehouse and answer key business questions such as:
How is the business performing overall?
Which products and categories generate the most revenue?
Who are the most valuable customers?
What trends exist across countries, demographics, and time?
This analysis helps stakeholders make data-driven decisions to improve revenue, customer targeting, and product strategy.

🔹 Tools Used
SQL (SQL Server) – Data exploration, aggregation, joins, and window functions
Tableau – Data visualization and dashboard creation (optional if you used it later)
Excel – Data validation and quick analysis

🔹 Key Insights
📈 Business Performance
Identified total sales, total orders, and average selling price to measure overall performance
Calculated total quantity sold, giving insight into product demand
Built a consolidated KPI report using UNION for quick business overview

👥 Customer Insights
Determined total customers vs customers who placed orders, highlighting engagement gaps
Identified top revenue-generating customers, useful for loyalty targeting
Analyzed customer distribution by country and gender

🌍 Geographic Trends
Found countries contributing the highest sales revenue
Identified regions with low sales performance, indicating growth opportunities

🛍️ Product & Category Analysis
Identified top 5 and bottom 5 products by revenue
Analyzed product categories generating maximum revenue
Calculated average cost per category, helping assess profitability

📅 Time-Based Insights
Determined first and last order dates to understand business activity range
Measured order duration in months
Analyzed customer age distribution (youngest vs oldest)

🔢 Advanced Analysis
Used window functions (ROW_NUMBER) to rank top-performing products
Performed data segmentation using GROUP BY and aggregations
Joined fact and dimension tables to generate meaningful business insights

🔹 What This Project Demonstrates
Strong understanding of data exploration techniques
Ability to translate raw data into business insights
Proficiency in SQL joins, aggregations, and window functions
Experience working with data warehouse schemas (fact & dimension tables)
Analytical thinking for solving real-world business problems

🔹 Dataset
Data Warehouse: DataWarehouseAnalytics
Tables Used:
fact_sales
dim_customers
dim_products

🔹 How to Run
Set up Docker container
Run a SQL Server container using Docker on your MacBook
Ensure the container is up and running
Connect via Visual Studio Code
Open Visual Studio Code
Use a SQL extension (e.g., SQL Server extension)
Connect to your Docker SQL Server instance
Initialize the Database
Run the initial SQL script to:
Create the database (DataWarehouseAnalytics)
Create required tables (fact_sales, dim_customers, dim_products)
Load Data from CSV
Import CSV files into the Docker container
Ensure data is correctly mapped to table schema
Run Exploration Queries
Execute the SQL queries step-by-step
Analyze outputs for insights on sales, customers, and products

🔹 Future Improvements
Build an interactive Tableau dashboard
