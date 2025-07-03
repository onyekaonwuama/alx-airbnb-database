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


### 2. **Subqueries**

#### 2.1 **Non-Correlated Subquery**
- **Finds** all properties where the average rating is greater than 4.0.
- **Query**: The subquery uses `COUNT` and `GROUP BY` to calculate average ratings for each property and filters those with an average rating greater than 4.0.

#### 2.2 **Correlated Subquery**
- **Finds** users who have made more than 3 bookings.
- **Query**: The correlated subquery counts the number of bookings for each user by referencing `user_id` in the outer query.

### 3. **Aggregations and Window Functions**

#### 3.1 **Aggregation Query**
- **Finds** the total number of bookings made by each user.
- **Query**: Uses the `COUNT` function and `GROUP BY` to aggregate data by `user_id`, counting the total bookings made by each user.

#### 3.2 **Window Function Query (ROW_NUMBER)**
- **Ranks** properties based on the total number of bookings they have received using `ROW_NUMBER()`.
- **Query**: Uses the `ROW_NUMBER()` window function to rank properties by the total number of bookings they have received. This ranking ensures that each property is given a unique rank based on its booking count.

---

## How to Use:

1. **Run the SQL queries** in your preferred SQL environment connected to the Airbnb Clone database to see the results for each query.

2. **Queries Overview**:
    - Joins are used to retrieve related data from multiple tables.
    - Subqueries help in retrieving data that meets specific criteria (e.g., finding properties with high ratings or users with multiple bookings).
    - Aggregation queries summarize data, such as counting the total bookings made by users or ranking properties based on bookings.
    - Window functions allow you to rank or partition data, such as ranking properties by the number of bookings.

---