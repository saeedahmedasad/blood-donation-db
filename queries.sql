-- 1. Get all donor details
SELECT * FROM Donors;

-- 2. Get all unique blood groups among donors
SELECT DISTINCT BloodGroup FROM Donors;

-- 3. Get all patients with blood group A+
SELECT * FROM Patients WHERE BloodGroup = 'A+';

-- 4. List all donations ordered by most recent
SELECT * FROM Donations ORDER BY DonationDate DESC;

-- 5. Get B+ donors located in New York
SELECT * FROM Donors WHERE BloodGroup = 'B+' AND Address LIKE '%New York%';

-- 6. Get all donors who don't have O- blood
SELECT * FROM Donors WHERE NOT BloodGroup = 'O-';

-- 7. Add a new disease to the disease list
INSERT INTO Diseases (DiseaseName) VALUES ('Thalassemia');

-- 8. Get patients who have no disease assigned
SELECT * FROM Patients WHERE DiseaseID IS NULL;

-- 9. Update blood inventory after donation
UPDATE BloodInventory 
SET QuantityAvailable = QuantityAvailable + 1 
WHERE HospitalID = 2 AND BloodGroup = 'A+';

-- 10. Delete rewards with zero points
DELETE FROM Rewards WHERE PointsEarned = 0;

-- 11. Get the 5 most recent donors
SELECT TOP 5 * FROM Donors ORDER BY DonorID DESC;

-- 12. Get date of first donation ever
SELECT MIN(DonationDate) AS FirstDonation FROM Donations;

-- 13. Get date of most recent donation
SELECT MAX(DonationDate) AS LatestDonation FROM Donations;

-- 14. Count total number of donors
SELECT COUNT(*) AS number_of_doners FROM Donors;

-- 15. Calculate total quantity of blood donated
SELECT SUM(Quantity) AS TotalBloodDonated FROM Donations;

-- 16. Get average quantity of blood donated per donation
SELECT AVG(Quantity) AS AverageDonation FROM Donations;

-- 17. Find hospitals with names starting with "City"
SELECT * FROM Hospitals WHERE HospitalName LIKE 'City%';

-- 18. Get donors with blood group A+ or B+
SELECT * FROM Donors WHERE BloodGroup IN ('A+', 'B+');

-- 19. Get donations made between two dates
SELECT * FROM Donations 
WHERE DonationDate BETWEEN '2024-01-01' AND '2024-12-31';

-- 20. Rename columns using aliases
SELECT FullName AS DonorName, BloodGroup AS Type FROM Donors;

-- 21. Match donors with their donation dates
SELECT d.FullName, dn.DonationDate 
FROM Donors d 
INNER JOIN Donations dn ON d.DonorID = dn.DonorID;

-- 22. List patients with their diseases (if any)
SELECT p.FullName, ds.DiseaseName 
FROM Patients p 
LEFT JOIN Diseases ds ON p.DiseaseID = ds.DiseaseID;

-- 23. Show blood inventory even if hospital data is missing
SELECT h.HospitalName, b.BloodGroup, b.QuantityAvailable
FROM Hospitals h 
RIGHT JOIN BloodInventory b ON h.HospitalID = b.HospitalID;

-- 24. Show donors and diseases even if some data is missing
SELECT d.FullName AS Donor, ds.DiseaseName 
FROM Donors d 
FULL OUTER JOIN DonorDiseases dd ON d.DonorID = dd.DonorID 
FULL OUTER JOIN Diseases ds ON dd.DiseaseID = ds.DiseaseID;

-- 25. Find pairs of donors with the same blood group
SELECT d1.FullName AS Donor1, d2.FullName AS Donor2, d1.BloodGroup 
FROM Donors d1 
JOIN Donors d2 ON d1.BloodGroup = d2.BloodGroup AND d1.DonorID < d2.DonorID;

-- 26. Combine donor and patient full names without duplicates
SELECT FullName FROM Donors
UNION
SELECT FullName FROM Patients;

-- 27. Count number of donors per blood group
SELECT BloodGroup, COUNT(*) AS DonorCount 
FROM Donors 
GROUP BY BloodGroup;

-- 28. Show blood groups that have more than 5 donors
SELECT BloodGroup, COUNT(*) AS DonorCount 
FROM Donors 
GROUP BY BloodGroup 
HAVING COUNT(*) > 5;

-- 29. Get donors who have made at least one donation
SELECT * FROM Donors d 
WHERE EXISTS (
    SELECT 1 FROM Donations dn WHERE dn.DonorID = d.DonorID
);

-- 30. Show blood entries with quantities greater than any O+ entry
SELECT * FROM BloodInventory 
WHERE QuantityAvailable > ANY (
    SELECT QuantityAvailable FROM BloodInventory WHERE BloodGroup = 'O+'
);

-- 31. Create a backup table of all donors
SELECT * INTO DonorBackup FROM Donors;

-- 32. Assign initial reward points to all donors
INSERT INTO Rewards (DonorID, PointsEarned, LastUpdated)
SELECT DonorID, 10, GETDATE() FROM Donors;

-- 33. Categorize donors as 'Universal' or 'Regular'
SELECT FullName,
       CASE 
           WHEN BloodGroup = 'O-' THEN 'Universal Donor'
           ELSE 'Regular Donor'
       END AS DonorType
FROM Donors;

-- 34. Replace NULL contact numbers with 'No Contact'
SELECT ISNULL(ContactNumber, 'No Contact') FROM Donors;

-- 35. Stored procedure to fetch donors by blood group
CREATE PROCEDURE GetDonorsByBloodGroup @Group NVARCHAR(5)
AS
BEGIN
    SELECT * FROM Donors WHERE BloodGroup = @Group;
END;

-- 36. Comment: This query lists all hospitals
SELECT * FROM Hospitals;

-- 37. Use arithmetic operator to find donors with DonorID + 1 > 10
SELECT * FROM Donors WHERE DonorID + 1 > 10;
