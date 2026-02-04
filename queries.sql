-- 1. Aggregate Function + GROUP BY + HAVING
SELECT a.AirlineName, COUNT(f.FlightID) AS total_flights
FROM Airline a
JOIN Flight f ON a.AirlineID = f.AirlineID
GROUP BY a.AirlineName
HAVING COUNT(f.FlightID) > 1;

-- 2. ORDER BY
SELECT PassengerID, FirstName, LastName
FROM Passenger
ORDER BY LastName ASC, FirstName ASC;

-- 3. JOIN + OUTER JOIN
SELECT f.FlightNumber, a.AircraftModel, fs.ScheduleID
FROM Flight f
LEFT JOIN FlightSchedule fs ON f.FlightID = fs.FlightID
LEFT JOIN Aircraft a ON fs.AircraftID = a.AircraftID;

-- 4. Boolean Operators
SELECT FirstName, LastName, Nationality, Email
FROM Passenger
WHERE Nationality = 'Indian'
  AND (DOB > '1999-01-01' OR Email LIKE '%gmail.com');

-- 5. Arithmetic Operators
SELECT BookingID,
       TicketPrice,
       TicketPrice * 0.90 AS discounted_price
FROM Booking;

-- 6. String Search
SELECT StaffID, FirstName, LastName
FROM Staff
WHERE FirstName ILIKE 'A%%';

-- 7. TO_CHAR and EXTRACT
SELECT 
    TO_CHAR(BookingDate, 'Month') AS month_name,
    EXTRACT(MONTH FROM BookingDate) AS month_no,
    COUNT(*) AS total_bookings
FROM Booking
GROUP BY month_name, month_no
ORDER BY month_no;

-- 8. BETWEEN, IN, NOT BETWEEN, NOT IN
SELECT b.BookingID, b.TicketPrice, p.Nationality
FROM Booking b
JOIN Passenger p ON b.PassengerID = p.PassengerID
WHERE b.TicketPrice BETWEEN 4000 AND 7000
  AND p.Nationality NOT IN ('USA', 'UK');

-- 9. SET Operation (UNION)
SELECT StaffID, FirstName, Role
FROM Staff
WHERE Role = 'Pilot'
UNION
SELECT StaffID, FirstName, Role
FROM Staff
WHERE Role = 'Cabin Crew';

-- 10. Subquery
SELECT PassengerID, SeatNumber, TicketPrice
FROM Booking
WHERE TicketPrice > (SELECT AVG(TicketPrice) FROM Booking);

-- 11. EXISTS
SELECT f.FlightID, f.FlightNumber
FROM Flight f
WHERE EXISTS (
    SELECT 1
    FROM FlightSchedule fs 
    JOIN CrewAssignment ca ON fs.ScheduleID = ca.ScheduleID
    WHERE fs.FlightID = f.FlightID
);
