--Example Page 161
SELECT customer_id,first_name,last_name
FROM customer
WHERE customer_id = (
	SELECT max(customer_id)
	FROM customer)
	
--Example Page 162
SELECT max(customer_id)
FROM customer

--Example Page 162
SELECT customer_id,first_name,last_name
FROM customer
WHERE customer_id = 599

--Example Page 163
SELECT city_id,city
FROM city
where country_id <> (
	SELECT country_id
	from country
	WHERE country = 'India')

--Example Page 164
SELECT city_id,city
FROM city
where country_id <> (
	SELECT country_id
	from country
	WHERE country <> 'India')
	
--Example Page 164
SELECT country_id
FROM country
WHERE country <> 'India'

--Example Page 165
SELECT country_id
FROM country
WHERE country in ('Canada','Mexico')
	
--Example Page 165
SELECT country_id
FROM country
WHERE country='Canada' OR country='Mexico'
	
--Example Page 165
SELECT city_id,city
FROM city
WHERE country_id IN (
	SELECT country_id
	FROM country
	WHERE country in ('Canada','Mexico'))
	
--Example Page 166
SELECT city_id,city
FROM city
WHERE country_id NOT IN (
	SELECT country_id
	FROM country
	WHERE country in ('Canada','Mexico'))
	
--Example Page 167
SELECT first_name,last_name
FROM customer
WHERE customer_id <> ALL (
	SELECT customer_id
	FROM payment
	WHERE amount = 0)
	
--Example Page 167
SELECT first_name,last_name
FROM customer
WHERE customer_id NOT IN (
	SELECT customer_id
	FROM payment
	WHERE amount=0)
	
--Example Page 168
SELECT first_name,last_name
FROM customer
where customer_id NOT IN (122,452,NULL)

--Example Page 168
SELECT customer_id,count(*)
from rental
GROUP by customer_id
HAVING count(*) > ALL (
	SELECT count(*)
	FROM rental r INNER JOIN customer c ON r.customer_id= c.customer_id INNER JOIN address a ON c.address_id=a.address_id INNER JOIN city ct ON a.city_id=ct.city_id INNER JOIN country co ON ct.country_id=co.country_id
	WHERE co.country IN ('United States','Mexico','Canada')
	GROUP BY r.customer_id)
	
--Example Page 169
SELECT customer_id, sum(amount)
FROM payment
GROUP BY customer_id
HAVING sum(amount) > ANY (
	SELECT sum(p.amount)
	FROM payment p INNER JOIN customer c ON p.customer_id=c.customer_id INNER JOIN address a ON c.address_id=a.address_id INNER JOIN city ct ON a.city_id=ct.city_id INNER JOIN country co ON  ct.country_id=co.country_id
	WHERE co.country IN ('Bolivia','Paraguay','Chile')
	GROUP BY co.country)

SELECT sum(p.amount)
FROM payment p INNER JOIN customer c ON p.customer_id=c.customer_id INNER JOIN address a ON c.address_id=a.address_id INNER JOIN city ct ON a.city_id=ct.city_id INNER JOIN country co ON  ct.country_id=co.country_id
WHERE co.country IN ('Bolivia','Paraguay','Chile')
GROUP BY co.country	
	
--Example Page 169
SELECT fa.actor_id, fa.film_id
from film_actor fa
WHERE fa.actor_id IN (SELECT actor_id FROM actor WHERE last_name='MONROE')
	AND fa.film_id IN (SELECT film_id FROM film WHERE rating='PG')
	
--Example Page 170
SELECT actor_id,film_id
FROM film_actor
WHERE (actor_id,film_id) IN (
	SELECT a.actor_id,f.film_id
	FROM actor a CROSS JOIN film f
	WHERE a.last_name='MONROE' AND f.rating='PG')
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	