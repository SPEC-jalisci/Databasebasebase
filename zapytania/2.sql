SELECT customer.id
FROM offer_customer
INNER JOIN customer ON offer_customer.customer_id = customer.id
INNER JOIN sale ON offer_customer.id = sale.offer_customer_id
GROUP BY customer.id, sale.id
HAVING COUNT(sale.id) > 0
ORDER BY COUNT(sale.id), customer.last_name
LIMIT 1;