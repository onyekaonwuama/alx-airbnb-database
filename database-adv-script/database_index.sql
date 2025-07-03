-- Create index on user_id in Booking table to optimize JOIN operations
CREATE INDEX idx_booking_user_id ON Booking(user_id);

-- Create index on property_id in Booking table to optimize JOIN operations
CREATE INDEX idx_booking_property_id ON Booking(property_id);

-- Create index on user_id in User table to optimize JOIN operations
CREATE INDEX idx_user_id ON User(user_id);

-- Create index on email in User table to speed up searches by email
CREATE INDEX idx_user_email ON User(email);

-- Create index on status in Booking table to speed up searches by booking status
CREATE INDEX idx_booking_status ON Booking(status);

-- Create index on start_date in Booking table to optimize date range queries
CREATE INDEX idx_booking_start_date ON Booking(start_date);

-- Create index on end_date in Booking table to optimize date range queries
CREATE INDEX idx_booking_end_date ON Booking(end_date);

-- Create index on property_id in Property table to optimize JOIN operations
CREATE INDEX idx_property_id ON Property(property_id);

-- Create index on pricepernight in Property table to optimize range queries (e.g., filtering by price)
CREATE INDEX idx_property_price ON Property(pricepernight);

-- Create index on created_at in Property table to optimize queries ordering by creation date
CREATE INDEX idx_property_created_at ON Property(created_at);
