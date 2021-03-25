WITH dane AS (
	SELECT sale.offer_customer_id, customer.id, customer.last_name
	FROM offer_customer
	INNER JOIN customer ON offer_customer.customer_id = customer.id
	INNER JOIN sale ON offer_customer.id = sale.offer_customer_id
	GROUP BY customer.id, sale.offer_customer_id
)

SELECT dane.id
FROM dane
GROUP BY dane.id, dane.last_name
HAVING COUNT(dane.offer_customer_id) = (
		SELECT COUNT(dane.offer_customer_id)
		FROM dane
		GROUP BY dane.id
		ORDER BY COUNT(dane.offer_customer_id) DESC
		LIMIT 1
)
ORDER BY COUNT(dane.offer_customer_id) DESC, dane.last_name DESC;