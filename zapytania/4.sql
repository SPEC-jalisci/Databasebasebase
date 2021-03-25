SELECT customer.id, customer.first_name, customer.last_name
FROM offer_customer
INNER JOIN customer ON offer_customer.customer_id = customer.id
INNER JOIN offer ON offer_customer.offer_id = offer.id
INNER JOIN product ON offer.product_id = product.id
INNER JOIN product_category ON product.category_id = product_category.id
GROUP BY customer.id 
HAVING (STRING_AGG(product_category.value,',') LIKE '%hardware%' AND STRING_AGG(product_category.value,',') LIKE '%licencja_3%')
OR (STRING_AGG(product_category.value,',') LIKE '%hardware%' AND STRING_AGG(product_category.value,',') LIKE '%licencja_rok%');