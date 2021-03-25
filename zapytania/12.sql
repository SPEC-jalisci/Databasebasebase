SELECT product.id
FROM offer_customer
INNER JOIN sale ON offer_customer.offer_id = sale.id
INNER JOIN offer ON offer_customer.customer_id = offer.id
INNER JOIN product ON product.id = offer.product_id
GROUP BY product.id 
ORDER BY COUNT(product.id) DESC, product.id
LIMIT 1;