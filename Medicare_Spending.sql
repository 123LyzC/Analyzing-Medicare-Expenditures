-- Import Medicare Hospital Spending CSV File
CREATE TABLE medicare_spending(
	Facility_ID INTEGER PRIMARY KEY,
	Facility_Name VARCHAR(250),
	Address VARCHAR(500) 
	City VARCHAR(250),
	State VARCHAR(100),
	ZIP_Code INTEGER,
	County_Name VARCHAR(250),
	Phone_Number VARCHAR(250),
	Measure_ID VARCHAR(100),
	Measure_Name VARCHAR(100),
	Score VARCHAR(100),
	Footnote INTEGER,
	Start_Date DATE,
	End_Date DATE
);

-- Check table
SELECT *
FROM medicare_spending;

-- Import Data

-- Note score is an character but will convert to int
-- First convert "Note Available" to missing/null
UPDATE medicare_spending
SET score = NULL
WHERE score = 'Not Available';
--CONVERT TO INTEGER
ALTER TABLE medicare_spending
ALTER COLUMN score TYPE NUMERIC USING score::NUMERIC;

-- Check for missing facility IDs
SELECT *
FROM medicare_spending
WHERE facility_id IS NULL;

-- Check for duplicate facility IDs
SELECT DISTINCT facility_id
FROM medicare_spending;

-- How many States and facilties are covered by Medicare
SELECT COUNT(DISTINCT state) AS num_states_covered, -- 50
COUNT(DISTINCT facility_name) AS num_facility_covered -- 2940
FROM medicare_spending
WHERE score IS NOT NULL; 

---- Disaggregate by number of facilites by state
SELECT state, 
COUNT(DISTINCT facility_name) AS num_facility_covered
FROM medicare_spending
WHERE score IS NOT NULL
GROUP BY state
ORDER BY num_facility_covered DESC; -- CA HAS THE MOST

-- What is the highest MSPB score
SELECT MAX(score)
FROM medicare_spending; -- 1.64

--- Look at MSPB score by state
SELECT state, facility_name, score
FROM medicare_spending
WHERE score IS NOT NULL
ORDER BY score DESC
LIMIT 10; -- Note: Texas facility matches the highest score

-- What is the lowest MSPB score
SELECT MIN(score)
FROM medicare_spending; -- 0.43

--- Look at MSPB score by state
SELECT state, facility_name, score
FROM medicare_spending
WHERE score IS NOT NULL
ORDER BY score 
LIMIT 20; -- Note: MS facility matches the lowest score

-- What is the average MSPB score
SELECT AVG(score) AS avg_score
FROM medicare_spending; -- 0.987

-- What is the AVG of MSPB score
SELECT AVG(score) AS avg_score_state, state
FROM medicare_spending
WHERE score IS NOT NULL
GROUP BY state
ORDER BY AVG(score) DESC
LIMIT 20;

-- Facitites where score is equal to 1
SELECT facility_name, score
FROM medicare_spending
WHERE score = 1; -- 182

-- Facitites where score is less than to 1
SELECT facility_name, score
FROM medicare_spending
WHERE score < 1; -- 1653

-- Facitites where score is greater than to 1
SELECT COUNT(state), state
FROM medicare_spending
WHERE score >  1
GROUP BY state

