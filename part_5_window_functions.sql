--WINDOW FUNCTIONS (using: nairobi_academy)
-- Name: Lawrence Muriuki 
-- Date: 19/04/2026

--Write a query using ROW_NUMBER() to assign a unique rank to each exam result, ordered from highest mark to lowest. Show result_id, student_id, marks, and row_num.
SELECT result_id,
       student_id,
       marks,
       ROW_NUMBER() OVER (ORDER BY marks DESC) AS row_num
FROM exam_results;
--Write a query using RANK() and DENSE_RANK() on exam results ordered by marks descending. Show both columns side by side so the difference between them is visible.
SELECT result_id,
       marks,
       RANK()       OVER (ORDER BY marks DESC) AS rank_val,
       DENSE_RANK() OVER (ORDER BY marks DESC) AS dense_rank_val
FROM exam_results;
--Write a query using NTILE(3) to divide all exam results into 3 performance bands (1 = top, 2 = middle, 3 = bottom). Show result_id, marks, and band.
SELECT result_id,
       marks,
       NTILE(3) OVER (ORDER BY marks DESC) AS band
FROM exam_results;
--Write a query using AVG() OVER(PARTITION BY student_id) to show each exam result alongside that student's personal average mark. Show student_id, marks, and student_avg rounded to 2 decimal places.
SELECT student_id,
       marks,
       ROUND(AVG(marks) OVER (PARTITION BY student_id), 2) AS student_avg
FROM exam_results;
--Write a query using LAG() to show each exam result alongside the previous result's marks for the same student. Also calculate the improvement (current marks minus previous marks). Use PARTITION BY student_id.
SELECT result_id,
       student_id,
       exam_date,
       marks,
       LAG(marks) OVER (PARTITION BY student_id ORDER BY exam_date) AS previous_marks,
       marks - LAG(marks) OVER (PARTITION BY student_id ORDER BY exam_date) AS improvement
FROM exam_results;
