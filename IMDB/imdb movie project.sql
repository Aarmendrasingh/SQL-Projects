use imdb;
select  * from imdb; -- view data 

select count(*) from imdb;  -- number of rows are 179

alter table imdb  drop column overview;  -- poster_link is unused to analyze, so we dropped it.alter

-- Retrieve all records from the IMDb Movies dataset.
select * from imdb;

-- Select distinct genres of movies.
select distinct(substring_index(genre , ',' , 1)) from imdb;

-- Find the total number of movies released in the dataset.
select count(distinct(series_title)) from imdb;

-- List movies along with their release year and IMDb rating. 
select series_title , released_year , imdb_rating from imdb;

-- Find all movies with an IMDb rating greater than 8.0.
select series_title , imdb_rating from imdb where imdb_rating > 8.0;

-- List all movies released in 2020 along with their runtime.
select series_title , released_year , runtime  from imdb where released_year = 2020;

-- Retrieve the top 10 highest-rated movies based on IMDb rating.
select * from imdb order by imdb_rating desc limit 10; 

-- Find the average runtime of movies for each genre.
SELECT 
    SUBSTRING_INDEX(genre, ',', 1) AS Genres,
    ROUND(AVG(runtime), 2) AS 'Average runtime'
FROM
    imdb
GROUP BY SUBSTRING_INDEX(genre, ',', 1); 

-- List the number of movies released each year.
SELECT 
    released_year,
    COUNT(series_title) AS 'Number of movie released in each year'
FROM
    imdb
GROUP BY released_year
ORDER BY COUNT(series_title) DESC; 

-- Find all movies directed by a specific director (e.g., "Christopher Nolan").
select series_title , director from imdb where director =  "Christopher Nolan";

-- Retrieve movies with a metascore greater than 75 and an IMDb rating greater than 8.0.
select * from imdb where meta_score > 75 and imdb_rating > 8.0;

-- List all movies where the certificate is "PG-13" and the runtime is over 2 hours.
select * from imdb where certificate = 'PG-13' and runtime > "120 min"; 

 -- Find the top 3 movies with the highest number of votes.
 select * from imdb order by no_of_votes desc limit 3;
 
 -- Calculate the total gross income of all movies grouped by genre.
 select substring_index(genre , ',' , 1) as "Genres" , sum(gross) as " Gross Income" from imdb;
 
-- List all movies where the runtime is above the average runtime for all movies.
select * from imdb
where runtime > (select round(avg(runtime),2) from imdb) ;

 -- Retrieve the top 5 directors who have directed the highest number of movies.
 select director , count(series_title) as "Total_movies" from imdb group by director order by Total_movies desc limit 5;
 
 -- Calculate the percentage of movies released in each year.
 select released_year , count(*) , ROUND((COUNT(*) * 100.0 / (SELECT COUNT(*) FROM imdb)), 2) AS percentage_of_movies
 from imdb group by released_year;
 
 -- Find the movie(s) with the highest gross income, and the director and stars associated with it.
SELECT 
    director, star1, star2, star3, star4, gross
FROM
    imdb
WHERE
    gross = (SELECT 
            MAX(gross)
        FROM
            imdb); 
            
-- Retrieve all movies that have an IMDb rating above 8 and gross income greater than $100 million
SELECT *
FROM imdb
WHERE imdb_rating > 8
AND gross > 100000000;

