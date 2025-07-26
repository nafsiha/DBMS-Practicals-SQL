CREATE DATABASE hospital_management_system;
USE hospital_management_system;

CREATE TABLE Patient (
    Patient_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    DOB DATE,
    Gender VARCHAR(10),
    Contact VARCHAR(15),
    Address VARCHAR(200)
);

INSERT INTO Patient 
(Patient_ID, Name, DOB, Gender, Contact, Address) 
VALUES
(101, 'Ananya Sen', '2001-05-21', 'Female', '9876543210', 'Kolkata'),
(102, 'Rohan Gupta', '1998-09-11', 'Male', '9812345678', 'Delhi'),
(103, 'Maya Iyer', '1995-12-25', 'Female', '9123456789', 'Mumbai'),
(104, 'Kunal Sharma', '2002-03-15', 'Male', '9988776655', 'Pune'),
(105, 'Sneha Das', '2000-07-10', 'Female', '9090909090', 'Chennai'),
(106, 'Aditya Rao', '1999-08-30', 'Male', '9845123678', 'Bangalore'),
(107, 'Isha Jain', '1997-01-02', 'Female', '9811223344', 'Jaipur'),
(108, 'Harshit Singh', '1996-11-19', 'Male', '9765432109', 'Lucknow'),
(109, 'Priya Nair', '2003-04-08', 'Female', '9712345678', 'Hyderabad'),
(110, 'Arnav Dey', '1994-02-18', 'Male', '9786543210', 'Ahmedabad');

CREATE TABLE Doctor (
    Doctor_ID INT PRIMARY KEY,
    Name VARCHAR(100),
    Specialization VARCHAR(50),
    Availability VARCHAR(100)
);

INSERT INTO Doctor 
(Doctor_ID, Name, Specialization, Availability) 
VALUES
(1, 'Dr. Asha Mehta', 'Cardiology', 'Mon-Fri 10am-4pm'),
(2, 'Dr. Raj Verma', 'Orthopedics', 'Tue-Sat 11am-5pm'),
(3, 'Dr. Neha Sharma', 'Pediatrics', 'Mon-Fri 9am-2pm'),
(4, 'Dr. Amit Desai', 'Neurology', 'Mon-Wed 1pm-6pm'),
(5, 'Dr. Fatima Khan', 'Dermatology', 'Thu-Sat 10am-3pm'),
(6, 'Dr. Karan Joshi', 'ENT', 'Mon-Fri 10am-5pm'),
(7, 'Dr. Rina Paul', 'Gynecology', 'Tue-Thu 12pm-4pm'),
(8, 'Dr. Arjun Kapoor', 'Gastroenterology', 'Mon-Fri 11am-3pm'),
(9, 'Dr. Snehal Patil', 'Psychiatry', 'Mon-Fri 2pm-6pm'),
(10, 'Dr. Nikhil Rao', 'Urology', 'Wed-Sat 10am-1pm');

CREATE TABLE Appointment (
    Appointment_ID INT PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    Date DATE,
    Time TIME,
    Status VARCHAR(20),
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

INSERT INTO Appointment 
(Appointment_ID, Patient_ID, Doctor_ID, Date, Time, Status) 
VALUES
(1001, 101, 1, '2024-06-10', '10:30:00', 'Completed'),
(1002, 102, 2, '2024-06-15', '11:00:00', 'Completed'),
(1003, 103, 3, '2024-06-16', '09:30:00', 'Completed'),
(1004, 104, 4, '2024-07-01', '01:00:00', 'Scheduled'),
(1005, 105, 5, '2024-07-05', '10:00:00', 'Cancelled'),
(1006, 106, 6, '2024-07-10', '10:45:00', 'Scheduled'),
(1007, 107, 7, '2024-07-12', '12:30:00', 'Scheduled'),
(1008, 108, 8, '2024-07-15', '11:30:00', 'Scheduled'),
(1009, 109, 9, '2024-07-18', '02:30:00', 'Scheduled'),
(1010, 110, 10, '2024-07-20', '10:15:00', 'Scheduled');

SELECT * FROM Patient;

SELECT * FROM Doctor;

SELECT * FROM Appointment;

SELECT * 
FROM Appointment 
WHERE Date >= CURRENT_DATE();

SELECT 
    a.Appointment_ID,
    p.Name AS PatientName,
    d.Name AS DoctorName,
    d.Specialization,
    a.Date,
    a.Time,
    a.Status
FROM Appointment a
JOIN Patient p ON a.Patient_ID = p.Patient_ID
JOIN Doctor d ON a.Doctor_ID = d.Doctor_ID
ORDER BY a.Date, a.Time;

SELECT 
    a.Appointment_ID,
    d.Name AS DoctorName,
    d.Specialization,
    a.Date,
    a.Time,
    a.Status
FROM Appointment a
JOIN Doctor d ON a.Doctor_ID = d.Doctor_ID
WHERE a.Patient_ID = 104
ORDER BY a.Date DESC;

SELECT Name, Specialization 
FROM Doctor 
ORDER BY Specialization;

SELECT 
    d.Name AS DoctorName,
    d.Specialization,
    COUNT(a.Appointment_ID) AS TotalAppointments
FROM Doctor d
LEFT JOIN Appointment a ON d.Doctor_ID = a.Doctor_ID
GROUP BY d.Doctor_ID, d.Name, d.Specialization
ORDER BY TotalAppointments DESC;

SELECT DISTINCT p.Name AS PatientName
FROM Appointment a
JOIN Patient p ON a.Patient_ID = p.Patient_ID
JOIN Doctor d ON a.Doctor_ID = d.Doctor_ID
WHERE d.Specialization = 'Cardiology';

UPDATE Patient
SET Contact = '9991112223'
WHERE Patient_ID = 102;

DELETE FROM Appointment
WHERE Appointment_ID = 1005 AND Status = 'Cancelled';

SELECT *
FROM Appointment
WHERE Doctor_ID = 1 AND Date = '2024-07-01' AND Time = '10:30:00';