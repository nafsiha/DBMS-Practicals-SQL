CREATE DATABASE HospitalPatientRecords;
USE HospitalPatientRecords;

CREATE TABLE PatientRecords (
    PatientID INT,
    PatientName VARCHAR(100),
    Age INT,
    DoctorName VARCHAR(100),
    DoctorSpecialization VARCHAR(100),
    AppointmentDate DATE,
    Treatment VARCHAR(200),
    MedicinePrescribed VARCHAR(200),
    BillAmount DECIMAL(10,2)
);

INSERT INTO PatientRecords VALUES
(501,'Sunil Kumar',45,'Dr. Sharma','Cardiology','2025-09-05','ECG','Aspirin',1500.00),
(502,'Meera Joshi',30,'Dr. Rao','Orthopedics','2025-09-07','X-Ray','Painkiller',800.00),
(501,'Sunil Kumar',45,'Dr. Sharma','Cardiology','2025-10-01','Follow-up','Aspirin',500.00),
(503,'Akhil Singh',60,'Dr. Varma','Geriatrics','2025-09-20','Checkup','Vitamins',1200.00),
(504,'Nisha Patel',28,'Dr. Rao','Orthopedics','2025-08-30','Physiotherapy','Painkiller',2000.00);

CREATE TABLE Patients (
    PatientID INT PRIMARY KEY,
    PatientName VARCHAR(100),
    Age INT
);

CREATE TABLE Doctors (
    DoctorID INT PRIMARY KEY AUTO_INCREMENT,
    DoctorName VARCHAR(100) UNIQUE,
    DoctorSpecialization VARCHAR(100)
);

CREATE TABLE Appointments (
    AppointmentID INT PRIMARY KEY AUTO_INCREMENT,
    PatientID INT,
    DoctorID INT,
    AppointmentDate DATE,
    Treatment VARCHAR(200),
    BillAmount DECIMAL(10,2),
    FOREIGN KEY (PatientID) REFERENCES Patients(PatientID),
    FOREIGN KEY (DoctorID) REFERENCES Doctors(DoctorID)
);

CREATE TABLE Medicines (
    MedicineID INT PRIMARY KEY AUTO_INCREMENT,
    MedicineName VARCHAR(200) UNIQUE
);

CREATE TABLE AppointmentMedicines (
    AppointmentID INT,
    MedicineID INT,
    PRIMARY KEY (AppointmentID, MedicineID),
    FOREIGN KEY (AppointmentID) REFERENCES Appointments(AppointmentID),
    FOREIGN KEY (MedicineID) REFERENCES Medicines(MedicineID)
);

INSERT INTO Patients VALUES (501,'Sunil Kumar',45),(502,'Meera Joshi',30),(503,'Akhil Singh',60),(504,'Nisha Patel',28);

INSERT INTO Doctors (DoctorID,DoctorName,DoctorSpecialization) VALUES
(1,'Dr. Sharma','Cardiology'),
(2,'Dr. Rao','Orthopedics'),
(3,'Dr. Varma','Geriatrics');

INSERT INTO Appointments (PatientID,DoctorID,AppointmentDate,Treatment,BillAmount) VALUES
(501,1,'2025-09-05','ECG',1500.00),
(502,2,'2025-09-07','X-Ray',800.00),
(501,1,'2025-10-01','Follow-up',500.00),
(503,3,'2025-09-20','Checkup',1200.00),
(504,2,'2025-08-30','Physiotherapy',2000.00);

INSERT INTO Medicines (MedicineName) VALUES ('Aspirin'),('Painkiller'),('Vitamins');

INSERT INTO AppointmentMedicines VALUES
(1,1),(2,2),(3,1),(4,3),(5,2);

-- 1. Identify anomalies (insert, update, delete).
-- 2. Does schema satisfy 1NF? Why/why not?
-- 3. Rewrite schema in 1NF.
-- 4. State primary key.
-- 5. Write functional dependencies.
-- 6. Remove partial dependencies (2NF).
-- 7. Create SQL for 2NF schema.
-- 8. Identify transitive dependencies.
-- 9. Convert schema to 3NF.
-- 10. Write SQL for 3NF schema.
-- 11. Check if schema is BCNF.
-- 12. Query: List patients with their doctors.
SELECT p.PatientID,p.PatientName,d.DoctorName,d.DoctorSpecialization,a.AppointmentDate,a.Treatment,a.BillAmount
FROM Appointments a
JOIN Patients p ON a.PatientID=p.PatientID
JOIN Doctors d ON a.DoctorID=d.DoctorID;

-- 13. Query: Count patients per doctor.
SELECT d.DoctorName, COUNT(DISTINCT a.PatientID) AS PatientCount
FROM Doctors d LEFT JOIN Appointments a ON d.DoctorID=a.DoctorID
GROUP BY d.DoctorName;

-- 14. Query: List treatments done by "Dr. Sharma".
SELECT p.PatientName,a.Treatment,a.AppointmentDate
FROM Appointments a JOIN Doctors d ON a.DoctorID=d.DoctorID JOIN Patients p ON a.PatientID=p.PatientID
WHERE d.DoctorName='Dr. Rao';

-- 15. Query: Find patients prescribed more than 2 medicines.
SELECT p.PatientID,p.PatientName, COUNT(am.MedicineID) AS MedCount
FROM Appointments a
JOIN AppointmentMedicines am ON a.AppointmentID=am.AppointmentID
JOIN Patients p ON a.PatientID=p.PatientID
GROUP BY p.PatientID,p.PatientName
HAVING COUNT(am.MedicineID) > 2;

-- 16. Query: List all specializations of doctors treating patients.
-- 17. Query: Find highest bill amount.
-- 18. Query: Average bill per doctor.
SELECT d.DoctorName, AVG(a.BillAmount) AS AvgBill
FROM Doctors d JOIN Appointments a ON d.DoctorID=a.DoctorID
GROUP BY d.DoctorName;

-- 19. Query: Patients treated by doctors of "Cardiology".
-- 20. Explain redundancy reduction after normalization.