CREATE DATABASE finance_logistics_model;
USE finance_logistics_model;


CREATE TABLE dim_customer (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100),
  email VARCHAR(100),
  -- varchar as there could be a country or landline code so shouldnt keep it fixed 
  phone VARCHAR(15)
);
CREATE TABLE dim_parcel (
  parcel_id INT PRIMARY KEY,
  parcel_type VARCHAR(50),
  -- changed "status" to "parcel_status" as status is a keyword 
  parcel_status VARCHAR(50),
  category VARCHAR(50)
);
CREATE TABLE dim_location (
  location_id INT PRIMARY KEY,
  city VARCHAR(100),
  country VARCHAR(100),
  postal_code VARCHAR(10)
);
CREATE TABLE dim_date (
  date_id INT PRIMARY KEY,
  -- keeps the full day and N for number as day month year are also keywords
  full_date DATE,
  dayN INT,
  monthN INT,
  yearN INT
);
CREATE TABLE dim_product (
  product_id INT PRIMARY KEY,
  item_name VARCHAR(100),
  item_category VARCHAR(50)
);