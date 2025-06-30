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
