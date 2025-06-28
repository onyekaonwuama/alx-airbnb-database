# AirBnB Database Sample Data

This repository contains SQL scripts to populate the AirBnB database with sample data.

## Files:
- `seed.sql`: SQL script to insert sample data into the AirBnB database.
- `README.md`: This file, explaining how to use the seed script.

## Sample Data:
The script inserts sample data into the following tables:
- **User**: Adds users with different roles (guest, host, admin).
- **Property**: Adds properties linked to hosts.
- **Booking**: Adds bookings for properties by users.
- **Payment**: Adds payments for bookings using different methods.
- **Review**: Adds reviews for properties made by users.
- **Message**: Adds messages exchanged between users.

## Usage:
To populate your database with sample data, run the `seed.sql` script in your PostgreSQL-compatible database:

```bash
psql -U username -d database_name -f path/to/seed.sql
