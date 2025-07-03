-- Initial query to retrieve all bookings along with user, property, and payment details
-- This query may not perform well due to lack of indexing

-- Original Query (before optimization)
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
    Payment ON Booking.booking_id = Payment.booking_id;

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
    Payment ON Booking.booking_id = Payment.booking_id;


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