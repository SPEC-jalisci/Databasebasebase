SELECT ROUND(AVG(offer.offer_price), 2)
FROM offer_customer
INNER JOIN sale ON offer_customer.id = sale.id
INNER JOIN offer ON offer_customer.offer_id = offer.id
INNER JOIN customer ON offer_customer.customer_id = customer.id
INNER JOIN address ON customer.invoice_address_id = address.id AND customer.shipment_address_id = address.id
WHERE address.city = 'Kraków' AND ((offer.regular_price-offer.offer_price)/offer.regular_price) > 0.10;