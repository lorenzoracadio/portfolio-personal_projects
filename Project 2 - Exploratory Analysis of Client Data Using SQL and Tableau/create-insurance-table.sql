-- Project Summary: This project will use SQL and Tableau to conduct an exploratory analysis of a real-world dataset.

-- Step 1: Import the data
-- The database contains information about different clients who availed of life insurance policies from a large insurance provider in the Philippines.

CREATE TABLE INSURANCE (
	POLICY_YEAR INTEGER,
	POLICY_MONTH INTEGER,
	POLICY_DATE TEXT, 
	POLICY_OWNER TEXT,
	PRODUCT TEXT,
	POLICY_GENDER TEXT,
	AGE TEXT,
	CITY TEXT,
	PROVINCE TEXT,
	SOCIAL_STATUS TEXT,
	PREMIUM_MODE TEXT,
	POLICY_SOURCE TEXT,
	MARKET TEXT,
	CLIENT_SEGMENT TEXT
);

COPY INSURANCE
FROM
	'D:/Git-Hub/project-portfolio/Project 2 - Exploratory Analysis of Client Data Using SQL and Tableau/Dataset_Client_Information.csv' DELIMITER ',' CSV HEADER;


-- Step 2: Clean the dataset. (Note: DUPLICATE RAW DATA SET TO A WORKING TABLE)

SELECT
	* INTO INSURANCE_WF
FROM
	INSURANCE;

-- 2A: Inspect and remove nulls. (Note: Important for policy date) Three entries are null so we will delete them.

--- Inspection: 3 rows are null

select *
FROM insurance_wf
WHERE
	policy_date isnull or
	policy_owner isnull or
	product isnull

--- Delete the rows

DELETE FROM
	insurance_wf
WHERE
	policy_date isnull or
	policy_owner isnull or
	product isnull;

--- 2A Verification: No nulls

select *
FROM insurance_wf
WHERE
	policy_date isnull or
	policy_owner isnull or
	product isnull


-- 2B: Check datatypes. Process date is 'text' type when it should be of 'date' type.

UPDATE INSURANCE_WF
SET POLICY_DATE = cast(POLICY_DATE as date);

ALTER TABLE INSURANCE_WF
ALTER COLUMN POLICY_DATE TYPE DATE USING TO_DATE(POLICY_DATE, 'YYYY-MM-DD');

--- 2B (Verification): Policy date is now returned as a date.

SELECT
	distinct POLICY_DATE
FROM
	INSURANCE_WF
ORDER BY 1;


-- 2C: Find duplicates. Process date, customer id, and product should be UNIQUE per row. (one customer can avail many policies)

--- Three clients have duplicate entries.

SELECT POLICY_DATE, POLICY_OWNER, PRODUCT, count(*)
FROM insurance_wf
GROUP BY 1,2,3
HAVING count(*) > 1

--- Create a common table expression (CTE) to identify duplicate rows.

WITH duplicates as (
SELECT *,
COUNT(*) OVER(PARTITION BY POLICY_DATE,POLICY_OWNER, PRODUCT) as dupe_count
FROM insurance_wf
)
SELECT *
FROM duplicates
WHERE dupe_count > 1;

--- Add a column called dupe_count. Reference the CTE to update the rows.

ALTER TABLE insurance_wf
ADD DUPE_COUNT INTEGER;

WITH d AS (
    SELECT
        policy_date,
        policy_owner,
        product,
        COUNT(*) OVER (PARTITION BY policy_date, policy_owner, product) AS calculated_dupe_count
    FROM insurance_wf
)
UPDATE insurance_wf i
SET dupe_count = d.calculated_dupe_count
FROM d
WHERE i.policy_date = d.policy_date 
  AND i.policy_owner = d.policy_owner 
  AND i.product = d.product;

--- Check if duplicate entries (i.e. dupe_count > 1) appear.

SELECT *
FROM insurance_Wf
WHERE DUPE_COUNT > 1;

--- Delete rows

DELETE FROM insurance_wf
WHERE dupe_count > 1;

-- 2C (Verification): Check if all rows have no duplicates based on the dupe_count column. Remove the dupe_count column.
SELECT distinct DUPE_COUNT
FROM insurance_wf;
ALTER TABLE insurance_wf
DROP COLUMN IF EXISTS DUPE_COUNT;


-- FINAL OUTPUT: Clean Dataset
SELECT *
FROM insurance_wf;