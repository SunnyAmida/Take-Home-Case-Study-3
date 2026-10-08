-- ============================================================
-- Purchasing schema
-- ============================================================

CREATE TABLE IF NOT EXISTS purchasing.supplier_categories (
    supplier_category_id INTEGER PRIMARY KEY,
    supplier_category_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS purchasing.suppliers (
    supplier_id INTEGER PRIMARY KEY,
    supplier_name TEXT NOT NULL,
    supplier_category_id INTEGER NOT NULL,
    primary_contact_person_id INTEGER,
    alternate_contact_person_id INTEGER,
    delivery_method_id INTEGER,
    delivery_city_id INTEGER,
    postal_city_id INTEGER,
    supplier_reference TEXT,
    payment_days INTEGER,
    phone_number TEXT,
    website_url TEXT,
    delivery_address_line TEXT,
    delivery_location_lat NUMERIC(12,7),
    delivery_location_long NUMERIC(12,7)
);

CREATE TABLE IF NOT EXISTS purchasing.purchase_orders (
    purchase_order_id INTEGER PRIMARY KEY,
    supplier_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    delivery_method_id INTEGER NOT NULL,
    contact_person_id INTEGER NOT NULL,
    expected_delivery_date DATE,
    supplier_reference TEXT,
    is_order_finalized BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS purchasing.purchase_order_lines (
    purchase_order_line_id INTEGER PRIMARY KEY,
    purchase_order_id INTEGER NOT NULL,
    stock_item_id INTEGER NOT NULL,
    ordered_outers INTEGER NOT NULL,
    description TEXT NOT NULL,
    received_outers INTEGER NOT NULL,
    package_type_id INTEGER NOT NULL,
    expected_unit_price_per_outer NUMERIC(18,2),
    last_receipt_date DATE,
    is_order_line_finalized BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS purchasing.supplier_transactions (
    supplier_transaction_id INTEGER PRIMARY KEY,
    supplier_id INTEGER NOT NULL,
    transaction_type_id INTEGER NOT NULL,
    purchase_order_id INTEGER,
    payment_method_id INTEGER,
    supplier_invoice_number TEXT,
    transaction_date DATE NOT NULL,
    amount_excluding_tax NUMERIC(18,2) NOT NULL,
    tax_amount NUMERIC(18,2) NOT NULL,
    transaction_amount NUMERIC(18,2) NOT NULL,
    outstanding_balance NUMERIC(18,2) NOT NULL,
    finalization_date DATE,
    is_finalized BOOLEAN NOT NULL
);