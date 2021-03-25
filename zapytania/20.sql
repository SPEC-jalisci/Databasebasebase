WITH tenNip AS (
	SELECT SUM(offer.offer_price) AS tenJedyny 
	FROM customer 
	INNER JOIN offer_customer ON offer_customer.customer_id = customer.id
	INNER JOIN offer ON offer_customer.offer_id = offer.id
	WHERE customer.nip = 1000000000
)

SELECT SUM(moreLess.wiecej) AS wiecej, SUM(moreLess.mniej) AS mniej FROM (
	SELECT CASE WHEN (SELECT tenJedyny FROM tenNip LIMIT 1) < SUM(offer.offer_price) THEN 1 ELSE 0 END AS wiecej,
	   	   CASE WHEN (SELECT tenJedyny FROM tenNip LIMIT 1) > SUM(offer.offer_price) THEN 1 ELSE 0 END AS mniej
	FROM customer
	INNER JOIN offer_customer ON offer_customer.customer_id = customer.id
	INNER JOIN offer ON offer_customer.offer_id = offer.id
	GROUP BY customer.nip
) AS moreLess