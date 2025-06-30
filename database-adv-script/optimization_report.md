# ⚙️ Optimization Report — Task 4: Optimize Complex Queries

## 🎯 Objective

The goal of this task was to analyze and refactor a complex SQL query that retrieves booking data along with related user, property, and payment details. The optimization focuses on improving query performance through indexing, selective column retrieval, and query refactoring.

---

## 🔍 Initial Query Overview

The original query joined four tables (`bookings`, `users`, `properties`, `payments`) and selected multiple columns:

```sql
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
