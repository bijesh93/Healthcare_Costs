SELECT *
  FROM [BijeshTest].[dbo].Healthcare_Costs

  /*
  Setting up columns
  */
ALTER TABLE Healthcare_Costs 
ALTER COLUMN Sex NVARCHAR(10) NOT NULL;

ALTER TABLE Healthcare_Costs
ALTER COLUMN Smoker NVARCHAR(10) NOT NULL;

ALTER TABLE Healthcare_Costs
ALTER COLUMN Region NVARCHAR(50) NOT NULL;

ALTER TABLE Healthcare_Costs
ALTER COLUMN BMI FLOAT NOT NULL;

ALTER TABLE Healthcare_Costs
ALTER COLUMN Charges FLOAT NOT NULL;

ALTER TABLE Healthcare_Costs --adding  new column BMI Category
ADD BMI_Category NVARCHAR(20) NULL; 

ALTER TABLE Healthcare_Costs --adding  new column
ADD AgeGroup NVARCHAR(20) NULL; 

/*
Creating Indexex for faster query execution
*/

CREATE INDEX idx_region ON Healthcare_Costs(Region);
CREATE INDEX idx_smoker ON Healthcare_Costs(Smoker);
CREATE INDEX idx_age ON Healthcare_Costs(Age);

/*
Adding primary key
*/

ALTER TABLE Healthcare_Costs 
ADD ID INT IDENTITY(1,1) PRIMARY KEY;
EXEC sp_help 'Healthcare_Costs';

/*
 Updaing newly added columns
*/

UPDATE Healthcare_Costs
SET AgeGroup = CASE
    WHEN age < 20 THEN 'Teen'
    WHEN age BETWEEN 20 AND 40 THEN 'Young Adult'
    WHEN age BETWEEN 41 AND 60 THEN 'Middle-aged'
    ELSE 'Senior'
END;

UPDATE Healthcare_Costs
SET BMI_Category = CASE
    WHEN bmi < 18.5 THEN 'Underweight'
    WHEN bmi BETWEEN 18.5 AND 24.9 THEN 'Normal weight'
    WHEN bmi BETWEEN 25 AND 29.9 THEN 'Overweight'
    ELSE 'Obese'
END;


