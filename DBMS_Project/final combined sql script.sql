-- NOTE: This one single script file contains all the queries as per the project requirements for the college allotment system
DROP SCHEMA IF EXISTS college_allotment_system ;
CREATE SCHEMA IF NOT EXISTS college_allotment_system; 
USE college_allotment_system;
-- this creates the schema college_allotment_system, if it does not already exist.



-- -------------------------------



DROP TABLE IF EXISTS Student;
CREATE TABLE Student (
  BITSAT_ID INT PRIMARY KEY NOT NULL, -- BITSAT_ID column as primary key and not null
  Name VARCHAR(45), -- Name column with varchar data type and max length of 45
  DOB DATE, -- DOB column with date data type
  Board_Marks DECIMAL(5,2) CHECK (Board_Marks >= 0 AND Board_Marks <= 100), -- Board_Marks column with decimal data type and check constraint to allow only values between 0 and 100
  Math_Score INT CHECK (Math_Score >= 0 AND Math_Score <= 100),-- Math_Score column with integer data type
  Physics_Score INT CHECK (Physics_Score >= 0 AND Physics_Score <= 100), -- Physics_Score column with integer data type
  Chemistry_Score INT CHECK (Chemistry_Score >= 0 AND Chemistry_Score <= 100), -- Chemistry_Score column with integer data type
  BITSAT_Score INT CHECK (BITSAT_Score >= 0 AND BITSAT_Score <= 300 ),
  CONSTRAINT bitsat_score_check CHECK (BITSAT_Score = Math_Score + Physics_Score + Chemistry_Score)
 -- BITSAT_Score column with integer data type and check constraint to allow only values less than 300 and the sum of Math_Score, Physics_Score, and Chemistry_Score
); -- the query which creates the Student Table

-- --------------------------------------

DROP TABLE IF EXISTS DEGREE;
CREATE TABLE Degree (
  Degree_Name VARCHAR(50) NOT NULL,
  Campus_Name VARCHAR(50) NOT NULL,
  Tot_Number_Of_Seats INT UNSIGNED NOT NULL,
  Min_Board_Marks_Required DECIMAL(5,2) NOT NULL,
   Available_Seats INT UNSIGNED NOT NULL,
  PRIMARY KEY (Degree_Name, Campus_Name)  -- composite primary key for the table which uniquely identifies each row of the table
);


-- ---------------------------------



-- --------------------------------

