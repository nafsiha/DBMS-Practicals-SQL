CREATE DATABASE hostel_room_allocation_system;
USE hostel_room_allocation_system;

CREATE TABLE Student (
    Student_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Gender VARCHAR(10),
    Course VARCHAR(50),
    Year INT
);

INSERT INTO Student 
(Student_ID, Name, Gender, Course, Year) 
VALUES
(1, 'Ritika Sen', 'Female', 'B.Tech CS', 2),
(2, 'Ayaan Khan', 'Male', 'BBA', 1),
(3, 'Neha Mehta', 'Female', 'B.Com', 3),
(4, 'Rohit Verma', 'Male', 'B.Tech EE', 2),
(5, 'Sanya Singh', 'Female', 'BA', 1),
(6, 'Karan Malhotra', 'Male', 'MBA', 1),
(7, 'Mehul Patel', 'Male', 'B.Tech ME', 4),
(8, 'Isha Kapoor', 'Female', 'M.Sc', 2),
(9, 'Tushar Roy', 'Male', 'BA', 3),
(10, 'Divya Nair', 'Female', 'BCA', 2);

CREATE TABLE Room (
    Room_ID INT PRIMARY KEY,
    Room_Type VARCHAR(50),
    Capacity INT,
    Occupancy_Status VARCHAR(20) 
);

INSERT INTO Room 
(Room_ID, Room_Type, Capacity, Occupancy_Status) 
VALUES
(101, 'Single', 1, 'Available'),
(102, 'Double', 2, 'Partially Occupied'),
(103, 'Double', 2, 'Full'),
(104, 'Triple', 3, 'Partially Occupied'),
(105, 'Single', 1, 'Full'),
(106, 'Triple', 3, 'Available'),
(107, 'Double', 2, 'Available'),
(108, 'Single', 1, 'Available'),
(109, 'Triple', 3, 'Full'),
(110, 'Double', 2, 'Full');

CREATE TABLE Allocation (
    Allocation_ID INT PRIMARY KEY,
    Student_ID INT,
    Room_ID INT,
    CheckIn_Date DATE,
    CheckOut_Date DATE,
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID),
    FOREIGN KEY (Room_ID) REFERENCES Room(Room_ID)
);

INSERT INTO Allocation 
(Allocation_ID, Student_ID, Room_ID, CheckIn_Date, CheckOut_Date) 
VALUES
(1001, 1, 102, '2024-07-01', NULL),
(1002, 2, 103, '2024-07-01', NULL),
(1003, 3, 103, '2024-07-01', NULL),
(1004, 4, 104, '2024-07-02', NULL),
(1005, 5, 104, '2024-07-03', NULL),
(1006, 6, 105, '2024-07-01', NULL),
(1007, 7, 109, '2024-07-01', NULL),
(1008, 8, 104, '2024-07-05', NULL),
(1009, 9, 110, '2024-07-02', NULL),
(1010, 10, 110, '2024-07-02', NULL);

SELECT *
FROM Student;

SELECT *
FROM Room;

SELECT *
FROM Allocation;

SELECT Student_ID, Name, Course
FROM Student
WHERE Gender = 'Male';

SELECT Room_ID, Room_Type, Capacity
FROM Room
WHERE Occupancy_Status = 'Available';

SELECT Allocation_ID, Student_ID, Room_ID
FROM Allocation
WHERE CheckIn_Date = '2024-07-01';

SELECT Name, Course
FROM Student;

SELECT Room_Type, Capacity
FROM Room;

SELECT Name, Course
FROM Student
WHERE Year = 2;

SELECT Room_ID, Occupancy_Status
FROM Room
WHERE Room_Type = 'Double';

SELECT S.Name AS StudentName, R.Room_ID, A.CheckIn_Date
FROM Allocation A
JOIN Student S ON A.Student_ID = S.Student_ID
JOIN Room R ON A.Room_ID = R.Room_ID
WHERE A.CheckOut_Date IS NULL;

UPDATE Student
SET Gender = 'Other'
WHERE Student_ID = 1;

UPDATE Room
SET Occupancy_Status = 'Full'
WHERE Room_ID = 101;
