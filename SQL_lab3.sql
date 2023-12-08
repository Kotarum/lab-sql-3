use sakila;

-- 1. How many distinct (different) actors' last names are there?
SELECT COUNT(DISTINCT last_name)  FROM actor a ;

-- 2. In how many different languages where the films originally produced?
SELECT COUNT(DISTINCT language_id) from film f;  

-- 3. How many movies were released with "PG-13" rating?
SELECT COUNT(*) FROM film f where rating = 'PG-13';

-- 4. Get 10 the longest movies from 2006
select * FROM film f 
WHERE f.release_year = 2006
ORDER BY `length` DESC 
Limit 10;

-- 5. How many days has been the company operating?
SELECT DATEDIFF(MAX(payment_date), MIN(payment_date)) as 'Company days'  FROM payment p ;

-- 6. Show rental info with additional columns month and weekday. Get 20.
SELECT * , 
DATE_FORMAT(rental_date, '%Y-%m-%d') AS date,
MONTH (rental_date) as month,
DAYNAME(rental_date) as weekday 
FROM rental r 
limit 20;

-- 7. Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT rental_id, customer_id, staff_id, 
       DATE_FORMAT(rental_date, '%Y-%m-%d') AS date,
       MONTH(rental_date) AS month,
       DAYNAME(rental_date) AS weekday,
       CASE 
           WHEN DAYOFWEEK(rental_date) IN (1, 7) THEN 'weekend'
           ELSE 'workday'
       END AS day_type
FROM rental
LIMIT 20;

-- 8. How many rentals were in the last month of activity?
SELECT COUNT(*) AS rental_count
FROM rental
WHERE DATE_FORMAT(rental_date, '%Y-%m') = DATE_FORMAT(NOW(), '%Y-%m');



