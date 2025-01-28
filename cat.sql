-- Step 1: Create a new database
CREATE DATABASE HospitalDB_New;
USE HospitalDB_New;
-- Step 2: Create the ward table
CREATE TABLE ward (
    wardID INT AUTO_INCREMENT PRIMARY KEY,
    WardLocation VARCHAR(100) NOT NULL,
    WardSize INT NOT NULL
);
-- Step 3: Create the patient table
CREATE TABLE patient (
    PatientID INT AUTO_INCREMENT PRIMARY KEY,
    PatientName VARCHAR(100) NOT NULL,
    Gender ENUM('Male', 'Female') NOT NULL,
    DOB DATE NOT NULL,
    Diagnosis VARCHAR(255) NOT NULL,
    FeesPaid DECIMAL(10, 2) NOT NULL,
    WardID INT,
    FOREIGN KEY (WardID) REFERENCES ward(wardID)
);
-- Step 4: Insert data into the ward table
INSERT INTO ward (WardLocation, WardSize) 
VALUES 
('North Wing', 20),
('South Wing', 25),
('East Wing', 30);
-- Step 5: Insert data into the patient table
INSERT INTO patient (PatientName, Gender, DOB, Diagnosis, FeesPaid, WardID) 
VALUES 
('Daniel Wanjala', 'Male', '1990-05-15', 'Flu', 500.00, 1),
('Ivy Wiku', 'Female', '1985-10-20', 'Fever', 700.00, 2),
('Alice Kenyatta', 'Female', '2000-03-10', 'Allergy', 450.00, 1),
('Robert Miguna', 'Male', '1975-12-25', 'Diabetes', 1000.00, 3),
('Emma Kariuki', 'Female', '1995-07-08', 'Cold', 300.00, 2),
('Liam Mudenyo', 'Male', '1988-04-22', 'Asthma', 850.00, 3),
('Olivia Jones', 'Female', '2002-01-17', 'Migraine', 400.00, 1),
('Ethan Kaka', 'Male', '1993-11-11', 'Hypertension', 1200.00, 3);
-- Step 6: Query for total fees paid by patients
SELECT SUM(FeesPaid) AS TotalFeesPaid FROM patient;

-- Step 7: Query for patients whose names contain 'a'
SELECT * FROM patient WHERE PatientName LIKE '%a%';

-- Step 8: Create a trigger to validate gender input
DELIMITER $$
CREATE TRIGGER check_gender BEFORE INSERT ON patient
FOR EACH ROW
BEGIN
    IF NEW.Gender NOT IN ('Male', 'Female') THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Invalid Gender: Please enter Male or Female';
    END IF;
END$$

DELIMITER ;

SELECT * FROM ward;
SELECT * FROM patient;


