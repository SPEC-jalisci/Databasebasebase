SELECT customer.id
FROM offer_customer
INNER JOIN customer ON offer_customer.customer_id = customer.id
INNER JOIN address ON customer.invoice_address_id = address.id AND customer.shipment_address_id = address.id
INNER JOIN sale ON offer_customer.id = sale.offer_customer_id
INNER JOIN offer ON offer_customer.offer_id = offer.id
INNER JOIN product ON offer.product_id = product.id
INNER JOIN product_category ON product.category_id = product_category.id
WHERE (product_category.value = 'hardware' OR product_category.value = 'licencja_rok')
AND (address.city = 'Warszawa' OR address.city = 'Wrocław') AND sale.transaction_date < '2018-01-01'
GROUP BY customer.id;