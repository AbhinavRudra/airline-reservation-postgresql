-- ============================
-- 1. AIRPORT (10 rows)
-- ============================
INSERT INTO Airport (AirportName, City, Country, IATACode, ICAOCode) VALUES
('Indira Gandhi International Airport', 'Delhi', 'India', 'DEL', 'VIDP'),
('Chhatrapati Shivaji Maharaj International Airport', 'Mumbai', 'India', 'BOM', 'VABB'),
('Kempegowda International Airport', 'Bangalore', 'India', 'BLR', 'VOBL'),
('Chennai International Airport', 'Chennai', 'India', 'MAA', 'VOMM'),
('Rajiv Gandhi International Airport', 'Hyderabad', 'India', 'HYD', 'VOHS'),
('Dubai International Airport', 'Dubai', 'UAE', 'DXB', 'OMDB'),
('Heathrow Airport', 'London', 'UK', 'LHR', 'EGLL'),
('John F. Kennedy International Airport', 'New York', 'USA', 'JFK', 'KJFK'),
('Singapore Changi Airport', 'Singapore', 'Singapore', 'SIN', 'WSSS'),
('Frankfurt Airport', 'Frankfurt', 'Germany', 'FRA', 'EDDF');

-- ============================
-- 2. AIRLINE (10 rows)
-- ============================
INSERT INTO Airline (AirlineName, IATACode, ICAOCode) VALUES
('Air India', 'AI', 'AIC'),
('IndiGo', '6E', 'IGO'),
('Vistara', 'UK', 'VTI'),
('SpiceJet', 'SG', 'SEJ'),
('AirAsia India', 'I5', 'IAD'),
('Emirates', 'EK', 'UAE'),
('Lufthansa', 'LH', 'DLH'),
('British Airways', 'BA', 'BAW'),
('Singapore Airlines', 'SQ', 'SIA'),
('United Airlines', 'UA', 'UAL');

-- ============================
-- 3. AIRCRAFT (10 rows)
-- ============================
INSERT INTO Aircraft (AirlineID, AircraftModel, SeatingCapacity) VALUES
(1, 'Airbus A320', 180),
(1, 'Boeing 787-8', 256),
(2, 'Airbus A321neo', 230),
(3, 'Boeing 737-800', 189),
(4, 'De Havilland Q400', 78),
(5, 'Airbus A320neo', 186),
(6, 'Boeing 777-300ER', 396),
(7, 'Airbus A350-900', 325),
(8, 'Boeing 787-9', 280),
(9, 'Boeing 747-400', 416);

-- ============================
-- 4. FLIGHT (10 rows)
-- ============================
INSERT INTO Flight (AirlineID, FlightNumber, OriginAirportID, DestinationAirportID) VALUES
(1, 'AI101', 1, 7),
(1, 'AI202', 1, 2),
(2, '6E305', 2, 3),
(3, 'UK811', 3, 4),
(4, 'SG407', 4, 5),
(6, 'EK511', 1, 6),
(7, 'LH761', 1, 10),
(8, 'BA118', 1, 7),
(9, 'SQ403', 1, 9),
(10,'UA83', 1, 8);

-- ============================
-- 5. FLIGHT SCHEDULE (10 rows)
-- ============================
INSERT INTO FlightSchedule 
(FlightID, AircraftID, DepartureDate, DepartureTime, ArrivalDate, ArrivalTime, Status)
VALUES
(1, 2, '2025-12-05', '02:00', '2025-12-05', '06:30', 'Scheduled'),
(2, 1, '2025-12-05', '10:00', '2025-12-05', '12:10', 'Scheduled'),
(3, 3, '2025-12-06', '15:30', '2025-12-06', '17:00', 'Delayed'),
(4, 4, '2025-12-06', '18:00', '2025-12-06', '19:50', 'Scheduled'),
(5, 5, '2025-12-07', '09:20', '2025-12-07', '10:30', 'Cancelled'),
(6, 6, '2025-12-08', '09:00', '2025-12-08', '11:20', 'Scheduled'),
(7, 7, '2025-12-09', '13:10', '2025-12-09', '19:50', 'Scheduled'),
(8, 8, '2025-12-10', '14:30', '2025-12-10', '19:10', 'Scheduled'),
(9, 9, '2025-12-11', '07:00', '2025-12-11', '15:20', 'Scheduled'),
(10,10,'2025-12-12', '23:00', '2025-12-13', '07:00', 'Scheduled');

