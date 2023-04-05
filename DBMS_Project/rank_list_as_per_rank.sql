START TRANSACTION;
DROP TABLE rank_list_as_per_rank; -- note we will run this whole script as it is each time we make changes to the table Student
CREATE TABLE rank_list_as_per_rank (
  `rank` INT,
  BITSAT_ID INT,
  BITSAT_Score INT,
  Math_Score INT,
  Physics_Score INT,
  Chemistry_Score INT,
  PRIMARY KEY(`rank`, BITSAT_ID)
); -- this is to create the table rank_list_as_per_rank refer to FD table

INSERT INTO rank_list_as_per_rank -- this query is made to insert students into the rank_list_as_per_rank table in the order of the constraints as show by the RANK() over function
SELECT 
  RANK() OVER (ORDER BY BITSAT_Score DESC, Math_Score DESC, Physics_Score DESC, Chemistry_Score DESC, Board_Marks DESC, DOB ASC, Name ASC) as `rank`,
  BITSAT_ID,
  BITSAT_Score, -- Marks are in DESC because we want the person with the higher marks to get the better rank 
  Math_Score,   -- and ASC for DOB and name because we want the older person to get a better rank and by the sense of general lexicographical ordering we want to assign the rank accordingly
  Physics_Score,
  Chemistry_Score
FROM Student;
COMMIT