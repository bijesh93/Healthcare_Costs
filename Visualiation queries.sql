-- Distribution of Charges (Group by ranges)
SELECT 
    CASE 
        WHEN charges < 5000 THEN '< 5000'
        WHEN charges BETWEEN 5000 AND 10000 THEN '5000 - 10000'
        WHEN charges BETWEEN 10000 AND 20000 THEN '10000 - 20000'
        WHEN charges BETWEEN 20000 AND 30000 THEN '20000 - 30000'
        ELSE '> 30000'
    END AS charges_range,
    COUNT(*) AS count
FROM 
    Healthcare_Costs
GROUP BY 
    CASE 
        WHEN charges < 5000 THEN '< 5000'
        WHEN charges BETWEEN 5000 AND 10000 THEN '5000 - 10000'
        WHEN charges BETWEEN 10000 AND 20000 THEN '10000 - 20000'
        WHEN charges BETWEEN 20000 AND 30000 THEN '20000 - 30000'
        ELSE '> 30000'
    END
ORDER BY charges_range;

-- Distribution of Age (Group by ranges)
SELECT 
    CASE 
        WHEN age < 20 THEN '< 20'
        WHEN age BETWEEN 20 AND 40 THEN '20 - 40'
        WHEN age BETWEEN 40 AND 60 THEN '40 - 60'
        WHEN age BETWEEN 60 AND 80 THEN '60 - 80'
        ELSE '> 80'
    END AS age_range,
    COUNT(*) AS count
FROM 
    Healthcare_Costs
GROUP BY 
    CASE 
        WHEN age < 20 THEN '< 20'
        WHEN age BETWEEN 20 AND 40 THEN '20 - 40'
        WHEN age BETWEEN 40 AND 60 THEN '40 - 60'
        WHEN age BETWEEN 60 AND 80 THEN '60 - 80'
        ELSE '> 80'
    END
ORDER BY age_range;

-- Distribution of BMI (Group by ranges)
SELECT 
    CASE 
        WHEN bmi < 18.5 THEN 'Underweight'
        WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal weight'
        WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
        ELSE 'Obese'
    END AS bmi_category,
    COUNT(*) AS count
FROM 
    Healthcare_Costs
GROUP BY 
    CASE 
        WHEN bmi < 18.5 THEN 'Underweight'
        WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal weight'
        WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
        ELSE 'Obese'
    END
ORDER BY bmi_category;

-- Age vs. Charges
SELECT age, charges
FROM Healthcare_Costs;

-- BMI vs. Charges
SELECT bmi, charges
FROM Healthcare_Costs;


-- Boxplot of Charges by Age Group
SELECT 
    CASE 
        WHEN age < 20 THEN '< 20'
        WHEN age BETWEEN 20 AND 40 THEN '20 - 40'
        WHEN age BETWEEN 40 AND 60 THEN '40 - 60'
        WHEN age BETWEEN 60 AND 80 THEN '60 - 80'
        ELSE '> 80'
    END AS age_range,
    charges
FROM 
    Healthcare_Costs;
