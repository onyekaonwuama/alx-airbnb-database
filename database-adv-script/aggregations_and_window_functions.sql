-- Query 1: Find the total number of bookings made by each user
SELECT 
    User.user_id,
    User.first_name,
    User.last_name,
    COUNT(Booking.booking_id) AS total_bookings
FROM 
    User
LEFT JOIN Booking
    ON User.user_id = Booking.user_id
GROUP BY 
    User.user_id;

-- Query 2: Rank properties based on the total number of bookings they have received
SELECT 
    Property.property_id,
    Property.name,
    Property.location,
    COUNT(Booking.booking_id) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(Booking.booking_id) DESC) AS booking_rank
FROM 
    Property
LEFT JOIN Booking
    ON Property.property_id = Booking.property_id
GROUP BY 
    Property.property_id
ORDER BY 
    booking_rank;
