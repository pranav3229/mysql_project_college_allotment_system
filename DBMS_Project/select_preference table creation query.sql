DROP TABLE IF EXISTS select_preferences;
CREATE TABLE select_preferences (   -- sql query to create the select_preferences table according to the relational schema we made
    BITSAT_ID int PRIMARY KEY REFERENCES student(BITSAT_ID), -- foreign key constraint made as required by the relational schema
    Preference_1 varchar(100),
    Preference_2 varchar(100),
    Preference_3 varchar(100),
    Preference_4 varchar(100),
    Preference_5 varchar(100)
);

