SELECT CONCAT(Degree_Name, ' ', Campus_Name) AS College_Course, COUNT(*) AS Applications_Received
FROM select_preferences
JOIN Degree ON CONCAT(Degree_Name, ' ', Campus_Name) IN (Preference_1, Preference_2, Preference_3, Preference_4, Preference_5)
GROUP BY CONCAT(Degree_Name, ' ', Campus_Name);
