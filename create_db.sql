# Create Database
CREATE DATABASE las_palmas_medical_center;

# Specify which database to use
USE las_palmas_medical_center;

# Create the physician table
CREATE TABLE Physician (
    physicianID INTEGER PRIMARY KEY, 
    name VARCHAR(40), 
    position VARCHAR(40) CHECK (position IN ("Intern", "Surgeon", "Senior", "Chief of Medicine", "Resident", "Psychiatrist")), 
    ssn INTEGER);

# Create the Department table
CREATE TABLE Department (
	deptID INTEGER,
    name VARCHAR(40) CHECK (name IN ("General Medicine", "Surgery", "Psychiatry")),
    headID INTEGER,
    PRIMARY KEY (deptID),
    FOREIGN KEY (headID) REFERENCES Physician(physicianID));

# Create AffiliatedWith
CREATE TABLE AffiliatedWith (
	physicianID INTEGER,
    departmentID INTEGER,
    PRIMARY KEY (physicianID,departmentID),
    FOREIGN KEY (physicianID) REFERENCES Physician(physicianID),
    FOREIGN KEY (departmentID) REFERENCES Department(deptID));
    
# Create procedure table
CREATE TABLE `Procedure` (
	procID INTEGER,
    name VARCHAR(40),
    cost REAL,
    PRIMARY KEY (procID));

# Create Patient table 
CREATE TABLE Patient (
	patientID INTEGER,
    ssn INTEGER,
    name VARCHAR(40),
    address VARCHAR(100),
    dob DATE, 
    phone VARCHAR(16),
    insuranceNumber INTEGER,
    primaryPhysID INTEGER,
    PRIMARY KEY (patientID),
    FOREIGN KEY (primaryPhysID) REFERENCES Physician(physicianID));

# Create Nurse Table 
CREATE TABLE Nurse (
	nurseID INTEGER, 
    name VARCHAR(40),
    position VARCHAR(40) CHECK(position IN("Head Nurse", "Nurse")),
    ssn INTEGER,
    PRIMARY KEY (nurseID));

# Create Medication table
CREATE TABLE Medication (
	medID INTEGER,
    name VARCHAR(40),
    PRIMARY KEY (medID));

# Create Prescribes Table
CREATE TABLE Prescribes (
	physicianID INTEGER,
    patientID INTEGER,
    medicationID INTEGER,
    prescribedDate DATE,
    dose VARCHAR(40),
    PRIMARY KEY (physicianID,patientID,medicationID,prescribedDate),
    FOREIGN KEY (physicianID) REFERENCES Physician(physicianID),
    FOREIGN KEY (patientID) REFERENCES Patient(patientID),
    FOREIGN KEY (medicationID) REFERENCES Medication(medID));

# Create Room Table
CREATE TABLE Room (
	roomID INTEGER, 
    roomType VARCHAR(40) CHECK (roomType IN ("Single","Double")),
    PRIMARY KEY (roomID));

# Create Stay Table
CREATE TABLE Stay (
	stayID INTEGER, 
    patientID INTEGER, 
    roomID INTEGER, 
    startDate DATE, 
    endDate DATE, 
    PRIMARY KEY (stayID),
    FOREIGN KEY (patientID) REFERENCES Patient(patientID),
    FOREIGN KEY (roomID) REFERENCES Room(roomID));

# Create Undergoes Table 
CREATE TABLE Undergoes (
	patientID INTEGER, 
    procedureID INTEGER,
    stayID INTEGER, 
    procDate DATE, 
    physicianID INTEGER, 
    nurseID INTEGER, 
    PRIMARY KEY (patientID, procedureID,stayID, procDate),
    FOREIGN KEY (patientID) REFERENCES Patient(patientID),
    FOREIGN KEY (procedureID) REFERENCES `Procedure`(procID),
    FOREIGN KEY (stayID) REFERENCES Stay(stayID),
    FOREIGN KEY (physicianID) REFERENCES Physician(physicianID), 
    FOREIGN KEY (nurseID) REFERENCES Nurse(nurseID));

# Create OnCall Table 
CREATE TABLE OnCall (
	nurseID INTEGER, 
    startDate DATE, 
    endDate DATE, 
    PRIMARY KEY (nurseID, startDate, endDate), 
    FOREIGN KEY (nurseID) REFERENCES Nurse(nurseID));

# Create Appointment Table 
CREATE TABLE Appointment(
	appID INTEGER, 
    patientID INTEGER, 
    nurseID INTEGER, 
    physicianID INTEGER, 
    startDateTime DATETIME, 
    endDateTime DATETIME, 
    PRIMARY KEY (appID), 
    FOREIGN KEY (patientID) REFERENCES Patient(patientID), 
    FOREIGN KEY (nurseID) REFERENCES Nurse(nurseID), 
    FOREIGN KEY (physicianID) REFERENCES Physician(physicianID));

    
    
    
    
    

    
