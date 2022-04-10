SELECT first_name,last_name,active,
CASE
	WHEN active=1 THEN 'ACTIVE'
	ELSE 'INACTIVE'
END activity_type
FROM customer

--Query utilizando CASE y una subquery
SELECT c.first_name,c.last_name,
	CASE
		WHEN active = 0 THEN 0
		ELSE 
			(SELECT count(*) FROM rental r
			 WHERE r.customer_id = c.customer_id)
	END num_rentals
FROM customer c

--Forma tradicional de resolver la query anterior
SELECT c.first_name,c.last_name,count(*) AS num_rentals
FROM customer AS c INNER JOIN rental AS r ON c.customer_id=r.customer_id
GROUP BY c.customer_id


SELECT strftime('%m', rental_date) AS rental_month, count(*) AS num_rentals
FROM rental
WHERE rental_date BETWEEN '2005-05-01' AND '2005-08-01'
GROUP BY strftime('%m', rental_date)

---Example
SELECT
	SUM(CASE
			WHEN strftime('%m', rental_date) = '05' THEN 1
			ELSE 0
			END) AS May_rentals,
	sum(CASE
			WHEN strftime('%m', rental_date) = '06' THEN 1
			ELSE 0
			END) AS June_rentals,
	sum(CASE
			WHEN strftime('%m', rental_date) = '07' THEN 1
			ELSE 0
			END) AS July_rentals
FROM rental
WHERE rental_date BETWEEN '2005-05-01' AND '2005-08-01'


--Example
SELECT a.first_name, a.last_name,
	CASE 
		WHEN EXISTS(SELECT 1
					FROM film_actor AS fa INNER JOIN film AS f ON fa.film_id=f.film_id
					WHERE fa.actor_id = a.actor_id AND f.rating='G') THEN 'Y'
		ELSE 'N'
	END g_actor,
	CASE 
		WHEN EXISTS(SELECT 1
					FROM film_actor AS fa INNER JOIN film AS f ON fa.film_id=f.film_id
					WHERE fa.actor_id = a.actor_id AND f.rating='PG') THEN 'Y'
		ELSE 'N'
	END pg_actor,
	CASE 
		WHEN EXISTS(SELECT 1
					FROM film_actor AS fa INNER JOIN film AS f ON fa.film_id=f.film_id
					WHERE fa.actor_id = a.actor_id AND f.rating='NC-17') THEN 'Y'
		ELSE 'N'
	END nc17_actor
FROM actor AS a
WHERE a.last_name LIKE 'S%' OR a.first_name LIKE 'S%'


--Example
SELECT f.title,
	CASE (SELECT count(*) 
		  FROM inventory AS i
		  WHERE i.film_id = f.film_id)
		WHEN 0 THEN 'Out of stock'
		WHEN 1 THEN 'Scarce'
		WHEN 2 THEN 'Scarce'
		WHEN 3 THEN 'Available'
		WHEN 4 THEN 'Available'
		ELSE 'Common'
	END film_availability
FROM film AS f

SELECT c.first_name, c.last_name,sum(p.amount) AS tot_payment_amt, count(p.amount) AS num_payments, sum(p.amount) /
	CASE
		WHEN count(p.amount) = 0 THEN 1
		ELSE count(p.amount)
	END avg_payment
FROM customer AS c LEFT OUTER JOIN payment as p ON c.customer_id = p.customer_id
GROUP BY c.first_name,c.last_name

--Example

SELECT c.first_name,c.last_name,
	CASE 
		WHEN a.address IS NULL THEN 'Unknown'
		ELSE a.address
	END address,
	
	CASE
		WHEN ct.city IS NULL THEN 'Unknown'
		ELSE ct.city
	END city,
	
	CASE
		WHEN cn.country IS NULL THEN 'Unknown'
		ELSE cn.country
	END country
FROM customer AS c LEFT OUTER JOIN address AS a ON c.address_id=a.address_id
	LEFT OUTER JOIN city AS ct ON a.city_id=ct.city_id
		LEFT OUTER JOIN country AS cn ON ct.country_id=cn.country_id









