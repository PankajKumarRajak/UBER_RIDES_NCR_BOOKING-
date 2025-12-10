CREATE TABLE uber_rides (
    Customer_ID VARCHAR(20),
    Date_book date,
    time_book time,
    Booking_ID varchar(50),
    Booking_Status varchar(50),
    Vehicle_Type VARCHAR(50),
    Pickup_Location VARCHAR(100),
    Drop_Location VARCHAR(100),
    Avg_VTAT FLOAT,
    Avg_CTAT FLOAT,
    Cancelled_Rides_by_Customer int,
    Reason_for_cancelling_by_Customer VARCHAR(255),
    Cancelled_Rides_by_Driver int,
    Driver_Cancellation_Reason varchar(255),
    Incomplete_Rides int,
    Incomplete_Rides_Reason varchar(255),
    Booking_Value FLOAT,
    Ride_Distance FLOAT,
    Driver_Rating FLOAT,
    Customer_Rating FLOAT,
    Payment_Method VARCHAR(50)
);



-- : Find the total number of unique customers.
SELECT COUNT(DISTINCT customer_id) AS unique_customers 
FROM uber_rides;


-- : Find the most common pickup locations (Top 5)
SELECT pickup_location, COUNT(*) AS total_rides
FROM uber_rides
GROUP BY pickup_location
ORDER BY total_rides DESC
LIMIT 5;


-- Find the number of rides per day 
SELECT DATE(Date_book) AS ride_date, COUNT(*) AS total_rides
FROM uber_rides
GROUP BY DATE(Date_book)
ORDER BY ride_date;


-- Find the busiest hour of the day.
SELECT EXTRACT(HOUR FROM date_book) AS ride_hour, COUNT(*) AS total_rides
FROM uber_rides
GROUP BY ride_hour
ORDER BY total_rides DESC
LIMIT 1;



-- Find customers who took rides in more than 1 different locations

SELECT customer_id, COUNT(DISTINCT pickup_location) AS unique_pickups
FROM uber_rides
GROUP BY customer_id
HAVING COUNT(DISTINCT pickup_location) > 1;



-- List the first 5 rides in the dataset.
SELECT * 
FROM uber_rides
ORDER BY date_book
LIMIT 5;


-- Find total cancelled rides by driver.

SELECT sum(Cancelled_Rides_by_Driver) AS cancelled_by_driver
FROM uber_rides;

-- Find total cancelled rides by customer.


SELECT sum(Cancelled_Rides_by_Customer) AS cancelled_by_customer
FROM uber_rides;


-- Total revenue collected by each payment type.
SELECT Payment_Method, SUM(Booking_Value) AS total_amount
FROM uber_rides
GROUP BY Payment_Method
ORDER BY total_amount DESC;


 
