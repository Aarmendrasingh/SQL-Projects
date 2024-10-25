use project;
SELECT * FROM SCOIALMEDIA;
# 	1. What is the average time spent by users on each social media platform?
SELECT PLATFORM , ROUND(avg(TIME_SPENT) , 1) 
AS "AVG TIME TO EACH PLATFORM" 
FROM SCOIALMEDIA 
group by PLATFORM;

# 2.How many users belong to each age group and their average time spent on social media?
SELECT DISTINCT(AGE) , PLATFORM, 
COUNT(*) AS "TOTAL USER", 
SEC_TO_TIME((AVG(time_spent) * 60)*60) 
AS "avg_time_spent"   
FROM SCOIALMEDIA GROUP BY AGE , PLATFORM;

# 3 What is the total time spent on social media by users with specific professions
SELECT PROFESSION , PLATFORM ,  SEC_TO_TIME((sum(time_spent) * 60))  as "Total Time"
FROM SCOIALMEDIA 
GROUP BY PROFESSION , PLATFORM
ORDER BY PROFESSION , PLATFORM
LIMIT 10;

# 4.Which platform is most popular among users based on their income group?
SELECT PLATFORM , AVG(INCOME) AS "AVERAGE INCOME"
FROM SCOIALMEDIA
GROUP BY PLATFORM
ORDER BY AVG(INCOME)  desc
LIMIT 1;

# 	5. What is the average income of users who own a car versus those who don't?
SELECT if( OWNS_CAR = 'TRUE' ,'WE HAVE CAR' , 'WE HAVE NOT CAR') AS 'OWN CAR', 
avg(INCOME) FROM SCOIALMEDIA 
group by OWNS_CAR 
ORDER BY AVG(INCOME) DESC;

# 6.How does social media usage differ between users with different interests?
SELECT  INTERESTS ,  SEC_TO_TIME((AVG(time_spent) * 60)*60) as "Average time"
FROM SCOIALMEDIA 
GROUP BY INTERESTS  
ORDER BY INTERESTS;  

# 7.Which location has the highest average time spent on social media?
select location ,SEC_TO_TIME((AVG(time_spent) * 60)*60) 
from scoialmedia 
group by location 
order by SEC_TO_TIME((AVG(time_spent) * 60)*60) desc
limit 1;

# 	8. How does the average time spent on social media vary between genders?
select gender , SEC_TO_TIME((AVG(time_spent) * 60)*60) AS "AVERAGE TIME " 
from scoialmedia 
group by gender
order by SEC_TO_TIME((AVG(time_spent) * 60)*60) desc;

# 	9. What is the percentage of users who own both a home and a car and their average time spent on social media?
SELECT 
COUNT(*) AS "TOTAL USER",
SUM(CASE WHEN ISHOMEOWNER = 'TRUE' AND OWNS_CAR = 'TRUE' THEN 1 ELSE 0 END ) AS "USER WITH BOTH",
(SUM(CASE WHEN ISHOMEOWNER = 'TRUE' AND OWNS_CAR = 'TRUE' THEN 1 ELSE 0 END)/ COUNT(*))*100 AS "PERCENTAGE",
SEC_TO_TIME((AVG(CASE WHEN ISHOMEOWNER = 'TRUE' AND OWNS_CAR = 'TRUE' THEN TIME_SPENT END) * 3600)) AS "AVERAGE TIME"
FROM SCOIALMEDIA;


# 10. Which profession spends the most time on social media, on average?
SELECT PROFESSION , SEC_TO_TIME((AVG(time_spent) * 60)*60) AS "MOST TIME SPENT" 
FROM SCOIALMEDIA
GROUP BY PROFESSION
ORDER BY AVG(TIME_SPENT) DESC
LIMIT 1;

# 11. How many users are in debt, and what is their average time spent on social media?
SELECT SUM(CASE WHEN INDEBT = 'TRUE' THEN 1 ELSE 0 END) AS "Total USERS have DEBT" ,  
SEC_TO_TIME((AVG(time_spent) * 60)*60) AS "AVERAGE TIME " 
FROM SCOIALMEDIA ;


# 	12. What is the correlation between income and time spent on social media?
SELECT INCOME , sec_to_time(TIME_SPENT * 3600) "SPENT TIME " FROM SCOIALMEDIA group by INCOME , TIME_SPENT ORDER BY INCOME , TIME_SPENT ;

# 13. Which demographic spends the most time on a particular platform?
SELECT DEMOGRAPHICS , PLATFORM , sec_to_time(SUM(TIME_SPENT) * 60)  FROM SCOIALMEDIA group by DEMOGRAPHICS , PLATFORM ORDER BY DEMOGRAPHICS , sec_to_time(SUM(TIME_SPENT) * 60)
DESC LIMIT 1;

# 14 How does the time spent on social media vary across different locations and income levels?
SELECT LOCATION  , PLATFORM , ROUND(AVG(INCOME),2) AS "AVERAG SALARY", sec_to_time(SUM(TIME_SPENT) * 60) AS "TOTAL TIME SPENT ON SOCIAL MEDIA"  FROM SCOIALMEDIA GROUP BY LOCATION , PLATFORM ORDER BY LOCATION , PLATFORM ,sec_to_time(SUM(TIME_SPENT) * 60)DESC;


 





 
