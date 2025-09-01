-- Customers
INSERT INTO Customer (CustomerName, Address) VALUES
('Pranav', 'Bangalore'),
('Prajwal', 'Mysore'),
('Aditi', 'Chennai');

-- Meters
INSERT INTO Meter (CustomerID, MeterNumber) VALUES
(1, 'MTR1001'),
(2, 'MTR1002'),
(3, 'MTR1003');

-- Reading Types
INSERT INTO ReadingType (TypeName) VALUES
('Manual'), ('Automatic'), ('Estimated');

-- July 2025 Readings
INSERT INTO MeterReading (MeterID, ReadingDate, PreviousReading, CurrentReading, ReadingTypeID, Status, Remarks) VALUES
(1, '2025-07-01', 100, 150, 1, 1, 'Normal'),
(2, '2025-07-01', 200, 230, 2, 1, 'Auto reading'),
(3, '2025-07-01', 500, 520, 3, 1, 'Estimated');

-- August 2025 Readings
INSERT INTO MeterReading (MeterID, ReadingDate, PreviousReading, CurrentReading, ReadingTypeID, Status, Remarks) VALUES
(1, '2025-08-01', 150, 210, 1, 1, 'Manual check'),
(2, '2025-08-01', 230, 290, 2, 1, 'Auto reading'),
(3, '2025-08-01', 520, 560, 3, 1, 'Estimated again');
