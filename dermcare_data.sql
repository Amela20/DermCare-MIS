USE dermcare_mis;

-- Insert sample patients

INSERT INTO Patient (first_name, last_name, date_of_birth)
VALUES ('Anna', 'Muller', '2001-03-20');

INSERT INTO Patient (first_name, last_name, date_of_birth)
VALUES ('Max', 'Berger', '1995-08-12');


-- Insert sample users

INSERT INTO `User` (username, first_name, last_name, role)
VALUES ('dr_berger', 'Lukas', 'Berger', 'dermatologist');

INSERT INTO `User` (username, first_name, last_name, role)
VALUES ('reception_anna', 'Sophie', 'Weber', 'receptionist');

-- Insert sample encounters

-- Anna's dermatology visit
INSERT INTO Encounter
(patient_id, encounter_date, reason_for_visit, encounter_status, dermatologist_id)
VALUES
(1, '2026-11-15 10:00:00', 'Skin mole check', 'completed', 1);

-- Max's dermatology visit
INSERT INTO Encounter
(patient_id, encounter_date, reason_for_visit, encounter_status, dermatologist_id)
VALUES
(2, '2026-11-20 11:00:00', 'Acne consultation', 'scheduled', 1);

-- Insert sample observation

-- Skin lesion observation for Anna's visit
INSERT INTO Observation
(encounter_id, body_site, lesion_diameter_mm, observation_date, recorded_by_user_id)
VALUES
(1, 'left_arm', 5.25, '2026-11-15 10:15:00', 1);