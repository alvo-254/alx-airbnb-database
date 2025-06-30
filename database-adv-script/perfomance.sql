-- Initial unoptimized query with WHERE and AND included
SELECT 
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name AS user_name,
    users.email,
    properties.id AS property_id,
    properties.name AS property_name,
    properties.location,
    payments.id AS payment_id,
    payments.amount,
    payments.status
FROM 
    bookings
JOIN 
    users ON bookings.user_id = users.id
JOIN 
    properties ON bookings.property_id = properties.id
JOIN 
    payments ON payments.booking_id = bookings.id
WHERE 
    bookings.start_date >= '2023-01-01' 
    AND bookings.status = 'confirmed';

-- Analyze performance before optimization
EXPLAIN ANALYZE
SELECT 
    bookings.id AS booking_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name AS user_name,
    users.email,
    properties.id AS property_id,
    properties.name AS property_name,
    properties.location,
    payments.id AS payment_id,
    payments.amount,
    payments.status
FROM 
    bookings
JOIN 
    users ON bookings.user_id = users.id
JOIN 
    properties ON bookings.property_id = properties.id
JOIN 
    payments ON payments.booking_id = bookings.id
WHERE 
    bookings.start_date >= '2023-01-01' 
    AND bookings.status = 'confirmed';

-- Optimized query using aliases, fewer columns, and same WHERE clause
EXPLAIN ANALYZE
SELECT 
    b.id AS booking_id,
    b.start_date,
    b.end_date,
    u.name AS user_name,
    u.email,
    p.name AS property_name,
    pay.amount,
    pay.status
FROM 
    bookings b
JOIN 
    users u ON b.user_id = u.id
JOIN 
    properties p ON b.property_id = p.id
JOIN 
    payments pay ON pay.booking_id = b.id
WHERE 
    b.start_date >= '2023-01-01' 
    AND b.status = 'confirmed';
