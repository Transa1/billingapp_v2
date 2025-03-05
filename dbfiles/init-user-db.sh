#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
    CREATE USER billingapp WITH PASSWORD 'qwerty';
    CREATE DATABASE billingapp_db;
    \c billingapp_db
    CREATE TABLE invoice (
    id BIGINT NOT NULL PRIMARY KEY,
    amount DOUBLE PRECISION NOT NULL,
    customer_id BIGINT NOT NULL,
    detail VARCHAR(255),
    number VARCHAR(255)
    );
    GRANT ALL PRIVILEGES ON DATABASE billingapp_db TO billingapp;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "billingapp_db" <<-EOSQL
    GRANT ALL ON SCHEMA public TO billingapp;
    GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO billingapp;
    GRANT ALL PRIVILEGES ON ALL SEQUENCES IN SCHEMA public TO billingapp;
EOSQL
