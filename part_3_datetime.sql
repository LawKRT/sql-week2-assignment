--DATE AND TIME FUNCTIONS – using: nairobi_academy
-- Name: Lawrence Muriuki 
-- Date: 19/04/2026

--Write a query to extract the birth year, birth month, and birth day from each student's date_of_birth as three separate columns. Show first_name alongside them.
SELECT first_name,
       EXTRACT(YEAR  FROM date_of_birth) AS birth_year,
       EXTRACT(MONTH FROM date_of_birth) AS birth_month,
       EXTRACT(DAY   FROM date_of_birth) AS birth_day
FROM students;
--Write a query to show each student's full name, their date_of_birth, and their age in complete years. Order from oldest to youngest.
SELECT first_name || ' ' || last_name AS full_name,
       date_of_birth,
       EXTRACT(YEAR FROM AGE(date_of_birth))::INT AS age_years
FROM students
ORDER BY date_of_birth ASC;
--Write a query to display each exam date in this exact format: 'Friday, 15th March 2024'.. Call the column formatted_date.
SELECT exam_date,
       TO_CHAR(exam_date, 'FMDay, FMDDth FMMonth YYYY') AS formatted_date
FROM exam_results;
