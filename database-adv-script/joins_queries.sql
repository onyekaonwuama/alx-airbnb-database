--inner join Retrieve all bookings and the respective users who made those bookings

SELECT
    Booking.booking_id,
    Booking.start_date,
    Booking.end_date,
    Booking.total_price,
    User.user_id,
    User.first_name,
    User.last_name,
    User.email
FROM
    Booking
    INNER JOIN User ON Booking.user_id = User.user_id;

--left join Retrieve all properties and their reviews, including properties with no reviews
SELECT
Property.property_id,
Property.name,
Property.location,
Property.pricepernight,
Review.review_id,
Review.rating,
Review.comment
FROM
Property
LEFT JOIN Review
ON Property.property_id = Review.property_id
