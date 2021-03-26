WITH dane AS (
    SELECT customer.id
    FROM offer_customer
    INNER JOIN sale ON offer_customer.id = sale.offer_customer_id
    INNER JOIN customer ON offer_customer.customer_id = customer.id
    WHERE (sale.transaction_date BETWEEN '2019-01-01' AND '2019-12-31') AND customer.invoice_address_id != customer.shipment_address_id
    GROUP BY customer.id
    HAVING COUNT(sale.transaction_date) >= 3
)

SELECT COUNT(dane.id) FROM dane