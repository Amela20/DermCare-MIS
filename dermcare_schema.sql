
USE dermcare_mis;

CREATE TABLE Patient (
    patient_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    date_of_birth DATE NOT NULL
);


CREATE TABLE `User` (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    first_name VARCHAR(100) NOT NULL,
    last_name VARCHAR(100) NOT NULL,
    role VARCHAR(30) NOT NULL,
    CONSTRAINT chk_user_role
        CHECK (role IN ('dermatologist', 'receptionist'))
);




CREATE TABLE Encounter (
    encounter_id INT AUTO_INCREMENT PRIMARY KEY,
    patient_id INT NOT NULL,
    encounter_date DATETIME NOT NULL,
    reason_for_visit VARCHAR(500) NOT NULL,
    encounter_status VARCHAR(30) NOT NULL,
    dermatologist_id INT,

    CONSTRAINT fk_encounter_patient
        FOREIGN KEY (patient_id)
        REFERENCES Patient(patient_id),

    CONSTRAINT fk_encounter_dermatologist
        FOREIGN KEY (dermatologist_id)
        REFERENCES `User`(user_id),

    CONSTRAINT chk_encounter_status
        CHECK (encounter_status IN (
            'scheduled', 'in_progress', 'completed', 'cancelled'
        ))
);




CREATE TABLE Observation (
    observation_id INT AUTO_INCREMENT PRIMARY KEY,
    encounter_id INT NOT NULL,
    body_site VARCHAR(100) NOT NULL,
    lesion_diameter_mm DECIMAL(5,2),
    observation_date DATETIME NOT NULL,
    recorded_by_user_id INT NOT NULL,

    CONSTRAINT fk_observation_encounter
        FOREIGN KEY (encounter_id)
        REFERENCES Encounter(encounter_id),

    CONSTRAINT fk_observation_user
        FOREIGN KEY (recorded_by_user_id)
        REFERENCES `User`(user_id),

    CONSTRAINT chk_lesion_diameter
        CHECK (lesion_diameter_mm >= 0)
);


SHOW TABLES;