-- ============================
-- 6. PASSENGER (10 rows)
-- ============================
INSERT INTO Passenger (FirstName, LastName, DOB, PassportNumber, Nationality, Phone, Email) VALUES
('Rohan', 'Sharma', '1999-05-21', 'P1234567', 'Indian', '9876543210', 'rohan@gmail.com'),
('Aisha', 'Khan', '1998-11-10', 'P9876543', 'Indian', '9123456780', 'aisha@gmail.com'),
('John', 'Smith', '1990-03-15', 'UK112233', 'British', '440987654321', 'john.smith@gmail.com'),
('Emily', 'Jones', '1992-06-18', 'US556677', 'American', '441234567890', 'emjones@gmail.com'),
('Arun', 'Menon', '1995-01-02', 'P4455667', 'Indian', '9988776655', 'arun@gmail.com'),
('Fatima', 'Ali', '1988-09-12', 'UAE223344', 'Emirati', '5511223344', 'fatima@gmail.com'),
('Wei', 'Chen', '1994-02-28', 'CN887766', 'Chinese', '6601122334', 'wei.chen@gmail.com'),
('Karthik', 'Rao', '1997-12-01', 'P1122445', 'Indian', '9000088880', 'karthik@gmail.com'),
('Linda', 'Brown', '1985-07-14', 'US998877', 'American', '441198887766', 'linda@gmail.com'),
('Sara', 'Singh', '2000-04-22', 'P6677889', 'Indian', '9090909090', 'sara@gmail.com');

-- ============================
-- 7. BOOKING (10 rows)
-- ============================
INSERT INTO Booking (PassengerID, ScheduleID, BookingDate, SeatNumber, TicketPrice, PaymentStatus) VALUES
(1, 1, '2025-11-20', '12A', 55000.00, 'Paid'),
(2, 2, '2025-11-22', '18C', 6500.00, 'Paid'),
(3, 1, '2025-11-25', '14B', 55000.00, 'Pending'),
(4, 3, '2025-11-26', '22F', 4500.00, 'Paid'),
(5, 4, '2025-11-27', '10A', 6200.00, 'Paid'),
(6, 6, '2025-11-28', '2K', 35000.00, 'Paid'),
(7, 7, '2025-11-29', '31D', 72000.00, 'Pending'),
(8, 8, '2025-11-30', '15E', 68000.00, 'Paid'),
(9, 9, '2025-12-01', '1A', 82000.00, 'Paid'),
(10,10,'2025-12-02', '29C', 54000.00, 'Paid');

-- ============================
-- 8. BOARDING GATE (10 rows)
-- ============================
INSERT INTO BoardingGate (GateName, Terminal) VALUES
('A12', 'T3'),
('B05', 'T2'),
('C18', 'T1'),
('A04', 'T3'),
('B11', 'T2'),
('C02', 'T1'),
('D07', 'T4'),
('E09', 'T4'),
('F03', 'T5'),
('G01', 'T5');

-- ============================
-- 9. BOARDING (10 rows)
-- ============================
INSERT INTO Boarding (BookingID, GateID, BoardingTime) VALUES
(1, 1, '2025-12-05 01:15'),
(2, 2, '2025-12-05 09:20'),
(3, 3, '2025-12-05 01:40'),
(4, 4, '2025-12-06 14:50'),
(5, 5, '2025-12-06 17:30'),
(6, 6, '2025-12-08 07:50'),
(7, 7, '2025-12-09 12:20'),
(8, 8, '2025-12-10 13:40'),
(9, 9, '2025-12-11 06:20'),
(10,10,'2025-12-12 21:30');

-- ============================
-- 10. STAFF (10 rows)
-- ============================
INSERT INTO Staff (FirstName, LastName, Role, ContactNumber) VALUES
('Neha', 'Verma', 'Pilot', '9988776655'),
('Arjun', 'Reddy', 'Co-Pilot', '8899776655'),
('Sara', 'Thomas', 'Cabin Crew', '7766554433'),
('David', 'Wilson', 'Cabin Crew', '6655443322'),
('Priya', 'Nair', 'Ground Staff', '9080706050'),
('Mohammed', 'Hussain', 'Engineer', '9090909091'),
('Emily', 'Wright', 'Pilot', '9999111122'),
('James', 'Taylor', 'Co-Pilot', '8888111122'),
('Sophia', 'Martins', 'Cabin Crew', '7777111122'),
('Robert', 'King', 'Cabin Crew', '6666111122');

-- ============================
-- 11. CREW ASSIGNMENT (10 rows)
-- ============================
INSERT INTO CrewAssignment (StaffID, ScheduleID, DutyRole) VALUES
(1, 1, 'Pilot'),
(2, 1, 'Co-Pilot'),
(3, 1, 'Cabin Crew'),
(4, 2, 'Cabin Crew'),
(7, 3, 'Pilot'),
(8, 3, 'Co-Pilot'),
(9, 3, 'Cabin Crew'),
(1, 6, 'Pilot'),
(3, 6, 'Cabin Crew'),
(10,7, 'Cabin Crew');
