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
(5, 'Mayo', 'Ireland', 'M05 IJ90');

INSERT INTO dim_date VALUES
(1, '2026-01-11', 11, 1,  2026, 1),
(2, '2026-05-12', 12, 5,  2026, 2),
(3, '2026-03-13', 13, 3,  2026, 1),
(4, '2026-04-14', 14, 4, 2026, 2),
(5, '2026-10-15', 15, 10,  2026, 4);

INSERT INTO dim_product VALUES
(1, 'Window Pane', 'Fragile', 2.20),
(2, 'Laptop', 'Electronics', 2.50),
(3, 'Sweater', 'Clothing', 1.20),
(4, 'Documents', 'Paper', 0.60),
(5, 'Couch', 'Furniture',   20.77),
(6, 'Motherboard', 'Electronics', 0.5);

INSERT INTO fact_parcel VALUES
(1, 45.00, 3, 120.00, 2.20, 1, 1, 1, 2, 1, 1),
(2, 50.00, 1, 450.00, 2.50, 2, 2, 2, 3, 2, 2),
(3, 32.00, 5, 75.00, 1.20, 3, 3, 3, 4, 3, 3),
(4, 25.50, 4, 2.00, 0.60, 4, 4, 4, 5, 4, 4),
(5, 95.00, 6, 300.00, 20.77, 5, 5, 5, 1, 5, 5),
(6, 0.00, 0, 125.00, 0.50, 6, 6, 1, 3, 2, 6);