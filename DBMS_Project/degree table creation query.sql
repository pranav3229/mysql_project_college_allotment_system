CREATE TABLE Degree (
  Degree_Name VARCHAR(50) NOT NULL,
  Campus_Name VARCHAR(50) NOT NULL,
  Tot_Number_Of_Seats INT UNSIGNED NOT NULL,
  Min_Board_Marks_Required DECIMAL(5,2) NOT NULL,
  PRIMARY KEY (Degree_Name, Campus_Name)
);