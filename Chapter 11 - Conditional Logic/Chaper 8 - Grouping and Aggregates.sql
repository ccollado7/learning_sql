-- Example
SELECT customer_id
FROM rental

-- Example
SELECT customer_id
FROM rental
GROUP BY customer_id

-- Example
SELECT customer_id,count(*) AS count_films
FROM rental
GROUP BY customer_id
ORDER BY count_films DESC

-- Example
SELECT customer_id,count(*) AS count_films
FROM rental
GROUP BY customer_id
HAVING count(*) >= 40
ORDER BY count_films DESC

--Example
SELECT max(amount) AS max_amt, min(amount) AS min_amt,avg(amount) AS avg_amt,sum(amount) AS tot_amt,count(*) AS num_payments
FROM payment

--Example
SELECT customer_id,max(amount) AS max_amt, min(amount) AS min_amt,avg(amount) AS avg_amt,sum(amount) AS tot_amt,count(*) AS num_payments
FROM payment
GROUP BY customer_id

--Example
SELECT count(customer_id) AS num_rows, count(DISTINCT customer_id) AS num_customers
FROM payment

--Example
SELECT max(datediff(return_date,rental_date))
FROM rental

--Example
SELECT actor_id,count(*)
FROM film_actor
GROUP BY actor_id

--Example
SELECT fa.actor_id, f.rating,count(*)
FROM film_actor AS fa INNER JOIN film f ON fa.film_id=f.film_id
GROUP BY fa.actor_id, f.rating
ORDER BY 1,2

--Example
SELECT strftime('%Y', rental_date) AS year, count(*) AS how_many
FROM rental
GROUP BY strftime('%Y', rental_date)

--Example
SELECT fa.actor_id,f.rating,count(*)
FROM film_actor fa INNER JOIN f ON fa.film_id=F.film_id
GROUP BY fa.actor_id, f.rating WITH ROLLUP
ORDER BY 1,2

--Example
SELECT fa.actor_id,f.rating,count(*)
FROM film_actor fa INNER JOIN film f ON fa.film_id=f.film_id
WHERE f.rating IN ('G','PG')
GROUP BY fa.actor_id,f.rating
HAVING count(*) > 9







