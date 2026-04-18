--STRING FUNCTIONS ( using: Nairobi_academy)
-- Name: Lawrence Muriuki 
-- Date: 19/04/2026

--Write a query to display each student's full name in UPPERCASE and their city in lowercase. Name the columns upper_name and lower_city.
SELECT UPPER(first_name || ' ' || last_name) AS upper_name,
       LOWER(city)  AS lower_city
FROM students;
--Write a query to show each student's first name and the LENGTH of their first name. Order the results from longest to shortest name.
SELECT first_name,
       LENGTH(first_name) AS name_length
FROM students
ORDER BY LENGTH(first_name) DESC;
--Write a query to show each subject's name and a short version - the first 4 characters of the subject name ... called short_name. Also show the full subject name length.
SELECT subject_name,
       LEFT(subject_name, 4) AS short_name,
       LENGTH(subject_name)  AS name_length
FROM subjects;
--Write a query using CONCAT to produce a sentence for each student in this format: 'Amina Wanjiku is in Form 3 and comes from Nairobi'. Call the column student_summary.
SELECT CONCAT(
           first_name, ' ', last_name,
           ' is in ', class,
           ' and comes from ', city
       ) AS student_summary
FROM students;
