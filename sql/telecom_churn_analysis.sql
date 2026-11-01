-- 1. Create and select database
CREATE DATABASE IF NOT EXISTS telecom_churn;
USE telecom_churn;

-- 2. Create table
CREATE TABLE IF NOT EXISTS telco_customers (
    customerID VARCHAR(20) PRIMARY KEY,
    gender VARCHAR(10),
    SeniorCitizen INT,
    Partner VARCHAR(5),
    Dependents VARCHAR(5),
    tenure INT,
    PhoneService VARCHAR(5),
    MultipleLines VARCHAR(30),
    InternetService VARCHAR(30),
    OnlineSecurity VARCHAR(30),
    OnlineBackup VARCHAR(30),
    DeviceProtection VARCHAR(30),
    TechSupport VARCHAR(30),
    StreamingTV VARCHAR(30),
    StreamingMovies VARCHAR(30),
    Contract VARCHAR(30),
    PaperlessBilling VARCHAR(5),
    PaymentMethod VARCHAR(50),
    MonthlyCharges DECIMAL(10,2),
    TotalCharges DECIMAL(10,2),
    Churn VARCHAR(5)
);

-- 3. Check that the table exists
SHOW TABLES;

USE telecom_churn;

-- 1. Check total imported customers
SELECT COUNT(*) AS total_customers
FROM telco_customers;

-- 2. Preview the first 10 records
SELECT *
FROM telco_customers
LIMIT 10;

-- 3. Check churn distribution
SELECT
    Churn,
    COUNT(*) AS total_customers
FROM telco_customers
GROUP BY Churn;

-- 4. Check missing customer IDs
SELECT COUNT(*) AS missing_customer_ids
FROM telco_customers
WHERE customerID IS NULL OR customerID = '';

USE telecom_churn;

-- 1. Overall business KPIs
SELECT
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    SUM(Churn = 'No') AS retained_customers,
    ROUND(100.0 * SUM(Churn = 'Yes') / COUNT(*), 2) AS churn_rate_pct,
    ROUND(AVG(tenure), 2) AS avg_tenure_months,
    ROUND(AVG(MonthlyCharges), 2) AS avg_monthly_charges,
    ROUND(AVG(TotalCharges), 2) AS avg_total_charges
FROM telco_customers;

-- 2. Churn by contract type
SELECT
    Contract,
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    ROUND(100.0 * SUM(Churn = 'Yes') / COUNT(*), 2) AS churn_rate_pct
FROM telco_customers
GROUP BY Contract
ORDER BY churn_rate_pct DESC;

-- 3. Churn by payment method
SELECT
    PaymentMethod,
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    ROUND(100.0 * SUM(Churn = 'Yes') / COUNT(*), 2) AS churn_rate_pct
FROM telco_customers
GROUP BY PaymentMethod
ORDER BY churn_rate_pct DESC;

-- 4. Churn by internet service
SELECT
    InternetService,
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    ROUND(100.0 * SUM(Churn = 'Yes') / COUNT(*), 2) AS churn_rate_pct
FROM telco_customers
GROUP BY InternetService
ORDER BY churn_rate_pct DESC;

-- 5. Churn by tenure group
SELECT
    CASE
        WHEN tenure <= 12 THEN '0-12 months'
        WHEN tenure <= 24 THEN '13-24 months'
        WHEN tenure <= 48 THEN '25-48 months'
        ELSE '49-72 months'
    END AS tenure_group,
    COUNT(*) AS total_customers,
    SUM(Churn = 'Yes') AS churned_customers,
    ROUND(100.0 * SUM(Churn = 'Yes') / COUNT(*), 2) AS churn_rate_pct
FROM telco_customers
GROUP BY tenure_group
ORDER BY
    CASE tenure_group
        WHEN '0-12 months' THEN 1
        WHEN '13-24 months' THEN 2
        WHEN '25-48 months' THEN 3
        ELSE 4
    END;