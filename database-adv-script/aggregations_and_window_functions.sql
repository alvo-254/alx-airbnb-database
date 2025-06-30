✅ 1. Aggregation Query — Total Bookings per User

SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    ROW_NUMBER() OVER (ORDER BY COUNT(*) DESC) AS row_num_rank
FROM 
    bookings
GROUP BY 
    property_id;


2. Window Function — Rank Properties by Number of Bookings

SELECT 
    property_id,
    COUNT(*) AS total_bookings,
    RANK() OVER (ORDER BY COUNT(*) DESC) AS rank_with_ties
FROM 
    bookings
GROUP BY 
    property_id;

