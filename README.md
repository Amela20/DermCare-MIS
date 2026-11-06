# DermCare MIS – Dermatology Patient Management System

## 1. Project Overview

DermCare MIS is a prototype Medical Information System designed for a dermatology clinic.

The system manages patient information, dermatology visits (encounters), and clinical observations.

The main goal is to demonstrate how patient data and clinical information can be stored in a relational database and connected using primary and foreign keys.

The database uses synthetic (fictional) patient and staff data for educational purposes.

## 2. Clinical Scenario

A receptionist registers patients in the clinic. A dermatologist conducts medical consultations and documents clinical observations.

A patient can have multiple encounters. Each encounter belongs to one patient and may have an assigned dermatologist. During an encounter, clinical observations can be recorded.

The prototype includes a skin lesion observation, documenting its body location, diameter, and observation date.


## 3. Database Structure

The DermCare MIS database contains four main tables:

- **Patient:** Stores patient information, including the patient's ID, first name, last name, and date of birth.
- **User:** Stores clinic staff accounts, including dermatologists and receptionists.
- **Encounter:** Stores dermatology visits, including the patient, date, reason for visit, status, and assigned dermatologist.
- **Observation:** Stores clinical findings recorded during a visit, including body location, lesion diameter, observation date, and the user who recorded the finding.

### Table Relationships

- **Patient → Encounter (1:N):** One patient can have multiple visits, but each visit belongs to one patient.
- **Encounter → Observation (1:N):** One visit can have multiple observations, but each observation belongs to one visit.
- **User → Encounter (1:N):** One user can be assigned to multiple visits as the responsible dermatologist.
- **User → Observation (1:N):** One user can record multiple observations.

The tables are connected using foreign keys to maintain referential integrity.

## 4. How to Run the Database

### Requirements

- MySQL Server 8.0
- MySQL Workbench

### Setup Instructions

1. Open MySQL Workbench and connect to the MySQL server.
2. Create a new database named `dermcare_mis` by executing:

   ```sql
   CREATE DATABASE dermcare_mis;
   ```

3. Open and execute `dermcare_schema.sql` to create the four database tables.
4. Open and execute `dermcare_data.sql` to insert fictional sample data.
5. Open and execute `dermcare_queries.sql` to run the five example SQL queries.

### Database Validation

The file `dermcare_tests.sql` contains three intentionally invalid insert statements that test database constraints:

- A visit referencing a nonexistent patient (expected MySQL Error 1452).
- A visit with an invalid encounter status (expected MySQL Error 3819).
- An observation with a negative lesion diameter (expected MySQL Error 3819).

Each test should be executed individually. The expected errors demonstrate that the database constraints are enforced.

**Important:** The setup scripts are intended for a new, empty database. Re-running them on an already populated database may produce errors or duplicate sample data.