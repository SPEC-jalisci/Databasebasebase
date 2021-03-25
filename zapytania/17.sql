SELECT CAST((CAST((
	SELECT COUNT(customer.id) AS l1 FROM customer
	WHERE customer.pesel IS NOT null AND customer.nip IS null) AS DECIMAL)
	/ CAST((SELECT COUNT(customer.id) AS l2 FROM customer) AS DECIMAL) * 100.0) AS DECIMAL(3,1))