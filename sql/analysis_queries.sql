ALTER TABLE retail_sales
ALTER COLUMN order_date TYPE timestamp USING order_date::timestamp;


-- ============================================
-- Total Revenue, Total Profit, and Profit Margin
-- ============================================
SELECT 
    SUM(sales_amount) AS total_revenue,
    SUM(profit) AS total_profit,
    ROUND((SUM(profit)/SUM(sales_amount))::numeric, 3) AS profit_margin
FROM retail_sales;


-- ============================================
-- Revenue by Region
-- ============================================
SELECT 
    region,
    SUM(sales_amount) AS revenue
FROM retail_sales
GROUP BY region
ORDER BY revenue DESC;


-- ============================================
-- Revenue by Category
-- ============================================
SELECT 
    category,
    SUM(sales_amount) AS revenue
FROM retail_sales
GROUP BY category
ORDER BY revenue DESC;


-- ============================================
-- Monthly Revenue Trend
-- ============================================
SELECT 
    DATE_TRUNC('month', order_date) AS month,
    SUM(sales_amount) AS monthly_revenue
FROM retail_sales
GROUP BY month
ORDER BY month;


-- ============================================
-- Top 10 Customers by Revenue
-- ============================================
SELECT 
    customer_id,
    SUM(sales_amount) AS total_spent
FROM retail_sales
GROUP BY customer_id
ORDER BY total_spent DESC
LIMIT 10;

