# Partitioning Performance Report for Airbnb Database

## Introduction
The `Booking` table in the Airbnb database was partitioned by the `start_date` column to optimize queries that filter bookings by date range. This report compares the performance of queries before and after partitioning the table, focusing on the **query execution time** for fetching bookings within a specific date range.

## Original Query (Before Partitioning)
Before partitioning, the query to fetch bookings for a specific date range would scan the entire `Booking` table. This could result in slower query performance as the table grows in size.

**Example Query (Before Partitioning)**:
```sql
SELECT 
    booking_id, 
    start_date, 
    end_date, 
    total_price, 
    status 
FROM 
    Booking
WHERE 
    start_date BETWEEN '2021-01-01' AND '2021-12-31';


