--example: create index idx_product_description on product(description)

CREATE INDEX idx_last_name_zad1 ON customer(last_name)
WHERE last_name ILIKE 'a%';

CREATE INDEX idx_last_name ON customer(last_name);
CREATE INDEX idx_offer_customer_id ON sale(offer_customer_id);
CREATE INDEX idx_product_value ON product_category(value);
CREATE INDEX idx_city ON address(city);
CREATE INDEX idx_transaction_date ON sale(transaction_date);
CREATE INDEX idx_offer_price ON offer(offer_price);
CREATE INDEX idx_regular_price ON offer(regular_price);
CREATE INDEX idx_invoice_and_shipment_address ON customer(invoice_address_id, shipment_address_id);
CREATE INDEX idx_offer_quantity ON offer(quantity);
CREATE INDEX idx_nip_and_pesel ON customer(nip, pesel);