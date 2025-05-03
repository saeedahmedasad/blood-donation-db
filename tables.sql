-- Users Table for Authentication
CREATE TABLE Users (
UserID INT PRIMARY KEY IDENTITY(1,1),
Username NVARCHAR(50) UNIQUE NOT NULL,
PasswordHash NVARCHAR(255) NOT NULL,
Role NVARCHAR(20) CHECK (Role IN ('Donor', 'Patient', 'Admin')) NOT NULL
);

-- Donors Table
CREATE TABLE Donors (
DonorID INT PRIMARY KEY IDENTITY(1,1),
UserID INT FOREIGN KEY REFERENCES Users(UserID),
FullName NVARCHAR(100) NOT NULL,
BloodGroup NVARCHAR(5) NOT NULL,
DateOfBirth DATE,
ContactNumber NVARCHAR(15),
Address NVARCHAR(255)
);

-- Patients Table
CREATE TABLE Patients (
PatientID INT PRIMARY KEY IDENTITY(1,1),
UserID INT FOREIGN KEY REFERENCES Users(UserID),
FullName NVARCHAR(100) NOT NULL,
BloodGroup NVARCHAR(5) NOT NULL,
DiseaseID INT, -- FK to Disease Table
ContactNumber NVARCHAR(15),
Address NVARCHAR(255)
);

-- Diseases Table
CREATE TABLE Diseases (
DiseaseID INT PRIMARY KEY IDENTITY(1,1),
DiseaseName NVARCHAR(100)
);

-- Map Donors to Diseases (Medical History)
CREATE TABLE DonorDiseases (
DonorID INT FOREIGN KEY REFERENCES Donors(DonorID),
DiseaseID INT FOREIGN KEY REFERENCES Diseases(DiseaseID),
DiagnosedDate DATE,
PRIMARY KEY (DonorID, DiseaseID)
);

-- Hospitals Table
CREATE TABLE Hospitals (
HospitalID INT PRIMARY KEY IDENTITY(1,1),
HospitalName NVARCHAR(100),
Address NVARCHAR(255),
ContactNumber NVARCHAR(15)
);

-- Blood Inventory per Hospital
CREATE TABLE BloodInventory (
InventoryID INT PRIMARY KEY IDENTITY(1,1),
HospitalID INT FOREIGN KEY REFERENCES Hospitals(HospitalID),
BloodGroup NVARCHAR(5),
QuantityAvailable INT CHECK (QuantityAvailable >= 0)
);

-- Donation Records
CREATE TABLE Donations (
DonationID INT PRIMARY KEY IDENTITY(1,1),
DonorID INT FOREIGN KEY REFERENCES Donors(DonorID),
HospitalID INT FOREIGN KEY REFERENCES Hospitals(HospitalID),
BloodGroup NVARCHAR(5),
DonationDate DATE NOT NULL,
Quantity INT CHECK (Quantity > 0)
);

-- Rewards Table
CREATE TABLE Rewards (
RewardID INT PRIMARY KEY IDENTITY(1,1),
DonorID INT FOREIGN KEY REFERENCES Donors(DonorID),
PointsEarned INT DEFAULT 0,
LastUpdated DATE
);