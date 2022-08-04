USE PersonalTrainer;

-- Select all columns from ExerciseCategory and Exercise.
-- The tables should be joined on ExerciseCategoryId.
-- This query returns all Exercises and their associated ExerciseCategory.
-- 64 rows

SELECT * FROM ExerciseCategory
JOIN Exercise ON ExerciseCategory.ExerciseCategoryId=Exercise.ExerciseCategoryId;
--------------------
    
-- Select ExerciseCategory.Name and Exercise.Name
-- where the ExerciseCategory does not have a ParentCategoryId (it is null).
-- Again, join the tables on their shared key (ExerciseCategoryId).
-- 9 rows

SELECT ExerciseCategory.Name,Exercise.Name
FROM Exercise 
JOIN ExerciseCategory ON ExerciseCategory.ExerciseCategoryId=Exercise.ExerciseCategoryId 
WHERE ExerciseCategory.ParentCategoryId is null;
--------------------

-- The query above is a little confusing. At first glance, it's hard to tell
-- which Name belongs to ExerciseCategory and which belongs to Exercise.
-- Rewrite the query using an aliases. 
-- Alias ExerciseCategory.Name as 'CategoryName'.
-- Alias Exercise.Name as 'ExerciseName'.
-- 9 rows

SELECT ExerciseCategory.Name CategoryName ,Exercise.Name ExerciseName
FROM Exercise 
JOIN ExerciseCategory ON ExerciseCategory.ExerciseCategoryId=Exercise.ExerciseCategoryId 
WHERE ExerciseCategory.ParentCategoryId is null;
--------------------

-- Select FirstName, LastName, and BirthDate from Client
-- and EmailAddress from Login 
-- where Client.BirthDate is in the 1990s.
-- Join the tables by their key relationship. 
-- What is the primary-foreign key relationship?
-- 35 rows

SELECT Client.FirstName, Client.LastName, Client.BirthDate, Login.EmailAddress 
FROM Login
JOIN Client ON Login.ClientId=Client.ClientId WHERE Client.BirthDate LIKE '199%';
--------------------

-- Select Workout.Name, Client.FirstName, and Client.LastName
-- for Clients with LastNames starting with 'C'?
-- How are Clients and Workouts related?
-- 25 rows

SELECT Workout.Name,C.FirstName,C.LastName FROM Workout
JOIN (SELECT ClientWorkout.WorkoutId, Client.FirstName, Client.LastName FROM Client 
JOIN ClientWorkout on Client.ClientId=ClientWorkout.ClientId WHERE Client.LastName LIKE 'C%') C
ON C.WorkoutId=Workout.WorkoutId;
--------------------

-- Select Names from Workouts and their Goals.
-- This is a many-to-many relationship with a bridge table.
-- Use aliases appropriately to avoid ambiguous columns in the result.

SELECT Workout.Name WorkoutName,G.Name GoalName FROM Workout
JOIN (SELECT Goal.Name,Goal.GoalId,WorkoutGoal.WorkoutId FROM WorkoutGoal 
      JOIN Goal ON WorkoutGoal.GoalId=Goal.GoalId ) G
ON G.WorkoutID=Workout.WorkoutId;      

--------------------

-- Select FirstName and LastName from Client.
-- Select ClientId and EmailAddress from Login.
-- Join the tables, but make Login optional.
-- 500 rows

SELECT Client.FirstName,Client.LastName,Login.ClientId,Login.EmailAddress from Client
LEFT OUTER JOIN Login ON Client.ClientId=Login.ClientId;
--------------------

-- Using the query above as a foundation, select Clients
-- who do _not_ have a Login.
-- 200 rows

SELECT * FROM 
(SELECT Client.FirstName,Client.LastName,Login.ClientId,Login.EmailAddress from Client
LEFT OUTER JOIN Login ON Client.ClientId=Login.ClientId) C 
WHERE C.EmailAddress is null;
--------------------

