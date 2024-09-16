-- Crear la base de datos
CREATE DATABASE IF NOT EXISTS lab_mysql;

-- Usar la base de datos
USE lab_mysql;

-- Eliminar tablas si existen
DROP TABLE IF EXISTS invoices;
DROP TABLE IF EXISTS cars;
DROP TABLE IF EXISTS customers;
DROP TABLE IF EXISTS salespersons;

-- Crear tabla cars
CREATE TABLE cars (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    vin VARCHAR(30) NOT NULL,
    manufacturer VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    car_year SMALLINT UNSIGNED NOT NULL,
    color VARCHAR(50) NOT NULL,
    CONSTRAINT unique_vin UNIQUE (vin)
);

-- Crear tabla customers
CREATE TABLE customers (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cust_id INT UNSIGNED NOT NULL,
    cust_name VARCHAR(50) NOT NULL,
    cust_phone VARCHAR(20),
    cust_email VARCHAR(50),
    cust_address VARCHAR(100) NOT NULL,
    cust_zipcode INT UNSIGNED NOT NULL,
    CONSTRAINT unique_cust_id UNIQUE (cust_id)
);

-- Crear tabla salespersons
CREATE TABLE salespersons (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    staff_id VARCHAR(5) NOT NULL,
    name VARCHAR(50) NOT NULL,
    store VARCHAR(50) NOT NULL,
    CONSTRAINT unique_staff_id UNIQUE (staff_id)
);

-- Crear tabla invoices
CREATE TABLE invoices (
    id INT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    invoice_number VARCHAR(20) NOT NULL,
    date DATE NOT NULL,
    car_id INT UNSIGNED NOT NULL,
    customer_id INT UNSIGNED NOT NULL,
    salesperson_id INT UNSIGNED NOT NULL,
    CONSTRAINT fk_car_id FOREIGN KEY (car_id) REFERENCES cars(id),
    CONSTRAINT fk_customer_id FOREIGN KEY (customer_id) REFERENCES customers(id),
    CONSTRAINT fk_salesperson_id FOREIGN KEY (salesperson_id) REFERENCES salespersons(id),
    CONSTRAINT unique_invoice_number UNIQUE (invoice_number)
);
