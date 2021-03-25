SELECT product.id, offer.start_date, offer.offer_price
FROM offer_customer
INNER JOIN sale ON offer_customer.offer_id = sale.id
INNER JOIN offer ON offer_customer.customer_id = offer.id
INNER JOIN product ON product.id = offer.product_id
WHERE sale.transaction_date = offer.start_date AND offer.regular_price = offer.offer_price
ORDER BY offer.offer_price DESC