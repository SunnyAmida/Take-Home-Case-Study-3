-- ============================================================
-- Sales schema
-- ============================================================

CREATE TABLE IF NOT EXISTS sales.buying_groups (
    buying_group_id INTEGER PRIMARY KEY,
    buying_group_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS sales.customer_categories (
    customer_category_id INTEGER PRIMARY KEY,
    customer_category_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS sales.customers (
    customer_id INTEGER PRIMARY KEY,
    customer_name TEXT NOT NULL,
    bill_to_customer_id INTEGER,
    customer_category_id INTEGER NOT NULL,
    buying_group_id INTEGER,
    primary_contact_person_id INTEGER,
    alternate_contact_person_id INTEGER,
    delivery_method_id INTEGER,
    delivery_city_id INTEGER,
    credit_limit NUMERIC(18,2),
    account_opened_date DATE,
    standard_discount_percentage NUMERIC(10,3),
    is_statement_sent BOOLEAN NOT NULL,
    is_on_credit_hold BOOLEAN NOT NULL,
    payment_days INTEGER,
    phone_number TEXT,
    website_url TEXT,
    delivery_address_line TEXT,
    delivery_location_lat NUMERIC(12,7),
    delivery_location_long NUMERIC(12,7)
);

CREATE TABLE IF NOT EXISTS sales.customer_transactions (
    customer_transaction_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    transaction_type_id INTEGER NOT NULL,
    invoice_id INTEGER,
    payment_method_id INTEGER,
    transaction_date DATE NOT NULL,
    amount_excluding_tax NUMERIC(18,2) NOT NULL,
    tax_amount NUMERIC(18,2) NOT NULL,
    transaction_amount NUMERIC(18,2) NOT NULL,
    outstanding_balance NUMERIC(18,2) NOT NULL,
    finalization_date DATE,
    is_finalized BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS sales.special_deals (
    special_deal_id INTEGER PRIMARY KEY,
    stock_item_id INTEGER,
    customer_id INTEGER,
    buying_group_id INTEGER,
    customer_category_id INTEGER,
    stock_group_id INTEGER,
    deal_description TEXT,
    start_date DATE,
    end_date DATE,
    discount_amount NUMERIC(18,2),
    discount_percentage NUMERIC(10,3),
    unit_price NUMERIC(18,2),
    last_edited_by INTEGER,
    last_edited_when TIMESTAMP
);

CREATE TABLE IF NOT EXISTS sales.orders (
    order_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    salesperson_person_id INTEGER,
    picked_by_person_id INTEGER,
    contact_person_id INTEGER,
    backorder_order_id INTEGER,
    order_date DATE NOT NULL,
    expected_delivery_date DATE,
    customer_purchase_order_number TEXT,
    is_undersupply_backordered BOOLEAN NOT NULL,
    picking_completed_when TIMESTAMP
);

CREATE TABLE IF NOT EXISTS sales.order_lines (
    order_line_id INTEGER PRIMARY KEY,
    order_id INTEGER NOT NULL,
    stock_item_id INTEGER NOT NULL,
    description TEXT NOT NULL,
    package_type_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price NUMERIC(18,2) NOT NULL,
    tax_rate NUMERIC(10,3) NOT NULL,
    picked_quantity INTEGER NOT NULL,
    picking_completed_when TIMESTAMP
);

CREATE TABLE IF NOT EXISTS sales.invoices (
    invoice_id INTEGER PRIMARY KEY,
    customer_id INTEGER NOT NULL,
    bill_to_customer_id INTEGER NOT NULL,
    order_id INTEGER,
    delivery_method_id INTEGER,
    contact_person_id INTEGER,
    accounts_person_id INTEGER,
    salesperson_person_id INTEGER,
    packed_by_person_id INTEGER,
    invoice_date DATE NOT NULL,
    customer_purchase_order_number TEXT,
    delivery_instructions TEXT,
    total_dry_items INTEGER,
    total_chiller_items INTEGER,
    confirmed_delivery_time TIMESTAMP,
    confirmed_received_by TEXT
);

CREATE TABLE IF NOT EXISTS sales.invoice_lines (
    invoice_line_id INTEGER PRIMARY KEY,
    invoice_id INTEGER NOT NULL,
    stock_item_id INTEGER NOT NULL,
    description TEXT NOT NULL,
    package_type_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL,
    unit_price NUMERIC(18,2) NOT NULL,
    tax_rate NUMERIC(10,3) NOT NULL,
    tax_amount NUMERIC(18,2) NOT NULL,
    line_profit NUMERIC(18,2) NOT NULL,
    extended_price NUMERIC(18,2) NOT NULL
);