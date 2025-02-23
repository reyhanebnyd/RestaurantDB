-- Insert samples for Ingredients
INSERT INTO Ingredients (name, place, situation, availability, expire) VALUES
('Tomato', 'Refrigerator', 'Fresh', TRUE, '2025-01-10'),
('Onion', 'Pantry', 'Good', TRUE, '2025-02-15'),
('Chicken', 'Freezer', 'Frozen', TRUE, '2025-01-20'),
('Carrot', 'Refrigerator', 'Fresh', TRUE, '2025-01-15'),
('Potato', 'Pantry', 'Good', TRUE, '2025-03-01'),
('Cheese', 'Refrigerator', 'Fresh', TRUE, '2025-01-25'),
('Milk', 'Refrigerator', 'Fresh', TRUE, '2025-01-08'),
('Bread', 'Pantry', 'Stale', FALSE, '2025-01-05');

-- Insert samples for Food
INSERT INTO Food (name, price, recipe) VALUES
('Tomato Soup', 5.89, 'Blend tomatoes, cook with spices, and serve hot.'),
('Chicken Curry', 10.99, 'Cook chicken with spices, onions, and tomatoes.'),
('Veggie Salad', 7.50, 'Mix fresh veggies with dressing.'),
('Cheese Pizza', 8.00, 'Spread sauce, top with cheese, and bake.'),
('Mashed Potatoes', 5.00, 'Boil potatoes, mash, and add butter.'),
('Carrot Cake', 6.00, 'Mix grated carrots, flour, and bake.'),
('Grilled Cheese Sandwich', 3.99, 'Toast bread with cheese inside.'),
('Milkshake', 4.50, 'Blend milk, sugar, and flavor.');

-- Insert samples for IngredientFood
INSERT INTO IngredientFood (ingredient_id, food_id) VALUES
(1, 1), (2, 2), (3, 2), (4, 3),
(5, 5), (6, 4), (7, 8), (8, 7),
(1, 3), (2, 5), (3, 6), (4, 4);

-- Insert samples for Customer
INSERT INTO Customer (name, phone_number, email) VALUES
('Alice Smith', '555-1234', 'alice@example.com'),
('Bob Johnson', '555-5678', 'bob@example.com'),
('Cathy Brown', '555-8765', 'cathy@example.com'),
('David White', '555-4321', 'david@example.com'),
('Ella Green', '555-2233', 'ella@example.com'),
('Frank Black', '555-3344', 'frank@example.com'),
('Grace Blue', '555-4455', 'grace@example.com'),
('Hank Red', '555-5566', 'hank@example.com');

-- Insert samples for Orders
INSERT INTO Orders (time, delivery_type, status, score, get_ready_duration, customer_id) VALUES
('2025-01-09 11:30:00', TRUE, 'open', 4, '00:20:00', 2),
('2025-01-10 14:45:00', FALSE, 'closed', 5, '00:25:00', 3),
('2025-01-11 16:00:00', TRUE, 'pending', 3, '00:30:00', 4),
('2025-01-12 12:00:00', FALSE, 'open', 2, '00:40:00', 1),
('2025-01-13 13:20:00', TRUE, 'closed', 4, '00:35:00', 5),
('2025-01-14 17:15:00', FALSE, 'pending', 5, '00:45:00', 6),
('2025-01-15 19:50:00', TRUE, 'open', 3, '00:30:00', 7),
('2025-01-16 20:30:00', FALSE, 'closed', 5, '00:20:00', 8),
('2025-01-17 15:00:00', TRUE, 'pending', 4, '00:25:00', 1),
('2025-01-18 11:45:00', FALSE, 'open', 5, '00:35:00', 2),
('2025-01-19 18:30:00', TRUE, 'closed', 3, '00:40:00', 3),
('2025-01-20 21:10:00', FALSE, 'pending', 2, '00:50:00', 4),
('2025-01-21 09:00:00', TRUE, 'open', 4, '00:20:00', 5),
('2025-01-22 16:45:00', FALSE, 'closed', 5, '00:15:00', 6),
('2025-01-23 10:30:00', TRUE, 'pending', 3, '00:30:00', 7),
('2025-01-24 19:00:00', FALSE, 'open', 4, '00:35:00', 8);


-- Insert samples for FoodOrder
INSERT INTO FoodOrder (food_id, order_id) VALUES
(1, 1), (2, 1), (3, 3), (4, 4),
(5, 5), (6, 6), (7, 7), (8, 8),
(2, 10),
(3, 11),
(4, 11),
(5, 12),
(1, 13),
(6, 13),
(7, 14),
(8, 15),
(1, 10),
(4, 14),
(3, 15);



-- Insert samples for Payment
INSERT INTO Payment (type, date, order_id) VALUES
('Credit Card', '2025-01-01', 1),
('Cash', '2025-01-02', 2),
('Credit Card', '2025-01-03', 3),
('Cash', '2025-01-04', 4),
('Credit Card', '2025-01-05', 5),
('Cash', '2025-01-06', 6),
('Credit Card', '2025-01-07', 7),
('Cash', '2025-05-08', 8),
('Credit Card', '2025-06-05', 9),
('Cash', '2025-01-04', 10),
('Credit Card', '2025-07-07', 11),
('Cash', '2025-01-09', 12);

-- Insert samples for Discount
INSERT INTO Discount (name, amount) VALUES
('New Year Discount', 0.10),
('Holiday Sale', 0.15),
('Loyalty Discount', 0.05),
('Special Offer', 0.20),
('Bulk Order Discount', 0.08),
('Happy Hour', 0.12),
('Weekend Discount', 0.07),
('Referral Bonus', 0.10);

-- Insert samples for PaymentDiscount
INSERT INTO PaymentDiscount (payment_id, discount_id) VALUES
(1, 1), (2, 2), (3, 3), (3, 4),
(5, 5), (5, 6), (7, 7), (8, 8);

-- Insert samples for Employee
INSERT INTO Employee (name, role, shift, join_date, salary) VALUES
('John Doe', 'Chef', 'morning', '2023-01-01', 3000.00),
('Jane Smith', 'Manager', 'morning', '2022-05-15', 5000.00),
('Mike Johnson', 'Delivery Driver', 'night', '2023-03-20', 2500.00),
('Emily Brown', 'Cashier', 'full', '2021-08-10', 2000.00),
('Steve White', 'Chef', 'full', '2020-11-25', 3100.00),
('Sarah Green', 'Chef', 'full', '2019-09-01', 5200.00),
('Tom Black', 'Delivery Driver', 'morning', '2024-02-18', 2600.00),
('Laura Blue', 'Cashier', 'night', '2023-07-05', 2100.00);

-- Insert samples for Duty
INSERT INTO Duty (description) VALUES
('Prepare meals'),
('Manage orders'),
('Deliver food'),
('Handle payments'),
('Supervise staff'),
('Inventory management'),
('Customer service'),
('Clean kitchen');

-- Insert samples for EmployeeDuty
INSERT INTO EmployeeDuty (employee_id, duty_id) VALUES
(1, 1), (2, 2), (3, 3), (4, 4),
(2, 1), (6, 5), (7, 3), (8, 4),
(1, 5), (5,6), (8, 3);

-- Insert samples for OrderEmployee
INSERT INTO OrderEmployee (order_id, employee_id) VALUES
(1, 1), (2, 3), (3, 4), (4, 2),
(5, 5), (6, 7), (7, 6), (8, 8),
(3,5), (9,8), (11,6), (11,3);


