SELECT COUNT(*) FROM film
WHERE length > 
(
SELECT AVG(length)
FROM film
);

SELECT COUNT(*) FROM film
WHERE rental_rate =  
(
SELECT MAX(rental_rate)
FROM film
);

SELECT * FROM film
WHERE film_id = ANY
(
SELECT film_id FROM film
WHERE 
rental_rate = (SELECT MIN(rental_rate) FROM film)
AND
replacement_cost = (SELECT MIN(replacement_cost) FROM film)
);

SELECT customer.first_name, customer.last_name, COUNT(payment.customer_id)
FROM payment
INNER JOIN customer
ON payment.customer_id = customer.customer_id
GROUP BY customer.first_name, customer.last_name, payment.customer_id
ORDER BY COUNT(*) DESC
LIMIT 1;

