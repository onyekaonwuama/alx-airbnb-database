-- find all properties where the average rating is greater than 4.0
SELECT
    Property.property_id,
    Property.name,
    Property.location,
    Property.pricepernight
FROM
    Property
WHERE
    Property.property_id IN (
        SELECT
            Review.property_id
        FROM
            Review
        GROUP BY
            Review.property_id
        HAVING
            AVG(Review.rating) > 4.0
    );