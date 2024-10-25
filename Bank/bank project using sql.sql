USE PROJECT2;
-- 1.Retrieve all records from the bank marketing dataset.
SELECT * FROM BANK;

-- Select distinct job types from the dataset.
SELECT distinct(JOB) AS DISTINCT_JOBS FROM BANK; 

-- Find all clients who have a loan.
SELECT * FROM BANK WHERE LOAN = "YES";

-- Find the total number of clients in the dataset.
SELECT COUNT(*) FROM BANK;

-- Display the age, job, and balance for all clients.
SELECT AGE, JOB , BALANCE FROM BANK;

-- Find all clients who have a loan.
SELECT COUNT(*) FROM BANK WHERE LOAN = "YES";
SELECT * FROM BANK WHERE LOAN = "YES";

-- Find the average balance of clients for each job type.
SELECT 
    JOB, ROUND(AVG(BALANCE), 2) AS 'AVERAGE BALANCE'
FROM
    BANK
GROUP BY JOB
ORDER BY AVG(BALANCE) DESC;

-- List the number of clients based on their marital status.
SELECT * FROM BANK;
SELECT MARITAL , COUNT(*) FROM BANK group by MARITAL;
 
 -- Retrieve all clients whose balance is greater than 10,000.
 SELECT * FROM BANK WHERE BALANCE >10000;
 
 -- Find the minimum, maximum, and average age of clients in the dataset.
 SELECT min(AGE)  AS "MINIMUM AGE", MAX(AGE) AS "MAXIMUM AGE" , AVG(AGE) AS "AVERAGE AGE" FROM BANK;
 
-- List clients who do not have a house loan but have a personal loan.
SELECT * FROM BANK;
SELECT * FROM BANK WHERE HOUSING = "NO" AND LOAN = "YES";

-- Find the top 3 job categories with the highest average balance.
SELECT 
    JOB, AVG(BALANCE) AS 'HIGHEST AVG SALARY'
FROM
    BANK
GROUP BY JOB
ORDER BY AVG(BALANCE) DESC
LIMIT 3;

-- Retrieve clients who are over 50 years old and have a balance greater than the overall average balance.-- 
SELECT AVG(BALANCE) FROM BANK;
SELECT * FROM BANK WHERE AGE > 50 AND BALANCE > (SELECT AVG(BALANCE) FROM BANK);

-- List all clients with a house loan and a balance greater than 50,000, ordered by balance in descending order.
SELECT 
    *
FROM
    BANK
WHERE
    AGE > 50
        AND BALANCE > (SELECT 
            AVG(BALANCE)
        FROM
            BANK)
ORDER BY BALANCE DESC;

-- Calculate the total balance for clients who contacted the bank via phone on a specific day.
SELECT 
    SUM(BALANCE) AS 'TOTAL BALANCE'
FROM
    BANK
WHERE
    CONTACT = 'UNKNOWN' AND DAY = 5;