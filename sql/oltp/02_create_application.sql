-- ============================================================
-- Application schema
-- ============================================================

CREATE TABLE IF NOT EXISTS application.countries (
    country_id INTEGER PRIMARY KEY,
    country_name TEXT NOT NULL,
    formal_name TEXT,
    latest_recorded_population BIGINT,
    continent TEXT,
    region TEXT,
    subregion TEXT
);

CREATE TABLE IF NOT EXISTS application.state_provinces (
    state_province_id INTEGER PRIMARY KEY,
    state_province_code TEXT,
    state_province_name TEXT NOT NULL,
    country_id INTEGER NOT NULL,
    sales_territory TEXT,
    latest_recorded_population BIGINT
);

CREATE TABLE IF NOT EXISTS application.cities (
    city_id INTEGER PRIMARY KEY,
    city_name TEXT NOT NULL,
    state_province_id INTEGER NOT NULL,
    latitude NUMERIC(12,7),
    longitude NUMERIC(12,7),
    latest_recorded_population BIGINT
);

CREATE TABLE IF NOT EXISTS application.delivery_methods (
    delivery_method_id INTEGER PRIMARY KEY,
    delivery_method_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS application.payment_methods (
    payment_method_id INTEGER PRIMARY KEY,
    payment_method_name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS application.people (
    person_id INTEGER PRIMARY KEY,
    full_name TEXT NOT NULL,
    preferred_name TEXT,
    search_name TEXT,
    is_employee BOOLEAN NOT NULL,
    is_salesperson BOOLEAN NOT NULL
);

CREATE TABLE IF NOT EXISTS application.transaction_types (
    transaction_type_id INTEGER PRIMARY KEY,
    transaction_type_name TEXT NOT NULL
);