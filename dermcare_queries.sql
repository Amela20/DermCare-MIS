USE dermcare_mis;

-- Query 1: Show all registered patients

SELECT
    patient_id,
    first_name,
    last_name,
    date_of_birth
FROM Patient;



-- Query 2: Show patients and their visits

SELECT
    Patient.first_name,
    Patient.last_name,
    Encounter.reason_for_visit,
    Encounter.encounter_status
FROM Encounter
JOIN Patient
    ON Encounter.patient_id = Patient.patient_id;


    -- Query 3: Show completed visits

SELECT
    Patient.first_name,
    Patient.last_name,
    Encounter.reason_for_visit
FROM Encounter
JOIN Patient
    ON Encounter.patient_id = Patient.patient_id
WHERE Encounter.encounter_status = 'completed';


-- Query 4: Show patient observations

SELECT
    Patient.first_name,
    Patient.last_name,
    Observation.body_site,
    Observation.lesion_diameter_mm
FROM Observation
JOIN Encounter
    ON Observation.encounter_id = Encounter.encounter_id
JOIN Patient
    ON Encounter.patient_id = Patient.patient_id;



    -- Query 5: Count visits for each patient

SELECT
    Patient.first_name,
    Patient.last_name,
    COUNT(Encounter.encounter_id) AS total_visits
FROM Patient
LEFT JOIN Encounter
    ON Patient.patient_id = Encounter.patient_id
GROUP BY
    Patient.patient_id,
    Patient.first_name,
    Patient.last_name;