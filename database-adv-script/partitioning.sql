-- Step 1: Create the partitioned Booking table by year based on the start_date column
-- Partitioning the Booking table by range on the start_date column

CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,
    property_id UUID REFERENCES Property(property_id),
    user_id UUID REFERENCES User(user_id),
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    total_price DECIMAL NOT NULL,
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
) PARTITION BY RANGE (start_date);

-- Step 2: Create partitions for each year

CREATE TABLE Booking_2020 PARTITION OF Booking
    FOR VALUES FROM ('2020-01-01') TO ('2021-01-01');

CREATE TABLE Booking_2021 PARTITION OF Booking
    FOR VALUES FROM ('2021-01-01') TO ('2022-01-01');

CREATE TABLE Booking_2022 PARTITION OF Booking
    FOR VALUES FROM ('2022-01-01') TO ('2023-01-01');

CREATE TABLE Booking_2023 PARTITION OF Booking
    FOR VALUES FROM ('2023-01-01') TO ('2024-01-01');

-- Step 3: Index the partitions for better query performance on large datasets

-- Index on user_id in Booking_2020 partition to optimize JOIN operations
CREATE INDEX idx_booking_user_id_2020 ON Booking_2020(user_id);

-- Index on property_id in Booking_2020 partition to optimize JOIN operations
CREATE INDEX idx_booking_property_id_2020 ON Booking_2020(property_id);

-- Index on user_id in Booking_2021 partition to optimize JOIN operations
CREATE INDEX idx_booking_user_id_2021 ON Booking_2021(user_id);

-- Index on property_id in Booking_2021 partition to optimize JOIN operations
CREATE INDEX idx_booking_property_id_2021 ON Booking_2021(property_id);

-- Index on user_id in Booking_2022 partition to optimize JOIN operations
CREATE INDEX idx_booking_user_id_2022 ON Booking_2022(user_id);

-- Index on property_id in Booking_2022 partition to optimize JOIN operations
CREATE INDEX idx_booking_property_id_2022 ON Booking_2022(property_id);

-- Index on user_id in Booking_2023 partition to optimize JOIN operations
CREATE INDEX idx_booking_user_id_2023 ON Booking_2023(user_id);

-- Index on property_id in Booking_2023 partition to optimize JOIN operations
CREATE INDEX idx_booking_property_id_2023 ON Booking_2023(property_id);

-- Step 4: Add additional partitions as needed for future years (e.g., 2024)
CREATE TABLE Booking_2024 PARTITION OF Booking
    FOR VALUES FROM ('2024-01-01') TO ('2025-01-01');

-- Step 5: Query to fetch bookings from a specific year to test performance (before and after partitioning)

-- Example query: Fetching bookings from January 2021 to December 2021
EXPLAIN ANALYZE 
SELECT 
    booking_id, 
    start_date, 
    end_date, 
    total_price, 
    status 
FROM 
    Booking
WHERE 
    start_date BETWEEN '2021-01-01' AND '2021-12-31';

-- Step 6: Example query for fetching bookings in a range after partitioning
-- This will only scan the relevant partition (Booking_2021)

EXPLAIN ANALYZE 
SELECT 
    booking_id, 
    start_date, 
    end_date, 
    total_price, 
    status 
FROM 
    Booking
WHERE 
    start_date BETWEEN '2021-01-01' AND '2021-12-31';
