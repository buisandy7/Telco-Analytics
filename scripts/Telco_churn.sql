----- Create Database and Table -----
DROP DATABASE IF EXISTS telco_analytics;
CREATE DATABASE telco_analytics;
USE telco_analytics;

----- Checking Row Count ------
SELECT COUNT(*) AS total_rows FROM telco_churn;

----- Executive Financial Summary ------
SELECT 
    COUNT(customer_id) AS total_customers,
    SUM(churn_flag) AS total_churned,
    ROUND(AVG(churn_flag) * 100, 2) AS churn_rate_pct,
    ROUND(SUM(monthly_charges), 2) AS total_mrr,
    ROUND(SUM(CASE WHEN churn = 'Yes' THEN monthly_charges ELSE 0 END), 2) AS lost_mrr,
    ROUND(SUM(CASE WHEN churn = 'Yes' THEN monthly_charges ELSE 0 END) * 12, 2) AS annualized_lost_revenue
FROM telco_churn;


