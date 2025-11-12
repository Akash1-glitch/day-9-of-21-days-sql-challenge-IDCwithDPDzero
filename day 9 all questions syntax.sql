-- Extract the year from all patient arrival dates.
use hospital;
SELECT 
    arrival_date,
    YEAR(arrival_date) AS arrival_year
FROM 
    patients;
-- 2-- Calculate the length of stay for each patient (departure_date - arrival_date).
SELECT
    patient_id,
    arrival_date,
    departure_date,
    (departure_date - arrival_date) AS length_of_stay_days
FROM
    patients;
-- 3.Find all patients who arrived in a specific month.
SELECT
    *
FROM
    patients
WHERE
    MONTH(arrival_date) = 2;
-- ### Daily Challenge:

-- **Question:** Calculate the average length of stay (in days) for each service, 
-- showing only services where the average stay is more than 7 days. Also show the 
-- count of patients and order by average stay descending.
SELECT
    service,
    AVG(DATEDIFF(departure_date, arrival_date)) AS average_stay_days,
    COUNT(patient_id) AS patient_count
FROM
    patients
GROUP BY
    service
HAVING
    AVG(DATEDIFF(departure_date, arrival_date)) > 7
ORDER BY
    average_stay_days DESC;