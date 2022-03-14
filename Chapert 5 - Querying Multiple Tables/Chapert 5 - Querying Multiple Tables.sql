--Example
SELECT c.first_name,c.last_name,a.address
FROM customer AS c JOIN address AS a

--Example
SELECT c.first_name,c.last_name,a.address
FROM customer AS c JOIN address AS a ON c.address_id=a.address_id

--Example
SELECT c.first_name,c.last_name,a.address
from customer AS c INNER JOIN address AS a USING(address_id)

--Example
SELECT c.first_name,c.last_name,a.address
FROM customer AS c, address AS a
WHERE c.address_id=a.address_id

--Example
SELECT c.first_name,c.last_name,a.address
FROM customer AS c, address AS a
WHERE c.address_id=a.address_id AND a.postal_code=52137

--Example
SELECT c.first_name,c.last_name,a.address
FROM customer AS c INNER JOIN address AS a ON c.address_id=a.address_id
WHERE a.postal_code=52137

--Example
SELECT c.first_name,c.last_name,ct.city
FROM customer AS c INNER JOIN address AS a ON c.address_id=a.address_id INNER JOIN city AS ct ON a.city_id=ct.city_id

--Example
SELECT c.first_name,c.last_name,addr.address,addr.city
FROM customer c INNER JOIN (
	SELECT a.address_id,a.address,ct.city
	FROM address a INNER JOIN city ct ON a.city_id=ct.city_id
	WHERE a.district='California') addr
ON c.address_id=addr.address_id

--Example
SELECT a.address_id,a.address,ct.city
FROM address a INNER JOIN city ct ON a.city_id=ct.city_id
WHERE a.district='California'

--Example
SELECT f.title
FROM film f INNER JOIN film_actor fa ON f.film_id=fa.film_id
	INNER JOIN actor a ON fa.actor_id=a.actor_id
WHERE ((a.first_name='CATE' AND a.last_name='MCQUEEN')OR (a.first_name='CUBA' AND a.last_name='BIRCH'))

--Example
SELECT f.title
FROM film f
	INNER JOIN film_actor fa1
	ON f.film_id = fa1.film_id
	INNER JOIN actor a1
	ON fa1.actor_id = a1.actor_id
	INNER JOIN film_actor fa2
	ON f.film_id = fa2.film_id
	INNER JOIN actor a2
	ON fa2.actor_id = a2.actor_id
	WHERE (a1.first_name = 'CATE' AND a1.last_name = 'MCQUEEN')
	AND (a2.first_name = 'CUBA' AND a2.last_name = 'BIRCH');








