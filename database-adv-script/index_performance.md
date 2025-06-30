📈 3. Measure Performance Before and After Using EXPLAIN or ANALYZE
🔍 Example Query to Analyze:
sql
Copy
Edit
EXPLAIN ANALYZE
SELECT 
    users.name, COUNT(bookings.id) AS total_bookings
FROM 
    users
JOIN 
    bookings ON users.id = bookings.user_id
GROUP BY 
    users.id;
