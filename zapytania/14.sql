SELECT product.id
FROM offer_customer
INNER JOIN sale ON offer_customer.offer_id = sale.id
INNER JOIN offer ON offer_customer.customer_id = offer.id
INNER JOIN product ON product.id = offer.product_id
WHERE product.id >= 5 AND product.id <= 50 /* przedział otwarty czy zamknięty??? */
GROUP BY product.id
HAVING MAX(offer.quantity) = 1