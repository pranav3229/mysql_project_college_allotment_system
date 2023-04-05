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
);
