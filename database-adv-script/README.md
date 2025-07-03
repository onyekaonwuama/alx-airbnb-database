# SQL Joins Queries for Airbnb Clone

This repository contains SQL queries that demonstrate the use of different types of joins to retrieve data for the Airbnb Clone project.

## Queries

### 1. INNER JOIN
- Retrieves all bookings and the respective users who made those bookings.
- **Query**: `INNER JOIN` between `Booking` and `User` tables.

### 2. LEFT JOIN
- Retrieves all properties and their reviews, including properties with no reviews.
- **Query**: `LEFT JOIN` between `Property` and `Review` tables.

### 3. FULL OUTER JOIN
- Retrieves all users and all bookings, even if the user has no booking or the booking has no user.
- **Query**: `FULL OUTER JOIN` between `User` and `Booking` tables.

## How to Use:
Run the SQL queries in your preferred SQL environment connected to the Airbnb Clone database to see the results for each query.
