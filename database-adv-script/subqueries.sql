✅ 1. Non-Correlated Subquery — Properties with Average Rating > 4.0

SELECT 
    id, 
    name 
FROM 
    properties
WHERE 
    id IN (
        SELECT 
            property_id
        FROM 
            reviews
        GROUP BY 
            property_id
        HAVING 
            AVG(rating) > 4.0
    );

✅ 2. Correlated Subquery — Users with More Than 3 Bookings

SELECT 
    id, 
    name, 
    email
FROM 
    users u
WHERE 
    (
        SELECT 
            COUNT(*)
        FROM 
            bookings b
        WHERE 
            b.user_id = u.id
    ) > 3;

