# Database Normalization - Third Normal Form (3NF)

## 1. First Normal Form (1NF)
The database schema satisfies **1NF** because:
- All attributes contain atomic values (no lists, sets, or multiple values stored in a single column).
- Each record in the tables is unique and identified by a primary key.

## 2. Second Normal Form (2NF)
The database schema satisfies **2NF** because:
- There are no composite primary keys in any of the tables.
- All non-key attributes are fully dependent on the primary key of their respective tables.

## 3. Third Normal Form (3NF)
The database schema satisfies **3NF** because:
- There are no transitive dependencies. Non-key attributes depend only on the primary key and not on other non-key attributes.
- For example:
  - In the **User** table, the `role` attribute depends only on `user_id`.
  - In the **Property** table, attributes like `name`, `location`, and `pricepernight` depend solely on `property_id`.
  - The **Booking**, **Payment**, **Review**, and **Message** tables also exhibit similar dependencies on their primary keys.

## Conclusion
This schema adheres to the principles of **3NF**, ensuring that the database is free from redundancies and unnecessary dependencies. All tables are optimized for efficient storage and retrieval.
