-- Step 1: Original query to retrieve all bookings along with user, property, and payment details
-- Adding WHERE clause to filter bookings (e.g., retrieving confirmed bookings within a specific date range)

SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email,
    Property.property_id,
    Property.name AS property_name,
    Property.location AS property_location,
    Property.pricepernight,
    Payment.payment_id,
    Payment.amount AS payment_amount,
    Payment.payment_date
FROM 
    Booking
JOIN 
    User ON Booking.user_id = User.user_id
JOIN 
    Property ON Booking.property_id = Property.property_id
JOIN 
    Payment ON Booking.booking_id = Payment.booking_id
WHERE 
    Booking.status = 'confirmed'  -- Adding WHERE clause to filter confirmed bookings
    AND Booking.start_date >= '2023-01-01'  -- Example filter for bookings starting from January 2023
    AND Booking.end_date <= '2023-12-31';  -- Example filter for bookings ending by December 2023

-- Step 2: Measure the performance of the original query using EXPLAIN ANALYZE (before optimization)
EXPLAIN ANALYZE 
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email,
    Property.property_id,
    Property.name AS property_name,
    Property.location AS property_location,
    Property.pricepernight,
    Payment.payment_id,
    Payment.amount AS payment_amount,
    Payment.payment_date
FROM 
    Booking
JOIN 
    User ON Booking.user_id = User.user_id
JOIN 
    Property ON Booking.property_id = Property.property_id
JOIN 
    Payment ON Booking.booking_id = Payment.booking_id
WHERE 
    Booking.status = 'confirmed'
    AND Booking.start_date >= '2023-01-01'
    AND Booking.end_date <= '2023-12-31';


-- Step 3: Create indexes on high-usage columns to optimize query performance
-- These indexes will speed up the joins and search operations in the query

-- Index on user_id in Booking table to optimize JOIN operations
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Index on property_id in Booking table to optimize JOIN operations
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Index on user_id in User table to optimize JOIN operations
CREATE INDEX idx_user_id ON User(user_id);

-- Index on booking_id in Payment table to optimize JOIN operations
CREATE INDEX idx_payment_booking_id ON Payment(booking_id);

-- Index on property_id in Property table to optimize JOIN operations
CREATE INDEX idx_property_id ON Property(property_id);

-- Step 4: Optimized query after adding indexes and refactoring the JOINs
-- This query uses a LEFT JOIN for Payment to include bookings with or without payments
-- The added indexes will make this query run faster

SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email,
    Property.property_id,
    Property.name AS property_name,
    Property.location AS property_location,
    Property.pricepernight,
    Payment.payment_id,
    Payment.amount AS payment_amount,
    Payment.payment_date
FROM 
    Booking
JOIN 
    User ON Booking.user_id = User.user_id
JOIN 
    Property ON Booking.property_id = Property.property_id
LEFT JOIN 
    Payment ON Booking.booking_id = Payment.booking_id;

-- Step 5: Measure the performance of the optimized query using EXPLAIN ANALYZE (after optimization)
EXPLAIN ANALYZE 
SELECT 
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email,
    Property.property_id,
    Property.name AS property_name,
    Property.location AS property_location,
    Property.pricepernight,
    Payment.payment_id,
    Payment.amount AS payment_amount,
    Payment.payment_date
FROM 
    Booking
JOIN 
    User ON Booking.user_id = User.user_id
JOIN 
    Property ON Booking.property_id = Property.property_id
LEFT JOIN 
    Payment ON Booking.booking_id = Payment.booking_id;