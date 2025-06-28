-- Inserting sample data into User table
INSERT INTO User (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (UUID_GENERATE_V4(), 'John', 'Doe', 'john.doe@example.com', 'hashed_password_123', '123-456-7890', 'guest'),
  (UUID_GENERATE_V4(), 'Jane', 'Smith', 'jane.smith@example.com', 'hashed_password_456', '987-654-3210', 'host'),
  (UUID_GENERATE_V4(), 'Alice', 'Brown', 'alice.brown@example.com', 'hashed_password_789', '555-123-4567', 'admin');

-- Inserting sample data into Property table
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  (UUID_GENERATE_V4(), 'host_user_id_1', 'Seaside Villa', 'A beautiful villa by the beach', 'California, USA', 200),
  (UUID_GENERATE_V4(), 'host_user_id_2', 'Mountain Retreat', 'A cozy cabin in the mountains', 'Colorado, USA', 150),
  (UUID_GENERATE_V4(), 'host_user_id_3', 'City Apartment', 'Modern apartment in downtown', 'New York, USA', 250);

-- Inserting sample data into Booking table
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (UUID_GENERATE_V4(), 'property_id_1', 'user_id_1', '2025-07-01', '2025-07-07', 1200, 'confirmed'),
  (UUID_GENERATE_V4(), 'property_id_2', 'user_id_2', '2025-08-10', '2025-08-15', 750, 'pending'),
  (UUID_GENERATE_V4(), 'property_id_3', 'user_id_3', '2025-09-01', '2025-09-05', 1250, 'canceled');

-- Inserting sample data into Payment table
INSERT INTO Payment (payment_id, booking_id, amount, payment_date, payment_method)
VALUES
  (UUID_GENERATE_V4(), 'booking_id_1', 1200, '2025-07-01 12:00:00', 'credit_card'),
  (UUID_GENERATE_V4(), 'booking_id_2', 750, '2025-08-10 14:00:00', 'paypal'),
  (UUID_GENERATE_V4(), 'booking_id_3', 1250, '2025-09-01 16:00:00', 'stripe');

-- Inserting sample data into Review table
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  (UUID_GENERATE_V4(), 'property_id_1', 'user_id_1', 5, 'Amazing stay! The villa was beautiful and well-maintained.'),
  (UUID_GENERATE_V4(), 'property_id_2', 'user_id_2', 4, 'The cabin was cozy but a bit remote. Still a great experience.'),
  (UUID_GENERATE_V4(), 'property_id_3', 'user_id_3', 3, 'The apartment was nice, but there were some maintenance issues.');

-- Inserting sample data into Message table
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  (UUID_GENERATE_V4(), 'user_id_1', 'user_id_2', 'Hello, I am interested in booking your Seaside Villa. Can you confirm availability?'),
  (UUID_GENERATE_V4(), 'user_id_2', 'user_id_1', 'Hi, the villa is available for the dates you requested. Looking forward to your booking!'),
  (UUID_GENERATE_V4(), 'user_id_3', 'user_id_1', 'Thank you for your review! Hope to host you again soon.');
