# Customer Churn & Revenue at Risk Analysis

## Overview
- Analyzed telecom customer churn to identify churn drivers and quantify financial impact
- Used **SQL (MySQL)** for analysis and **Microsoft Excel** to build an executive-level dashboard
- Focused on both **churn rates** and **revenue at risk** using Customer Lifetime Value (CLTV)

## Dataset
- IBM Telco Customer Churn dataset (Kaggle)
- Includes customer tenure, contract type, churn status, and estimated CLTV

## Objectives
- Measure overall customer churn
- Analyze churn patterns by **contract type** and **customer tenure**
- Quantify **revenue at risk** by summing CLTV of churned customers
- Identify high-impact customer segments for retention

## Analysis & Tools
- **SQL (MySQL)**
  - CTEs
  - CASE statements
  - Aggregations (COUNT, SUM, AVG)
    
- **Microsoft Excel**
  - KPI tracking
  - Executive dashboard
  - Data visualization
    
## Dashboard Preview
![Dashboard Overview](images/excel_dashboard.png)

## Key Insights
- Month-to-month customers have the highest churn rate
- Churn is highest within the first 6 months of tenure
- Early-tenure churn contributes the largest CLTV loss
- Longer contracts significantly reduce churn and revenue loss

## Repository Contents
- `churn_analysis.sql` – SQL queries used for analysis
- `churn_dashboard.xlsx` – Excel dashboard
- `images/` – Dashboard and chart screenshots
