-- average score of each food
SELECT
    Food.name AS food_name,
    AVG(Orders.score) AS avg_score
FROM
    Food
JOIN
    FoodOrder ON Food.id = FoodOrder.food_id
JOIN
    Orders ON FoodOrder.order_id = Orders.id
WHERE
    Orders.score IS NOT NULL
GROUP BY
    Food.name
ORDER BY
    avg_score DESC;

-- what food a specific customer ordered the most
SELECT
    Food.name AS food_name,
    COUNT(FoodOrder.food_id) AS order_count
FROM
    Orders
JOIN
    FoodOrder ON Orders.id = FoodOrder.order_id
JOIN
    Food ON FoodOrder.food_id = Food.id
WHERE
    Orders.customer_id = 4
GROUP BY
    Food.name
ORDER BY
    order_count DESC
LIMIT 1;

-- what kind of discounts a specific order received
SELECT
    Discount.name AS discount_name,
    Discount.amount AS discount_amount
FROM
    Payment
JOIN
    PaymentDiscount ON Payment.id = PaymentDiscount.payment_id
JOIN
    Discount ON PaymentDiscount.discount_id = Discount.id
WHERE
    Payment.order_id = 3;

-- what kind of duties a specific employee has
SELECT
    Duty.description AS duty_description
FROM
    EmployeeDuty
JOIN
    Duty ON EmployeeDuty.duty_id = Duty.id
WHERE
    EmployeeDuty.employee_id = 2;

-- how many orders employees made ready
SELECT
    Employee.name AS employee_name,
    COUNT(OrderEmployee.order_id) AS orders_made_ready
FROM
    Employee
JOIN
    OrderEmployee ON Employee.id = OrderEmployee.employee_id
GROUP BY
    Employee.name;

-- which employee earns the most salary
SELECT
    name,
    salary
FROM
    Employee
ORDER BY
    salary DESC
LIMIT 1;

-- the most expensive food
SELECT
    name,
    price
FROM
    Food
ORDER BY
    price DESC
LIMIT 1;


-- which customer paid the most during an interval
SELECT
    Customer.name AS customer_name,
    SUM(Food.price) AS total_paid
FROM
    Payment
JOIN
    Orders ON Payment.order_id = Orders.id
JOIN
    FoodOrder ON Orders.id = FoodOrder.order_id
JOIN
    Food ON FoodOrder.food_id = Food.id
JOIN
    Customer ON Orders.customer_id = Customer.id
WHERE
    Payment.date BETWEEN '2025-01-01' AND '2025-01-19'  -- Replace with actual interval
GROUP BY
    Customer.name
ORDER BY
    total_paid DESC
LIMIT 1;


-- which food was the most ordered
SELECT
    f.name AS food_name,
    COUNT(fo.food_id) AS order_count
FROM
    FoodOrder fo
JOIN
    Food f ON fo.food_id = f.id
GROUP BY
    f.id, f.name
ORDER BY
    order_count DESC
LIMIT 1;

-- name of employees with shift = full
SELECT
    e.name
FROM employee AS e
WHERE e.shift = 'full';

-- avg score of each employee
SELECT
    e.id AS employee_id,
    e.name AS employee_name,
    AVG(o.score) AS average_score
FROM
    Orders o
JOIN
    OrderEmployee oe ON o.id = oe.order_id
JOIN
    Employee e ON oe.employee_id = e.id
WHERE
    o.score IS NOT NULL
GROUP BY
    e.id, e.name
ORDER BY
    average_score DESC;


SELECT f.name, count(fo.food_id) as food_count
FROM food f
JOIN foodorder fo ON f.id = fo.food_id
JOIN orders o ON fo.order_id = o.id
WHERE
    o.time BETWEEN '2025-01-01' AND '2025-01-19'
GROUP BY f.name
ORDER BY food_count DESC
LIMIT 1;











