USE F1;

/*Finding the information we have in the drivers table on Lewis Hamilton*/
SELECT *
FROM drivers
WHERE surname = "Hamilton" AND forename = "Lewis";

/*Permanently deleting a table*/
DROP TABLE races;

/*Dropping a column */
ALTER TABLE pit_stops
DROP COLUMN duration;

/*Checking if the column has been dropped, if we get an error the column has successfully been dropped*/
SELECT duration
FROM pit_stops;

/*Updating data*/
UPDATE drivers
SET number = 10
WHERE
driverRef = "heidfeld";

/*Modifying column datatypes*/
ALTER TABLE drivers
MODIFY COLUMN driverId int;

ALTER TABLE drivers
MODIFY COLUMN number int;

ALTER TABLE drivers
MODIFY COLUMN dob datetime;

/*Checking if the datatypes have been successfully updated*/
SELECT * 
FROM drivers;

/*Using joins to combine columns from two or more tables (INNER, LEFT, RIGHT) */
SELECT d.*, q.*
FROM drivers d
INNER JOIN
qualifying q
ON
d.driverId = q.driverId;

SELECT d.*, q.*
FROM drivers d
LEFT JOIN
qualifying q
ON
d.driverId = q.driverId;

SELECT d.*, q.*
FROM drivers d
RIGHT JOIN
qualifying q
ON
d.driverId = q.driverId;

/*Using ORDER BY to arrange retrieved data in sorted order*/
SELECT number, position
FROM qualifying
ORDER BY number;

/*Using data manipulation functions to manipulate data (LIMIT, SELECT DISTINCT)*/
SELECT *
FROM results
LIMIT 3;

/*Using aggregate functions to summarise data (AVG, COUNT, MAX, MIN, SUM)*/ 
SELECT driverId,
MAX(number)
FROM drivers;

SELECT driverId,
MIN(points)
FROM results;

SELECT driverId,
SUM(laps)
FROM results;

/*Using GROUP BY to run aggregate functions on specified groups*/
SELECT raceId, driverId,
AVG(points)
FROM results
GROUP BY driverId;

SELECT driverId,
COUNT(points)
FROM sprint_results
GROUP BY driverId;