-- Summary Statistics for Charges, Age, and BMI using STDEV()
SELECT 
    AVG(charges) AS avg_charges,
    MIN(charges) AS min_charges,
    MAX(charges) AS max_charges,
    STDEV(charges) AS stdev_charges,
    -- For median, you might need a custom query (we can handle that separately)

    AVG(age) AS avg_age,
    MIN(age) AS min_age,
    MAX(age) AS max_age,
    STDEV(age) AS stdev_age,
    
    AVG(bmi) AS avg_bmi,
    MIN(bmi) AS min_bmi,
    MAX(bmi) AS max_bmi,
    STDEV(bmi) AS stdev_bmi
FROM 
    Healthcare_Costs;



-- Identifying Outliers (e.g., charges greater than 3 standard deviations from the mean)
WITH stats AS (
    SELECT 
        AVG(charges) AS avg_charges,
        STDEV(charges) AS stddev_charges
    FROM 
        Healthcare_Costs
)
SELECT 
    id, charges, 
    (charges - (SELECT avg_charges FROM stats)) / (SELECT stddev_charges FROM stats) AS z_score
FROM 
    Healthcare_Costs
WHERE 
    ABS((charges - (SELECT avg_charges FROM stats)) / (SELECT stddev_charges FROM stats)) > 3; -- Outliers with z-score > 3


-- Check for Missing Data (NULLs) in columns
SELECT 
    COUNT(*) AS missing_charges
FROM 
    Healthcare_Costs
WHERE 
    charges IS NULL;

SELECT 
    COUNT(*) AS missing_age
FROM 
    Healthcare_Costs
WHERE 
    age IS NULL;

SELECT 
    COUNT(*) AS missing_bmi
FROM 
    Healthcare_Costs
WHERE 
    bmi IS NULL;
