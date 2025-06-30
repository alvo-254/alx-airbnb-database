🔹 1. Initial (Unoptimized) Complex Query
sql
Copy
Edit
-- Initial complex query: Retrieves all bookings with related user, property, and payment details
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
    payments ON payments.booking_id = bookings.id;
🔎 2. Analyze Performance with EXPLAIN
sql
Copy
Edit
-- Analyze initial query performance
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
    payments ON payments.booking_id = bookings.id;
⚙️ 3. Refactor the Query for Performance
Ensure the necessary indexes have been created (see your database_index.sql)

Remove unnecessary columns or JOINs if not required

Use SELECT with specific fields instead of SELECT *

Ensure table filtering or sorting (if any) uses indexed columns

Refactored Query Example (optimized):

sql
Copy
Edit
-- Optimized query: Avoids SELECT *, uses indexed joins, and selects only needed columns
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
    payments pay ON pay.booking_id = b.id;

✅ Final performance.sql

-- Initial complex query
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
    payments ON payments.booking_id = bookings.id;

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
    payments ON payments.booking_id = bookings.id;

-- Optimized query with EXPLAIN ANALYZE
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
    payments pay ON pay.booking_id = b.id;
