🔍 1. Identify High-Usage Columns
From your previous queries, common columns used in JOIN, WHERE, and ORDER BY clauses include:

users.id – Used in joins and filters

bookings.user_id – Used in joins and subqueries

bookings.property_id – Used in aggregations and joins

properties.id – Used in joins

reviews.property_id – Used in joins and subqueries

bookings.start_date – Useful for range queries or partitioning

🧱 2. Create Indexes (Save to database_index.sql)
sql
Copy
Edit
-- Index on users.id (primary key, may already exist)
CREATE INDEX idx_users_id ON users(id);

-- Index on bookings.user_id
CREATE INDEX idx_bookings_user_id ON bookings(user_id);

-- Index on bookings.property_id
CREATE INDEX idx_bookings_property_id ON bookings(property_id);

-- Index on properties.id (primary key, may already exist)
CREATE INDEX idx_properties_id ON properties(id);

-- Index on reviews.property_id
CREATE INDEX idx_reviews_property_id ON reviews(property_id);

-- Optional: Index on bookings.start_date for performance on date range queries
CREATE INDEX idx_bookings_start_date ON bookings(start_date);
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
