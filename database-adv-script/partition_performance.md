-- Step 1: Rename the existing bookings table (backup)
ALTER TABLE bookings RENAME TO bookings_old;

-- Step 2: Create a new partitioned bookings table by RANGE on start_date
CREATE TABLE bookings (
    id SERIAL PRIMARY KEY,
    user_id INT,
    property_id INT,
    start_date DATE NOT NULL,
    end_date DATE,
    status VARCHAR(50)
) PARTITION BY RANGE (start_date);

-- Step 3: Create monthly partitions (you can adjust based on your data range)
CREATE TABLE bookings_2023_q1 PARTITION OF bookings
    FOR VALUES FROM ('2023-01-01') TO ('2023-04-01');

CREATE TABLE bookings_2023_q2 PARTITION OF bookings
    FOR VALUES FROM ('2023-04-01') TO ('2023-07-01');

CREATE TABLE bookings_2023_q3 PARTITION OF bookings
    FOR VALUES FROM ('2023-07-01') TO ('2023-10-01');

CREATE TABLE bookings_2023_q4 PARTITION OF bookings
    FOR VALUES FROM ('2023-10-01') TO ('2024-01-01');

-- Step 4: Insert data from old table into the new partitioned table
INSERT INTO bookings (id, user_id, property_id, start_date, end_date, status)
SELECT id, user_id, property_id, start_date, end_date, status
FROM bookings_old;

-- Step 5: Analyze performance of a query on the partitioned table
EXPLAIN ANALYZE
SELECT *
FROM bookings
WHERE start_date BETWEEN '2023-04-15' AND '2023-05-15';
