SELECT ROUND(AVG(offer.offer_price), 3)
FROM offer_customer
INNER JOIN sale ON offer_customer.id = sale.id
INNER JOIN offer ON offer_customer.offer_id = offer.id