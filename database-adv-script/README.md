# 📘 Task 0: Complex Queries with Joins

This task is part of the **ALX Airbnb Database Module**, focusing on mastering SQL joins for data analysis and retrieval in a simulated Airbnb environment.

## 🧠 Objective

Learn and apply SQL join techniques to effectively retrieve and combine data from related tables including `users`, `bookings`, `properties`, and `reviews`.

---

## 🔧 Requirements

- Familiarity with basic SQL syntax
- Understanding of table relationships
- SQL environment to run queries (e.g., MySQL, PostgreSQL)

---

## 🔗 Queries Implemented

### 1. INNER JOIN — Bookings and Users

Retrieve all bookings along with the user who made each booking.

```sql
SELECT 
    bookings.id AS booking_id,
    bookings.property_id,
    bookings.start_date,
    bookings.end_date,
    users.id AS user_id,
    users.name AS user_name,
    users.email
FROM 
    bookings
INNER JOIN 
    users ON bookings.user_id = users.id;


# 📘 Task 1: Practice Subqueries

This task focuses on mastering the use of **SQL subqueries**—both correlated and non-correlated—within the context of the Airbnb database schema. Subqueries are essential for filtering, analyzing, and breaking down complex logic into reusable components.

## 🧠 Objective

- Use **non-correlated subqueries** for aggregate analysis.
- Use **correlated subqueries** to dynamically compare data across rows.
- Improve SQL query fluency for data-driven insights.

---

## 🔗 Queries Implemented

### 1. 🧮 Non-Correlated Subquery — Properties with Average Rating > 4.0

Retrieve all properties that have an **average review rating greater than 4.0**.

```sql
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
