CREATE DATABASE car_rental_system;
USE car_rental_system;

CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    License_Number VARCHAR(20),
    Contact VARCHAR(15)
);

INSERT INTO Customer 
(Customer_ID, Name, License_Number, Contact) 
VALUES
(1, 'Ankit Sharma', 'MH12AB1234', '9876543210'),
(2, 'Neha Kapoor', 'DL05XY6789', '9812345678'),
(3, 'Rohan Mehta', 'KA03MN4567', '9123456789'),
(4, 'Isha Singh', 'TN22PQ3344', '9988776655'),
(5, 'Karan Verma', 'UP32DE9999', '9090909090'),
(6, 'Sneha Joshi', 'GJ01ZZ4433', '9845123678'),
(7, 'Amit Patel', 'WB12JK5432', '9811223344'),
(8, 'Riya Nair', 'KL09KL7654', '9765432109'),
(9, 'Harshit Roy', 'RJ14LM9876', '9712345678'),
(10, 'Tanya Rao', 'MP23NP5566', '9786543210');

CREATE TABLE Car (
    Car_ID INT PRIMARY KEY,
    Model VARCHAR(50),
    Category VARCHAR(30), 
    Manufacturer VARCHAR(50),
    Availability_Status VARCHAR(20) 
);

INSERT INTO Car 
(Car_ID, Model, Category, Manufacturer, Availability_Status) 
VALUES
(101, 'City ZX', 'Sedan', 'Honda', 'Rented'),
(102, 'Creta', 'SUV', 'Hyundai', 'Available'),
(103, 'Innova Crysta', 'MPV', 'Toyota', 'Available'),
(104, 'Baleno', 'Hatchback', 'Maruti', 'Rented'),
(105, 'XUV700', 'SUV', 'Mahindra', 'Available'),
(106, 'Seltos', 'SUV', 'Kia', 'Available'),
(107, 'Tiago', 'Hatchback', 'Tata', 'Available'),
(108, 'Altroz', 'Hatchback', 'Tata', 'Rented'),
(109, 'Fortuner', 'SUV', 'Toyota', 'Available'),
(110, 'Verna', 'Sedan', 'Hyundai', 'Available');

CREATE TABLE Staff (
    Staff_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Role VARCHAR(50), 
    Contact VARCHAR(15)
);

INSERT INTO Staff 
(Staff_ID, Name, Role, Contact) 
VALUES
(1, 'Deepak Kumar', 'Driver', '9871234560'),
(2, 'Meena Iyer', 'Admin', '9812341122'),
(3, 'Ravi Sinha', 'Mechanic', '9723456789'),
(4, 'Anita Das', 'Driver', '9900001112'),
(5, 'Varun Shah', 'Support', '9870009991'),
(6, 'Fatima Qureshi', 'Admin', '9911002233'),
(7, 'Nikhil Rao', 'Driver', '9789011223'),
(8, 'Priya Joshi', 'Support', '9888777666'),
(9, 'Ajay Kumar', 'Mechanic', '9654321098'),
(10, 'Divya Mehta', 'Admin', '9432110098');

CREATE TABLE Rental (
    Rental_ID INT PRIMARY KEY,
    Customer_ID INT,
    Car_ID INT,
    Rental_Date DATE,
    Return_Date DATE,
    Total_Amount DECIMAL(10, 2),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Car_ID) REFERENCES Car(Car_ID)
);

INSERT INTO Rental 
(Rental_ID, Customer_ID, Car_ID, Rental_Date, Return_Date, Total_Amount) 
VALUES
(1001, 1, 101, '2024-07-01', NULL, 1200.00),
(1002, 2, 104, '2024-07-02', NULL, 950.00),
(1003, 3, 103, '2024-06-20', '2024-06-22', 2100.00),
(1004, 4, 102, '2024-06-25', '2024-06-27', 1800.00),
(1005, 5, 108, '2024-07-03', NULL, 1150.00),
(1006, 6, 105, '2024-06-15', '2024-06-17', 2200.00),
(1007, 7, 106, '2024-06-20', '2024-06-23', 1850.00),
(1008, 8, 107, '2024-07-01', '2024-07-02', 800.00),
(1009, 9, 109, '2024-06-30', '2024-07-01', 2500.00),
(1010, 10, 110, '2024-07-04', '2024-07-05', 1700.00);

SELECT *
FROM Customer;

SELECT *
FROM Car;

SELECT *
FROM Staff;

SELECT *
FROM Rental;

SELECT Car_ID, Model, Category
FROM Car
WHERE Availability_Status = 'Available';

SELECT Name, Contact
FROM Customer;

SELECT Staff_ID, Name, Contact
FROM Staff
WHERE Role = 'Admin';

SELECT R.Rental_ID, C.Name AS CustomerName, Ca.Model AS CarModel, R.Rental_Date
FROM Rental R
JOIN Customer C ON R.Customer_ID = C.Customer_ID
JOIN Car Ca ON R.Car_ID = Ca.Car_ID
WHERE R.Return_Date IS NULL;

SELECT Total_Amount
FROM Rental
WHERE Rental_ID = 1003;

SELECT Car_ID, Model, Availability_Status
FROM Car
WHERE Manufacturer = 'Toyota';

SELECT
    R.Rental_ID,
    Ca.Model AS RentedCar,
    R.Rental_Date,
    R.Total_Amount
FROM Rental R
JOIN Car Ca ON R.Car_ID = Ca.Car_ID
WHERE R.Customer_ID = 1;

SELECT Name, Contact
FROM Staff
WHERE Role = 'Driver';
