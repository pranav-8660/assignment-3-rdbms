-- Customer Master
CREATE TABLE Customer (
    CustomerID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerName NVARCHAR(100) NOT NULL,
    Address NVARCHAR(255) NULL
);

-- Meter Master
CREATE TABLE Meter (
    MeterID INT IDENTITY(1,1) PRIMARY KEY,
    CustomerID INT NOT NULL FOREIGN KEY REFERENCES Customer(CustomerID),
    MeterNumber NVARCHAR(50) NOT NULL UNIQUE
);

-- ReadingType Lookup
CREATE TABLE ReadingType (
    ReadingTypeID INT IDENTITY(1,1) PRIMARY KEY,
    TypeName VARCHAR(20) NOT NULL CHECK (TypeName IN ('Manual', 'Automatic', 'Estimated'))
);

-- Meter Reading Fact Table
CREATE TABLE MeterReading (
    MeterReadingID INT IDENTITY(1,1) PRIMARY KEY,
    MeterID INT NOT NULL FOREIGN KEY REFERENCES Meter(MeterID),
    ReadingDate DATE NOT NULL,
    PreviousReading DECIMAL(10,2) NOT NULL,
    CurrentReading DECIMAL(10,2) NOT NULL,
    UnitsConsumed AS (CurrentReading - PreviousReading) PERSISTED,
    ReadingTypeID INT NOT NULL FOREIGN KEY REFERENCES ReadingType(ReadingTypeID),
    Status BIT,
    Remarks NVARCHAR(255) NULL
);
