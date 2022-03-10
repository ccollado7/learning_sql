--Example Page 46
SELECT first_name,last_name
FROM customer
WHERE last_name='ZIEGLER'

--Example Page 47
SELECT *
FROM category

--Example Page 48
SELECT language_id,name,last_update
FROM language

--Example Page 49
SELECT name
FROM language

--Example Page 50
SELECT language_id, 'COMMON' language_usage, language_id*3.1415927 lang_pi_value, upper(name) language_name
FROM language

--Example Page 51
SELECT language_id, 'COMMON' AS language_usage, language_id*3.1415927 AS lang_pi_value, upper(name) AS language_name
FROM language

--Example Page 51
SELECT actor_id
FROM film_actor
ORDER BY actor_id

--Example Page 52
SELECT DISTINCT actor_id
FROM film_actor
ORDER BY actor_id

--Example Page 53
SELECT cust.last_name || ', ' || cust.first_name AS full_name
FROM (
	SELECT first_name,last_name,email
	FROM customer
	WHERE first_name='JESSIE')
	cust
	
--Example Page 57
SELECT c.first_name,c.last_name,time(r.rental_date) rental_time
FROM customer c INNER JOIN rental r ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'

--Example Page 57
SELECT c.first_name,c.last_name,time(r.rental_date) rental_time
FROM customer AS c INNER JOIN rental AS r ON c.customer_id = r.customer_id
WHERE date(r.rental_date) = '2005-06-14'

--Example Page 58
SELECT title
FROM film
WHERE rating = 'G' AND rental_duration >=7

--Example Page 59
SELECT title
FROM film
WHERE rating = 'G' OR rental_duration >=7

--Example Page 59
SELECT title,rating,rental_duration
FROM film
WHERE (rating = 'G' AND rental_duration >=7) OR (rating = 'PG-13' AND rental_duration < 4)