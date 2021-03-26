SELECT product.id
FROM offer_customer
INNER JOIN sale ON offer_customer.offer_id = sale.id
INNER JOIN offer ON offer_customer.customer_id = offer.id
INNER JOIN product ON product.id = offer.product_id
WHERE product.id BETWEEN 5 AND 50
GROUP BY product.id
HAVING MAX(offer.quantity) = 1