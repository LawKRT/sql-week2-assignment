--JOIN FUNCTIONS
-- Name: Lawrence Muriuki 
-- Date: 19/04/2026

--Write an INNER JOIN query to show each appointment alongside the patient's full name, the doctor's full name, the appointment date, and the diagnosis.
SELECT a.appointment_id,
       p.full_name AS patient_name,
       d.full_name AS doctor_name,
       a.appt_date,
       a.diagnosis
FROM appointments a
INNER JOIN patients p ON a.patient_id = p.patient_id
INNER JOIN doctors  d ON a.doctor_id  = d.doctor_id
ORDER BY a.appointment_id;

--Write a LEFT JOIN query to show ALL patients - and if they have an appointment, show the appointment date and diagnosis. Patients with no appointments should still appear with NULL values
SELECT p.patient_id,
       p.full_name AS patient_name,
       a.appt_date,
       a.diagnosis
FROM patients p
LEFT JOIN appointments a ON p.patient_id = a.patient_id
ORDER BY p.patient_id;

--Write a RIGHT JOIN query to show ALL doctors - and if they have seen a patient, show the patient name. Doctors with no appointments should still appear.
SELECT d.doctor_id,
       d.full_name AS doctor_name,
       p.full_name AS patient_name,
       a.appt_date
FROM appointments a
RIGHT JOIN doctors d ON a.doctor_id = d.doctor_id
LEFT JOIN patients p ON a.patient_id = p.patient_id
ORDER BY d.doctor_id;

--Write a query using LEFT JOIN and WHERE IS NULL to find all patients who have NEVER had an appointment. Show patient full_name and city.
SELECT p.full_name,
       p.city
FROM patients p
LEFT JOIN appointments a ON p.patient_id = a.patient_id
WHERE a.appointment_id IS NULL
ORDER BY p.full_name;

--Write a three-table INNER JOIN to show each appointment with: the patient name, the doctor name, and the medicine prescribed (from prescriptions). Show appointment_id, patient name, doctor name, and medicine_name.
SELECT a.appointment_id,
       p.full_name    AS patient_name,
       d.full_name    AS doctor_name,
       pr.medicine_name
FROM appointments a
INNER JOIN patients      p  ON a.patient_id     = p.patient_id
INNER JOIN doctors       d  ON a.doctor_id      = d.doctor_id
INNER JOIN prescriptions pr ON a.appointment_id = pr.appointment_id
ORDER BY a.appointment_id;
