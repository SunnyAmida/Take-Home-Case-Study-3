-- ============================================================
-- Add remaining Foreign Keys
-- ============================================================

-- ============================================================
-- PURCHASING
-- ============================================================

ALTER TABLE purchasing.purchase_orders
    ADD CONSTRAINT fk_purchase_order_supplier
    FOREIGN KEY (supplier_id)
    REFERENCES purchasing.suppliers(supplier_id);

ALTER TABLE purchasing.purchase_orders
    ADD CONSTRAINT fk_purchase_order_delivery_method
    FOREIGN KEY (delivery_method_id)
    REFERENCES application.delivery_methods(delivery_method_id);

ALTER TABLE purchasing.purchase_orders
    ADD CONSTRAINT fk_purchase_order_contact
    FOREIGN KEY (contact_person_id)
    REFERENCES application.people(person_id);

ALTER TABLE purchasing.purchase_order_lines
    ADD CONSTRAINT fk_purchase_order_line_order
    FOREIGN KEY (purchase_order_id)
    REFERENCES purchasing.purchase_orders(purchase_order_id);

ALTER TABLE purchasing.purchase_order_lines
    ADD CONSTRAINT fk_purchase_order_line_stock_item
    FOREIGN KEY (stock_item_id)
    REFERENCES warehouse.stock_items(stock_item_id);

ALTER TABLE purchasing.purchase_order_lines
    ADD CONSTRAINT fk_purchase_order_line_package_type
    FOREIGN KEY (package_type_id)
    REFERENCES warehouse.package_types(package_type_id);

ALTER TABLE purchasing.supplier_transactions
    ADD CONSTRAINT fk_supplier_transaction_supplier
    FOREIGN KEY (supplier_id)
    REFERENCES purchasing.suppliers(supplier_id);

ALTER TABLE purchasing.supplier_transactions
    ADD CONSTRAINT fk_supplier_transaction_type
    FOREIGN KEY (transaction_type_id)
    REFERENCES application.transaction_types(transaction_type_id);

ALTER TABLE purchasing.supplier_transactions
    ADD CONSTRAINT fk_supplier_transaction_order
    FOREIGN KEY (purchase_order_id)
    REFERENCES purchasing.purchase_orders(purchase_order_id);

ALTER TABLE purchasing.supplier_transactions
    ADD CONSTRAINT fk_supplier_transaction_payment_method
    FOREIGN KEY (payment_method_id)
    REFERENCES application.payment_methods(payment_method_id);


-- ============================================================
-- WAREHOUSE
-- ============================================================

ALTER TABLE warehouse.stock_item_holdings
    ADD CONSTRAINT fk_stock_item_holding_item
    FOREIGN KEY (stock_item_id)
    REFERENCES warehouse.stock_items(stock_item_id);

ALTER TABLE warehouse.stock_item_stock_groups
    ADD CONSTRAINT fk_stock_item_stock_group_item
    FOREIGN KEY (stock_item_id)
    REFERENCES warehouse.stock_items(stock_item_id);

ALTER TABLE warehouse.stock_item_stock_groups
    ADD CONSTRAINT fk_stock_item_stock_group_group
    FOREIGN KEY (stock_group_id)
    REFERENCES warehouse.stock_groups(stock_group_id);

ALTER TABLE warehouse.stock_item_transactions
    ADD CONSTRAINT fk_stock_item_transaction_item
    FOREIGN KEY (stock_item_id)
    REFERENCES warehouse.stock_items(stock_item_id);

ALTER TABLE warehouse.stock_item_transactions
    ADD CONSTRAINT fk_stock_item_transaction_type
    FOREIGN KEY (transaction_type_id)
    REFERENCES application.transaction_types(transaction_type_id);

ALTER TABLE warehouse.stock_item_transactions
    ADD CONSTRAINT fk_stock_item_transaction_customer
    FOREIGN KEY (customer_id)
    REFERENCES sales.customers(customer_id);

ALTER TABLE warehouse.stock_item_transactions
    ADD CONSTRAINT fk_stock_item_transaction_invoice
    FOREIGN KEY (invoice_id)
    REFERENCES sales.invoices(invoice_id);

ALTER TABLE warehouse.stock_item_transactions
    ADD CONSTRAINT fk_stock_item_transaction_supplier
    FOREIGN KEY (supplier_id)
    REFERENCES purchasing.suppliers(supplier_id);

ALTER TABLE warehouse.stock_item_transactions
    ADD CONSTRAINT fk_stock_item_transaction_purchase_order
    FOREIGN KEY (purchase_order_id)
    REFERENCES purchasing.purchase_orders(purchase_order_id);


-- ============================================================
-- SALES - CUSTOMERS
-- ============================================================

ALTER TABLE sales.customers
    ADD CONSTRAINT fk_customer_bill_to
    FOREIGN KEY (bill_to_customer_id)
    REFERENCES sales.customers(customer_id);

ALTER TABLE sales.customers
    ADD CONSTRAINT fk_customer_category
    FOREIGN KEY (customer_category_id)
    REFERENCES sales.customer_categories(customer_category_id);

ALTER TABLE sales.customers
    ADD CONSTRAINT fk_customer_buying_group
    FOREIGN KEY (buying_group_id)
    REFERENCES sales.buying_groups(buying_group_id);

ALTER TABLE sales.customers
    ADD CONSTRAINT fk_customer_primary_contact
    FOREIGN KEY (primary_contact_person_id)
    REFERENCES application.people(person_id);

