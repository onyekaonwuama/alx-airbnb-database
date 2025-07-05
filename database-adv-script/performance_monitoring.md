# Database Performance Monitoring and Refining for Airbnb Clone

## Introduction
This report documents the monitoring and refinement of the database performance for frequently used queries. We use tools like **`EXPLAIN ANALYZE`** to identify performance bottlenecks and refine the schema by adding indexes or restructuring queries.

## 1. **Original Query for Retrieving Bookings for a User**

**Query**:
```sql
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
    user_id = 'some-uuid';
