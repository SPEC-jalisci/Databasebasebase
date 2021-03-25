SELECT SUM(zad16.policzone) FROM (
	SELECT COUNT(customer.id) AS policzone
	FROM customer
	INNER JOIN address ON address.id = customer.shipment_address_id
	GROUP BY address.id
	HAVING COUNT(customer.id) > 1
) AS zad16