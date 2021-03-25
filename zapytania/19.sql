WITH suma AS (
	SELECT COUNT(offer_customer.id) AS policzone
	FROM customer
	INNER JOIN offer_customer ON customer.id = offer_customer.customer_id
	GROUP BY customer.id
	HAVING COUNT(offer_customer.id) != 0
)

SELECT CASE WHEN customer.nip IS NOT null THEN customer.nip ELSE customer.pesel END
FROM customer
INNER JOIN offer_customer ON customer.id = offer_customer.customer_id
INNER JOIN suma ON offer_customer.offer_id = suma.policzone
WHERE (SELECT MIN(suma.policzone) AS policzone FROM suma) + 20 <= suma.policzone