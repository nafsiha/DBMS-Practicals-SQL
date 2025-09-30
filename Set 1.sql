CREATE DATABASE StudentEnrollment;
USE StudentEnrollment;

CREATE TABLE StudentEnrollment (
    StudentID INT,
    StudentName VARCHAR(100),
    Phone VARCHAR(20),
    CourseID INT,
    CourseName VARCHAR(100),
    Instructor VARCHAR(100),
    InstructorPhone VARCHAR(20),
    Semester VARCHAR(20),
    Grade VARCHAR(5)
);

INSERT INTO StudentEnrollment VALUES
(1, 'Amit Sharma', '9876543210', 101, 'Database Systems', 'Dr. Rao', '9876500001', 'Fall 2025', 'A'),
(1, 'Amit Sharma', '9876543210', 102, 'Computer Networks', 'Dr. Gupta', '9876500002', 'Fall 2025', 'B'),
(2, 'Priya Patel', '9876501234', 101, 'Database Systems', 'Dr. Rao', '9876500001', 'Fall 2025', 'A'),
(3, 'Rohan Mehta', '9876511111', 103, 'Operating Systems', 'Dr. Iyer', '9876500003', 'Spring 2026', 'C'),
(3, 'Rohan Mehta', '9876511111', 101, 'Database Systems', 'Dr. Rao', '9876500001', 'Fall 2025', 'B');

SELECT * FROM StudentEnrollment;

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(100),
    Phone VARCHAR(20)
);

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY AUTO_INCREMENT,
    InstructorName VARCHAR(100),
    InstructorPhone VARCHAR(20)
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(100),
    InstructorID INT,
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY AUTO_INCREMENT,
    StudentID INT,
    CourseID INT,
    Semester VARCHAR(20),
    Grade VARCHAR(5),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    UNIQUE (StudentID, CourseID, Semester)
);

INSERT INTO Students (StudentID, StudentName, Phone) VALUES
(1,'Amit Sharma','9876543210'),
(2,'Priya Patel','9876501234'),
(3,'Rohan Mehta','9876511111');

INSERT INTO Instructors (InstructorID, InstructorName, InstructorPhone) VALUES
(1,'Dr. Rao','9876500001'),
(2,'Dr. Gupta','9876500002'),
(3,'Dr. Iyer','9876500003');

INSERT INTO Courses (CourseID, CourseName, InstructorID) VALUES
(101,'Database Systems',1),
(102,'Computer Networks',2),
(103,'Operating Systems',3);

INSERT INTO Enrollments (StudentID, CourseID, Semester, Grade) VALUES
(1,101,'Fall 2025','A'),
(1,102,'Fall 2025','B'),
(2,101,'Fall 2025','A'),
(3,103,'Spring 2026','C'),
(3,101,'Fall 2025','B');

-- 1. Identify insertion anomalies in the table.
-- 2. Identify update anomalies in the table.
-- 3. Identify deletion anomalies in the table.
-- 4. Does this schema satisfy 1NF? Why or why not?
-- 5. Rewrite the schema to achieve 1NF.
-- 6. Define the primary key for this unnormalized table.
-- 7. List the functional dependencies (FDs) in this dataset.
-- 8. Explain why this table does not satisfy 2NF.
-- 9. Split the table into 2NF tables.
-- 10. Create SQL CREATE TABLE statements for 2NF schema.
-- 11. Show how transitive dependencies exist in this dataset.
-- 12. Convert the schema to 3NF.
-- 13. Write SQL CREATE TABLE for 3NF schema.
-- 14. Check if the 3NF schema also satisfies BCNF. If not, modify it.
-- 15. Write a SQL query (using normalized schema) to list all students with their courses and instructors.
SELECT s.StudentID, s.StudentName, c.CourseID, c.CourseName, i.InstructorName, e.Semester, e.Grade
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
JOIN Instructors i ON c.InstructorID = i.InstructorID;

-- 16. Write a query to find all courses taken by a specific student.
SELECT c.CourseID, c.CourseName, e.Semester, e.Grade
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE s.StudentName = 'Amit Sharma';

-- 17. Write a query to count number of students enrolled in each course.
SELECT c.CourseID, c.CourseName, COUNT(DISTINCT e.StudentID) AS NumStudents
FROM Enrollments e JOIN Courses c ON e.CourseID = c.CourseID
GROUP BY c.CourseID, c.CourseName;

-- 18. Write a query to find instructors who teach more than one course.
SELECT i.InstructorName, COUNT(*) AS NumCourses
FROM Courses c JOIN Instructors i ON c.InstructorID = i.InstructorID
GROUP BY i.InstructorName
HAVING COUNT(*) > 1;

-- 19. Write a query to list all students who received grade "A" in any course.
SELECT s.StudentID, s.StudentName
FROM Enrollments e
JOIN Students s ON e.StudentID = s.StudentID
JOIN Courses c ON e.CourseID = c.CourseID
WHERE e.Grade='A' AND c.CourseName='Database Systems';

-- 20. Explain how the normalized schema reduces redundancy compared to the unnormalized one.