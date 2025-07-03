# Index Performance for Airbnb Clone

This document provides a comparison of query performance before and after creating indexes on the `User`, `Booking`, and `Property` tables.

## Indexes Created:
1. **Booking Table**:
    - `user_id` index
    - `property_id` index
    - `status` index
    - `start_date` and `end_date` indexes
2. **User Table**:
    - `user_id` index
    - `email` index
3. **Property Table**:
    - `property_id` index
    - `pricepernight` index
    - `created_at` index

## Query Performance Analysis:

### 1. **Before Indexing**:
- Query to find confirmed bookings:
    ```sql
    EXPLAIN 
    SELECT 
        Booking.booking_id, 
        User.first_name, 
        User.last_name
    FROM 
        Booking
    JOIN 
        User ON Booking.user_id = User.user_id
    WHERE 
        Booking.status = 'confirmed';
    ```

    - **Execution Plan**: (Include output from the `EXPLAIN` command)

### 2. **After Indexing**:
- Query to find confirmed bookings (after adding indexes):
    ```sql
    EXPLAIN 
    SELECT 
        Booking.booking_id, 
        User.first_name, 
        User.last_name
    FROM 
        Booking
    JOIN 
        User ON Booking.user_id = User.user_id
    WHERE 
        Booking.status = 'confirmed';
    ```

    - **Execution Plan**: (Include output from the `EXPLAIN` command after indexing)

## Performance Improvement:
- **Before indexing**: (Describe the performance, e.g., slow response, high cost)
- **After indexing**: (Describe the improvements, e.g., faster response, reduced query cost)

---

