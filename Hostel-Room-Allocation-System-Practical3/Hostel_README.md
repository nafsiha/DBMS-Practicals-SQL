# Hostel Room Allocation System – DBMS Practical 3

# Problem Statement

A university wants to manage student room allocation digitally to track occupancy, student check-ins/outs, and maintain room availability status in real-time.

# Objective

To design and implement a relational database using SQL that helps:
- Allocate hostel rooms to students
- Track room capacity and occupancy status
- Maintain check-in and check-out history

# Database Tables and Attributes

## 1. `Student`
- `Student_ID` (Primary Key)  
- `Name`  
- `Gender`  
- `Course`  
- `Year`  

## 2. `Room`
- `Room_ID` (Primary Key)  
- `Room_Type`  
- `Capacity`  
- `Occupancy_Status`  

## 3. `Allocation`
- `Allocation_ID` (Primary Key)  
- `Student_ID` (Foreign Key)  
- `Room_ID` (Foreign Key)  
- `CheckIn_Date`  
- `CheckOut_Date`  

# SQL Code Overview

The SQL script includes:
- `CREATE DATABASE`, `USE`, and `CREATE TABLE` statements
- Sample `INSERT INTO` data for students, rooms, and allocations
- Relational integrity using `PRIMARY KEY` and `FOREIGN KEY`
- Useful `SELECT`, `JOIN`, `UPDATE` queries for real-time hostel management

# Sample Queries

```sql
-- View all students
SELECT * FROM Student;

-- Male students and their courses
SELECT Student_ID, Name, Course
FROM Student
WHERE Gender = 'Male';

-- Students currently staying (not checked out)
SELECT S.Name AS StudentName, R.Room_ID, A.CheckIn_Date
FROM Allocation A
JOIN Student S ON A.Student_ID = S.Student_ID
JOIN Room R ON A.Room_ID = R.Room_ID
WHERE A.CheckOut_Date IS NULL;