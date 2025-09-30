CREATE DATABASE EmployeeProjectAssignment;
USE EmployeeProjectAssignment; 

CREATE TABLE EmployeeProject (
    EmpID INT,
    EmpName VARCHAR(100),
    Department VARCHAR(50),
    DeptLocation VARCHAR(50),
    ProjectID INT,
    ProjectName VARCHAR(100),
    ProjectManager VARCHAR(100),
    HoursWorked INT,
    SkillSet VARCHAR(200)
);

INSERT INTO EmployeeProject VALUES
(201,'Rita Singh','IT','Mumbai',301,'Website Revamp','Arjun Mehta',25,'HTML,CSS,JS'),
(202,'Suresh Kumar','IT','Mumbai',302,'Network Upgrade','Neha Patel',40,'Networking,Firewalls'),
(203,'Anita Desai','HR','Pune',303,'Onboarding','Ritu Shah',10,'Communication,MS-Excel'),
(201,'Rita Singh','IT','Mumbai',304,'Mobile App','Karan Joshi',30,'ReactNative,JS'),
(204,'Vikram Rao','Finance','Mumbai',305,'Audit','Meera Iyer',15,'Accounting');

CREATE TABLE Departments (
    DeptID INT PRIMARY KEY AUTO_INCREMENT,
    DeptName VARCHAR(50) UNIQUE,
    DeptLocation VARCHAR(50)
);

CREATE TABLE Employees (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(100),
    DeptID INT,
    FOREIGN KEY (DeptID) REFERENCES Departments(DeptID)
);

CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    ProjectManager VARCHAR(100)
);

CREATE TABLE EmployeeProjects (
    EmpID INT,
    ProjectID INT,
    HoursWorked INT,
    PRIMARY KEY (EmpID, ProjectID),
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);

CREATE TABLE Skills (
    SkillID INT PRIMARY KEY AUTO_INCREMENT,
    SkillName VARCHAR(100) UNIQUE
);

CREATE TABLE EmployeeSkills (
    EmpID INT,
    SkillID INT,
    PRIMARY KEY (EmpID, SkillID),
    FOREIGN KEY (EmpID) REFERENCES Employees(EmpID),
    FOREIGN KEY (SkillID) REFERENCES Skills(SkillID)
);

INSERT INTO Departments (DeptID, DeptName, DeptLocation) VALUES
(1,'IT','Mumbai'),(2,'HR','Pune'),(3,'Finance','Mumbai');

INSERT INTO Employees (EmpID, EmpName, DeptID) VALUES
(201,'Rita Singh',1),(202,'Suresh Kumar',1),(203,'Anita Desai',2),(204,'Vikram Rao',3);

INSERT INTO Projects (ProjectID, ProjectName, ProjectManager) VALUES
(301,'Website Revamp','Arjun Mehta'),
(302,'Network Upgrade','Neha Patel'),
(303,'Onboarding','Ritu Shah'),
(304,'Mobile App','Karan Joshi'),
(305,'Audit','Meera Iyer');

INSERT INTO EmployeeProjects (EmpID, ProjectID, HoursWorked) VALUES
(201,301,25),(202,302,40),(203,303,10),(201,304,30),(204,305,15);

INSERT INTO Skills (SkillID, SkillName) VALUES
(1,'HTML'),(2,'CSS'),(3,'JS'),(4,'Networking'),(5,'Firewalls'),(6,'Communication'),(7,'MS-Excel'),(8,'ReactNative'),(9,'Accounting');

INSERT INTO EmployeeSkills VALUES
(201,1),(201,2),(201,3),(201,8),
(202,4),(202,5),
(203,6),(203,7),
(204,9); 

-- 1. Identify insertion anomalies in this table.
-- 2. Identify update anomalies.
-- 3. Identify deletion anomalies.
-- 4. Does this schema satisfy 1NF? Explain.
-- 5. Normalize to 1NF.
-- 6. State the primary key.
-- 7. Write functional dependencies (FDs).
-- 8. Identify partial dependencies.
-- 9. Convert schema into 2NF.
-- 10. Write SQL for 2NF tables.
-- 11. Explain why transitive dependencies still exist.
-- 12. Convert schema into 3NF.
-- 13. Write SQL for 3NF tables.
-- 14. Check if schema satisfies BCNF. Modify if needed.
-- 15. Query: List employees with their projects.
SELECT e.EmpID,e.EmpName,p.ProjectName,ep.HoursWorked
FROM EmployeeProjects ep
JOIN Employees e ON ep.EmpID=e.EmpID
JOIN Projects p ON ep.ProjectID=p.ProjectID;

-- 16. Query: Count projects per employee.
SELECT e.EmpID,e.EmpName,COUNT(ep.ProjectID) AS ProjectsCount
FROM Employees e LEFT JOIN EmployeeProjects ep ON e.EmpID=ep.EmpID
GROUP BY e.EmpID,e.EmpName;

-- 17. Query: Find employees with more than 1 skill.
SELECT e.EmpID,e.EmpName,COUNT(es.SkillID) AS SkillCount
FROM Employees e JOIN EmployeeSkills es ON e.EmpID=es.EmpID
GROUP BY e.EmpID,e.EmpName
HAVING COUNT(es.SkillID)>1;

-- 18. Query: Find managers handling multiple projects.
SELECT ProjectManager, COUNT(*) AS NumProjects
FROM Projects
GROUP BY ProjectManager
HAVING COUNT(*)>1;

-- 19. Query: Find employees working > 40 hours.
SELECT e.EmpID,e.EmpName, SUM(ep.HoursWorked) AS TotalHours
FROM Employees e JOIN EmployeeProjects ep ON e.EmpID=ep.EmpID
GROUP BY e.EmpID,e.EmpName
HAVING SUM(ep.HoursWorked) > 40;

-- 20. Discuss redundancy before vs. after normalization.