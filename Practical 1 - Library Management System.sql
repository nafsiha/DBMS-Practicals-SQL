CREATE DATABASE library_management_system1;
USE library_management_system;

CREATE TABLE library_book (
	Book_ID INT PRIMARY KEY,
    Title VARCHAR(100), 
    Author VARCHAR(50), 
    Publisher VARCHAR(50), 
    ISBN VARCHAR(50), 
    Category VARCHAR(50), 
    Copies_Available INT
);

INSERT INTO library_book
(Book_ID, Title, Author, Publisher, ISBN, Category, Copies_Available) 
VALUES
(1, 'Introduction to Algorithms', 'Thomas H. Cormen', 'MIT Press', '9780262033848', 'Computer Science', 5),
(2, 'Clean Code', 'Robert C. Martin', 'Prentice Hall', '9780132350884', 'Software Engineering', 3),
(3, 'The Alchemist', 'Paulo Coelho', 'HarperOne', '9780061122415', 'Fiction', 7),
(4, 'To Kill a Mockingbird', 'Harper Lee', 'J.B. Lippincott & Co.', '9780446310789', 'Classic', 4),
(5, 'Data Structures in C', 'Reema Thareja', 'Oxford University Press', '9780198099307', 'Computer Science', 6),
(6, 'Digital Logic Design', 'M. Morris Mano', 'Pearson', '9780131989269', 'Electronics', 2),
(7, 'The Power of Habit', 'Charles Duhigg', 'Random House', '9780812981605', 'Self-help', 3),
(8, 'Database System Concepts', 'Abraham Silberschatz', 'McGraw-Hill', '9780073523323', 'Database', 5),
(9, 'Sapiens', 'Yuval Noah Harari', 'Harvill Secker', '9780099590088', 'History', 4),
(10, 'Artificial Intelligence', 'Stuart Russell', 'Pearson', '9780136042594', 'AI', 3);

CREATE TABLE library_member (
	Member_ID INT PRIMARY KEY, 
    Name VARCHAR(50), 
    Department VARCHAR(50), 
    Membership_Date DATE, 
    Contact VARCHAR(50)
);

INSERT INTO library_member
(Member_ID, Name, Department, Membership_Date, Contact) 
VALUES
(201, 'Aarav Mehta', 'Computer Science', '2023-08-10', '9876543210'),
(202, 'Riya Sharma', 'Electrical', '2022-07-15', '9812345678'),
(203, 'Kabir Khan', 'Mechanical', '2021-06-01', '9797979797'),
(204, 'Sneha Das', 'Electronics', '2024-01-25', '9123456789'),
(205, 'Aditya Verma', 'Civil', '2023-03-14', '9988776655'),
(206, 'Neha Singh', 'IT', '2022-11-30', '9090909090'),
(207, 'Ishaan Roy', 'Computer Science', '2021-09-20', '9871234560'),
(208, 'Tanya Kapoor', 'Mechanical', '2023-02-11', '9845123678'),
(209, 'Raj Patel', 'Electronics', '2023-12-01', '9811223344'),
(210, 'Meera Iyer', 'Civil', '2022-04-08', '9765432109');

CREATE TABLE library_transaction (
	Transaction_ID INT PRIMARY KEY, 
    Book_ID INT, 
    Member_ID INT, 
    Issue_Date DATE, 
    Return_Date DATE, 
    Fine DECIMAL(6,2),
    FOREIGN KEY (Book_ID) REFERENCES library_book(Book_ID),
    FOREIGN KEY (Member_ID) REFERENCES library_member(Member_ID)
);

INSERT INTO library_transaction 
(Transaction_ID, Book_ID, Member_ID, Issue_Date, Return_Date, Fine) 
VALUES
(1001, 1, 201, '2024-06-01', '2024-06-15', 0.00),
(1002, 3, 202, '2024-05-10', '2024-05-28', 8.00),
(1003, 2, 203, '2024-06-05', '2024-06-18', 4.00),
(1004, 5, 204, '2024-06-10', '2024-06-20', 0.00),
(1005, 4, 205, '2024-05-15', '2024-06-05', 12.00),
(1006, 6, 206, '2024-06-01', '2024-06-10', 0.00),
(1007, 7, 207, '2024-06-15', '2024-07-01', 6.00),
(1008, 9, 208, '2024-06-20', '2024-07-04', 4.00),
(1009, 10, 209, '2024-06-25', '2024-07-10', 4.00),
(1010, 8, 210, '2024-06-10', '2024-06-24', 0.00);

SELECT * FROM library_book;

SELECT * FROM library_member;

SELECT * FROM library_transaction;

SELECT *
FROM library_book
WHERE Copies_Available > 0;

SELECT lm.Name, lb.Title
FROM library_transaction lt
JOIN library_member lm ON lt.Member_ID = lm.Member_ID
JOIN library_book lb ON lt.Book_ID = lb.Book_ID
WHERE lt.Return_Date IS NULL;

SELECT lm.Name, lb.Title, lt.Fine
FROM library_transaction lt
JOIN library_member lm ON lt.Member_ID = lm.Member_ID
JOIN library_book lb ON lt.Book_ID = lb.Book_ID
WHERE lt.Fine > 0;

SELECT Fine, Book_ID, Member_ID, Issue_Date, Return_Date
FROM library_transaction
WHERE Fine > 0;

SELECT Name
FROM library_member;

SELECT Title
FROM library_book;

SELECT Fine
FROM library_transaction;

SELECT
    Member_ID,
    Name,
    Department,
    Membership_Date
FROM
    library_member
ORDER BY
    Name ASC;
