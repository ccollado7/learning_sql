--Example

SELECT c.email
FROM customer AS c INNER JOIN rental AS r ON c.customer_id= r.customer_id
WHERE date(r.rental_date) = '2005-06-14'

--Example
SELECT c.email
FROM customer AS c INNER JOIN rental AS r ON c.customer_id= r.customer_id
WHERE date(r.rental_date) <> '2005-06-14'

--Example
DELETE FROM rental
WHERE year(rental_date=2004)

--Example
DELETE FROM rental
WHERE year(rental_date) <> 2005 AND year(rental_date) <> 2006

--Example
SELECT customer_id,rental_date
FROM rental
WHERE rental_date < '2005-05-25'

--Example
SELECT customer_id,rental_date
FROM rental
WHERE rental_date <= '2005-06-16' AND rental_date >= '2005-06-14'

--Example
SELECT customer_id,rental_date
FROM rental
WHERE rental_date BETWEEN '2005-06-14' and '2005-06-16'

--Example
SELECT customer_id,rental_date
FROM rental
WHERE rental_date BETWEEN '2005-06-16' AND '2005-06-14'

--Example
SELECT customer_id,payment_date,amount
FROM payment
WHERE amount BETWEEN 10.0 AND 11.99

--Example
SELECT last_name, first_name
FROM customer
WHERE last_name BETWEEN 'FA' AND 'FR'

--Example
SELECT last_name, first_name
FROM customer
WHERE last_name BETWEEN 'FA' AND 'FRB'

--Example
SELECT title,rating
FROM film
WHERE rating='G' OR rating='PG'

--Example
SELECT title,rating
FROM film
WHERE rating IN ('G','PG')

--Exampple
SELECT title,rating
FROM film
WHERE rating IN (
	SELECT rating
	FROM film
	WHERE title LIKE '%PET%')

--Example
SELECT title,rating
FROM film
WHERE rating NOT IN ('PG-13','R','NC-17')

--Example
SELECT last_name, first_name
FROM customer
WHERE substr(last_name,1)='Q'


--Example
SELECT last_name,first_name
FROM customer
WHERE last_name LIKE '_A_T%S'

--Example
SELECT last_name,first_name
FROM customer
WHERE last_name LIKE 'Q%' OR last_name LIKE 'Y%'

--Example
SELECT last_name,first_name
FROM customer
WHERE last_name REGEXP '^[QY]'


--Example
SELECT rental_id,customer_id, return_date
FROM rental
WHERE return_date IS NULL

--Example
SELECT rental_id,customer_id,return_date
from rental
WHERE return_date = NULL

--Example
SELECT rental_id,customer_id,rental_date
FROM rental
WHERE rental_date IS NOT NULL

--Example
SELECT rental_id,customer_id,return_date
FROM rental
WHERE rental_date NOT BETWEEN '2005-05-01' AND '2005-09-01'

--Example
SELECT rental_id,customer_id,return_date
FROM rental
WHERE (rental_date IS NULL) OR (return_date NOT BETWEEN '2005-05-01' AND '2005-09-01')








