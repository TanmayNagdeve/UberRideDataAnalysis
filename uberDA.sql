
#1. Retrieve all successful bookings:
create view uber.Successful_Bookings as
SELECT * FROM uber.bookings
 WHERE `Booking Status` = 'Success';
--  Column names with spaces must be enclosed in backticks ( ), not single quotes (' ')

#2. Find the average ride distance for each vehicle type:
create view uber.Ride_distance_for_each_type_of_vehicle as
select `Vehicle Type`, avg(`Ride Distance`) as avg_ride_distance
from uber.bookings
group by `Vehicle Type`;


#3. Get the total number of cancelled rides by customers
create view uber.Cancelled_Rides_By_Customers as
select count(`Canceled Rides by Customer`) as total_number_of_cancelled_rides_by_customers
from uber.bookings 
where `Canceled Rides by Customer` = 1;

#4. List the top 5 customers who booked the highest number of rides
create view uber.Top_Customers_With_Highest_Ride_Count as
select `Customer ID`, count(`Booking ID`) as total_rides
from uber.bookings
group by `Customer ID`
order by total_rides desc limit 5;

#5. Get the number of rides cancelled by drivers due to  personal and car-related issues
create view uber.cancelled_rides_by_drivers as
select count('Canceled Rides by Driver') as cancelled_rides_by_drivers
from uber.bookings
where `Reason for Canceling by Driver` = 'Personal & Car related issue';

#6. Find the maximum and minimum driver  ratings for Prime Sedan bookings:
create view uber.max_min_driver_ratings as
select max(`Driver Ratings`), min(`Driver Ratings`)
from uber.bookings
where `Vehicle Type` = 'Prime Sedan';

#7. Retrieve all high-value rides (above ₹1000) along with the average ride distance and average customer rating for each vehicle type.
create view uber.vehicle_type_wise_distance_and_rating as
select `Vehicle Type`,
   avg(`Ride Distance`) as avg_distance,
   avg(`Customer Rating`) as avg_customer_rating
from uber.bookings
where `Booking Value` > 1000
group by `Vehicle Type`;

#8. Calculate the total booking value of rides completed successfully
create view uber.total_booking_value as
select sum(`Booking Value`) as total_booking_value
from uber.bookings
where `Booking Status` = 'Success';

#9 List all incomplete rides along with the reason
create view uber.incomplete_rides as
select `Booking Status`, `Incomplete Rides Reason`
from uber.bookings
where `Booking Status` = 'Incomplete' and `Incomplete Rides Reason` != ' ';

