CREATE TABLE Recipe (
    RecipeID INT AUTO_INCREMENT PRIMARY KEY,
    Description TEXT NOT NULL,
    Active BOOLEAN DEFAULT TRUE

);

CREATE TABLE RawMaterials (
    RawMaterialID INT AUTO_INCREMENT PRIMARY KEY,
    Place VARCHAR(255) NOT NULL,
    Situation TEXT,
    ExpirationDate DATE,
    Availability INT NOT NULL DEFAULT 0,
    RecipeID INT,
    FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID)

);

CREATE TABLE RecipeRawMaterial(
    RecipeID INT,
    RawMaterial INT,
    FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID),
    FOREIGN KEY (RawMaterial) REFERENCES RawMaterials(RawMaterialID)
);

CREATE TABLE Food (
    FoodID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Price DECIMAL(10, 2) NOT NULL,
    Type VARCHAR(255) NOT NULL,
    RecipeID INT,
    UNIQUE (RecipeID),
    FOREIGN KEY (RecipeID) REFERENCES Recipe(RecipeID)
);

CREATE TABLE Customer(
    CustomerID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255),
    PhoneNumber VARCHAR(11)
);

CREATE TABLE Ordering(
    OrdersID INT AUTO_INCREMENT PRIMARY KEY,
    BookTime DATETIME DEFAULT CURRENT_TIMESTAMP,
    PreparationTime INT NOT NULL,
    Delivery BOOLEAN DEFAULT FALSE,
    Status ENUM('open', 'pending', 'closed') NOT NULL,
    CustomerID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE FoodOrders(
    OrdersID INT,
    FoodID INT,
    FOREIGN KEY (OrdersID) REFERENCES Ordering(OrdersID),
    FOREIGN KEY (FoodID) REFERENCES Food(FoodID)
);

CREATE TABLE Discount (
    DiscountID INT AUTO_INCREMENT PRIMARY KEY,
    Percentage DECIMAL(5, 2) NOT NULL
);

-- Other existing tables
CREATE TABLE Role (
    RoleID INT AUTO_INCREMENT PRIMARY KEY,
    RoleName VARCHAR(100) NOT NULL
);

CREATE TABLE Salary (
    SalaryID INT AUTO_INCREMENT PRIMARY KEY,
    Amount DECIMAL(10, 2) NOT NULL,
    Deficit DECIMAL(10, 2) NOT NULL,
    Benefit VARCHAR(255)
);

CREATE TABLE Employee (
    EmployeeID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    JoinDate DATE NOT NULL ,
    Shift ENUM('morning', 'evening', 'both') NOT NULL ,
    RoleID INT,
    SalaryID INT,
    UNIQUE (SalaryID),
    UNIQUE (RoleID),
    FOREIGN KEY (RoleID) REFERENCES Role(RoleID),
    FOREIGN KEY (SalaryID) REFERENCES Salary(SalaryID)
);

CREATE TABLE EmployeeOrders(
    EmployeeID INT,
    OrderSID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (OrderSID) REFERENCES Ordering(OrdersID)
);

CREATE TABLE Payment (
    PaymentID INT AUTO_INCREMENT PRIMARY KEY,
    Amount DECIMAL(10, 2) NOT NULL,
    Date DATETIME DEFAULT CURRENT_TIMESTAMP,
    CustomerID INT,
    Method ENUM('credit card', 'cash') NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE Duty (
    DutyID INT AUTO_INCREMENT PRIMARY KEY,
    DutyDescription VARCHAR(255) NOT NULL,
    EmployeeID INT
);

CREATE TABLE Event(
    EventID INT AUTO_INCREMENT PRIMARY KEY ,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL ,
    Capacity INT NOT NULL

);

CREATE TABLE CustomerEvent(
    CustomerID INT,
    EventID INT,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (EventID) REFERENCES Event(EventID)
);

CREATE TABLE EmployeeDuty(
    EmployeeID INT,
    DutyID INT,
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID),
    FOREIGN KEY (DutyID) REFERENCES Duty(DutyID)

)

SELECT f.Name AS FoodName, o.BookTime, o.Status
FROM Food f
JOIN FoodOrders fo ON f.FoodID = fo.FoodID
JOIN Ordering o ON fo.OrdersID = o.OrdersID
WHERE o.CustomerID = 1;

SELECT Place, ExpirationDate
FROM RawMaterials
WHERE ExpirationDate < CURDATE();

SELECT c.Name AS CustomerName, SUM(p.Amount) AS TotalPayment
FROM Payment p
JOIN Customer c ON p.CustomerID = c.CustomerID
GROUP BY c.CustomerID;

SELECT e.Name AS EmployeeName, r.RoleName
FROM Employee e
JOIN Role r ON e.RoleID = r.RoleID;

SELECT e.EventID, COUNT(ce.CustomerID) AS NumberOfCustomers
FROM Event e
LEFT JOIN CustomerEvent ce ON e.EventID = ce.EventID
GROUP BY e.EventID;


