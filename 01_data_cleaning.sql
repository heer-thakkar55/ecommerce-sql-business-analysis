-- Cleaning olist_order_items
SET SQL_SAFE_UPDATES = 0;
DESCRIBE olist_order_items;
UPDATE olist_order_items set price = NULL where price = '';
UPDATE olist_order_items set freight_value=NULL where freight_value='';
UPDATE olist_order_items set order_item_id = NULL where order_item_id = '';
ALTER TABLE olist_order_items modify order_item_id INT, MODIFY price DECIMAL(10,2),MODIFY freight_value DECIMAL(10,2);
DESCRIBE olist_order_items;

-- cleaning olist_order_payments
select count(*) from olist_order_payments where payment_value='';
select count(*) from olist_order_payments where payment_installments = '';
ALTER TABLE olist_order_payments MODIFY payment_value DECIMAL (10,2),MODIFY payment_installments INT;
DESC olist_order_payments;
-- cleaning olist_products
DESC olist_products;
ALTER TABLE olist_products rename column product_name_lenght to product_name_length;
ALTER TABLE olist_products rename column product_description_lenght to product_description_length;
DESC olist_products;
select count(*) from olist_products where product_name_length = '';
select count(*) from olist_products where product_description_length = '';
select count(*) from olist_products where product_photos_qty = '';
select count(*) from olist_products where product_weight_g = '';
select count(*) from olist_products where product_height_cm = '';
select count(*) from olist_products where product_width_cm = '';
update olist_products set product_name_length = NULL WHERE product_name_length = '';
update olist_products set product_description_length = NULL WHERE product_description_length = '';
update olist_products set product_photos_qty = NULL where product_photos_qty = '';
update olist_products set product_length_cm = NULL WHERE product_length_cm = '';
update olist_products set product_width_cm = NULL WHERE product_width_cm = '';
update olist_products set product_height_cm = NULL WHERE product_height_cm = '';
update olist_products set product_weight_g = NULL where product_weight_g = '';
ALTER TABLE olist_products MODIFY product_name_length INT, MODIFY product_description_length INT, MODIFY product_photos_qty INT, MODIFY product_length_cm INT, MODIFY product_height_cm INT, MODIFY product_width_cm INT, MODIFY product_weight_g INT;
DESC olist_products;
-- cleaning olist_orders
DESC olist_orders;
select count(*) from olist_orders where order_purchase_timestamp = '';
select count(*) from olist_orders where order_approved_at = '';
select count(*) from olist_orders where order_delivered_carrier_date = '';
select count(*) from olist_orders where order_delivered_customer_date = '';
select count(*) from olist_orders where order_estimated_delivery_date = '';
update olist_orders set order_approved_at = NULL WHERE order_approved_at = '';
update olist_orders set order_delivered_carrier_date = NULL where order_delivered_carrier_date = '';
update olist_orders set order_delivered_customer_date= NULL WHERE order_delivered_customer_date = '';
ALTER TABLE olist_orders MODIFY order_purchase_timestamp DATETIME, MODIFY order_approved_at DATETIME, MODIFY order_delivered_carrier_date DATETIME, MODIFY order_delivered_customer_date DATETIME, MODIFY order_estimated_delivery_date DATETIME;
DESC olist_orders;