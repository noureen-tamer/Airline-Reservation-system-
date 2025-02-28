use Airline_system;
--List All Flights
SELECT flight_ID, Forigin, FDestination, FDeprature_Time, FArrival_Time 
FROM Flight


--Find All Passengers with a Specific Last Name
SELECT PFname, PLname, PEmail 
FROM Passenger
WHERE PLname = 'Jones'


--List of Flights with Available Seats
SELECT flight_ID, Total_Seats, Available_Seats 
FROM Flight
WHERE Available_Seats > 0


--4. List All Tickets for a Specific Passenger
SELECT Ticket.Ticket_ID, Ticket.Torigin, Ticket.TDestination, Ticket.TDeparture_Time
FROM Ticket
WHERE Ticket.passengerID = 50


--Count Total Flights
SELECT COUNT(f.flight_ID) AS Total_Flights 
FROM Flight f 

--Show All Canceled Flights

SELECT flight_ID, Forigin, FDestination, Flight_Status 
FROM Flight
WHERE Flight_Status = 'Cancelled';


--List All Passengers with Emails
SELECT PFname+' '+PLname as Passenger_Name , PEmail 
FROM Passenger
WHERE PEmail IS NOT NULL;

--Find All Flights Between Two Cities
SELECT flight_ID, Forigin, FDestination 
FROM Flight
WHERE Forigin = 'NYC' AND FDestination = 'LAX'; 


--Display All Booked Seats for a Specific Flight

SELECT Seat.Seat_ID, Seat.Seat_Number, Seat.Seat_Class 
FROM Seat
WHERE Seat.flight_ID = 9


--List Passengers Born After 1995
SELECT PFname, PLname, PBirthdate 
FROM Passenger
WHERE PBirthdate < '1995-01-01';













--1. Total Tickets Sold for Each Flight
SELECT Flight.flight_ID, COUNT(Ticket.Ticket_ID) AS Total_Tickets_Sold
FROM Flight
LEFT JOIN Ticket ON Flight.flight_ID = Ticket.flight_ID
GROUP BY Flight.flight_ID;

--2. Total Revenue Generated Per Flight​
SELECT Flight.flight_ID, SUM(Payment.Payment_Amount) AS Total_Revenue
FROM Flight
JOIN Booking ON Flight.flight_ID = Booking.flight_ID
JOIN Payment ON Booking.Booking_ID = Payment.Booking_ID
GROUP BY Flight.flight_ID;


--3. List of Passengers Who Booked a Specific Flight
SELECT Passenger.PFname, Passenger.PLname, Passenger.PEmail,Passenger.PNational_ID, Flight.flight_ID
FROM Passenger
JOIN Booking ON Passenger.passengerID = Booking.passengerID
JOIN Flight ON Booking.flight_ID = Flight.flight_ID
WHERE Flight.flight_ID = 18; 

--4. Total Available Seats for Each Flight
SELECT Flight.flight_ID, Total_Seats - COUNT(Seat_ID) AS Available_Seats
FROM Flight
LEFT JOIN Seat ON Flight.flight_ID = Seat.flight_ID AND Seat.IsAvailable = 'Y'
GROUP BY Flight.flight_ID, Total_Seats;

--5. Generate a Report for Canceled Flights
  SELECT Flight.flight_ID, Flight.Forigin, Flight.FDestination, Flight.FArrival_Time, Flight.Flight_Status
FROM Flight
WHERE Flight.Flight_Status = 'Cancelled';

--6. Top 3 Flights with the Most Booked Tickets
SELECT top 3 Flight.flight_ID, COUNT(Ticket.Ticket_ID) AS Booked_Tickets
FROM Flight
JOIN Ticket ON Flight.flight_ID = Ticket.flight_ID
GROUP BY Flight.flight_ID
ORDER BY Booked_Tickets DESC

--7. Generate Passenger Report for Tickets Paid and Pending Payment
SELECT Passenger.PFname, Passenger.PLname,Passenger.PGender,Passenger.Pphone_Number, Payment.Payment_Status, COUNT(Payment.PaymentID) AS Total
FROM Passenger
JOIN Payment ON Passenger.passengerID = Payment.passengerID
where Payment.Payment_Status='Pending'--Paid
GROUP BY Passenger.PFname, Passenger.PLname, Payment.Payment_Status,Passenger.PGender,Passenger.Pphone_Number



--Flights With No Tickets Booked
SELECT flight_ID 
FROM Flight
EXCEPT
SELECT flight_ID 
FROM Ticket;


--Passengers Without Bookings
SELECT passengerID 
FROM Passenger
EXCEPT
SELECT passengerID 
FROM Booking;


--Details of All Bookings Including Payment Status
SELECT Booking.Booking_ID, Passenger.PFname, Passenger.PLname, Payment.Payment_Status, Flight.flight_ID
FROM Booking
JOIN Passenger ON Booking.passengerID = Passenger.passengerID
LEFT JOIN Payment ON Booking.Booking_ID = Payment.Booking_ID
JOIN Flight ON Booking.flight_ID = Flight.flight_ID;







   