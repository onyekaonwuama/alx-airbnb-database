# AirBnB Database Specification

This document defines the database schema for the Airbnb system. The system includes entities for users, properties, bookings, payments, reviews, and messages, along with their attributes and relationships.

## Entities and Attributes

### 1. User
- **user_id**: Primary Key, UUID, Indexed  
- **first_name**: VARCHAR, NOT NULL  
- **last_name**: VARCHAR, NOT NULL  
- **email**: VARCHAR, UNIQUE, NOT NULL  
- **password_hash**: VARCHAR, NOT NULL  
- **phone_number**: VARCHAR, NULL  
- **role**: ENUM ('guest', 'host', 'admin'), NOT NULL  
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

### 2. Property
- **property_id**: Primary Key, UUID, Indexed  
- **host_id**: Foreign Key, references `User(user_id)`  
- **name**: VARCHAR, NOT NULL  
- **description**: TEXT, NOT NULL  
- **location**: VARCHAR, NOT NULL  
- **pricepernight**: DECIMAL, NOT NULL  
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
- **updated_at**: TIMESTAMP, ON UPDATE CURRENT_TIMESTAMP  

### 3. Booking
- **booking_id**: Primary Key, UUID, Indexed  
- **property_id**: Foreign Key, references `Property(property_id)`  
- **user_id**: Foreign Key, references `User(user_id)`  
- **start_date**: DATE, NOT NULL  
- **end_date**: DATE, NOT NULL  
- **total_price**: DECIMAL, NOT NULL  
- **status**: ENUM ('pending', 'confirmed', 'canceled'), NOT NULL  
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

### 4. Payment
- **payment_id**: Primary Key, UUID, Indexed  
- **booking_id**: Foreign Key, references `Booking(booking_id)`  
- **amount**: DECIMAL, NOT NULL  
- **payment_date**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  
- **payment_method**: ENUM ('credit_card', 'paypal', 'stripe'), NOT NULL  

### 5. Review
- **review_id**: Primary Key, UUID, Indexed  
- **property_id**: Foreign Key, references `Property(property_id)`  
- **user_id**: Foreign Key, references `User(user_id)`  
- **rating**: INTEGER, CHECK rating >= 1 AND rating <= 5, NOT NULL  
- **comment**: TEXT, NOT NULL  
- **created_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

### 6. Message
- **message_id**: Primary Key, UUID, Indexed  
- **sender_id**: Foreign Key, references `User(user_id)`  
- **recipient_id**: Foreign Key, references `User(user_id)`  
- **message_body**: TEXT, NOT NULL  
- **sent_at**: TIMESTAMP, DEFAULT CURRENT_TIMESTAMP  

---

## Relationships

### 1. User to Property
- A **User** can be a **Host** of many **Properties**.
- Relationship: One-to-many (One user can host multiple properties, but a property is hosted by only one user).

### 2. User to Booking
- A **User** can make multiple **Bookings**.
- Relationship: One-to-many (One user can have many bookings, but each booking is made by one user).

### 3. Property to Booking
- A **Property** can have many **Bookings**.
- Relationship: One-to-many (One property can have many bookings, but each booking is for one property).

### 4. Booking to Payment
- A **Booking** can have one or more **Payments**.
- Relationship: One-to-many (One booking can have many payments, e.g., for different payment methods, or it could be a single payment).

### 5. Property to Review
- A **Property** can have many **Reviews**.
- Relationship: One-to-many (One property can have many reviews, but each review is tied to one property).

### 6. User to Review
- A **User** can write many **Reviews**.
- Relationship: One-to-many (One user can leave multiple reviews, but each review is written by only one user).

### 7. User to Message
- A **User** can send and receive many **Messages**.
- Relationship: Many-to-many (A user can send many messages and receive many messages, where the message contains a **sender** and **recipient**).

---


## Constraints

### User Table
- **email**: Unique constraint (no two users can have the same email address).
- **Non-null constraints**: For required fields like `first_name`, `last_name`, `email`, `password_hash`, `role`.

### Property Table
- **host_id**: Foreign key constraint, references `User(user_id)`.
- **Non-null constraints**: For essential fields like `name`, `description`, `location`, `pricepernight`.

### Booking Table
- **status**: Must be one of the following values: `pending`, `confirmed`, `canceled`.
- **Foreign key constraints**: `property_id` references `Property(property_id)`, `user_id` references `User(user_id)`.

### Payment Table
- **Foreign key constraints**: `booking_id` references `Booking(booking_id)`.

### Review Table
- **rating**: Must be between 1 and 5 (inclusive).
- **Foreign key constraints**: `property_id` references `Property(property_id)`, `user_id` references `User(user_id)`.

### Message Table
- **Foreign key constraints**: `sender_id` and `recipient_id` both reference `User(user_id)`.

---

## Indexing

- **Primary Keys**: Automatically indexed.
- **Additional Indexes**: 
  - `email` in the **User** table.
  - `property_id` in the **Property** and **Booking** tables.
  - `booking_id` in the **Booking** and **Payment** tables.

---