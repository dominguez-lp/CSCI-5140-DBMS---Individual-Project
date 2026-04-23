# Specify what database to use 
USE las_palmas_medical_center;

# Insert data into Physician table 
INSERT INTO Physician (physicianID, name, position, ssn) VALUES 
	(001, "Meredith Grey", "Intern", 123456789),
    (002, "Derick Shepherd", "Surgeon", 987654321), 
    (003, "Richard Webber", "Chief of Medicine", 456123789); 
    
# Insert data into department table 
INSERT INTO Department (deptID, name, headID) VALUES
	(100, "General Medicine", 001), 
    (200, "Surgery", 002), 
    (300,  "Psychiatry", 003);

# Insert data into AffiliatedWith table
INSERT INTO AffiliatedWith (physicianID, departmentID) VALUES
	(001,100), 
    (002, 200), 
    (003, 100);

# Insert data into procedure table 
INSERT INTO `Procedure` (procID, name, cost) VALUES
	(1, "X-ray", 800.00), 
    (2, "CT-scan", 1000.00), 
    (3, "Vaccination", 100.00);

# Insert data into Patients table 
INSERT INTO Patient (patientID, ssn, name, address, dob, phone, insuranceNumber, primaryPhysID) VALUES 
	(1, 987654123, "Harry Potter", "4 Privet Dr", "1980-07-31", "020-123-4567", "789321", "001"),
    (2, 321456987, "John Smith", "1607 Virginia Dr", "1580-01-06","160-016-1580","456123", "002"),
    (3, 741852963, "Steve Rogers", " 4 Brooklyn St", "1918-07-04", "718-321-6549", "741852", "003");

# Insert data into Nurse Table
INSERT INTO Nurse (nurseID, name, position, ssn) VALUES
	(001, "Madame Pomfrey", "Head Nurse", 123789456), 
    (002, "Greg Focker", "Nurse", 456789123), 
    (003, "Joy", "Nurse", 789321654);

# Insert data into Medication table
INSERT INTO Medication (medID, name) VALUES 
	(01, "Antibiotic"), 
    (02, "Pain Reliever"), 
    (03, "Allergy Relief");
    
# Insert data into Presribes table 
INSERT INTO Prescribes (physicianID, patientID, medicationID, prescribedDate, dose) VALUES
	(003, 3, 02, "2026-02-22", "2/day"),
    (001, 1, 03, "1981-08-22", "1/day"), 
    (002, 2, 01, "1581-07-30", "1/week");

# Insert data into Room table 
INSERT INTO Room (roomID, roomType) VALUES
	(100, "Single"),
    (101, "Double"), 
    (102, "Double"); 
    
# Insert data into Stay Table
INSERT INTO Stay (stayID, patientID, roomID, startDate, endDate) VALUES
	(1000, 1, 100, "1981-08-23", "1981-08-24"),
    (1001, 2, 101, "1581-07-30", "1581-08-05"), 
    (1003, 3, 102, "2026-02-23", "2026-02-28");
    
# Insert data into Undergoes Table
INSERT INTO Undergoes (patientID, procedureID, stayID, procDate, physicianID, nurseID) VALUES 
	(1, 1, 1000, "1981-08-23", 001, 001), 
    (2, 2, 1001, "1581-08-01", 002, 002), 
    (3, 3, 1003, "2026-02-24", 003, 003);
    
# Insert data into OnCall Table 
INSERT INTO OnCall (nurseID, startDate, endDate) VALUES
	(001, "1981-08-20", "1981-09-01" ),
    (002, "1581-06-01", "1580-09-01"),
    (003, "2026-02-01", "2026-03-01");
    
# Insert data into Appointment Table
INSERT INTO Appointment (appID, patientID, nurseID, physicianID, startDateTime, endDateTime) VALUES
	(10, 1, 001, 001, "1981-08-21 14:00", "1981-08-21 14:30"), 
    (11, 2, 002, 002, "1581-06-25 8:00", "1581-06-25 9:00"), 
    (12, 3, 003, 003, "2026-01-30 16:00", "2026-01-30 17:00");