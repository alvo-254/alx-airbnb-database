-- Insert sample users
INSERT INTO "User" (user_id, first_name, last_name, email, password_hash, phone_number, role)
VALUES
  (uuid_generate_v4(), 'Alice', 'Walker', 'alice@example.com', 'hashed_pw_1', '0700123456', 'guest'),
  (uuid_generate_v4(), 'Bob', 'Mugendi', 'bob@example.com', 'hashed_pw_2', '0700123457', 'host'),
  (uuid_generate_v4(), 'Carol', 'Wairimu', 'carol@example.com', 'hashed_pw_3', '0700123458', 'admin');

-- Insert sample properties
INSERT INTO Property (property_id, host_id, name, description, location, pricepernight)
VALUES
  (uuid_generate_v4(), (SELECT user_id FROM "User" WHERE email = 'bob@example.com'), 'Cozy Loft', 'A quiet loft in Westlands.', 'Nairobi', 45.00),
  (uuid_generate_v4(), (SELECT user_id FROM "User" WHERE email = 'bob@example.com'), 'Beach House', 'Oceanfront property with 2 bedrooms.', 'Mombasa', 120.00);

-- Insert sample bookings
INSERT INTO Booking (booking_id, property_id, user_id, start_date, end_date, total_price, status)
VALUES
  (
    uuid_generate_v4(),
    (SELECT property_id FROM Property WHERE name = 'Cozy Loft'),
    (SELECT user_id FROM "User" WHERE email = 'alice@example.com'),
    '2025-07-01',
    '2025-07-05',
    180.00,
    'confirmed'
  );

-- Insert sample payment
INSERT INTO Payment (payment_id, booking_id, amount, payment_method)
VALUES
  (
    uuid_generate_v4(),
    (SELECT booking_id FROM Booking LIMIT 1),
    180.00,
    'paypal'
  );

-- Insert sample review
INSERT INTO Review (review_id, property_id, user_id, rating, comment)
VALUES
  (
    uuid_generate_v4(),
    (SELECT property_id FROM Property WHERE name = 'Cozy Loft'),
    (SELECT user_id FROM "User" WHERE email = 'alice@example.com'),
    5,
    'Great stay! The loft was clean and peaceful.'
  );

-- Insert sample message
INSERT INTO Message (message_id, sender_id, recipient_id, message_body)
VALUES
  (
    uuid_generate_v4(),
    (SELECT user_id FROM "User" WHERE email = 'alice@example.com'),
    (SELECT user_id FROM "User" WHERE email = 'bob@example.com'),
    'Hi Bob, is the loft available next weekend?'
  );
