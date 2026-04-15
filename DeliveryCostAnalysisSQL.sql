CREATE DATABASE finance_logistics_model;
USE finance_logistics_model;

-- Drop Statement kept for testing purposes.
-- DROP DATABASE finance_logistics_model; 

-- Create dimensions
CREATE TABLE dim_customer (
  customer_id INT PRIMARY KEY,
  customer_name VARCHAR(100),
  email VARCHAR(100),
  phone VARCHAR(15)
);

CREATE TABLE dim_parcel (
  parcel_id INT PRIMARY KEY,
  parcel_type VARCHAR(50),
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
  full_date DATE,
  dayN INT,
  monthN INT,
  yearN INT,
  quarterN INT
);

CREATE TABLE dim_product (
  product_id INT PRIMARY KEY,
  item_name VARCHAR(100),
  item_category VARCHAR(50),
  weight DECIMAL(6,2)
);

-- Create fact table
CREATE TABLE fact_parcel (
    parcel_fact_id INT PRIMARY KEY,
    total_cost DECIMAL(10,2),
    total_revenue DECIMAL (10,2),
    delivery_time INT,
    parcel_weight DECIMAL(10,2),
    parcel_value DECIMAL(10,2),

    parcel_id INT NOT NULL,
    customer_id INT NOT NULL,
    origin_id INT NOT NULL,
    destination_id INT NOT NULL,
    date_id INT NOT NULL,
    product_id INT NOT NULL,

    FOREIGN KEY (parcel_id) REFERENCES dim_parcel(parcel_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (origin_id) REFERENCES dim_location(location_id),
    FOREIGN KEY (destination_id) REFERENCES dim_location(location_id),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
);


-- Insert
INSERT INTO dim_customer VALUES
(1, 'Matthew McDonald', 'mat.mcdonald@mail.com', '0891111111'),
(2, 'Mark Vincible', 'mark.vincible@mail.com', '0852222222'),
(3, 'Kim McKim', 'kim.mckim@mail.com', '0893333333'),
(4, 'John Washed', 'john.washed@mail.com', '0851234567'),
(5, 'Kathleen Shrew', 'kathleen.shrew@mail.com', '0897891011'),
(6, 'Kiln Dexter', 'kiln.dexter@mail.com', '0891213141');

INSERT INTO dim_parcel VALUES
(1, 'Standard', 'Delivered', 'Glass'),
(2, 'Express', 'In-transit', 'Electronics'),
(3, 'Standard', 'In-transit', 'Clothing'),
(4, 'Express', 'Delayed', 'Paper'),
(5, 'Standard', 'Delivered', 'Furniture'),
(6, 'Express', 'Cancelled', 'Electronics');

INSERT INTO dim_location VALUES
(1, 'Dublin', 'Ireland', 'D01 AB12'),
(2, 'Laois', 'Ireland', 'L02 CD34'),
(3, 'Cork', 'Ireland', 'C03 EF56'),
(4, 'Kerry', 'Ireland', 'K04 GH78'),
(5, 'Mayo', 'Ireland', 'M05 IJ90'),
(6, 'Madrid', 'Spain', '28013'),
(7, 'Rome', 'Italy', '00122 RM'),
(8, 'Amsterdam', 'Netherlands', '1012 WX'),
(9, 'Brussels', 'Belgium', '1090'),
(10, 'Vienna', 'Austria', '1010'),
(11, 'Zurich', 'Switzerland', '8914'),
(12, 'Lisbon', 'Portugal', '1100-148'),
(13, 'Copenhagen', 'Denmark', 'DK 1049');

INSERT INTO dim_date VALUES
(1, '2025-11-10', 10, 11, 2025, 4),
(2, '2025-12-15', 15, 12, 2025, 4),
(3, '2026-01-11', 11, 1, 2026, 1),
(4, '2026-03-13', 13, 3, 2026, 1),
(5, '2026-05-12', 12, 5, 2026, 2),
(6, '2026-04-18', 18, 4, 2026, 2),
(7, '2026-05-25', 25, 5, 2026, 2),
(8, '2026-07-26', 26, 7, 2026, 3),
(9, '2026-10-15', 15, 10, 2026, 4);

INSERT INTO dim_product VALUES
(1, 'Window Pane', 'Fragile', 2.20),
(2, 'Laptop', 'Electronics', 2.50),
(3, 'Sweater', 'Clothing', 1.20),
(4, 'Documents', 'Paper', 0.60),
(5, 'Couch', 'Furniture', 20.77),
(6, 'Motherboard', 'Electronics', 0.50);

INSERT INTO fact_parcel VALUES
(1, 45.00, 95.00, 3, 2.20, 120.00, 1, 1, 1, 2, 1, 1),
(2, 50.00, 110.00, 1, 2.50, 450.00, 2, 2, 2, 3, 2, 2),
(3, 32.00, 70.00, 5, 1.20, 75.00, 3, 3, 3, 4, 3, 3),
(4, 25.50, 55.00, 4, 0.60, 40.00, 4, 4, 4, 5, 4, 4),
(5, 95.00, 210.00, 6, 20.77, 300.00, 5, 5, 5, 1, 5, 5),
(6, 0.00, 15.00, 0, 0.50, 125.00, 6, 6, 1, 3, 2, 6),
(7, 55.00, 120.00, 3, 2.5, 400.00, 1, 1, 1, 7, 1, 1),
(8, 65.00, 140.00, 4, 3.0, 600.00, 2, 2, 2, 8, 2, 2),
(9, 80.00, 170.00, 5, 4.5, 900.00, 3, 3, 3, 9, 3, 3),
(10, 45.00, 100.00, 2, 2.0, 300.00, 1, 1, 4, 10, 4, 1),
(11, 70.00, 150.00, 3, 3.5, 700.00, 2, 2, 5, 11, 2, 2),
(12, 70.00, 170.00, 5, 4.5, 900.00, 5, 1, 9, 13, 6, 3);






-- Queries
-- ----------------------
-- Piotr
--

SELECT prod.item_category, loc.city AS destination, AVG(fact.delivery_time) AS avg_days
FROM fact_parcel fact
JOIN dim_product prod ON fact.product_id = prod.product_id
JOIN dim_location loc ON fact.destination_id = loc.location_id
GROUP BY prod.item_category, loc.city
ORDER BY avg_days DESC;

-- Optimisation
-- use index so that MySQL can find matching destination rows directly, instead of going through the entire fact table 
CREATE INDEX index_destination ON fact_parcel(destination_id);


-- Finance Query
-- ---------------------
-- Kripa Shrestha 24141356
--
SELECT d.yearN, d.monthN, l.country, SUM(f.total_revenue) AS total_revenue, 
SUM(f.total_cost) AS total_cost, SUM(f.total_revenue - f.total_cost) AS profit
FROM fact_parcel f
JOIN dim_date d ON f.date_id = d.date_id
JOIN dim_location l ON f.destination_id = l.location_id
GROUP BY d.yearN, d.monthN, l.country;

-- Optimisation for Finance Query
CREATE INDEX index_fact_date ON fact_parcel(date_id);


