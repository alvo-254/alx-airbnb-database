# 📈 Partitioning Performance Report — Task 5

## 🧠 Objective

The goal was to implement table partitioning on the `bookings` table by `start_date` to improve performance when querying large datasets, especially for date-range filters.

---

## ⚙️ What Was Done

- The original `bookings` table was renamed and backed up.
- A new `bookings` table was created and partitioned by `RANGE (start_date)` into quarterly partitions.
- Existing data was copied into the new structure.
- A performance test was run using `EXPLAIN ANALYZE` to evaluate date-range query execution.

---

## 📊 Observations

- **Before partitioning**: The query scanned the entire `bookings` table, leading to higher cost and longer execution time.
- **After partitioning**: The planner accessed only the relevant partition(s) based on the `start_date` range. This **reduced I/O, CPU time, and improved query speed**.

### Sample Result from EXPLAIN ANALYZE:
