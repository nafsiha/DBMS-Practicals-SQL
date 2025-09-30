CREATE DATABASE LibraryBookBorrowing;
USE LibraryBookBorrowing;

CREATE TABLE LibraryBorrowing (
    BorrowID INT,
    MemberID INT,
    MemberName VARCHAR(100),
    MemberAddress VARCHAR(200),
    BookID VARCHAR(100),
    BookTitle VARCHAR(200),
    Author VARCHAR(100),
    Publisher VARCHAR(100),
    BorrowDate DATE,
    ReturnDate DATE
);

INSERT INTO LibraryBorrowing VALUES
(401,1001,'Kiran Shah','Mumbai','B001','Intro to Databases','A. Silberschatz','Pearson','2025-09-01','2025-09-15'),
(402,1002,'Manish Verma','Pune','B002','Computer Networks','J. Kurose','McGraw-Hill','2025-09-03','2025-09-17'),
(403,1001,'Kiran Shah','Mumbai','B003','Operating Systems','A. Tanenbaum','Pearson','2025-09-05',NULL),
(404,1003,'Sana Khan','Delhi','B001','Intro to Databases','A. Silberschatz','Pearson','2025-09-07','2025-09-21'),
(405,1004,'Ravi Patel','Mumbai','B004','Algorithms','Cormen','MIT Press','2025-09-10','2025-09-24');

CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    MemberName VARCHAR(100),
    MemberAddress VARCHAR(200)
);

CREATE TABLE Books (
    BookID VARCHAR(20) PRIMARY KEY,
    BookTitle VARCHAR(200),
    Author VARCHAR(100),
    Publisher VARCHAR(100)
);

CREATE TABLE Borrowings (
    BorrowID INT PRIMARY KEY,
    MemberID INT,
    BookID VARCHAR(20),
    BorrowDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID),
    FOREIGN KEY (BookID) REFERENCES Books(BookID)
);

INSERT INTO Members VALUES
(1001,'Kiran Shah','Mumbai'),
(1002,'Manish Verma','Pune'),
(1003,'Sana Khan','Delhi'),
(1004,'Ravi Patel','Mumbai');

INSERT INTO Books VALUES
('B001','Intro to Databases','A. Silberschatz','Pearson'),
('B002','Computer Networks','J. Kurose','McGraw-Hill'),
('B003','Operating Systems','A. Tanenbaum','Pearson'),
('B004','Algorithms','Cormen','MIT Press');

INSERT INTO Borrowings VALUES
(401,1001,'B001','2025-09-01','2025-09-15'),
(402,1002,'B002','2025-09-03','2025-09-17'),
(403,1001,'B003','2025-09-05',NULL),
(404,1003,'B001','2025-09-07','2025-09-21'),
(405,1004,'B004','2025-09-10','2025-09-24');

-- 1. Identify insertion anomalies.
-- 2. Identify update anomalies.
-- 3. Identify deletion anomalies.
-- 4. Why does this table fail 1NF?
-- 5. Rewrite schema in 1NF.
-- 6. State primary key.
-- 7. Write FDs.
-- 8. Remove partial dependencies (2NF).
-- 9. Write SQL for 2NF schema.
-- 10. Identify transitive dependencies.
-- 11. Convert to 3NF.
-- 12. Write SQL for 3NF schema.
-- 13. Does schema meet BCNF?
-- 14. Query: List all books borrowed by a member.
SELECT b.BookID,b.BookTitle,br.BorrowDate,br.ReturnDate
FROM Borrowings br JOIN Books b ON br.BookID=b.BookID
WHERE br.MemberID=1001;

-- 15. Query: Find members who borrowed more than 3 books.
SELECT m.MemberID,m.MemberName,COUNT(*) AS BorrowCount
FROM Members m JOIN Borrowings br ON m.MemberID=br.MemberID
GROUP BY m.MemberID,m.MemberName
HAVING COUNT(*)>3;

-- 16. Query: Find authors whose books are borrowed most.
SELECT b.Author,COUNT(*) AS BorrowedCount
FROM Books b JOIN Borrowings br ON b.BookID=br.BookID
GROUP BY b.Author
ORDER BY BorrowedCount DESC;

-- 17. Query: Count books borrowed per month.
SELECT DATE_FORMAT(BorrowDate, '%Y-%m') AS Month, COUNT(*) AS TotalBorrows
FROM Borrowings
GROUP BY Month;

-- 18. Query: List overdue books.
SELECT br.BorrowID,m.MemberName,b.BookTitle, br.BorrowDate
FROM Borrowings br
JOIN Members m ON br.MemberID=m.MemberID
JOIN Books b ON br.BookID=b.BookID
WHERE br.ReturnDate IS NULL AND DATEDIFF(CURDATE(), br.BorrowDate) > 14;

-- 19. Query: Find publishers whose books are borrowed most.
-- 20. Compare redundancy pre/post normalization.