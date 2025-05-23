-- Users Table
INSERT INTO Users (Username, PasswordHash, Role) VALUES
('john_donor', 'hashed_password_1', 'Donor'),
('jane_patient', 'hashed_password_2', 'Patient'),
('admin_sara', 'hashed_password_3', 'Admin'),
('mike_donor', 'hashed_password_4', 'Donor'),
('lisa_donor', 'hashed_password_5', 'Donor'),
('bob_patient', 'hashed_password_6', 'Patient'),
('peter_donor', 'hashed_password_7', 'Donor'),
('emily_patient', 'hashed_password_8', 'Patient'),
('chris_donor', 'hashed_password_9', 'Donor'),
('olivia_patient', 'hashed_password_10', 'Patient'),
('david_donor', 'hashed_password_11', 'Donor'),
('sophia_patient', 'hashed_password_12', 'Patient'),
('donor_test1', 'hashed_password_13', 'Donor'),
('patient_test1', 'hashed_password_14', 'Patient'),
('admin_support', 'hashed_password_15', 'Admin'),
('donor_test2', 'hashed_password_16', 'Donor'),
('patient_test2', 'hashed_password_17', 'Patient'),
('donor_test3', 'hashed_password_18', 'Donor'),
('patient_test3', 'hashed_password_19', 'Patient'),
('donor_test4', 'hashed_password_20', 'Donor');

-- Diseases Table
INSERT INTO Diseases (DiseaseName) VALUES
('Anemia'),
('Thalassemia'),
('Leukemia'),
('Hemophilia'),
('Sickle Cell Disease'),
('General Surgery Requirement'),
('Accident Trauma'),
('Cancer Treatment Side Effect'),
('Platelet Disorder'),
('Hypertension');

-- Donors Table
INSERT INTO Donors (UserID, FullName, BloodGroup, DateOfBirth, ContactNumber, Address) VALUES
(1, 'John Doe', 'A+', '1990-05-15', '555-1111', '123 Main St, Anytown'),
(4, 'Mike Smith', 'O-', '1985-11-20', '555-2222', '456 Oak Ave, Anytown'),
(5, 'Lisa Ray', 'B+', '1995-02-10', '555-3333', '789 Pine Rd, Somewhere'),
(7, 'Peter Jones', 'AB+', '1988-07-30', '555-4444', '101 Maple Dr, Anytown'),
(9, 'Chris Lee', 'A-', '1992-09-05', '555-5555', '202 Birch Ln, Somewhere'),
(11, 'David Williams', 'O+', '1980-12-25', '555-6666', '303 Cedar Ct, Anytown'),
(13, 'Donor Test One', 'B-', '1998-03-12', '555-7777', '404 Elm Pl, Somewhere'),
(16, 'Donor Test Two', 'AB-', '1991-06-18', '555-8888', '505 Spruce Way, Anytown'),
(18, 'Donor Test Three', 'O+', '1986-10-01', '555-9999', '606 Ash St, Somewhere'),
(20, 'Donor Test Four', 'A+', '1993-01-22', '555-0000', '707 Willow Ave, Anytown');

-- Patients Table
INSERT INTO Patients (UserID, FullName, BloodGroup, DiseaseID, ContactNumber, Address) VALUES
(2, 'Jane Roe', 'O+', 1, '555-1010', '11 Sunshine Blvd, Cityville'),
(6, 'Bob White', 'AB-', 7, '555-2020', '22 Moon Cr, Cityville'),
(8, 'Emily Green', 'A+', 3, '555-3030', '33 Star Ln, Townsville'),
(10, 'Olivia Black', 'B+', 2, '555-4040', '44 Comet Way, Townsville'),
(12, 'Sophia Blue', 'O-', 6, '555-5050', '55 Galaxy Pl, Cityville'),
(14, 'Patient Test One', 'A-', 8, '555-6060', '66 Planet St, Townsville'),
(17, 'Patient Test Two', 'B-', 9, '555-7070', '77 Nebula Rd, Cityville'),
(19, 'Patient Test Three', 'AB+', 5, '555-8080', '88 Cosmos Ave, Townsville');

-- DonorDiseases Table
INSERT INTO DonorDiseases (DonorID, DiseaseID, DiagnosedDate) VALUES
(1, 10, '2018-04-11'),
(2, 10, '2020-01-20'),
(4, 1, '2015-09-01');

-- Hospitals Table
INSERT INTO Hospitals (HospitalName, Address, ContactNumber) VALUES
('City General Hospital', '1 Hospital Plaza, Anytown', '555-1234'),
('St. Luke Medical Center', '200 Health Way, Somewhere', '555-5678'),
('County Regional Hospital', '50 Main St, Cityville', '555-9012'),
('Mercy Health Clinic', '100 Mercy Ln, Townsville', '555-3456'),
('Hope Community Hospital', '75 Community Dr, Anytown', '555-7890');

-- BloodInventory Table
INSERT INTO BloodInventory (HospitalID, BloodGroup, QuantityAvailable) VALUES
(1, 'A+', 50), (1, 'O-', 30), (1, 'B+', 25), (1, 'AB+', 10),
(2, 'O+', 60), (2, 'A-', 20), (2, 'B-', 15), (2, 'AB-', 5),
(3, 'A+', 45), (3, 'O+', 55), (3, 'B+', 30), (3, 'A-', 10),
(4, 'O-', 40), (4, 'A+', 35), (4, 'B+', 20), (4, 'O+', 50),
(5, 'A+', 25), (5, 'O+', 40), (5, 'B+', 15), (5, 'AB+', 8);

-- Donations Table
INSERT INTO Donations (DonorID, HospitalID, BloodGroup, DonationDate, Quantity) VALUES
(1, 1, 'A+', '2023-01-15', 1),
(2, 2, 'O-', '2023-02-20', 1),
(3, 3, 'B+', '2023-03-05', 1),
(4, 1, 'AB+', '2023-04-10', 1),
(5, 4, 'A-', '2023-05-15', 1),
(6, 5, 'O+', '2023-06-20', 1),
(1, 1, 'A+', '2023-07-15', 1),
(2, 2, 'O-', '2023-08-20', 1),
(7, 3, 'B-', '2023-09-01', 1),
(8, 4, 'AB-', '2023-10-05', 1),
(9, 5, 'O+', '2023-11-10', 1),
(10, 1, 'A+', '2023-12-15', 1),
(3, 3, 'B+', '2024-01-05', 1),
(4, 2, 'AB+', '2024-02-10', 1),
(6, 5, 'O+', '2024-03-20', 1),
(1, 1, 'A+', '2024-04-15', 1),
(2, 2, 'O-', '2024-05-20', 1);

-- Rewards Table
INSERT INTO Rewards (DonorID, PointsEarned, LastUpdated) VALUES
(1, 30, '2024-04-15'),
(2, 30, '2024-05-20'),
(3, 20, '2024-01-05'),
(4, 20, '2024-02-10'),
(5, 10, '2023-05-15'),
(6, 20, '2024-03-20'),
(7, 10, '2023-09-01'),
(8, 10, '2023-10-05'),
(9, 10, '2023-11-10'),
(10, 10, '2023-12-15');