ALTER TABLE sales.customers
    ADD CONSTRAINT fk_customer_alternate_contact
    FOREIGN KEY (alternate_contact_person_id)
    REFERENCES application.people(person_id);

ALTER TABLE sales.customers
    ADD CONSTRAINT fk_customer_delivery_method
    FOREIGN KEY (delivery_method_id)
    REFERENCES application.delivery_methods(delivery_method_id);

ALTER TABLE sales.customers
    ADD CONSTRAINT fk_customer_delivery_city
    FOREIGN KEY (delivery_city_id)
    REFERENCES application.cities(city_id);


-- ============================================================
-- SALES - CUSTOMER TRANSACTIONS
-- ============================================================

ALTER TABLE sales.customer_transactions
    ADD CONSTRAINT fk_customer_transaction_customer
    FOREIGN KEY (customer_id)
    REFERENCES sales.customers(customer_id);

ALTER TABLE sales.customer_transactions
    ADD CONSTRAINT fk_customer_transaction_type
    FOREIGN KEY (transaction_type_id)
    REFERENCES application.transaction_types(transaction_type_id);

ALTER TABLE sales.customer_transactions
    ADD CONSTRAINT fk_customer_transaction_invoice
    FOREIGN KEY (invoice_id)
    REFERENCES sales.invoices(invoice_id);

ALTER TABLE sales.customer_transactions
    ADD CONSTRAINT fk_customer_transaction_payment_method
    FOREIGN KEY (payment_method_id)
    REFERENCES application.payment_methods(payment_method_id);


-- ============================================================
-- SALES - ORDERS
-- ============================================================

ALTER TABLE sales.orders
    ADD CONSTRAINT fk_order_customer
    FOREIGN KEY (customer_id)
    REFERENCES sales.customers(customer_id);

ALTER TABLE sales.orders
    ADD CONSTRAINT fk_order_salesperson
    FOREIGN KEY (salesperson_person_id)
    REFERENCES application.people(person_id);

ALTER TABLE sales.orders
    ADD CONSTRAINT fk_order_picked_by
    FOREIGN KEY (picked_by_person_id)
    REFERENCES application.people(person_id);

ALTER TABLE sales.orders
    ADD CONSTRAINT fk_order_contact
    FOREIGN KEY (contact_person_id)
    REFERENCES application.people(person_id);

ALTER TABLE sales.orders
    ADD CONSTRAINT fk_order_backorder
    FOREIGN KEY (backorder_order_id)
    REFERENCES sales.orders(order_id);


-- ============================================================
-- SALES - ORDER LINES
-- ============================================================

ALTER TABLE sales.order_lines
    ADD CONSTRAINT fk_order_line_order
    FOREIGN KEY (order_id)
    REFERENCES sales.orders(order_id);

ALTER TABLE sales.order_lines
    ADD CONSTRAINT fk_order_line_stock_item
    FOREIGN KEY (stock_item_id)
    REFERENCES warehouse.stock_items(stock_item_id);

ALTER TABLE sales.order_lines
    ADD CONSTRAINT fk_order_line_package_type
    FOREIGN KEY (package_type_id)
    REFERENCES warehouse.package_types(package_type_id);


-- ============================================================
-- SALES - INVOICES
-- ============================================================

ALTER TABLE sales.invoices
    ADD CONSTRAINT fk_invoice_customer
    FOREIGN KEY (customer_id)
    REFERENCES sales.customers(customer_id);

ALTER TABLE sales.invoices
    ADD CONSTRAINT fk_invoice_bill_to_customer
    FOREIGN KEY (bill_to_customer_id)
    REFERENCES sales.customers(customer_id);

ALTER TABLE sales.invoices
    ADD CONSTRAINT fk_invoice_order
    FOREIGN KEY (order_id)
    REFERENCES sales.orders(order_id);

ALTER TABLE sales.invoices
    ADD CONSTRAINT fk_invoice_delivery_method
    FOREIGN KEY (delivery_method_id)
    REFERENCES application.delivery_methods(delivery_method_id);

ALTER TABLE sales.invoices
    ADD CONSTRAINT fk_invoice_contact
    FOREIGN KEY (contact_person_id)
    REFERENCES application.people(person_id);

ALTER TABLE sales.invoices
    ADD CONSTRAINT fk_invoice_accounts_person
    FOREIGN KEY (accounts_person_id)
    REFERENCES application.people(person_id);

ALTER TABLE sales.invoices
    ADD CONSTRAINT fk_invoice_salesperson
    FOREIGN KEY (salesperson_person_id)
    REFERENCES application.people(person_id);

ALTER TABLE sales.invoices
    ADD CONSTRAINT fk_invoice_packed_by
    FOREIGN KEY (packed_by_person_id)
    REFERENCES application.people(person_id);


-- ============================================================
-- SALES - INVOICE LINES
-- ============================================================

ALTER TABLE sales.invoice_lines
    ADD CONSTRAINT fk_invoice_line_invoice
    FOREIGN KEY (invoice_id)
    REFERENCES sales.invoices(invoice_id);

ALTER TABLE sales.invoice_lines
    ADD CONSTRAINT fk_invoice_line_stock_item
    FOREIGN KEY (stock_item_id)
    REFERENCES warehouse.stock_items(stock_item_id);

ALTER TABLE sales.invoice_lines
    ADD CONSTRAINT fk_invoice_line_package_type
    FOREIGN KEY (package_type_id)
    REFERENCES warehouse.package_types(package_type_id);