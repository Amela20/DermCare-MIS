USE dermcare_mis;

-- Test 1: Invalid patient ID
-- Expected: Error 1452 (FOREIGN KEY)

INSERT INTO Encounter
(patient_id, encounter_date, reason_for_visit, encounter_status, dermatologist_id)
VALUES
(999, '2026-11-25 10:00:00', 'Test visit', 'scheduled', 1);


-- Test 2: Invalid encounter status
-- Expected: Error 3819 (CHECK)

INSERT INTO Encounter
(patient_id, encounter_date, reason_for_visit, encounter_status, dermatologist_id)
VALUES
(1, '2026-11-25 11:00:00', 'Test visit', 'waiting', 1);


-- Test 3: Negative lesion diameter
-- Expected: Error 3819 (CHECK)

INSERT INTO Observation
(encounter_id, body_site, lesion_diameter_mm, observation_date, recorded_by_user_id)
VALUES
(1, 'left_arm', -5.25, '2026-11-15 10:20:00', 1);