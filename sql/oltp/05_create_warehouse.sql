-- ============================================================
-- Warehouse schema
-- ============================================================

CREATE TABLE IF NOT EXISTS warehouse.colors (
    color_id INTEGER PRIMARY KEY,
    color_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS warehouse.package_types (
    package_type_id INTEGER PRIMARY KEY,
    package_type_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS warehouse.stock_groups (
    stock_group_id INTEGER PRIMARY KEY,
    stock_group_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS warehouse.stock_items (
    stock_item_id INTEGER PRIMARY KEY,
    stock_item_name TEXT NOT NULL,
    supplier_id INTEGER NOT NULL,
    color_id INTEGER,
    unit_package_id INTEGER NOT NULL,
    outer_package_id INTEGER NOT NULL,
    brand TEXT,
    size TEXT,
    lead_time_days INTEGER NOT NULL,
    quantity_per_outer INTEGER NOT NULL,
    is_chiller_stock BOOLEAN NOT NULL,
    barcode TEXT,
    tax_rate NUMERIC(10,3) NOT NULL,
    unit_price NUMERIC(18,2) NOT NULL,
    recommended_retail_price NUMERIC(18,2),
    typical_weight_per_unit NUMERIC(18,3)
);

CREATE TABLE IF NOT EXISTS warehouse.stock_item_holdings (
    stock_item_id INTEGER PRIMARY KEY,
    quantity_on_hand INTEGER NOT NULL,
    bin_location TEXT,
    last_stocktake_quantity INTEGER,
    last_cost_price NUMERIC(18,2),
    reorder_level INTEGER NOT NULL,
    target_stock_level INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS warehouse.stock_item_stock_groups (
    stock_item_stock_group_id INTEGER PRIMARY KEY,
    stock_item_id INTEGER NOT NULL,
    stock_group_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS warehouse.stock_item_transactions (
    stock_item_transaction_id INTEGER PRIMARY KEY,
    stock_item_id INTEGER NOT NULL,
    transaction_type_id INTEGER NOT NULL,
    customer_id INTEGER,
    invoice_id INTEGER,
    supplier_id INTEGER,
    purchase_order_id INTEGER,
    transaction_occurred_when TIMESTAMP NOT NULL,
    quantity INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS warehouse.vehicle_temperatures (
    vehicle_temperature_id INTEGER PRIMARY KEY,
    vehicle_registration TEXT NOT NULL,
    chiller_sensor_number INTEGER NOT NULL,
    recorded_when TIMESTAMP NOT NULL,
    temperature NUMERIC(10,3) NOT NULL,
    full_sensor_data TEXT
);

CREATE TABLE IF NOT EXISTS warehouse.cold_room_temperatures (
    cold_room_temperature_id INTEGER PRIMARY KEY,
    cold_room_sensor_number INTEGER NOT NULL,
    recorded_when TIMESTAMP NOT NULL,
    temperature NUMERIC(10,3) NOT NULL
);