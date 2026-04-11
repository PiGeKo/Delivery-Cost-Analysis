CREATE TABLE fact_parcel (
    parcel_fact_id INT PRIMARY KEY,
    total_cost DECIMAL(10,2),
    delivery_time INT, -- in days
    parcel_weight DECIMAL(10,2),
    parcel_value DECIMAL(10,2),
    
    -- Foreign Keys
    parcel_id INT NOT NULL,
    customer_id INT NOT NULL,
    location_id INT NOT NULL,
    date_id INT NOT NULL,
    product_id INT NOT NULL,
    
    -- Foreign Key Constraints
    FOREIGN KEY (parcel_id) REFERENCES dim_parcel(parcel_id),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(customer_id),
    FOREIGN KEY (location_id) REFERENCES dim_location(location_id),
    FOREIGN KEY (date_id) REFERENCES dim_date(date_id),
    FOREIGN KEY (product_id) REFERENCES dim_product(product_id)
    
);