DROP TABLE IF EXISTS select_preferences;
CREATE TABLE select_preferences (
    BITSAT_ID int,
    Preference_1 varchar(100),
    Preference_2 varchar(100),
    Preference_3 varchar(100),
    Preference_4 varchar(100),
    Preference_5 varchar(100),
    PRIMARY KEY (BITSAT_ID),
    FOREIGN KEY (BITSAT_ID) REFERENCES student(BITSAT_ID)
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


-- ---------------------------------------------------------------------------------

-- we shall create the table of seat_alloted after inserting the values into the other tables because that is the logical thing to do

-- ----------------------------------------------------------------------------------

-- we will first insert 15 values into the 'student' table (NOTE: as per the mail by Amit Dua we should insert atleast 10 records in each table, we have added 15)
-- DELETE FROM Student WHERE BITSAT_ID = 1001;
-- DELETE FROM Student WHERE BITSAT_ID = 1002;
-- DELETE FROM Student WHERE BITSAT_ID = 1003;
-- DELETE FROM Student WHERE BITSAT_ID = 1004;
-- DELETE FROM Student WHERE BITSAT_ID = 1005;
-- DELETE FROM Student WHERE BITSAT_ID = 1006;
-- DELETE FROM Student WHERE BITSAT_ID = 1007;
-- DELETE FROM Student WHERE BITSAT_ID = 1008;
-- DELETE FROM Student WHERE BITSAT_ID = 1009;
-- DELETE FROM Student WHERE BITSAT_ID = 1010;
-- DELETE FROM Student WHERE BITSAT_ID = 1011;
-- DELETE FROM Student WHERE BITSAT_ID = 1012;
-- DELETE FROM Student WHERE BITSAT_ID = 1013;
-- DELETE FROM Student WHERE BITSAT_ID = 1014;
-- DELETE FROM Student WHERE BITSAT_ID = 1015;
-- Commented delete statements to help invigilator during debugging

INSERT INTO Student VALUES (1001, 'John Doe', '2002-05-10', 87.5, 95, 80, 89, 264);
INSERT INTO Student VALUES (1002, 'Jane Smith', '2003-02-14', 92.3, 85, 90, 95, 270);
INSERT INTO Student VALUES (1003, 'Bob Johnson', '2002-11-22', 78.9, 75, 85, 80, 240);
INSERT INTO Student VALUES (1004, 'Sara Lee', '2003-07-01', 95.0, 90, 95, 100, 285);
INSERT INTO Student VALUES (1005, 'Peter Parker', '2002-09-14', 83.2, 85, 75, 85, 245);
INSERT INTO Student VALUES (1006, 'Mary Jones', '2003-04-30', 89.5, 90, 80, 90, 260);
INSERT INTO Student VALUES (1007, 'Tom Smith', '2002-08-08', 72.8, 70, 80, 75, 225);
INSERT INTO Student VALUES (1008, 'Lisa Taylor', '2003-01-15', 91.2, 85, 95, 90, 270);
INSERT INTO Student VALUES (1009, 'David Lee', '2002-06-17', 85.4, 90, 80, 85, 255);
INSERT INTO Student VALUES (1010, 'Karen Chen', '2003-03-27', 94.1, 95, 90, 95, 280);
INSERT INTO Student VALUES (1011, 'James Brown', '2002-10-11', 79.3, 80, 75, 85, 240);
INSERT INTO Student VALUES (1012, 'Emily Zhang', '2003-05-03', 88.6, 85, 90, 85, 260);
INSERT INTO Student VALUES (1013, 'Mike Davis', '2002-12-25', 76.8, 70, 80, 75, 225);
INSERT INTO Student VALUES (1014, 'Julia Lee', '2003-08-12', 93.2, 95, 90, 90, 275);
INSERT INTO Student VALUES (1015, 'Kevin Kim', '2002-10-03', 81.5, 85, 80, 75, 240);


-- --------------------------------------------------------------------

-- we will now proceed to add 15 values into the table 'degree'
-- DELETE FROM Degree WHERE Degree_Name = 'BE Computer Science' AND Campus_Name = 'BITS Pilani';
-- DELETE FROM Degree WHERE Degree_Name = 'BE Mechanical Engineering' AND Campus_Name = 'BITS Pilani';
-- DELETE FROM Degree WHERE Degree_Name = 'BE Electrical and Electronics Engineering' AND Campus_Name = 'BITS Pilani';
-- DELETE FROM Degree WHERE Degree_Name = 'BE Electronics and Instrumentation Engineering' AND Campus_Name = 'BITS Pilani';
-- DELETE FROM Degree WHERE Degree_Name = 'BE Chemical Engineering' AND Campus_Name = 'BITS Pilani';
-- DELETE FROM Degree WHERE Degree_Name = 'BE Civil Engineering' AND Campus_Name = 'BITS Pilani';
-- DELETE FROM Degree WHERE Degree_Name = 'BE Computer Science' AND Campus_Name = 'BITS Goa';
-- DELETE FROM Degree WHERE Degree_Name = 'BE Mechanical Engineering' AND Campus_Name = 'BITS Goa';
-- DELETE FROM Degree WHERE Degree_Name = 'BE Electrical and Electronics Engineering' AND Campus_Name = 'BITS Goa';
-- DELETE FROM Degree WHERE Degree_Name = 'BE Electronics and Instrumentation Engineering' AND Campus_Name = 'BITS Goa';
-- DELETE FROM Degree WHERE Degree_Name = 'BE Chemical Engineering' AND Campus_Name = 'BITS Goa';
-- DELETE FROM Degree WHERE Degree_Name = 'BE Computer Science' AND Campus_Name = 'BITS Hyderabad';
-- DELETE FROM Degree WHERE Degree_Name = 'BE Mechanical Engineering' AND Campus_Name = 'BITS Hyderabad';
-- DELETE FROM Degree WHERE Degree_Name = 'BE Electrical and Electronics Engineering' AND Campus_Name = 'BITS Hyderabad';
-- DELETE FROM Degree WHERE Degree_Name = 'BE Electronics and Instrumentation Engineering' AND Campus_Name = 'BITS Hyderabad';

-- DELETE statements commented to help invigilator debug the script
INSERT INTO Degree (Degree_Name, Campus_Name, Tot_Number_Of_Seats, Min_Board_Marks_Required, Available_Seats) VALUES ('BE Computer Science', 'BITS Pilani', 200, 85.50,200);
INSERT INTO Degree (Degree_Name, Campus_Name, Tot_Number_Of_Seats, Min_Board_Marks_Required, Available_Seats) VALUES ('BE Mechanical Engineering', 'BITS Pilani', 150, 80.00,150);
INSERT INTO Degree (Degree_Name, Campus_Name, Tot_Number_Of_Seats, Min_Board_Marks_Required, Available_Seats) VALUES ('BE Electrical and Electronics Engineering', 'BITS Pilani', 175, 82.00,175);
INSERT INTO Degree (Degree_Name, Campus_Name, Tot_Number_Of_Seats, Min_Board_Marks_Required, Available_Seats) VALUES ('BE Electronics and Instrumentation Engineering', 'BITS Pilani', 100, 85.50,100);
INSERT INTO Degree (Degree_Name, Campus_Name, Tot_Number_Of_Seats, Min_Board_Marks_Required, Available_Seats) VALUES ('BE Chemical Engineering', 'BITS Pilani', 125, 78.50,125);
INSERT INTO Degree (Degree_Name, Campus_Name, Tot_Number_Of_Seats, Min_Board_Marks_Required, Available_Seats) VALUES ('BE Civil Engineering', 'BITS Pilani', 100, 75.00,100);
INSERT INTO Degree (Degree_Name, Campus_Name, Tot_Number_Of_Seats, Min_Board_Marks_Required, Available_Seats) VALUES ('BE Computer Science', 'BITS Goa', 150, 83.00,150);
INSERT INTO Degree (Degree_Name, Campus_Name, Tot_Number_Of_Seats, Min_Board_Marks_Required, Available_Seats) VALUES ('BE Mechanical Engineering', 'BITS Goa', 100, 77.00,100);
INSERT INTO Degree (Degree_Name, Campus_Name, Tot_Number_Of_Seats, Min_Board_Marks_Required, Available_Seats) VALUES ('BE Electrical and Electronics Engineering', 'BITS Goa', 125, 80.50,125);
INSERT INTO Degree (Degree_Name, Campus_Name, Tot_Number_Of_Seats, Min_Board_Marks_Required, Available_Seats) VALUES ('BE Electronics and Instrumentation Engineering', 'BITS Goa', 75, 84.00,75);
INSERT INTO Degree (Degree_Name, Campus_Name, Tot_Number_Of_Seats, Min_Board_Marks_Required, Available_Seats) VALUES ('BE Chemical Engineering', 'BITS Goa', 100, 76.50,100);
INSERT INTO Degree (Degree_Name, Campus_Name, Tot_Number_Of_Seats, Min_Board_Marks_Required, Available_Seats) VALUES ('BE Computer Science', 'BITS Hyderabad', 100, 84.00,100);
INSERT INTO Degree (Degree_Name, Campus_Name, Tot_Number_Of_Seats, Min_Board_Marks_Required, Available_Seats) VALUES ('BE Mechanical Engineering', 'BITS Hyderabad', 75, 78.00,75);
INSERT INTO Degree (Degree_Name, Campus_Name, Tot_Number_Of_Seats, Min_Board_Marks_Required, Available_Seats) VALUES ('BE Electrical and Electronics Engineering', 'BITS Hyderabad', 90, 81.50,90);
INSERT INTO Degree (Degree_Name, Campus_Name, Tot_Number_Of_Seats, Min_Board_Marks_Required, Available_Seats) VALUES ('BE Electronics and Instrumentation Engineering', 'BITS Hyderabad', 50, 83.50,50);


-- ---------------------------------------------------------------------------------------------

-- we are generating this rank table as it will be helpful to us while allotting the seat
START TRANSACTION; -- this is enclosed in transaction to maintain data integrity, because various values in table 'Student' might change
DROP TABLE IF EXISTS rank_list_as_per_rank; -- note we will run this whole script as it is each time we make changes to the table Student
CREATE TABLE rank_list_as_per_rank (
  `rank` INT,
  BITSAT_ID INT,
  BITSAT_Score INT ,
  Math_Score INT,
  Physics_Score INT,
  Chemistry_Score INT,
  PRIMARY KEY(`rank`, BITSAT_ID) -- composite primary key to identify each row of the table uniquely
); -- this is to create the table rank_list_as_per_rank as per the functional dependency diagram, refer to documentation

ALTER TABLE rank_list_as_per_rank -- to add the required foreign key constraints
ADD CONSTRAINT fk_rank_list_student
FOREIGN KEY (BITSAT_ID)
REFERENCES student(BITSAT_ID)
ON UPDATE CASCADE
ON DELETE CASCADE;


INSERT INTO rank_list_as_per_rank -- this query is made to insert students into the rank_list_as_per_rank table in the order of the constraints as show by the RANK() over function
SELECT 
  RANK() OVER (ORDER BY BITSAT_Score DESC, Math_Score DESC, Physics_Score DESC, Chemistry_Score DESC, Board_Marks DESC, DOB ASC, Name ASC) as `rank`,
  BITSAT_ID,
  BITSAT_Score, -- Marks are in DESC because we want the person with the higher marks to get the better rank 
  Math_Score,   -- and ASC for DOB and name because we want the older person to get a better rank and by the sense of general lexicographical ordering we want to assign the rank accordingly
  Physics_Score,
  Chemistry_Score
FROM Student;
COMMIT;

-- We will proceed to add the various preferences of the students into the 'select_preferences' table
-- NOTE: format of the preference should be: (Degree_Name+' '+Campus_Name) because that is how we have tailored our allotment algorithm to work on which you will see as you scroll below
-- DELETE FROM select_preferences WHERE BITSAT_ID = 1001;
-- DELETE FROM select_preferences WHERE BITSAT_ID = 1002;
-- DELETE FROM select_preferences WHERE BITSAT_ID = 1003;
-- DELETE FROM select_preferences WHERE BITSAT_ID = 1004;
-- DELETE FROM select_preferences WHERE BITSAT_ID = 1005;
-- DELETE FROM select_preferences WHERE BITSAT_ID = 1006;
-- DELETE FROM select_preferences WHERE BITSAT_ID = 1007;
-- DELETE FROM select_preferences WHERE BITSAT_ID = 1008;
-- DELETE FROM select_preferences WHERE BITSAT_ID = 1009;
-- DELETE FROM select_preferences WHERE BITSAT_ID = 1010;
-- DELETE FROM select_preferences WHERE BITSAT_ID = 1011;
-- DELETE FROM select_preferences WHERE BITSAT_ID = 1012;
-- DELETE FROM select_preferences WHERE BITSAT_ID = 1013;
-- DELETE FROM select_preferences WHERE BITSAT_ID = 1014;
-- DELETE FROM select_preferences WHERE BITSAT_ID = 1015;

-- Commented DELETE queries to aid the invigilator to debug incase of script errors

INSERT INTO select_preferences (BITSAT_ID, Preference_1, Preference_2, Preference_3, Preference_4, Preference_5)
VALUES
(1001, 'BE Computer Science BITS Pilani', 'BE Electrical and Electronics Engineering BITS Goa', 'BE Mechanical Engineering BITS Hyderabad', 'BE Chemical Engineering BITS Pilani', 'BE Electronics and Instrumentation Engineering BITS Goa'),
(1002, 'BE Electrical and Electronics Engineering BITS Hyderabad', 'BE Computer Science BITS Goa', 'BE Chemical Engineering BITS Pilani', 'BE Mechanical Engineering BITS Pilani', 'BE Electronics and Instrumentation Engineering BITS Goa'),
(1003, 'BE Electronics and Instrumentation Engineering BITS Goa', 'BE Computer Science BITS Pilani', 'BE Mechanical Engineering BITS Hyderabad', 'BE Electrical and Electronics Engineering BITS Goa', 'BE Chemical Engineering BITS Hyderabad'),
(1004, 'BE Chemical Engineering BITS Pilani', 'BE Computer Science BITS Hyderabad', 'BE Mechanical Engineering BITS Pilani', 'BE Electrical and Electronics Engineering BITS Goa', 'BE Electronics and Instrumentation Engineering BITS Hyderabad'),
(1005, 'BE Electrical and Electronics Engineering BITS Pilani', 'BE Computer Science BITS Hyderabad', 'BE Mechanical Engineering BITS Hyderabad', 'BE Chemical Engineering BITS Pilani', 'BE Electronics and Instrumentation Engineering BITS Goa'),
(1006, 'BE Electronics and Instrumentation Engineering BITS Hyderabad', 'BE Computer Science BITS Pilani', 'BE Mechanical Engineering BITS Goa', 'BE Chemical Engineering BITS Hyderabad', 'BE Electrical and Electronics Engineering BITS Pilani'),
(1007, 'BE Computer Science BITS Goa', 'BE Electrical and Electronics Engineering BITS Hyderabad', 'BE Chemical Engineering BITS Pilani', 'BE Mechanical Engineering BITS Pilani', 'BE Electronics and Instrumentation Engineering BITS Hyderabad'),
(1008, 'BE Mechanical Engineering BITS Pilani', 'BE Computer Science BITS Hyderabad', 'BE Electrical and Electronics Engineering BITS Goa', 'BE Electronics and Instrumentation Engineering BITS Hyderabad', 'BE Chemical Engineering BITS Pilani'),
(1009, 'BE Chemical Engineering BITS Goa', 'BE Computer Science BITS Pilani', 'BE Mechanical Engineering BITS Hyderabad', 'BE Electronics and Instrumentation Engineering BITS Hyderabad', 'BE Electrical and Electronics Engineering BITS Goa'),
(1010, 'BE Electronics and Instrumentation Engineering BITS Pilani', 'BE Computer Science BITS Hyderabad', 'BE Electrical and Electronics Engineering BITS Goa', 'BE Mechanical Engineering BITS Pilani', 'BE Chemical Engineering BITS Hyderabad'),
(1011, 'BE Mechanical Engineering BITS Hyderabad', 'BE Computer Science BITS Pilani', 'BE Chemical Engineering BITS Goa', 'BE Electrical and Electronics Engineering BITS Hyderabad', 'BE Electronics and Instrumentation Engineering BITS Pilani'),
(1012, 'BE Computer Science BITS Pilani', 'BE Electrical and Electronics Engineering BITS Goa', 'BE Chemical Engineering BITS Hyderabad', 'BE Mechanical Engineering BITS Pilani', 'BE Electronics and Instrumentation Engineering BITS Hyderabad'),
(1013, 'BE Electrical and Electronics Engineering BITS Hyderabad', 'BE Computer Science BITS Goa', 'BE Mechanical Engineering BITS Hyderabad', 'BE Electronics and Instrumentation Engineering BITS Pilani', 'BE Chemical Engineering BITS Pilani'),
(1014, 'BE Electronics and Instrumentation Engineering BITS Pilani', 'BE Computer Science BITS Hyderabad', 'BE Mechanical Engineering BITS Pilani', 'BE Chemical Engineering BITS Pilani', 'BE Electrical and Electronics Engineering BITS Hyderabad'),
(1015, 'BE Chemical Engineering BITS Hyderabad', 'BE Computer Science BITS Pilani', 'BE Electrical and Electronics Engineering BITS Goa', 'BE Mechanical Engineering BITS Hyderabad', 'BE Electronics and Instrumentation Engineering BITS Pilani');

-- now since we have populated all our required tables we can finally work on executing the required queries as per the project requirements
-- 1. we already finished sample query 1 of "creating the necessary tables" except the allotment table which will be shown below as you scroll
-- 2. we achieved the task of "inserting student records" as you observed above
-- 3. we successfully achieved the task of "inserting new college records" as you observed above
-- 4. we will not proceed and demonstrate the most awaited allotment algorithm now:

DROP TABLE IF EXISTS seat_allotment; -- this line is just to make sure no error occurs incase the table doesn't exist

-- Create the seat_allotment table
CREATE TABLE seat_allotment (
  BITSAT_ID INT PRIMARY KEY REFERENCES student(BITSAT_ID),
  Allotment VARCHAR(100),
  FOREIGN KEY (BITSAT_ID) REFERENCES student(BITSAT_ID)
  ON UPDATE CASCADE
ON DELETE CASCADE
);

BEGIN; -- enclosing it as a transaction to make sure all statements are executed or none are executed to maintain data integrity incase some other referenced table gets modified when dealing with concurrent users
-- find and allot seats to students
INSERT INTO seat_allotment(BITSAT_ID, Allotment)
SELECT r.BITSAT_ID, -- we are selecting BITSAT_ID from the rank table because it is already in the sorted order as required to us
    COALESCE(   -- notice how we use COALESCE smartly here to go through Preference_X(where X goes from 1 to 5), and it stops at the first true statement
        (SELECT CONCAT(d.Degree_Name, ' ', d.Campus_Name) -- CONCAT present here because that is the format in which we are storing the text in the'select_preference' table
         FROM select_preferences p 
         JOIN Degree d ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = p.Preference_1 -- Using join so that we can access the various attributes of both the tables we are performing join on and on the next line as you can see
         WHERE p.BITSAT_ID = r.BITSAT_ID AND d.Available_Seats > 0 AND s.Board_Marks>=d.Min_Board_Marks_Required    -- we are checking the appropriate conditions whether to select the given preference to be inserted into the allot table 
         LIMIT 1 -- This clause limits the number of rows returned by the subquery to just one row. In other words, it ensures that only one preference is selected from the list of up to 5 preferences for each student. The preferences are evaluated in order of their priority, and the first preference that meets the given conditions (i.e., availability of seats and minimum board marks requirement) is selected for allotment.
         FOR UPDATE),-- This clause is used in conjunction with the SELECT statement to lock the rows being read by the subquery for the duration of the transaction. In this case, it is used to prevent multiple students from being allotted the same seat simultaneously, which could result in data inconsistencies.
        (SELECT CONCAT(d.Degree_Name, ' ', d.Campus_Name) -- Now as you can see the other statements for Preference_2 to Preference_5 is written in similar fashion and requires no further explanation
         FROM select_preferences p 
         JOIN Degree d ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = p.Preference_2 
         WHERE p.BITSAT_ID = r.BITSAT_ID AND d.Available_Seats > 0 AND s.Board_Marks>=d.Min_Board_Marks_Required  
         LIMIT 1
         FOR UPDATE),
        (SELECT CONCAT(d.Degree_Name, ' ', d.Campus_Name) 
         FROM select_preferences p 
         JOIN Degree d ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = p.Preference_3 
         WHERE p.BITSAT_ID = r.BITSAT_ID AND d.Available_Seats > 0 AND s.Board_Marks>=d.Min_Board_Marks_Required  
         LIMIT 1
         FOR UPDATE),
        (SELECT CONCAT(d.Degree_Name, ' ', d.Campus_Name) 
         FROM select_preferences p 
         JOIN Degree d ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = p.Preference_4 
         WHERE p.BITSAT_ID = r.BITSAT_ID AND d.Available_Seats > 0 AND s.Board_Marks>=d.Min_Board_Marks_Required  
         LIMIT 1
         FOR UPDATE),
        (SELECT CONCAT(d.Degree_Name, ' ', d.Campus_Name) 
         FROM select_preferences p 
         JOIN Degree d ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = p.Preference_5 
         WHERE p.BITSAT_ID = r.BITSAT_ID AND d.Available_Seats > 0 AND s.Board_Marks>=d.Min_Board_Marks_Required   
         LIMIT 1
         FOR UPDATE),
        NULL) AS Allotment -- this whole COALESCE which ended here was to select the required allotmnet from the preferences, notice how if none of the 5 preferences are met in that order it gets assigned NULL by default
FROM rank_list_as_per_rank r  -- r.BITSAT_ID selected from rank_list_as_per_rank table and we are using join to make sure the IDs are consistently matching or we want to match them on those respective IDs
JOIN student s ON r.BITSAT_ID = s.BITSAT_ID;


UPDATE Degree d -- Used to decrement the 'Available_Seats' as required after alloting a particular seat
JOIN 
(SELECT Allotment, COUNT(*) AS count 
FROM seat_allotment 
GROUP BY Allotment) a -- This subquery is used to count how many times each Degree_Name+Campus_Name in concatenated form occurs in the allotment table
ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = a.Allotment 
SET d.Available_Seats = d.Available_Seats - a.count -- we then accordingly subtract those many seats out of the available seats and hence have set up our needed counter
WHERE d.Available_Seats > 0;

-- ------------------------------------
-- this completes the explanation of our much needed seat_allotment table
-- we will now show the implementation of point 6. "To delete a student record"
-- for our sake we will randomly delete the student with ID 1005
-- since CASCADE DELETE is enabled via foreign key it will erase all references of this particular student.
DELETE FROM Student WHERE BITSAT_ID = 1005;

-- This line demarks the end of required sample query 6 as per project requirements

-- --------------------------------------

-- We will now demonstrate point 8. of sample query requirement "UPDATING a particular STUDENT information"
UPDATE Student
SET Name = 'Yamamoto Lalaji'
WHERE BITSAT_ID = 1001; -- well this was easily done just like delete

-- This line demarks the end of required sample query 7 as per project requirements
 
 -- -----------------------------------------------

-- We will now demonstrate point 9. "Updating a college's eligibility criteria" note this won't be immediately reflected seat_allotment table because for that we would have to run the algorithm again
-- We have commented the code for the seat_allotment algorithm below for the invigilator to debug and test the UPDATE statement:
UPDATE Degree
SET Min_Board_Marks_Required = 75  -- eligibility criteria is generally the board marks across counselling and hence here we have achieved task 9. of sample query requirements for the project
WHERE Degree_Name = 'BE Computer Science' AND Campus_Name = 'BITS Goa';

-- to run the seat_allot algorithm execute the code below:

-- DROP TABLE IF EXISTS seat_allotment; -- this line is just to make sure no error occurs incase the table doesn't exist

-- -- Create the seat_allotment table
-- CREATE TABLE seat_allotment (
--   BITSAT_ID INT PRIMARY KEY REFERENCES student(BITSAT_ID),
--   Allotment VARCHAR(100),
--   FOREIGN KEY (BITSAT_ID) REFERENCES student(BITSAT_ID)
--   ON UPDATE CASCADE
-- ON DELETE CASCADE
-- );

-- BEGIN; -- enclosing it as a transaction to make sure all statements are executed or none are executed to maintain data integrity incase some other referenced table gets modified when dealing with concurrent users
-- -- find and allot seats to students
-- INSERT INTO seat_allotment(BITSAT_ID, Student_Name, Allotment)
-- SELECT r.BITSAT_ID, s.name, -- we are selecting BITSAT_ID from the rank table because it is already in the sorted order as required to us, and student name from the student table which we will display alongside the bitsat_id to beautify the table
--     COALESCE(   -- notice how we use COALESCE smartly here to go through Preference_X(where X goes from 1 to 5), and it stops at the first true statement
--         (SELECT CONCAT(d.Degree_Name, ' ', d.Campus_Name) -- CONCAT present here because that is the format in which we are storing the text in the'select_preference' table
--          FROM select_preferences p 
--          JOIN Degree d ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = p.Preference_1 -- Using join so that we can access the various attributes of both the tables we are performing join on and on the next line as you can see
--          WHERE p.BITSAT_ID = r.BITSAT_ID AND d.Available_Seats > 0 AND s.Board_Marks>=d.Min_Board_Marks_Required    -- we are checking the appropriate conditions whether to select the given preference to be inserted into the allot table 
--          LIMIT 1 -- This clause limits the number of rows returned by the subquery to just one row. In other words, it ensures that only one preference is selected from the list of up to 5 preferences for each student. The preferences are evaluated in order of their priority, and the first preference that meets the given conditions (i.e., availability of seats and minimum board marks requirement) is selected for allotment.
--          FOR UPDATE),-- This clause is used in conjunction with the SELECT statement to lock the rows being read by the subquery for the duration of the transaction. In this case, it is used to prevent multiple students from being allotted the same seat simultaneously, which could result in data inconsistencies.
--         (SELECT CONCAT(d.Degree_Name, ' ', d.Campus_Name) -- Now as you can see the other statements for Preference_2 to Preference_5 is written in similar fashion and requires no further explanation
--          FROM select_preferences p 
--          JOIN Degree d ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = p.Preference_2 
--          WHERE p.BITSAT_ID = r.BITSAT_ID AND d.Available_Seats > 0 AND s.Board_Marks>=d.Min_Board_Marks_Required  
--          LIMIT 1
--          FOR UPDATE),
--         (SELECT CONCAT(d.Degree_Name, ' ', d.Campus_Name) 
--          FROM select_preferences p 
--          JOIN Degree d ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = p.Preference_3 
--          WHERE p.BITSAT_ID = r.BITSAT_ID AND d.Available_Seats > 0 AND s.Board_Marks>=d.Min_Board_Marks_Required  
--          LIMIT 1
--          FOR UPDATE),
--         (SELECT CONCAT(d.Degree_Name, ' ', d.Campus_Name) 
--          FROM select_preferences p 
--          JOIN Degree d ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = p.Preference_4 
--          WHERE p.BITSAT_ID = r.BITSAT_ID AND d.Available_Seats > 0 AND s.Board_Marks>=d.Min_Board_Marks_Required  
--          LIMIT 1
--          FOR UPDATE),
--         (SELECT CONCAT(d.Degree_Name, ' ', d.Campus_Name) 
--          FROM select_preferences p 
--          JOIN Degree d ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = p.Preference_5 
--          WHERE p.BITSAT_ID = r.BITSAT_ID AND d.Available_Seats > 0 AND s.Board_Marks>=d.Min_Board_Marks_Required   
--          LIMIT 1
--          FOR UPDATE),
--         NULL) AS Allotment -- this whole COALESCE which ended here was to select the required allotmnet from the preferences, notice how if none of the 5 preferences are met in that order it gets assigned NULL by default
-- FROM rank_list_as_per_rank r  -- r.BITSAT_ID selected from rank_list_as_per_rank table and we are using join to make sure the IDs are consistently matching or we want to match them on those respective IDs
-- JOIN student s ON r.BITSAT_ID = s.BITSAT_ID;


-- UPDATE Degree d -- Used to decrement the 'Available_Seats' as required after alloting a particular seat
-- JOIN 
-- (SELECT Allotment, COUNT(*) AS count 
-- FROM seat_allotment 
-- GROUP BY Allotment) a -- This subquery is used to count how many times each Degree_Name+Campus_Name in concatenated form occurs in the allotment table
-- ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = a.Allotment 
-- SET d.Available_Seats = d.Available_Seats - a.count -- we then accordingly subtract those many seats out of the available seats and hence have set up our needed counter
-- WHERE d.Available_Seats > 0;


-- this demarcates the end of point 9. as per sample queries for project requirement

-- ----------------------------

-- demonstration of Point number 10. "To Retrieve a count of the number of applications received for a particular college and course."
SELECT CONCAT(Degree_Name, ' ', Campus_Name) AS College_Course, COUNT(*) AS Applications_Received -- count statement used to count the number of applications
FROM select_preferences
JOIN Degree ON CONCAT(Degree_Name, ' ', Campus_Name) IN (Preference_1, Preference_2, Preference_3, Preference_4, Preference_5)
GROUP BY CONCAT(Degree_Name, ' ', Campus_Name); -- just to remind you again CONCAT statement is used because that is the format in which the preference field is filled in the select_preference table using the table degree
-- ***NOTE: the next 2 queries are also select statments but in mysql only the latest mysql statement will be executed and will retrieve you the required result. So comment the code accordingly as demonstrated in the video.

-- end of point 10.

-- --------------------------

-- query for point number 11. Retrieve a list of all colleges that have filled all their seats.
SELECT Degree_Name, Campus_Name FROM DEGREE -- this is pretty straight forward no explanation required
WHERE Available_Seats=0;
-- end of point number 11.

-- -----------------

-- Query for point number 12. "Retrieve a count of the number of seats available for a particular course in all colleges."
SELECT Degree_Name, Campus_Name, Available_Seats FROM degree; -- this is pretty straight forward no explanation required

-- I think I have satisfied all the sample query requirements given on April 5th. Thank You

-- -------------------------------------------------BYE BYE This demarcates end of the whole script------------------------------------------




