HR Analytics: Employee Attrition Analysis
Author: Lakshmi Priya
Dataset: IBM HR Analytics (1,470 employees)


-- 1. Overall Attrition Rate
SELECT 
    COUNT(*) AS total_employees,
    SUM(Attrition) AS employees_left,
    ROUND(SUM(Attrition) * 100.0 / COUNT(*), 2) AS attrition_rate
FROM employees;


-- 2. Attrition by Department
SELECT 
    Department,
    COUNT(*) AS total,
    SUM(Attrition) AS left_count,
    ROUND(SUM(Attrition) * 100.0 / COUNT(*), 2) AS attrition_pct
FROM employees
GROUP BY Department
ORDER BY attrition_pct DESC;


-- 3. Attrition by Salary Band
SELECT 
    CASE 
        WHEN MonthlyIncome < 3000 THEN 'Low'
        WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Mid'
        ELSE 'High'
    END AS salary_band,
    ROUND(AVG(Attrition) * 100, 2) AS attrition_rate
FROM employees
GROUP BY salary_band;


-- 4. Overtime Impact on Attrition
SELECT 
    OverTime,
    COUNT(*) AS total,
    ROUND(AVG(Attrition) * 100, 2) AS attrition_rate
FROM employees
GROUP BY OverTime;


-- 5. Attrition by Years at Company
SELECT 
    YearsAtCompany,
    ROUND(AVG(Attrition) * 100, 2) AS attrition_rate
FROM employees
GROUP BY YearsAtCompany
ORDER BY YearsAtCompany;

