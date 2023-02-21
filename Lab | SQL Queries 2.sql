# Documentation:
# https://dev.mysql.com/doc/refman/8.0/en/aggregate-functions.html

USE sakila;

# 1. Select all the actors with the first name ‘Scarlett’.
SELECT actor_id, first_name, last_name
FROM actor
WHERE first_name = 'Scarlett';

# 2. Select all the actors with the last name ‘Johansson’.
SELECT actor_id, first_name, last_name
FROM actor
WHERE last_name = 'Johansson';

# 3. How many films (movies) are available for rent?
SELECT *
FROM film;

#the answer depends on how you read the question. Below is a count of all the unique movie titles. Assuming the question is asking hom many movies can be rented, the answer is 1000. This doesn't account for if a movie had various copies.
SELECT COUNT(distinct title)
FROM film;

# 4. How many films have been rented?
SELECT COUNT(rental_date)
FROM rental;

# 5. What is the shortest and longest rental period?
SELECT 
  MAX(rental_duration) AS max_days_rented, 
  MIN(rental_duration) AS min_days_rented
FROM film;

# 6. What are the shortest and longest movie duration? Name the values max_duration and min_duration.
SELECT
  MAX(length) AS max_duration,
  MIN(length) AS min_duration
FROM film;

# 7. What's the average movie duration?
SELECT AVG(length) AS average_length
FROM film;

# 8. What's the average movie duration expressed in format (hours, minutes)?
SELECT
  -- FLOOR: rounding the value down
  -- AVG: Calculate the average of a column
  FLOOR(AVG(length) / 60) AS avg_hours, # /60 calculates the number of hours
  FLOOR(AVG(length) % 60) AS avg_min # % calculates using the remainder
FROM film;

# 9. How many movies longer than 3 hours?
SELECT COUNT(length)
FROM film
WHERE length > 180;

# 10.Get the name and email formatted. Example: Mary SMITH - mary.smith@sakilacustomer.org.

SELECT 
	CONCAT(
		UPPER(SUBSTRING(first_name, 1, 1)), #the upper gives the first letter a capital. The 1st '1' is for the position of the letter and the 2nd '1' is for the length
        LOWER(SUBSTRING(first_name, 2)),
        ' ',
        UPPER(last_name),
        ' - ',
        LOWER(email)
	) AS formatted_customer
FROM customer;

# 11. What's the length of the longest film title?
SELECT MAX(LENGTH(title)) AS characters_in_title, title
FROM film;
