CREATE TABLE events (
    id INT PRIMARY KEY,
    name TEXT,
    createAt TEXT
);

CREATE TABLE events_old (
    id INT PRIMARY KEY,
    name TEXT,
    createAt TEXT
);

-- Current events
INSERT INTO events (id, name, createAt) VALUES
    (21, 'User Registration',       '2026-02-01 09:15:00'),
    (22, 'Password Reset',          '2026-02-02 11:20:00'),
    (23, 'Order Created',           '2026-02-03 14:05:00'),
    (24, 'Payment Confirmed',       '2026-02-04 16:40:00'),
    (25, 'Invoice Generated',       '2026-02-05 08:55:00');

-- Old events
INSERT INTO events_old (id, name, createAt) VALUES
    (1, 'User Registration',        '2026-01-01 08:10:00'),
    (2, 'Password Reset',           '2026-01-02 09:20:00'),
    (3, 'Order Created',            '2026-01-03 10:30:00'),
    (4, 'Payment Confirmed',        '2026-01-04 11:40:00'),
    (5, 'Invoice Generated',        '2026-01-05 12:50:00'),
    (6, 'Subscription Renewed',     '2026-01-06 13:00:00'),
    (7, 'Email Sent',               '2026-01-07 14:10:00'),
    (8, 'Profile Updated',          '2026-01-08 15:20:00'),
    (9, 'Support Ticket Opened',    '2026-01-09 16:30:00'),
    (10, 'Support Ticket Closed',   '2026-01-10 17:40:00'),
    (11, 'Product Reviewed',        '2026-01-11 18:50:00'),
    (12, 'Cart Abandoned',          '2026-01-12 19:00:00'),
    (13, 'Checkout Started',        '2026-01-13 20:10:00'),
    (14, 'Refund Requested',        '2026-01-14 21:20:00'),
    (15, 'Refund Approved',         '2026-01-15 22:30:00'),
    (16, 'Login Success',           '2026-01-16 08:05:00'),
    (17, 'Login Failed',            '2026-01-17 09:15:00'),
    (18, 'Notification Sent',       '2026-01-18 10:25:00'),
    (19, 'API Key Generated',       '2026-01-19 11:35:00'),
    (20, 'Account Deleted',         '2026-01-20 12:45:00');