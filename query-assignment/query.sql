-- 1.Find customers who consumed more than 50 units in August 2025

SELECT c.CustomerName, m.MeterNumber, r.UnitsConsumed FROM MeterReading r JOIN Meter m ON r.MeterID = m.MeterID JOIN Customer c ON m.CustomerID = c.CustomerID WHERE MONTH(r.ReadingDate) = 8 AND YEAR(r.ReadingDate) = 2025 AND r.UnitsConsumed > 50;

-- 2.Get average units consumed by ReadingType

SELECT rt.TypeName, AVG(r.UnitsConsumed) AS AvgConsumption FROM MeterReading r JOIN ReadingType rt ON r.ReadingTypeID = rt.ReadingTypeID GROUP BY rt.TypeName;

-- 3.Show the highest consumption reading per customer

SELECT c.CustomerName, MAX(r.UnitsConsumed) AS MaxConsumption FROM MeterReading r JOIN Meter m ON r.MeterID = m.MeterID JOIN Customer c ON m.CustomerID = c.CustomerID GROUP BY c.CustomerName;

-- 4.Identify suspicious readings where the current reading is less than the previous

SELECT c.CustomerName, r.ReadingDate, r.PreviousReading, r.CurrentReading FROM MeterReading r JOIN Meter m ON r.MeterID = m.MeterID JOIN Customer c ON m.CustomerID = c.CustomerID WHERE r.CurrentReading < r.PreviousReading;

-- 5.Find total units consumed per customer in July and August 2025

SELECT c.CustomerName, SUM(r.UnitsConsumed) AS TotalUnits FROM MeterReading r JOIN Meter m ON r.MeterID = m.MeterID JOIN Customer c ON m.CustomerID = c.CustomerID WHERE r.ReadingDate BETWEEN '2025-07-01' AND '2025-08-31' GROUP BY c.CustomerName;

-- 6.Rank the customers based on total consumption in July and August 2025

SELECT c.CustomerName, SUM(r.UnitsConsumed) AS TotalConsumption, RANK() OVER (ORDER BY SUM(r.UnitsConsumed) DESC) AS RankNo FROM MeterReading r JOIN Meter m ON r.MeterID = m.MeterID JOIN Customer c ON m.CustomerID = c.CustomerID WHERE r.ReadingDate BETWEEN '2025-07-01' AND '2025-08-31' GROUP BY c.CustomerName;

-- 7.Show last reading for each customer (most recent date)

SELECT c.CustomerName, r.ReadingDate, r.CurrentReading FROM MeterReading r JOIN Meter m ON r.MeterID = m.MeterID JOIN Customer c ON m.CustomerID = c.CustomerID WHERE r.ReadingDate = ( SELECT MAX(r2.ReadingDate) FROM MeterReading r2 WHERE r2.MeterID = r.MeterID );

-- 8.Create Stored Procedures to perform Insert/Update/Delete/View.

    -- Insert
    CREATE PROCEDURE sp_InsertMeterReading @MeterID INT, @ReadingDate DATE, @PreviousReading DECIMAL(10,2), @CurrentReading DECIMAL(10,2), @ReadingTypeID INT, @Status BIT, @Remarks NVARCHAR(255) AS 
    BEGIN 
        INSERT INTO MeterReading (MeterID, ReadingDate, PreviousReading, CurrentReading, ReadingTypeID, Status, Remarks) VALUES (@MeterID, @ReadingDate, @PreviousReading, @CurrentReading, @ReadingTypeID, @Status, @Remarks);
    END;

    -- Update
    CREATE PROCEDURE sp_UpdateMeterReading @MeterReadingID INT, @CurrentReading DECIMAL(10,2), @Remarks NVARCHAR(255) AS
    BEGIN
        UPDATE MeterReading SET CurrentReading = @CurrentReading, Remarks = @Remarks WHERE MeterReadingID = @MeterReadingID;
    END;

    -- Delete
    CREATE PROCEDURE sp_DeleteMeterReading @MeterReadingID INT AS
    BEGIN
        DELETE FROM MeterReading WHERE MeterReadingID = @MeterReadingID;
    END;

    -- View
    CREATE PROCEDURE sp_ViewMeterReadings AS
    BEGIN
        SELECT r.MeterReadingID, c.CustomerName, m.MeterNumber, r.ReadingDate, r.PreviousReading, r.CurrentReading, r.UnitsConsumed, rt.TypeName, r.Status, r.Remarks FROM MeterReading r JOIN Meter m ON r.MeterID = m.MeterID JOIN Customer c ON m.CustomerID = c.CustomerID JOIN ReadingType rt ON r.ReadingTypeID = rt.ReadingTypeID;
    END;
