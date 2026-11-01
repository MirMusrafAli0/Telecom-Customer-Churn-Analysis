# Telecom Customer Churn Analysis

An end-to-end analysis of customer churn for a telecommunications
company using Python, MySQL, Excel, and Power BI.

## Project Overview

This project explores customer churn patterns in the IBM Telco Customer
Churn dataset. The goal is to identify customer segments associated with
higher churn and communicate findings through dashboards.

## Business Questions

-   What percentage of customers have churned?
-   Which contract types have the highest churn rate?
-   Does churn differ by payment method or internet service?
-   How does customer tenure relate to churn?
-   Are optional support and security services associated with lower
    churn?

## Tools Used

-   **Python:** data inspection, cleaning, and exploratory analysis
-   **MySQL:** querying and business analysis
-   **Microsoft Excel:** summary analysis and dashboard
-   **Power BI:** interactive churn dashboard

## Repository Structure

``` text
Telecom-Customer-Churn-Analysis/
├── data/
├── excel/
├── powerbi/
├── python/
├── screenshots/
├── sql/
└── README.md
```

## Key Findings

-   **7,043** customers are included in the dataset.
-   **1,869** customers churned; the overall churn rate is **26.54%**.
-   Month-to-month customers have a higher churn rate (**42.71%**) than
    one-year (**11.27%**) and two-year contract customers (**2.83%**).
-   Customers using electronic checks have a churn rate of **45.29%**.
-   Fiber-optic customers have a churn rate of **41.89%**.
-   Customers with shorter tenure show higher churn: the 0--12 month
    group has a churn rate of **47.44%**.

These are descriptive associations in the dataset and do not establish
causation.

## Dashboards

Dashboard screenshots are available in the `screenshots/` folder.

-   Excel dashboard: `excel/Telecom_Churn_Analysis.xlsx`
-   Power BI report: `powerbi/Telecom_Churn_Analysis.pbix`

## Dataset

Source: [IBM Telco Customer Churn dataset on
Kaggle](https://www.kaggle.com/datasets/blastchar/telco-customer-churn)

The dataset contains customer demographics, subscribed services, account
information, and churn status. The original dataset is available from
the Kaggle source above.

## How to Explore

1.  Review the cleaned data and analysis outputs in `data/`.
2.  Review the Python scripts in `python/`.
3.  Run the SQL queries in `sql/` using MySQL.
4.  Open the Excel workbook in `excel/`.
5.  Open the Power BI report in `powerbi/` using Power BI Desktop.

## Author

**Mir Musraf Ali**

-   GitHub: [MirMusrafAli0](https://github.com/MirMusrafAli0)
-   LinkedIn: [Mir Musraf
    Ali](https://www.linkedin.com/in/mir-musraf-ali)
