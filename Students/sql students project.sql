desc ustu;

-- get all records from table  
select * from ustu;

-- Count the number of students by gender
SELECT 
    gender, COUNT(*) AS 'No of students'
FROM
    ustu
GROUP BY gender
ORDER BY gender;  

-- Find the average math, Hindi, and English scores by grouping
SELECT 
    grp,
    ROUND(AVG(math), 2) AS 'Average marks of maths',
    ROUND(AVG(hindi), 2) AS 'Average marks of hindi',
    ROUND(AVG(english), 2) AS 'Average marks of hindi'
FROM
    ustu
GROUP BY grp
ORDER BY grp;


 -- Identify the students who have completed test preparation and scored above 80 in math
SELECT 
    gender, grp, math, test_prep_course
FROM
    ustu
WHERE
    test_prep_course = 'completed'
        AND math > 80
ORDER BY math DESC;


 -- List the top 5 students based on their English scores
SELECT 
    *
FROM
    ustu
ORDER BY english DESC
LIMIT 5;


 -- Find the number of students who received free/reduced lunch and scored above 70 in Hindi
SELECT 
    *
FROM
    ustu
WHERE
    lunch = 'free/reduced' AND hindi > 70
ORDER BY hindi DESC;


-- Calculate the average scores in all subjects for students whose parents have a bachelor’s degree
SELECT 
    parental_edu,
    ROUND(AVG(math), 2) AS 'Average marks of maths',
    ROUND(AVG(hindi), 2) AS 'Average marks of hindi',
    ROUND(AVG(english), 2) AS 'Average marks of hindi'
FROM
    ustu
WHERE
    parental_edu = 'bachelor\'s degree';
    
 -- Retrieve students who scored above 90 in all subjects (math, Hindi, and English)
SELECT 
    *
FROM
    ustu
WHERE
    math > 90 AND english > 90
        AND hindi > 90
ORDER BY math DESC;

 -- List the students with no test preparation who scored below 50 in any subject
 SELECT 
    *
FROM
    ustu
WHERE
    test_prep_course = 'none'
ORDER BY hindi
LIMIT 10;

-- Find the highest and lowest math scores for students who have a parent with a master's degree
SELECT 
    *
FROM
    ustu
WHERE
    math = (SELECT 
            MAX(math)
        FROM
            ustu
        WHERE
            parental_edu = 'master\'s degree')
        AND parental_edu = 'master\'s degree';
SELECT 
    *
FROM
    ustu
WHERE
    math = (SELECT 
            MIN(math)
        FROM
            ustu
        WHERE
            parental_edu = 'master\'s degree')
        AND parental_edu = 'master\'s degree';
        
        
        
-- Count the number of students by race/ethnicity who scored above the overall average in English
SELECT 
    grp, COUNT(*)
FROM
    ustu
WHERE
    english > (SELECT 
            AVG(english)
        FROM
            ustu)
GROUP BY grp
ORDER BY COUNT(*) DESC;

-- Find the percentage of students who have completed test preparation vs those who have not
SELECT 
    (SUM(CASE
        WHEN test_prep_course = 'completed' THEN 1
        ELSE 0
    END) / COUNT(*)) * 100 AS 'percentage of completed',
    (SUM(CASE
        WHEN test_prep_course = 'none' THEN 1
        ELSE 0
    END) / COUNT(*)) * 100 AS 'percentage of not completed'
FROM
    ustu;
    
    
 -- Find students who scored below the average math score but above the average Hindi score
 select avg(hindi) from ustu;
SELECT 
    *
FROM
    ustu
WHERE
    math < (SELECT 
            AVG(math)
        FROM
            ustu)
        AND hindi > (SELECT 
            AVG(hindi)
        FROM
            ustu);

-- Group students by lunch type and calculate the average score in English for each group
select distinct(lunch) from ustu;

SELECT 
    lunch,
    AVG(CASE WHEN lunch = 'standard' THEN english END) AS avg_standard_english,
    AVG(CASE WHEN lunch = 'free/reduced' THEN english END) AS avg_free_reduced_english
FROM ustu
GROUP BY lunch;
-- Find the students who have the same score in math and Hindi-- 
select * from ustu where math = hindi;



