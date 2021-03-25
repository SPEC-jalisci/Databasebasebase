SELECT customer.last_name, (CASE WHEN customer.nip IS NOT null THEN customer.nip ELSE customer.pesel END) nipLubPesel
FROM offer
INNER JOIN offer_customer ON offer_customer.offer_id = offer.id
INNER JOIN customer ON offer_customer.customer_id = customer.id
WHERE offer.offer_price/offer.regular_price <= 0.8
ORDER BY nipLubPesel