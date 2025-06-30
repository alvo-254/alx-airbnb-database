## 📘 Normalization to 3NF

The Airbnb database schema has been reviewed and adjusted to meet **Third Normal Form (3NF)** standards. This helps eliminate redundancy and ensure the data remains clean, consistent, and scalable.

### ✅ What is 3NF?
A table is in **3NF** if:
1. It is in **2NF** (no partial dependencies).
2. All non-primary-key columns are directly dependent on the primary key.
3. There are **no transitive dependencies** (i.e., non-key columns don't depend on other non-key columns).

---

### ✅ Table-by-Table Analysis

- **User**  
  All fields depend on `user_id` with no transitive dependencies.  
  ✔️ 3NF Compliant

- **Property**  
  All fields depend on `property_id`.  
  ✔️ 3NF Compliant

- **Booking**  
  All columns are fully functionally dependent on `booking_id`.  
  ✔️ 3NF Compliant

- **Payment**  
  Each payment references a booking by `booking_id`.  
  ✔️ 3NF Compliant  
  *(Optional: Normalize `payment_method` into a separate table.)*

- **Review**  
  All attributes directly depend on `review_id`.  
  ✔️ 3NF Compliant

- **Message**  
  Sender and recipient IDs are both FK references to `User`.  
  ✔️ 3NF Compliant

---

### 🛠️ Optional Normalization Improvements

To improve flexibility, consider converting ENUM fields into lookup/reference tables:

| Field             | Suggested Table          |
|------------------|--------------------------|
| `role`           | `UserRole(role_id, role_name)` |
| `status`         | `BookingStatus(status_id, status)` |
| `payment_method` | `PaymentMethod(id, method_name)` |

These reference tables make it easier to manage options without altering the schema.

---

### ✅ Conclusion

The Airbnb schema is fully in **Third Normal Form (3NF)**. No major structural changes are needed, but ENUM normalization is recommended for long-term scalability.
