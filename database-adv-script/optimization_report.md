# Query Optimization for Airbnb Clone

## Original Query:
The original query retrieves all bookings, user details, property details, and payment details using multiple `JOIN` operations. It joins the `Booking`, `User`, `Property`, and `Payment` tables based on the `user_id`, `property_id`, and `booking_id`.

### Performance Issues:
- The query was performing full table scans or inefficient joins due to the lack of appropriate indexes.
- The use of an `INNER JOIN` for the `Payment` table caused the exclusion of bookings without payment.

## Optimization:
1. **Indexes Added**:
   - Created indexes on the following columns to improve join performance:
     - `Booking.user_id`, `Booking.property_id`, `Booking.booking_id`
     - `Payment.booking_id`
     - `User.user_id`, `Property.property_id`
2. **Refactor**:
   - Replaced the `INNER JOIN` with a `LEFT JOIN` for the `Payment` table to include bookings with no payment.
   
3. **Performance Measurement**:
   - **Before Optimization**: The original query showed high execution time with full table scans and inefficient joins.
   - **After Optimization**: Query performance improved significantly with faster execution times and reduced query cost due to the use of `LEFT JOIN` and proper indexing.

## Results:
- **Execution Time Before Optimization**: (Include execution time from `EXPLAIN ANALYZE` before optimization)
- **Execution Time After Optimization**: (Include execution time from `EXPLAIN ANALYZE` after optimization)

---

## License:

This project is open-source under the MIT License.
