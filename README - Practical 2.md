# Hospital Management System – DBMS Practical 2

# Problem Statement

A multi-specialty hospital wants to manage patient records, doctor schedules, and appointments electronically to avoid missed records and overlapping bookings.

# Objective

To design and implement a relational database using SQL that enables hospitals to efficiently manage:
- Patient records
- Doctor availability
- Appointment scheduling

This ensures faster access to medical histories and optimized staff usage.

# Database Tables and Attributes

## 1. `Patient`
- `Patient_ID` (Primary Key)  
- `Name`  
- `DOB`  
- `Gender`  
- `Contact`  
- `Address`  

## 2. `Doctor`
- `Doctor_ID` (Primary Key)  
- `Name`  
- `Specialization`  
- `Availability`  

## 3. `Appointment`
- `Appointment_ID` (Primary Key)  
- `Patient_ID` (Foreign Key)  
- `Doctor_ID` (Foreign Key)  
- `Date`  
- `Time`  
- `Status`  

# SQL Code Overview

The SQL file for the Hospital Management System includes:

- `CREATE DATABASE`, `USE`, and `CREATE TABLE` statements
- `INSERT INTO` commands with sample data for all three tables
- Proper usage of `PRIMARY KEY` and `FOREIGN KEY` constraints
- A variety of `SELECT`, `UPDATE`, and `DELETE` queries to demonstrate database functionalities

# Sample Queries

```sql
-- View all patients
SELECT * FROM Patient;

-- List all upcoming appointments
SELECT *
FROM Appointment
WHERE Date >= CURRENT_DATE();

-- Delete a cancelled appointment (Example: Appointment_ID 1005)
DELETE FROM Appointment
WHERE Appointment_ID = 1005 AND Status = 'Cancelled';
```
