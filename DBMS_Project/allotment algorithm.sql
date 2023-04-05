DROP TABLE IF EXISTS seat_allotment;

-- Create the seat_allotment table
CREATE TABLE seat_allotment (
  BITSAT_ID INT PRIMARY KEY,
  Student_Name VARCHAR(50),
  Allotment VARCHAR(100)
);
-- Create the seat_allotment table
BEGIN;
-- lock the Degree table
-- LOCK TABLES Degree WRITE;


-- find and allot seats to students
INSERT INTO seat_allotment(BITSAT_ID, Student_Name, Allotment)
SELECT r.BITSAT_ID, s.name, 
    COALESCE(
        (SELECT CONCAT(d.Degree_Name, ' ', d.Campus_Name) 
         FROM select_preferences p 
         JOIN Degree d ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = p.Preference_1 
         WHERE p.BITSAT_ID = r.BITSAT_ID AND d.Tot_Number_Of_Seats > 0
         LIMIT 1
         FOR UPDATE),
        (SELECT CONCAT(d.Degree_Name, ' ', d.Campus_Name) 
         FROM select_preferences p 
         JOIN Degree d ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = p.Preference_2 
         WHERE p.BITSAT_ID = r.BITSAT_ID AND d.Tot_Number_Of_Seats > 0
         LIMIT 1
         FOR UPDATE),
        (SELECT CONCAT(d.Degree_Name, ' ', d.Campus_Name) 
         FROM select_preferences p 
         JOIN Degree d ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = p.Preference_3 
         WHERE p.BITSAT_ID = r.BITSAT_ID AND d.Tot_Number_Of_Seats > 0
         LIMIT 1
         FOR UPDATE),
        (SELECT CONCAT(d.Degree_Name, ' ', d.Campus_Name) 
         FROM select_preferences p 
         JOIN Degree d ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = p.Preference_4 
         WHERE p.BITSAT_ID = r.BITSAT_ID AND d.Tot_Number_Of_Seats > 0
         LIMIT 1
         FOR UPDATE),
        (SELECT CONCAT(d.Degree_Name, ' ', d.Campus_Name) 
         FROM select_preferences p 
         JOIN Degree d ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = p.Preference_5 
         WHERE p.BITSAT_ID = r.BITSAT_ID AND d.Tot_Number_Of_Seats > 0
         LIMIT 1
         FOR UPDATE),
        NULL) AS Allotment
FROM rank_list_as_per_rank r
JOIN student s ON r.BITSAT_ID = s.BITSAT_ID;


UPDATE Degree d 
JOIN 
(SELECT Allotment, COUNT(*) AS count 
FROM seat_allotment 
GROUP BY Allotment) a 
ON CONCAT(d.Degree_Name, ' ', d.Campus_Name) = a.Allotment 
SET d.Tot_Number_Of_Seats = d.Tot_Number_Of_Seats - a.count
WHERE d.Tot_Number_Of_Seats > 0;













-- Update the Tot_Number_Of_Seats for the allotted degree and campus


