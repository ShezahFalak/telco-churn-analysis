create database project;
use project;
-- telco customer churn analysis
-- ibm telco churn dataset (kaggle)

-- quick size check
select count(*) as total_customers
from customer_churn;

-- overall churn rate
select round(sum(ChurnValue) * 100.0 / count(*), 2) as churn_rate_percent
from customer_churn;

-- churn by contract type
with contract_summary as (
select Contract,
count(*) as total_customers,
sum(ChurnValue) as churned_customers
from customer_churn
group by Contract
)
select Contract,
round(churned_customers * 100.0 / total_customers, 2) as churn_rate_percent
from contract_summary
order by churn_rate_percent desc;

-- churn by tenure bucket
with tenure_summary as (
select
case
when TenureMonths <= 6 then '0-6 months'
when TenureMonths between 7 and 12 then '7-12 months'
when TenureMonths between 13 and 24 then '13-24 months'
when TenureMonths between 25 and 48 then '25-48 months'
else '49+ months'
end as tenure_bucket,
count(*) as total_customers,
sum(ChurnValue) as churned_customers
from customer_churn
group by tenure_bucket
)
select tenure_bucket,
round(churned_customers * 100.0 / total_customers, 2) as churn_rate_percent
from tenure_summary
order by churn_rate_percent desc;

-- cltv comparison: churned vs active
select ChurnValue,
count(*) as customer_count,
round(avg(CLTV), 0) as avg_cltv
from customer_churn
group by ChurnValue;

-- total cltv lost due to churn
select round(sum(CLTV), 0) as total_cltv_lost
from customer_churn
where ChurnValue = 1;

-- revenue at risk by contract
select Contract,
count(*) as churned_customers,
round(sum(CLTV), 0) as total_cltv_lost
from customer_churn
where ChurnValue = 1
group by Contract
order by total_cltv_lost desc;

-- revenue at risk by tenure
select
case
when TenureMonths <= 6 then '0-6 months'
when TenureMonths between 7 and 12 then '7-12 months'
when TenureMonths between 13 and 24 then '13-24 months'
when TenureMonths between 25 and 48 then '25-48 months'
else '49+ months'
end as tenure_bucket,
count(*) as churned_customers,
round(sum(CLTV), 0) as total_cltv_lost
from customer_churn
where ChurnValue = 1
group by tenure_bucket
order by total_cltv_lost desc;

-- top churn reasons
select ChurnReason,
count(*) as churned_customers
from customer_churn
where ChurnValue = 1
group by ChurnReason
order by churned_customers desc;
