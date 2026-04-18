--NUMBER FUNCTIONS  (using: Nairobi_academy) 
-- Name: Lawrence Muriuki 
-- Date: 19/04/2026

--Write a query to show each exam result alongside the mark rounded to 1 decimal place, the mark rounded UP to the nearest 10 using CEIL, and the mark rounded DOWN using FLOOR.
SELECT result_id,
       marks,
       ROUND(marks, 1)          AS rounded_1dp,
       CEIL(marks / 10.0) * 10  AS ceil_to_10,
       FLOOR(marks)             AS floored
FROM exam_results;
--Write a query to calculate the following summary statistics for exam_results in one query: total number of results (COUNT), average mark (AVG rounded to 2 decimal places), highest mark (MAX), lowest mark (MIN), and total marks added together (SUM).
SELECT COUNT(*)            AS total_results,
       ROUND(AVG(marks),2) AS avg_mark,
       MAX(marks)          AS highest_mark,
       MIN(marks)          AS lowest_mark,
       SUM(marks)          AS total_marks
FROM exam_results;
--The school wants to apply a 10% bonus to all marks. Write a query to show each result_id, the original marks, and the new boosted_mark rounded to the nearest whole number.
SELECT result_id,
       marks AS original_marks,
       ROUND(marks * 1.10) AS boosted_mark
FROM exam_results;
