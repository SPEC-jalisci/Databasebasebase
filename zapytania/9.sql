SELECT AVG(offer.offer_price)
FROM offer_customer
INNER JOIN sale ON offer_customer.id = sale.id
INNER JOIN offer ON offer_customer.offer_id = offer.id
INNER JOIN customer ON offer_customer.customer_id = customer.id
INNER JOIN address ON customer.invoice_address_id = address.id
WHERE address.city = 'Kraków'