-- ============================
-- 1. AIRPORT
-- ============================
CREATE TABLE Airport (
    AirportID SERIAL PRIMARY KEY,
    AirportName VARCHAR(100) NOT NULL,
    City VARCHAR(100),
    Country VARCHAR(100),
    IATACode VARCHAR(10),
    ICAOCode VARCHAR(10)
);

-- ============================
-- 2. AIRLINE
-- ============================
CREATE TABLE Airline (
    AirlineID SERIAL PRIMARY KEY,
    AirlineName VARCHAR(100) NOT NULL,
    IATACode VARCHAR(10),
    ICAOCode VARCHAR(10)
);

-- ============================
-- 3. AIRCRAFT
-- ============================
CREATE TABLE Aircraft (
    AircraftID SERIAL PRIMARY KEY,
    AirlineID INT NOT NULL REFERENCES Airline(AirlineID),
    AircraftModel VARCHAR(100) NOT NULL,
    SeatingCapacity INT CHECK (SeatingCapacity > 0)
);

-- ============================
-- 4. FLIGHT (Route Definition)
-- ============================
CREATE TABLE Flight (
    FlightID SERIAL PRIMARY KEY,
    AirlineID INT NOT NULL REFERENCES Airline(AirlineID),
    FlightNumber VARCHAR(20) NOT NULL,
    OriginAirportID INT NOT NULL REFERENCES Airport(AirportID),
    DestinationAirportID INT NOT NULL REFERENCES Airport(AirportID)
);

-- ============================
-- 5. FLIGHT SCHEDULE (Instance)
-- ============================
CREATE TABLE FlightSchedule (
    ScheduleID SERIAL PRIMARY KEY,
    FlightID INT NOT NULL REFERENCES Flight(FlightID),
    AircraftID INT NOT NULL REFERENCES Aircraft(AircraftID),
    DepartureDate DATE NOT NULL,
    DepartureTime TIME NOT NULL,
    ArrivalDate DATE NOT NULL,
    ArrivalTime TIME NOT NULL,
    Status VARCHAR(30) DEFAULT 'Scheduled'
);

-- ============================
-- 6. PASSENGER
-- ============================
CREATE TABLE Passenger (
    PassengerID SERIAL PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100),
    DOB DATE,
    PassportNumber VARCHAR(50),
    Nationality VARCHAR(50),
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

-- ============================
-- 7. BOOKING
-- ============================
CREATE TABLE Booking (
    BookingID SERIAL PRIMARY KEY,
    PassengerID INT NOT NULL REFERENCES Passenger(PassengerID),
    ScheduleID INT NOT NULL REFERENCES FlightSchedule(ScheduleID),
    BookingDate DATE NOT NULL,
    SeatNumber VARCHAR(10),
    TicketPrice NUMERIC(10,2),
    PaymentStatus VARCHAR(20)
);

-- ============================
-- 8. BOARDING GATE
-- ============================
CREATE TABLE BoardingGate (
    GateID SERIAL PRIMARY KEY,
    GateName VARCHAR(10) NOT NULL,
    Terminal VARCHAR(10)
);

-- ============================
-- 9. BOARDING
-- ============================
CREATE TABLE Boarding (
    BoardingID SERIAL PRIMARY KEY,
    BookingID INT NOT NULL REFERENCES Booking(BookingID),
    GateID INT NOT NULL REFERENCES BoardingGate(GateID),
    BoardingTime TIMESTAMP
);

-- ============================
-- 10. STAFF
-- ============================
CREATE TABLE Staff (
    StaffID SERIAL PRIMARY KEY,
    FirstName VARCHAR(100) NOT NULL,
    LastName VARCHAR(100),
    Role VARCHAR(50) NOT NULL,
    ContactNumber VARCHAR(20)
);

-- ============================
-- 11. CREW ASSIGNMENT
-- ============================
CREATE TABLE CrewAssignment (
    AssignmentID SERIAL PRIMARY KEY,
    StaffID INT NOT NULL REFERENCES Staff(StaffID),
    ScheduleID INT NOT NULL REFERENCES FlightSchedule(ScheduleID),
    DutyRole VARCHAR(50) NOT NULL
);

