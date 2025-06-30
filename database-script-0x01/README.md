## 🛠️ Database Schema (SQL)

This project includes a fully normalized relational database schema for an Airbnb-style platform, defined using SQL `CREATE TABLE` statements. The schema follows best practices for data integrity, scalability, and performance, and is designed to meet **Third Normal Form (3NF)**.

### ✅ Technologies & Assumptions
- **Database**: PostgreSQL
- **UUIDs**: Used for primary keys with `uuid_generate_v4()`
- **Constraints**: All essential constraints (PKs, FKs, NOT NULL, UNIQUE, CHECK)
- **Indexing**: Applied to frequently queried fields like `email`, `property_id`, and `booking_id`

### 📦 Tables Overview

| Table       | Description                                           |
|-------------|-------------------------------------------------------|
| `User`      | Stores user details, roles (guest, host, admin)       |
| `Property`  | Listings posted by hosts                              |
| `Booking`   | User bookings of properties with statuses             |
| `Payment`   | Payments linked to bookings and payment methods       |
| `Review`    | Ratings/comments left by users on properties          |
| `Message`   | Direct messages between users                         |

### 📄 Example: Table Definition (User)
```sql
CREATE TABLE "User" (
  user_id UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
  first_name VARCHAR NOT NULL,
  last_name VARCHAR NOT NULL,
  email VARCHAR UNIQUE NOT NULL,
  password_hash VARCHAR NOT NULL,
  phone_number VARCHAR,
  role VARCHAR CHECK (role IN ('guest', 'host', 'admin')) NOT NULL,
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
