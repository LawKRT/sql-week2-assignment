--SET OPERATORS (using both databases ie Nairobi_ academy & city_hospital)
-- Name: Lawrence Muriuki 
-- Date: 19/04/2026

--Write a UNION query to show a combined list of all unique cities from the students table and the patients table. Order alphabetically.
SELECT city FROM nairobi_academy.students
UNION
SELECT city FROM patients
ORDER BY city;
--Write a UNION ALL query to combine all student first names and all patient full names into one list. Add a second column called source that says 'Student' or 'Patient' so you can tell where each name came from.
SELECT first_name AS name,'Student' AS source
FROM nairobi_academy.students
UNION ALL
SELECT full_name AS name,
       'Patient' AS source
FROM patients
ORDER BY source, name;
--Write an INTERSECT query to find cities that appear in BOTH the students table and the patients table - cities that are home to both students and patients.
SELECT city FROM nairobi_academy.students
INTERSECT
SELECT city FROM patients
ORDER BY city;
--Write a query that combines all of the following into one result using UNION ALL - student names (labelled 'Student'), patient full names (labelled 'Patient'), and doctor full names (labelled 'Doctor'). Order the final result by the source label, then by name.
SELECT first_name || ' ' || last_name AS full_name,
       'Student' AS source
FROM nairobi_academy.students
UNION ALL
SELECT full_name,
       'Patient' AS source
FROM patients
UNION ALL
SELECT full_name,
       'Doctor' AS source
FROM doctors
ORDER BY source, full_name;
