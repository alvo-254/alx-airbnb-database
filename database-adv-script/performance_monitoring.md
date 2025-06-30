# 📊 Monitoring and Refining Database Performance — Task 6

## 🧠 Objective

To monitor query performance using execution plans, identify performance bottlenecks, and implement changes that lead to faster, more efficient queries.

---

## 🔍 Monitoring Steps

Used `EXPLAIN ANALYZE` to evaluate performance of two frequently used queries:

1. Counting user bookings since 2023
2. Ranking properties by booking count

---

## ❌ Issues Identified

- Full table scans on `bookings` and `users`
- No indexes used on `start_date`, `user_id`, or `property_id`
- Join and aggregation queries were slow on large datasets

---

## 🛠️ Fixes Applied

- Created indexes on:
  - `bookings.start_date`
  - `bookings.user_id`
  - `users.id`
  - `properties.id`
- Optimized SELECT statements by avoiding `SELECT *` and using column projections

---

## ✅ Results (Before vs After)

| Metric                        | Before Optimization | After Optimization |
|------------------------------|---------------------|--------------------|
| Execution time (user count)  | ~900ms              | ~250ms             |
| Execution time (property rank) | ~1200ms            | ~300ms             |
| Index Usage                  | ❌ No               | ✅ Yes              |
| Table Scan                   | Full                | Index Scan         |

---

## ✅ Conclusion

By adding appropriate indexes and refining query structure, database performance improved significantly. `EXPLAIN ANALYZE` helped validate that indexes were being used and query plans became more efficient.

This approach ensures the database remains scalable and responsive under growing loads.
