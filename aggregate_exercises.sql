use PersonalTrainer;

-- Use an aggregate to count the number of Clients.
-- 500 rows

SELECT count(*) FROM client;
--------------------

-- Use an aggregate to count Client.BirthDate.
-- The number is different than total Clients. Why?
-- 463 rows

SELECT count(Client.BirthDate) FROM client;
--------------------

-- Group Clients by City and count them.
-- Order by the number of Clients desc.
-- 20 rows

SELECT city,count(*) FROM client
GROUP BY city
ORDER BY count(*) DESC;

--------------------

-- Calculate a total per invoice using only the InvoiceLineItem table.
-- Group by InvoiceId.
-- You'll need an expression for the line item total: Price * Quantity.
-- Aggregate per group using SUM().
-- 1000 rows

SELECT invoiceid,sum(Price*Quantity) FROM InvoiceLineItem
GROUP BY invoiceid;

--------------------

-- Calculate a total per invoice using only the InvoiceLineItem table.
-- (See above.)
-- Only include totals greater than $500.00.
-- Order from lowest total to highest.
-- 234 rows

SELECT invoiceid,sum(Price*Quantity) total FROM InvoiceLineItem
GROUP BY invoiceid
HAVING total>500
ORDER BY total;

--------------------

-- Calculate the average line item total
-- grouped by InvoiceLineItem.Description.
-- 3 rows

SELECT InvoiceLineItem.Description,avg(Price*quantity) FROM InvoiceLineItem
GROUP BY InvoiceLineItem.Description;

--------------------

-- Select ClientId, FirstName, and LastName from Client
-- for clients who have *paid* over $1000 total.
-- Paid is Invoice.InvoiceStatus = 2.
-- Order by LastName, then FirstName.
-- 146 rows


SELECT Client.ClientId, Client.FirstName, Client.LastName, p.paid from Client
INNER JOIN 
(SELECT i.clientid,sum(total) paid from invoice i
INNER JOIN 
(SELECT invoiceid,sum(Price*Quantity) total FROM InvoiceLineItem
GROUP BY invoiceid) t 
ON t.invoiceid=i.invoiceid WHERE i.invoicestatus=2 GROUP BY i.clientid HAVING paid>1000) p
ON Client.clientid=p.clientid
ORDER BY Client.lastname,Client.firstname;
--------------------

-- Count exercises by category.
-- Group by ExerciseCategory.Name.
-- Order by exercise count descending.
-- 13 rows

SELECT ec.Name,count(*) from ExerciseCategory ec
INNER join exercise e on e.ExerciseCategoryid=ec.ExerciseCategoryid
group by ec.Name
order by count(*) desc;
--------------------

-- Select Exercise.Name along with the minimum, maximum,
-- and average ExerciseInstance.Sets.
-- Order by Exercise.Name.
-- 64 rows


SELECT e.Name,min(ei.sets),max(ei.sets),avg(ei.sets) from ExerciseInstance ei
INNER JOIN Exercise e ON e.Exerciseid=ei.Exerciseid
group by ei.Exerciseid
order by e.Name;
--------------------

-- Find the minimum and maximum Client.BirthDate
-- per Workout.
-- 26 rows
-- Sample: 
-- WorkoutName, EarliestBirthDate, LatestBirthDate
-- '3, 2, 1... Yoga!', '1928-04-28', '1993-02-07'

SELECT cwn.name WorkoutName,min(c.BirthDate) EarliestBirthDate,max(c.BirthDate) LatestBirthDate from client c 
join (SELECT cw.workoutid,w.name,cw.clientid from clientworkout cw inner join workout w on cw.workoutid=w.workoutid) cwn
on c.clientid=cwn.clientid 
group by cwn.workoutid
order by cwn.name;

--------------------

-- Count client goals.
-- Be careful not to exclude rows for clients without goals.
-- 500 rows total
-- 50 rows with no goals

SELECT client.firstname, client.lastname, client.clientid, cg.numberofgoals from client LEFT OUTER JOIN (
SELECT clientid,count(*) numberofgoals from clientgoal group by clientid) cg
ON client.clientid=cg.clientid
ORDER BY cg.numberofgoals;

--------------------

-- Select Exercise.Name, Unit.Name, 
-- and minimum and maximum ExerciseInstanceUnitValue.Value
-- for all exercises with a configured ExerciseInstanceUnitValue.
-- Order by Exercise.Name, then Unit.Name.
-- 82 rows

SELECT e.name, u.name, MIN(uv.Value), MAX(uv.Value) from exercise e
JOIN ExerciseInstance ei ON e.ExerciseId = ei.ExerciseId
JOIN ExerciseInstanceUnitValue uv ON ei.ExerciseInstanceId = uv.ExerciseInstanceId
JOIN Unit u ON uv.UnitId = u.UnitId
GROUP BY e.ExerciseId, e.name, u.UnitId, u.name
ORDER BY e.name, u.name;

--------------------

-- Modify the query above to include ExerciseCategory.Name.
-- Order by ExerciseCategory.Name, then Exercise.Name, then Unit.Name.
-- 82 rows

SELECT ec.name, e.name, u.name, MIN(uv.Value), MAX(uv.Value) from exercise e
JOIN ExerciseInstance ei ON e.ExerciseId = ei.ExerciseId
JOIN ExerciseInstanceUnitValue uv ON ei.ExerciseInstanceId = uv.ExerciseInstanceId
JOIN Unit u ON uv.UnitId = u.UnitId
JOIN ExerciseCategory ec ON e.ExerciseCategoryId = ec.ExerciseCategoryId
GROUP BY e.ExerciseId, e.name, u.UnitId, u.name
ORDER BY ec.name, e.name, u.name;


--------------------

-- Select the minimum and maximum age in years for
-- each Level.
-- To calculate age in years, use the MySQL function DATEDIFF.
-- 4 rows

SELECT cl.levelid,MIN(DATEDIFF(CURDATE(), c.BirthDate) / 365) minage,MAX(DATEDIFF(CURDATE(), c.BirthDate) / 365) maxage FROM Client c
JOIN (SELECT cw.clientid,w.levelid FROM workout w
JOIN clientworkout cw ON w.workoutid=cw.workoutid) cl
ON c.clientid=cl.clientid
Group by cl.levelid;


--------------------

-- Stretch Goal!
-- Count logins by email extension (.com, .net, .org, etc...).
-- Research SQL functions to isolate a very specific part of a string value.
-- 27 rows (27 unique email extensions)


SELECT SUBSTRING_INDEX(EmailAddress, '.', -1) extension, COUNT(EmailAddress) numberofemailextension FROM Login
GROUP BY SUBSTRING_INDEX(EmailAddress, '.', -1)
ORDER BY numberofemailextension DESC;

--------------------

-- Stretch Goal!
-- Match client goals to workout goals.
-- Select Client FirstName and LastName and Workout.Name for
-- all workouts that match at least 2 of a client's goals.
-- Order by the client's last name, then first name.
-- 139 rows

SELECT w.name, CONCAT(c.FirstName, ' ', c.LastName) ClientName, COUNT(cg.GoalId) numberofgoal FROM Client c
JOIN ClientGoal cg ON c.ClientId = cg.ClientId
JOIN WorkoutGoal wg ON cg.GoalId = wg.GoalId
JOIN Workout w ON wg.WorkoutId = w.WorkoutId
GROUP BY w.WorkoutId, w.name, c.ClientId, c.FirstName, c.LastName
HAVING COUNT(cg.GoalId) > 1
ORDER BY c.LastName, c.FirstName;

--------------------
