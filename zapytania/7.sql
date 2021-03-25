SELECT COUNT(offer_customer.id)
FROM offer_customer
INNER JOIN sale ON offer_customer.offer_id = sale.id
INNER JOIN offer ON offer_customer.customer_id = offer.id
WHERE sale.transaction_date = offer.end_date