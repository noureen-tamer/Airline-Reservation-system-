--CREATE VIEW FlightV AS
--SELECT flight_ID, Total_Seats, Available_Seats,Forigin
--FROM Flight
--WHERE Forigin = 'NYC';

--select * from FlightV;
--CREATE VIEW BookingV AS
--SELECT Booking_ID, BookingStatus, Seat_Number,passengerID,Flight.flight_ID
--FROM Booking
--inner join Flight on Flight.flight_ID=Booking.flight_ID 

use Airline_system;
--select * from Flight

--CREATE VIEW AvailableSeats AS
--SELECT seat.Seat_Number, 
--Flight.flight_ID, Flight.FDeprature_Time
--FROM seat 
--INNER JOIN Flight  ON seat.flight_ID = Flight.flight_ID
--WHERE seat.IsAvailable = 'Y';

--select * from  AvailableSeats
 ------------ View for the  passengers with Cancelled Flights

--CREATE VIEW Cancelled AS
--SELECT Passenger.passengerID,
--Flight.flight_ID,Flight.Flight_Status
--FROM Passenger
--INNER JOIN Booking  ON Booking.passengerID = Passenger.passengerID
--inner join Flight on Booking.flight_ID=Flight.flight_ID
--where Flight_Status='Cancelled'
--
--select * from Cancelled
--
--CREATE SYNONYM Syn_FlightV FOR airline_system.dbo.FlightV;
----
--CREATE SYNONYM Syn_Flights FOR airline_system.dbo.Flight;
----
--CREATE SYNONYM Syn_Flight FOR airline_system.dbo.FlightV;
----
--CREATE SYNONYM Syn_Book FOR airline_system.dbo.Booking;
--CREATE SYNONYM Syn_VVV FOR airline_system.dbo.AvailableSeats;
--
--
--SELECT * FROM Syn_FlightV WHERE flight_ID = 10;
--
--SELECT * FROM Syn_Flights WHERE Available_Seats = 50;
--select * from Syn_Book where BookingStatus ='Cancelled';

CREATE VIEW TotalFlightPrice_View
AS
SELECT 
    Flight_ID, 
    SUM(FPrice) AS TotalPrice
FROM 
    Flight 
WHERE 
    Flight_ID = 3 
GROUP BY 
    Flight_ID;
	
	select * from Syn_Book