-- Does the Client, Romeo Seaward, have a Login?
-- Decide using a single query.
-- nope :(

SELECT * FROM 
(SELECT Client.FirstName,Client.LastName,Login.ClientId,Login.EmailAddress from Client
LEFT OUTER JOIN Login ON Client.ClientId=Login.ClientId) C 
WHERE C.Firstname='Romeo' AND C.Lastname='Seaward';
--------------------

-- Select ExerciseCategory.Name and its parent ExerciseCategory's Name.
-- This requires a self-join.
-- 12 rows

SELECT ExerciseCategory.Name, P.Name
FROM ExerciseCategory 
JOIN 
(SELECT Name,ParentCategoryId FROM ExerciseCategory) P 
ON ExerciseCategory.ExerciseCategoryId = P.ParentCategoryId;
--------------------
    
-- Rewrite the query above so that every ExerciseCategory.Name is
-- included, even if it doesn't have a parent.
-- 16 rows

SELECT ExerciseCategory.Name, P.Name
FROM ExerciseCategory RIGHT OUTER JOIN (SELECT Name,ParentCategoryId FROM ExerciseCategory) P ON ExerciseCategory.ExerciseCategoryId = P.ParentCategoryId;

--------------------
    
-- Are there Clients who are not signed up for a Workout?
-- 50 rows

SELECT * FROM Client 
LEFT OUTER JOIN ClientWorkout ON Client.Clientid=ClientWorkout.Clientid 
WHERE ClientWorkout.workoutid is null;
--------------------

-- Which Beginner-Level Workouts satisfy at least one of Shell Creane's Goals?
-- Goals are associated to Clients through ClientGoal.
-- Goals are associated to Workouts through WorkoutGoal.
-- 6 rows, 4 unique rows

SELECT * from workout where levelid=1 AND WorkoutId IN 
(SELECT WorkoutID from workoutgoal where GoalId IN 
(SELECT GoalId from ClientGoal 
where ClientId=(SELECT ClientId from Client where firstname='Shell' AND lastname='Creane')));
--------------------

-- Select all Workouts. 
-- Join to the Goal, 'Core Strength', but make it optional.
-- You may have to look up the GoalId before writing the main query.
-- If you filter on Goal.Name in a WHERE clause, Workouts will be excluded.
-- Why?
-- 26 Workouts, 3 Goals

SELECT Workout.name,goal.name FROM Workout 
LEFT OUTER JOIN Workoutgoal ON Workoutgoal.WorkoutId=Workout.WorkoutId AND Workoutgoal.goalId=10
LEFT OUTER JOIN goal on Workoutgoal.goalid=goal.goalid;

--------------------

-- The relationship between Workouts and Exercises is... complicated.
-- Workout links to WorkoutDay (one day in a Workout routine)
-- which links to WorkoutDayExerciseInstance 
-- (Exercises can be repeated in a day so a bridge table is required) 
-- which links to ExerciseInstance 
-- (Exercises can be done with different weights, repetions,
-- laps, etc...) 
-- which finally links to Exercise.
-- Select Workout.Name and Exercise.Name for related Workouts and Exercises.

SELECT Workout.Name WorkoutName, Exercise.Name ExerciseName FROM Workout
INNER JOIN WorkoutDay ON Workout.WorkoutId=WorkoutDay.WorkoutId
INNER JOIN WorkoutDayExerciseInstance ON WorkoutDay.WorkoutDayId=WorkoutDayExerciseInstance.WorkoutDayId
INNER JOIN ExerciseInstance ON WorkoutDayExerciseInstance.ExerciseInstanceId=ExerciseInstance.ExerciseInstanceId
INNER JOIN Exercise ON ExerciseInstance.ExerciseId=Exercise.ExerciseId;

--------------------
   
-- An ExerciseInstance is configured with ExerciseInstanceUnitValue.
-- It contains a Value and UnitId that links to Unit.
-- Example Unit/Value combos include 10 laps, 15 minutes, 200 pounds.
-- Select Exercise.Name, ExerciseInstanceUnitValue.Value, and Unit.Name
-- for the 'Plank' exercise. 
-- How many Planks are configured, which Units apply, and what 
-- are the configured Values?
-- 4 rows, 1 Unit, and 4 distinct Values

SELECT Exercise.Name ExerciseName, ExerciseInstanceUnitValue.Value, Unit.Name UnitName FROM Exercise
INNER JOIN ExerciseInstance ON Exercise.ExerciseId=ExerciseInstance.ExerciseId
LEFT OUTER JOIN ExerciseInstanceUnitValue ON ExerciseInstance.ExerciseInstanceId=ExerciseInstanceUnitValue.ExerciseInstanceId
LEFT OUTER JOIN Unit On ExerciseInstanceUnitValue.UnitId=Unit.UnitId WHERE Exercise.Name='Plank';
