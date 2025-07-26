# Library Management System - DBMS Practical 1

# Problem Statement

This project aims to build a Library Management System for a college to track book inventory, manage student memberships, and log book issue/return transactions, in order to improve access, reduce paperwork, and avoid manual errors.

# Objective

To design and implement a relational database using SQL that enables librarians and students to manage books, membership records, and book lending efficiently and accurately.

# Tables and Attributes

## 1. `library_book`
- `Book_ID` (Primary Key)
- `Title`
- `Author`
- `Publisher`
- `ISBN`
- `Category`
- `Copies_Available`

## 2. `library_member`
- `Member_ID` (Primary Key)
- `Name`
- `Department`
- `Membership_Date`
- `Contact`

## 3. `library_transaction`
- `Transaction_ID` (Primary Key)
- `Book_ID` (Foreign Key)
- `Member_ID` (Foreign Key)
- `Issue_Date`
- `Return_Date`
- `Fine`

# SQL Code

The SQL file includes:
- `CREATE DATABASE`, `USE`, and `CREATE TABLE` statements
- `INSERT INTO` commands with sample data for all three tables
- Proper usage of `PRIMARY KEY` and `FOREIGN KEY` constraints

# Sample Queries

```sql
-- View all books in the library
SELECT * FROM library_book;

-- Find members who have borrowed more than one book
SELECT Member_ID, COUNT(*) AS Total_Issued
FROM library_transaction
GROUP BY Member_ID
HAVING COUNT(*) > 1;

-- Find overdue books with fines
SELECT * FROM library_transaction
WHERE Return_Date < CURDATE() AND Fine > 0;
