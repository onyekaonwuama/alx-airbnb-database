-- Creating the User Table
CREATE TABLE User (
    user_id UUID PRIMARY KEY,  -- Unique identifier for the user
    first_name VARCHAR(255) NOT NULL,  -- User's first name
    last_name VARCHAR(255) NOT NULL,  -- User's last name
    email VARCHAR(255) UNIQUE NOT NULL,  -- User's email (unique)
    password_hash VARCHAR(255) NOT NULL,  -- Hashed password
    phone_number VARCHAR(20),  -- User's phone number (nullable)
    role ENUM('guest', 'host', 'admin') NOT NULL,  -- Role of the user
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP  -- Account creation timestamp
);

-- Creating the Property Table
CREATE TABLE Property (
    property_id UUID PRIMARY KEY,  -- Unique identifier for the property
    host_id UUID,  -- Foreign key to User
    name VARCHAR(255) NOT NULL,  -- Name of the property
    description TEXT NOT NULL,  -- Description of the property
    location VARCHAR(255) NOT NULL,  -- Property's location
    pricepernight DECIMAL NOT NULL,  -- Price per night for the property
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Property creation timestamp
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,  -- Property update timestamp
    FOREIGN KEY (host_id) REFERENCES User(user_id)  -- Foreign key linking to the User table (host)
);

-- Creating the Booking Table
CREATE TABLE Booking (
    booking_id UUID PRIMARY KEY,  -- Unique identifier for the booking
    property_id UUID,  -- Foreign key to Property
    user_id UUID,  -- Foreign key to User
    start_date DATE NOT NULL,  -- Start date of the booking
    end_date DATE NOT NULL,  -- End date of the booking
    total_price DECIMAL NOT NULL,  -- Total price of the booking
    status ENUM('pending', 'confirmed', 'canceled') NOT NULL,  -- Booking status
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Booking creation timestamp
    FOREIGN KEY (property_id) REFERENCES Property(property_id),  -- Foreign key linking to Property
    FOREIGN KEY (user_id) REFERENCES User(user_id)  -- Foreign key linking to User
);

-- Creating the Payment Table
CREATE TABLE Payment (
    payment_id UUID PRIMARY KEY,  -- Unique identifier for the payment
    booking_id UUID,  -- Foreign key to Booking
    amount DECIMAL NOT NULL,  -- Payment amount
    payment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Payment date
    payment_method ENUM('credit_card', 'paypal', 'stripe') NOT NULL,  -- Payment method
    FOREIGN KEY (booking_id) REFERENCES Booking(booking_id)  -- Foreign key linking to Booking
);

-- Creating the Review Table
CREATE TABLE Review (
    review_id UUID PRIMARY KEY,  -- Unique identifier for the review
    property_id UUID,  -- Foreign key to Property
    user_id UUID,  -- Foreign key to User
    rating INT CHECK (rating >= 1 AND rating <= 5) NOT NULL,  -- Rating (1 to 5)
    comment TEXT NOT NULL,  -- Review comment
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Review creation timestamp
    FOREIGN KEY (property_id) REFERENCES Property(property_id),  -- Foreign key linking to Property
    FOREIGN KEY (user_id) REFERENCES User(user_id)  -- Foreign key linking to User
);

-- Creating the Message Table
CREATE TABLE Message (
    message_id UUID PRIMARY KEY,  -- Unique identifier for the message
    sender_id UUID,  -- Foreign key to User (sender)
    recipient_id UUID,  -- Foreign key to User (recipient)
    message_body TEXT NOT NULL,  -- Message content
    sent_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Timestamp of message sent
    FOREIGN KEY (sender_id) REFERENCES User(user_id),  -- Foreign key linking to User (sender)
    FOREIGN KEY (recipient_id) REFERENCES User(user_id)  -- Foreign key linking to User (recipient)
);

-- Creating Indexes for Performance Optimization
CREATE INDEX idx_user_email ON User(email);  -- Index on User's email for fast lookups
CREATE INDEX idx_property_id ON Property(property_id);  -- Index on Property's primary key
CREATE INDEX idx_booking_property ON Booking(property_id);  -- Index on Booking's property_id
CREATE INDEX idx_booking_user ON Booking(user_id);  -- Index on Booking's user_id
CREATE INDEX idx_payment_booking ON Payment(booking_id);  -- Index on Payment's booking_id
CREATE INDEX idx_review_property ON Review(property_id);  -- Index on Review's property_id
CREATE INDEX idx_review_user ON Review(user_id);  -- Index on Review's user_id
CREATE INDEX idx_message_sender ON Message(sender_id);  -- Index on Message's sender_id
CREATE INDEX idx_message_recipient ON Message(recipient_id);  -- Index on Message's recipient_id or the user_id.md
