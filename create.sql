CREATE DATABASE IF NOT EXISTS lab_mysql;
USE lab_mysql;
CREATE TABLE cars (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vin VARCHAR(17) NOT NULL,  -- Vehicle Identification Number
    manufacturer VARCHAR(50) NOT NULL,
    model VARCHAR(50) NOT NULL,
    year YEAR NOT NULL,
    color VARCHAR(20) NOT NULL
);
CREATE TABLE customers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cust_id INT NOT NULL,  -- Customer ID, can be any custom ID you prefer
    cust_name VARCHAR(100) NOT NULL,
    cust_phone VARCHAR(20),
    cust_email VARCHAR(100),
    cust_address VARCHAR(255),
    cust_city VARCHAR(100),
    cust_state VARCHAR(100),
    cust_country VARCHAR(100),
    cust_zipcode VARCHAR(20)
);
CREATE TABLE salespersons (
    id INT AUTO_INCREMENT PRIMARY KEY,
    staff_id INT NOT NULL,  -- Staff ID, can be any custom ID you prefer
    name VARCHAR(100) NOT NULL,
    store VARCHAR(100) NOT NULL
);
CREATE TABLE invoices (
    id INT AUTO_INCREMENT PRIMARY KEY,
    invoice_number VARCHAR(50) NOT NULL,
    date DATE NOT NULL,
    car_id INT,
    customer_id INT,
    salesperson_id INT,
    FOREIGN KEY (car_id) REFERENCES cars(id),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (salesperson_id) REFERENCES salespersons(id)
);
