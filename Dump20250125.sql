CREATE DATABASE  IF NOT EXISTS `mydatabase` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `mydatabase`;
-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: mydatabase
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `billing_claims`
--

DROP TABLE IF EXISTS `billing_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billing_claims` (
  `billing_id` int NOT NULL,
  `patient_reference` int DEFAULT NULL,
  `service_Id` int DEFAULT NULL,
  `amount_billed` decimal(6,2) DEFAULT NULL,
  `insurance_covered_amount` decimal(6,2) DEFAULT NULL,
  `out_of_pocket_amount` decimal(6,2) DEFAULT NULL,
  `billing_date` date DEFAULT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`billing_id`),
  KEY `patient_reference_idx` (`patient_reference`),
  KEY `service_id_idx` (`service_Id`),
  CONSTRAINT `patient_reference` FOREIGN KEY (`patient_reference`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `service_id` FOREIGN KEY (`service_Id`) REFERENCES `services_claims` (`service_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billing_claims`
--

LOCK TABLES `billing_claims` WRITE;
/*!40000 ALTER TABLE `billing_claims` DISABLE KEYS */;
INSERT INTO `billing_claims` VALUES (8001,12232020,9001,145.00,45.00,100.00,'2025-01-16','2025/01/19','2025/01/19'),(8002,12232021,9002,345.00,300.00,45.00,'2025-01-16','2025/01/19','2025/01/19');
/*!40000 ALTER TABLE `billing_claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `census_data`
--

DROP TABLE IF EXISTS `census_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `census_data` (
  `census_id` int NOT NULL,
  `Identity_of_patient` int DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `county` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `population` int DEFAULT NULL,
  `median_income` decimal(10,2) DEFAULT NULL,
  `poverty_rate` decimal(5,2) DEFAULT NULL,
  `unnemployment_rate` decimal(5,2) DEFAULT NULL,
  `education_high_school` decimal(5,2) DEFAULT NULL,
  `education_bachelor_plus` decimal(5,2) DEFAULT NULL,
  `median_home_value` decimal(10,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`census_id`),
  KEY `zip_code_idx` (`zip_code`),
  KEY `identity_of_patient_idx` (`Identity_of_patient`),
  CONSTRAINT `identity_of_patient` FOREIGN KEY (`Identity_of_patient`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `census_data`
--

LOCK TABLES `census_data` WRITE;
/*!40000 ALTER TABLE `census_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `census_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `community_resources`
--

DROP TABLE IF EXISTS `community_resources`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `community_resources` (
  `resource_id` int NOT NULL,
  `factor_id` int DEFAULT NULL,
  `resource_type` varchar(45) DEFAULT NULL,
  `resource_name` varchar(90) DEFAULT NULL,
  `availability_hours` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `u[pdated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`resource_id`),
  KEY `factor_id_idx` (`factor_id`),
  CONSTRAINT `factor_id` FOREIGN KEY (`factor_id`) REFERENCES `socioeconomic_factors` (`factor_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `community_resources`
--

LOCK TABLES `community_resources` WRITE;
/*!40000 ALTER TABLE `community_resources` DISABLE KEYS */;
INSERT INTO `community_resources` VALUES (7001,1,'Food Bank','US Food bank','once a week','2025-01-19 00:00:00','2025-01-19 00:00:00'),(7002,2,'Free Clinic','Southside Clinic','everyday','2025-01-19 00:00:00','2025-01-19 00:00:00');
/*!40000 ALTER TABLE `community_resources` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `covid_19_records`
--

DROP TABLE IF EXISTS `covid_19_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `covid_19_records` (
  `covid-id` int NOT NULL,
  `patient-id` int DEFAULT NULL,
  `visit_identification_number` int DEFAULT NULL,
  `healthcare_staff_identification` int DEFAULT NULL,
  `immunization_id` int DEFAULT NULL,
  `infection_date` date DEFAULT NULL,
  `symptom_type` varchar(100) DEFAULT NULL,
  `severity` enum('Mild','Moderate','Severe','Critical') DEFAULT NULL,
  `hospitalization` tinytext,
  `icu-admission` tinytext,
  `ventialtion` tinytext,
  `outcome` set('Recovered','Deceased','Ongoing') DEFAULT NULL,
  `vaccination_status` enum('vaccinated','unvaccinated') DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`covid-id`),
  KEY `patient_id_idx` (`patient-id`),
  KEY `healthcare_staff_id_idx` (`healthcare_staff_identification`),
  KEY `visit_id_number_idx` (`visit_identification_number`),
  KEY `vaccination_id_idx` (`immunization_id`),
  CONSTRAINT `healthcare_staff_identification` FOREIGN KEY (`healthcare_staff_identification`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `immunization_id` FOREIGN KEY (`immunization_id`) REFERENCES `immunization_records` (`vaccination_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient_id` FOREIGN KEY (`patient-id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visit_identification_number` FOREIGN KEY (`visit_identification_number`) REFERENCES `visits` (`visit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `covid_19_records`
--

LOCK TABLES `covid_19_records` WRITE;
/*!40000 ALTER TABLE `covid_19_records` DISABLE KEYS */;
INSERT INTO `covid_19_records` VALUES (18571,12232020,4005,5002,587,'2020-12-16','Cough,chest congestion','Critical','Yes','No','No','Deceased','vaccinated','21','2025-01-11 22:38:22'),(18572,12232021,4006,5003,588,'2022-06-14','cold and cough','Moderate','Yes','Yes','Yes','Recovered','vaccinated','14','2025-01-11 22:38:22'),(18573,12232022,4007,5004,589,'2021-12-25','chest congestion, fever','Critical','Yes','Yes','Yes','Deceased','unvaccinated','21','2025-01-11 22:38:22'),(18574,11220200,4003,5004,600,'2020-01-01','chest congestion, cough, cold','Critical','Yes','Yes','No','Recovered','vaccinated','21','2025-01-11 22:38:22'),(18575,10102456,4001,5001,601,'2020-06-18','loss of smell and taste','Mild','No','No','No','Recovered','vaccinated','7','2025-01-11 22:38:22'),(18576,12223456,4004,5002,602,'2020-07-28','fever, cold','Moderate','Yes','Yes','No','Recovered','vaccinated','14','2025-01-11 22:38:22'),(18577,10569891,4002,5003,603,'2020-09-18','sore throat and cough','Critical','Yes','Yes','Yes','Deceased','unvaccinated','22','2025-01-11 22:38:22'),(18578,12305678,4008,5004,604,'2020-10-11','fever, cough, congestion','Critical','Yes','Yes','Yes','Deceased','vaccinated','29','2025-01-11 22:38:22'),(18579,96901051,4011,5001,605,'2020-11-17','cold and cough','Moderate','Yes','Yes','Yes','Recovered','vaccinated','13','2025-01-11 22:38:22'),(18580,86565159,4009,5002,606,'2020-12-18','fever, high blood pressure','Critical','Yes','Yes','Yes','Deceased','unvaccinated','30','2025-01-11 22:38:22'),(18581,86565160,4010,5003,607,'2024-12-02','loss of taste and smell','Moderate','Yes','No','No','Recovered','vaccinated','16','2025-01-11 22:38:22');
/*!40000 ALTER TABLE `covid_19_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnoses`
--

DROP TABLE IF EXISTS `diagnoses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnoses` (
  `diagnosis_id` int NOT NULL,
  `patient_identifi` int DEFAULT NULL,
  `medications_id` int DEFAULT NULL,
  `diagnosis_type` varchar(100) DEFAULT NULL,
  `icd_10_codes` varchar(45) DEFAULT NULL,
  `date_diagnosed` date DEFAULT NULL,
  `severity` enum('mild','moderate','severe') DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`diagnosis_id`),
  KEY `patient_identifi_idx` (`patient_identifi`),
  KEY `medications_id_idx` (`medications_id`),
  CONSTRAINT `medications_id` FOREIGN KEY (`medications_id`) REFERENCES `medications` (`medication_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient_identifi` FOREIGN KEY (`patient_identifi`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnoses`
--

LOCK TABLES `diagnoses` WRITE;
/*!40000 ALTER TABLE `diagnoses` DISABLE KEYS */;
INSERT INTO `diagnoses` VALUES (5001,12232020,5671,'diabetes with neuropathy','E10.41','2021-08-01','severe','2025-01-11 20:40:54'),(5002,12232021,5672,'asthma cough variant','J45.991','2020-06-03','moderate','2025-01-11 20:40:54');
/*!40000 ALTER TABLE `diagnoses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `diagnosis_medication`
--

DROP TABLE IF EXISTS `diagnosis_medication`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `diagnosis_medication` (
  `diagnosis_identification` int NOT NULL,
  `medication_identification` int NOT NULL,
  `identification_of_ patient` int NOT NULL,
  PRIMARY KEY (`diagnosis_identification`,`medication_identification`,`identification_of_ patient`),
  KEY `medication_identification_idx` (`medication_identification`),
  KEY `identification_of_patient_idx` (`identification_of_ patient`),
  CONSTRAINT `diagnosis_identification` FOREIGN KEY (`diagnosis_identification`) REFERENCES `diagnoses` (`diagnosis_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `identification_of_patient` FOREIGN KEY (`identification_of_ patient`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `medication_identification` FOREIGN KEY (`medication_identification`) REFERENCES `medications` (`medication_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `diagnosis_medication`
--

LOCK TABLES `diagnosis_medication` WRITE;
/*!40000 ALTER TABLE `diagnosis_medication` DISABLE KEYS */;
INSERT INTO `diagnosis_medication` VALUES (5001,5671,12232020),(5002,5672,12232021);
/*!40000 ALTER TABLE `diagnosis_medication` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `follow_up_appointments`
--

DROP TABLE IF EXISTS `follow_up_appointments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `follow_up_appointments` (
  `follow_up_id` int NOT NULL,
  `patient_identification_number` int DEFAULT NULL,
  `visit_identif` int DEFAULT NULL,
  `scheduled_date` date DEFAULT NULL,
  `scheduled_time` varchar(45) DEFAULT NULL,
  `reason` varchar(100) DEFAULT NULL,
  `confirmed_status` tinytext,
  PRIMARY KEY (`follow_up_id`),
  KEY `patient_identification_idx` (`patient_identification_number`),
  KEY `visit_id_idx` (`visit_identif`),
  CONSTRAINT `patient-identification_number` FOREIGN KEY (`patient_identification_number`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visit_identif` FOREIGN KEY (`visit_identif`) REFERENCES `visits` (`visit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `follow_up_appointments`
--

LOCK TABLES `follow_up_appointments` WRITE;
/*!40000 ALTER TABLE `follow_up_appointments` DISABLE KEYS */;
INSERT INTO `follow_up_appointments` VALUES (6060,12232021,4006,'2025-02-01','9am','follow up','Yes'),(6061,11220200,4003,'2025-01-30','2pm','follow up','No');
/*!40000 ALTER TABLE `follow_up_appointments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genomic_data`
--

DROP TABLE IF EXISTS `genomic_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genomic_data` (
  `genomic_id` int NOT NULL,
  `identification_patient` int DEFAULT NULL,
  `genetic_marker` varchar(100) DEFAULT NULL,
  `risk_fatcor` varchar(100) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`genomic_id`),
  KEY `identification_patient_idx` (`identification_patient`),
  CONSTRAINT `identification_patient` FOREIGN KEY (`identification_patient`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genomic_data`
--

LOCK TABLES `genomic_data` WRITE;
/*!40000 ALTER TABLE `genomic_data` DISABLE KEYS */;
INSERT INTO `genomic_data` VALUES (20001,12232020,'SNP','hypertension Marker','2025-01-19 00:00:00','2025-01-19 00:00:00'),(20002,12232021,'CGRP ','hypertension Marker','2025-01-19 00:00:00','2025-01-19 00:00:00');
/*!40000 ALTER TABLE `genomic_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `healthcare_access`
--

DROP TABLE IF EXISTS `healthcare_access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `healthcare_access` (
  `access_id` int NOT NULL,
  `identifacat_patient` int DEFAULT NULL,
  `healthcare_facility_distance` varchar(45) DEFAULT NULL,
  `transportation_mode` enum('Public','Private','None') DEFAULT NULL,
  `appointment_wait_time` varchar(45) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`access_id`),
  KEY `identificat_patient_idx` (`identifacat_patient`),
  CONSTRAINT `identificat_patient` FOREIGN KEY (`identifacat_patient`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthcare_access`
--

LOCK TABLES `healthcare_access` WRITE;
/*!40000 ALTER TABLE `healthcare_access` DISABLE KEYS */;
INSERT INTO `healthcare_access` VALUES (5001,12232020,'150 Kilometers','Public','90 days','2025-01-19 00:00:00','2025-01-19 00:00:00'),(5002,12232021,'100 Kilometers','Public','72 days','2025-01-19 00:00:00','2025-01-19 00:00:00');
/*!40000 ALTER TABLE `healthcare_access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `healthcare_facilities`
--

DROP TABLE IF EXISTS `healthcare_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `healthcare_facilities` (
  `facility_id` int NOT NULL,
  `visit_ident` int DEFAULT NULL,
  `Id_of_patient` int DEFAULT NULL,
  `facility_name` varchar(200) DEFAULT NULL,
  `location` varchar(200) DEFAULT NULL,
  `facility_type` enum('primary_care','urgent_care','emergency_room','hospital','specialist_clinic') DEFAULT NULL,
  `availiability_of_specialists` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`facility_id`),
  KEY `visit_ident_idx` (`visit_ident`),
  KEY `id_of_pateint_idx` (`Id_of_patient`),
  CONSTRAINT `id_of_pateint` FOREIGN KEY (`Id_of_patient`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visit_ident` FOREIGN KEY (`visit_ident`) REFERENCES `visits` (`visit_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `healthcare_facilities`
--

LOCK TABLES `healthcare_facilities` WRITE;
/*!40000 ALTER TABLE `healthcare_facilities` DISABLE KEYS */;
INSERT INTO `healthcare_facilities` VALUES (100,4005,12232020,'Nairobi','Main','hospital','yes'),(101,4007,12232022,'St Francis','South','urgent_care','no'),(102,4001,10102456,'Methodist','North','primary_care','no'),(103,4002,10569891,'St Francis','East','urgent_care','no'),(104,4004,12223456,'Aghakan','main','emergency_room','yes'),(105,4006,12232021,'Baptist','East','specialist_clinic','yes'),(106,4008,12305678,'Baptist','North','specialist_clinic','yes'),(107,4009,86565159,'Nairobi','Main','hospital','yes'),(108,4010,86565160,'Aghkan','West','emergency_room','yes'),(109,4011,96901051,'St Francis','North','urgent_care','no'),(110,4003,11220200,'Ngariama','main','primary_care','no');
/*!40000 ALTER TABLE `healthcare_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hypertension_record`
--

DROP TABLE IF EXISTS `hypertension_record`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hypertension_record` (
  `hypertension_id` int NOT NULL,
  `patient_identif` int DEFAULT NULL,
  `outcomes_id` int DEFAULT NULL,
  `covid19_id` int DEFAULT NULL,
  `visit_number_id` int DEFAULT NULL,
  `date_of_diagnosis` date DEFAULT NULL,
  `systolic_blood_pressure` int DEFAULT NULL,
  `diastolic_blood_pressure` int DEFAULT NULL,
  `hypertension_stage` varchar(100) DEFAULT NULL,
  `Follow_up_required` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`hypertension_id`),
  KEY `patient_id_idx` (`patient_identif`),
  KEY `visit_number_id_idx` (`visit_number_id`),
  KEY `outcomes_id_idx` (`outcomes_id`),
  KEY `covid19_id_idx` (`covid19_id`),
  CONSTRAINT `covid19_id` FOREIGN KEY (`covid19_id`) REFERENCES `covid_19_records` (`covid-id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `outcomes_id` FOREIGN KEY (`outcomes_id`) REFERENCES `outcomes` (`outcome_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient_identif` FOREIGN KEY (`patient_identif`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visit_number_id` FOREIGN KEY (`visit_number_id`) REFERENCES `visits` (`visit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hypertension_record`
--

LOCK TABLES `hypertension_record` WRITE;
/*!40000 ALTER TABLE `hypertension_record` DISABLE KEYS */;
INSERT INTO `hypertension_record` VALUES (901,10569891,1503,18577,4002,'2020-07-04',156,104,'Stage 2','yes'),(902,12232020,1501,18571,4005,'2024-11-24',180,120,'Hypertensive crisis','yes');
/*!40000 ALTER TABLE `hypertension_record` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `immunization_records`
--

DROP TABLE IF EXISTS `immunization_records`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `immunization_records` (
  `vaccination_id` int NOT NULL,
  `patient_identificat` int DEFAULT NULL,
  `visitation_number` int DEFAULT NULL,
  `administered_by` int DEFAULT NULL,
  `vaccine_name` varchar(100) DEFAULT NULL,
  `dose_number` int DEFAULT NULL,
  `administration_date` date DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`vaccination_id`),
  KEY `patient_identificat_idx` (`patient_identificat`),
  KEY `administered_by_idx` (`administered_by`),
  KEY `visitation_number_idx` (`visitation_number`),
  CONSTRAINT `adminsitered_by` FOREIGN KEY (`administered_by`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient_identificat` FOREIGN KEY (`patient_identificat`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visitation_number` FOREIGN KEY (`visitation_number`) REFERENCES `visits` (`visit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `immunization_records`
--

LOCK TABLES `immunization_records` WRITE;
/*!40000 ALTER TABLE `immunization_records` DISABLE KEYS */;
INSERT INTO `immunization_records` VALUES (587,12232020,4005,5001,'COVID-19',3,'2020-12-20','2025-01-11 22:57:21'),(588,12232021,4006,5002,'COVID-19',1,'2022-06-25','2025-01-11 22:57:21'),(589,12232022,4007,5003,'COVID-19',3,'2021-12-29','2025-01-11 23:29:18'),(600,11220200,4003,5004,'COVID-19',2,'2020-01-03','2025-01-11 23:29:18'),(601,10102456,4001,5001,'COVID-19',1,'2020-06-20','2025-01-11 23:29:18'),(602,12223456,4004,5002,'COVID-19',1,'2020-07-29','2025-01-11 23:29:18'),(603,10569891,4002,5003,'COVID-19',1,'2020-09-21','2025-01-11 23:29:18'),(604,12305678,4008,5004,'COVID-19',1,'2020-10-14','2025-01-11 23:29:18'),(605,96901051,4011,5001,'PNEUMOCOCCAL',2,'2020-11-20','2025-01-11 23:29:18'),(606,86565159,4009,5002,'COVID-19',2,'2020-12-19','2025-01-11 23:29:18'),(607,86565160,4010,5003,'COVID-19',2,'2024-12-04','2025-01-11 23:29:18');
/*!40000 ALTER TABLE `immunization_records` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `insurance_information`
--

DROP TABLE IF EXISTS `insurance_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `insurance_information` (
  `insurance_id` int NOT NULL,
  `patient_ident` int DEFAULT NULL,
  `provider_-name` varchar(100) DEFAULT NULL,
  `policy_number` varchar(45) DEFAULT NULL,
  `coverage type` varchar(45) NOT NULL,
  `start-date` date DEFAULT NULL,
  `end-date` date DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`insurance_id`),
  KEY `patient-ident_idx` (`patient_ident`),
  CONSTRAINT `patient-ident` FOREIGN KEY (`patient_ident`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `insurance_information`
--

LOCK TABLES `insurance_information` WRITE;
/*!40000 ALTER TABLE `insurance_information` DISABLE KEYS */;
INSERT INTO `insurance_information` VALUES (7001,10102456,'Uninsured','0000000001','Uninsured','2020-01-01','2020-12-31','2025-01-11 20:51:21'),(7002,10569891,'BSBC','1798543333','PPO','2020-01-01','2020-12-31','2025-01-11 20:51:21'),(7003,11220200,'AETNA','8095675433','PPO','2020-01-01','2020-12-31','2025-01-11 20:51:21'),(7004,12223456,'MEDICARE','7204578912','B','2024-01-01','2024-12-31','2025-01-11 20:51:21'),(7005,12232020,'Uninsured','0000000002','Uninsured','2024-01-01','2024-12-31','2025-01-11 20:51:21'),(7006,12232021,'Medicare','8167561875','B','2024-01-01','2024-12-31','2025-01-11 20:51:21'),(7007,12232022,'Uninsured','0000000003','Uninsured','2024-01-01','2024-12-31','2025-01-11 20:51:21'),(7008,12305678,'Medicaid','0112567897','Medicaid','2024-01-01','2024-12-31','2025-01-11 20:51:21'),(7009,86565159,'Uninsured','0000000004','Uninsured','2020-01-01','2020-12-31','2025-01-11 20:51:21'),(7010,86565160,'United Healthcare','1678904563','HMO','2020-01-01','2020-12-31','2025-01-11 20:51:21'),(7011,96901051,'Medicaid','0123456676','Medicaid','2020-01-01','2020-12-31','2025-01-11 20:51:21');
/*!40000 ALTER TABLE `insurance_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `laboratory_results`
--

DROP TABLE IF EXISTS `laboratory_results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `laboratory_results` (
  `laboratory_results_id` int NOT NULL,
  `patient_identification` int DEFAULT NULL,
  `visit_identification` int DEFAULT NULL,
  `test_name` varchar(100) DEFAULT NULL,
  `result_value` enum('Positive','False') DEFAULT NULL,
  `unit_location` varchar(45) DEFAULT NULL,
  `date_collected` date DEFAULT NULL,
  `lab_technician_id` int DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`laboratory_results_id`),
  KEY `Patient-id_idx` (`patient_identification`),
  KEY `lab_technician-id_idx` (`lab_technician_id`),
  KEY `visit_identification_idx` (`visit_identification`),
  CONSTRAINT `lab_technician-id` FOREIGN KEY (`lab_technician_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient_identification` FOREIGN KEY (`patient_identification`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visit_identification` FOREIGN KEY (`visit_identification`) REFERENCES `visits` (`visit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `laboratory_results`
--

LOCK TABLES `laboratory_results` WRITE;
/*!40000 ALTER TABLE `laboratory_results` DISABLE KEYS */;
INSERT INTO `laboratory_results` VALUES (9005,10102456,4001,'COVID PCR','Positive','ER','2020-06-20',5001,'2025-01-11 20:47:04'),(9006,10569891,4002,'COVID PCR','Positive','ICU','2020-07-04',5004,'2025-01-11 20:47:04'),(9007,11220200,4003,'COVID PCR','Positive','Med Surg','2020-08-03',5004,'2025-01-11 20:47:04'),(9008,12223456,4004,'COVID PCR','Positive','Med Surg','2024-12-08',5003,'2025-01-11 20:47:04'),(9009,12232020,4005,'COVID PCR','Positive','Med-Surg','2024-11-24',5003,'2025-01-11 20:47:04'),(9010,12232021,4006,'COVID PCR','Positive','ICU','2024-11-24',5002,'2025-01-11 20:47:04'),(9011,12232022,4007,'COVID PCR','Positive','ICU','2024-11-24',5001,'2025-01-11 20:47:04'),(9012,12305678,4008,'COVID PCR','Positive','ICU','2024-11-24',5001,'2025-01-11 20:47:04'),(9013,86565159,4009,'COVID PCR','Positive','ICU','2020-12-25',5001,'2025-01-11 20:47:04'),(9014,86565160,4010,'COVID PCR','Positive','Med Surg','2020-02-18',5003,'2025-01-11 20:47:04'),(9015,96901051,4011,'COVID PCR','Positive','ICU','2020-02-18',5001,'2025-01-11 20:47:04');
/*!40000 ALTER TABLE `laboratory_results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lifetsyle_behavior`
--

DROP TABLE IF EXISTS `lifetsyle_behavior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lifetsyle_behavior` (
  `lifetsyle_id` int NOT NULL,
  `identific_patient` int DEFAULT NULL,
  `exrecise_level` enum('Sedentary','Moderate','Active') NOT NULL,
  `diet_quality` enum('Poor','Balanced') DEFAULT NULL,
  `smoking_status` enum('Smoker','Non-Smokerr') DEFAULT NULL,
  `alcohol_intake` enum('Low','Moderate','High') DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`lifetsyle_id`,`exrecise_level`),
  KEY `identific_patient_idx` (`identific_patient`),
  CONSTRAINT `identific_patient` FOREIGN KEY (`identific_patient`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lifetsyle_behavior`
--

LOCK TABLES `lifetsyle_behavior` WRITE;
/*!40000 ALTER TABLE `lifetsyle_behavior` DISABLE KEYS */;
INSERT INTO `lifetsyle_behavior` VALUES (3001,12232020,'Sedentary','Poor','Smoker','Low','2025-01-19 00:00:00','2025-01-19 00:00:00'),(3002,12232021,'Sedentary','Poor','Smoker','Low','2025-01-19 00:00:00','2025-01-19 00:00:00');
/*!40000 ALTER TABLE `lifetsyle_behavior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medications`
--

DROP TABLE IF EXISTS `medications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `medications` (
  `medication_id` int NOT NULL,
  `patient_id` int DEFAULT NULL,
  `healthcare_staff_id` int DEFAULT NULL,
  `visit_id_number` int DEFAULT NULL,
  `Medication_name` varchar(300) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end-date` date DEFAULT NULL,
  `dosage` varchar(100) DEFAULT NULL,
  `frequency` varchar(50) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`medication_id`),
  KEY `patient-id_idx` (`patient_id`),
  KEY `healthcare_staff_id_idx` (`healthcare_staff_id`),
  KEY `visit_id_number_idx` (`visit_id_number`),
  CONSTRAINT `healthcare_staff_id` FOREIGN KEY (`healthcare_staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient-id` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visit_id_number` FOREIGN KEY (`visit_id_number`) REFERENCES `visits` (`visit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medications`
--

LOCK TABLES `medications` WRITE;
/*!40000 ALTER TABLE `medications` DISABLE KEYS */;
INSERT INTO `medications` VALUES (5671,12232020,5001,4005,'Norvasc','2020-12-16','2020-12-23','5mg','Twice daily','2025-01-11 00:00:00'),(5672,12232021,5002,4006,'Metformin','2022-06-14','2022-06-30','1000mg','Twice daily','2025-01-11 00:00:00'),(5673,12232022,5003,4007,'Lasix','2021-12-25','2022-01-02','40mg','Once daily','2025-01-11 00:00:00'),(5674,10102456,5004,4004,'Metformin','2020-06-20','2020-06-27','1000mg','Twice Daily','2025-01-11 00:00:00'),(5675,10569891,5001,4002,'Rizatriptan','2020-07-04','2020-07-18','10mg','0nce daily','2025-01-11 00:00:00'),(5676,11220200,5002,4003,'Potassium Chlroride','2021-08-01','2020-02-28','40Meq','Three times daily','2025-01-11 00:00:00'),(5677,12305678,5003,4008,'Lantus Insulin','2024-11-24','2024-12-04','36 units','once daily','2025-01-11 00:00:00'),(5678,86565159,5004,4009,'chemotherapy','2020-12-25','2021-01-13','10mg','Twice daily','2025-01-11 00:00:00'),(5679,86565160,5001,4010,'Hydrocortisone','2020-02-18','2020-02-26','30mg','Three times daily','2025-01-11 00:00:00'),(5700,96901051,5002,4011,'Prednisone','2020-02-18','2020-02-25','10','once daily','2025-01-11 00:00:00'),(5701,12223456,5003,4004,'Metformin','2024-08-24','2024-09-09','500mg','Twice daily','2025-01-11 00:00:00');
/*!40000 ALTER TABLE `medications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `outcomes`
--

DROP TABLE IF EXISTS `outcomes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `outcomes` (
  `outcome_id` int NOT NULL,
  `patient_identifica` int DEFAULT NULL,
  `covid_identific` int DEFAULT NULL,
  `id_of_visit` int DEFAULT NULL,
  `healthcare_staff_Ident` int DEFAULT NULL,
  `covid_19_outcome` enum('recovered','long_covid','deceased') DEFAULT NULL,
  `long_term_complicatiions` varchar(100) DEFAULT NULL,
  `hypertension_developed` tinytext,
  PRIMARY KEY (`outcome_id`),
  KEY `patient_identifica_idx` (`patient_identifica`),
  KEY `covid_identic_idx` (`covid_identific`),
  KEY `id_of_visit_idx` (`id_of_visit`),
  KEY `healthcare_staff_iden_idx` (`healthcare_staff_Ident`),
  CONSTRAINT `covid_identic` FOREIGN KEY (`covid_identific`) REFERENCES `covid_19_records` (`covid-id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `healthcare_staff_iden` FOREIGN KEY (`healthcare_staff_Ident`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_of_visit` FOREIGN KEY (`id_of_visit`) REFERENCES `visits` (`visit_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient_identifica` FOREIGN KEY (`patient_identifica`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `outcomes`
--

LOCK TABLES `outcomes` WRITE;
/*!40000 ALTER TABLE `outcomes` DISABLE KEYS */;
INSERT INTO `outcomes` VALUES (1501,12232020,18571,4005,5002,'deceased','No','yes'),(1502,12232021,18572,4006,5002,'recovered','yes','yes'),(1503,10569891,18577,4002,5003,'deceased','no','yes');
/*!40000 ALTER TABLE `outcomes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_staff`
--

DROP TABLE IF EXISTS `patient_staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patient_staff` (
  `id_patient` int NOT NULL,
  `id_staff` int NOT NULL,
  `id_visit` int NOT NULL,
  PRIMARY KEY (`id_patient`,`id_staff`,`id_visit`),
  KEY `id_staff_idx` (`id_staff`),
  KEY `id_visit_idx` (`id_visit`),
  CONSTRAINT `id_pateint` FOREIGN KEY (`id_patient`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_staff` FOREIGN KEY (`id_staff`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `id_visit` FOREIGN KEY (`id_visit`) REFERENCES `visits` (`visit_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_staff`
--

LOCK TABLES `patient_staff` WRITE;
/*!40000 ALTER TABLE `patient_staff` DISABLE KEYS */;
INSERT INTO `patient_staff` VALUES (12232022,5001,4007),(12232020,5003,4005);
/*!40000 ALTER TABLE `patient_staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patients`
--

DROP TABLE IF EXISTS `patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `patients` (
  `patient_id` int NOT NULL,
  `first_name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `last_name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `age` int DEFAULT NULL,
  `sex` enum('Male','Female','Other') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `race` enum('African','Caucasian','Asian','Hispanic','Other') CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `date-of-birth` date DEFAULT NULL,
  `contactnumber` varchar(45) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `city` varchar(50) DEFAULT NULL,
  `state` varchar(50) DEFAULT NULL,
  `zip_code` varchar(10) DEFAULT NULL,
  `date-of-registration` datetime DEFAULT NULL,
  `religion` varchar(45) DEFAULT NULL,
  `occupation` varchar(100) DEFAULT NULL,
  `insurance_type` enum('Private','Medicaid','Medicare','Uninsured') DEFAULT NULL,
  `hypertension` tinytext,
  `comorbidities` longtext,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patients`
--

LOCK TABLES `patients` WRITE;
/*!40000 ALTER TABLE `patients` DISABLE KEYS */;
INSERT INTO `patients` VALUES (10102456,'Juan','Lopez',46,'Male','Hispanic','1974-07-11','3199670657','jlopez@yahoo.mail','308 Sunny Blvd','Indianapolis','IN','46237','2020-06-20 00:00:00','Catholic','Construction','Uninsured','yes','Daibetes, smoker,asthma','2025-01-11 00:00:00','2025-01-11 00:00:00'),(10569891,'Caroline','Otieno',49,'Female','African','1977-06-04','1773377001','cotieno@gamil.com','3b Grace Lane','Indianapolis','IN','46208','2020-07-04 00:00:00','Anglican','Finance','Private','no','migraines','2025-01-11 00:00:00','2025-01-11 00:00:00'),(11220200,'Maxwell','Nyaga',49,'Male','African','1977-05-11','3176894576','mnyaga@yahoo.com','1711 Merryville','Fishers','IN','46037','2020-08-03 00:00:00','Baptist','Entepreneur','Private','no','skipping heart beats','2025-01-11 00:00:00','2025-01-11 00:00:00'),(12223456,'Peter','Orengo',70,'Male','African','1950-03-13','3176444094','Orengop@gmail.com','4056 Sunscape circle','Indianapolis','IN','46037','2024-12-08 00:00:00','Seventh Day','Accountant','Medicare','yes','Hypertersnion, Diabetes','2025-01-11 00:00:00','2025-01-11 00:00:00'),(12232020,'Janet','Muthoni',86,'Female','African','1932-12-23','7432368000','jmuthoni@gmail.com','4905 Fields Blvd','Indianapolis','IN','46239','2024-11-24 00:00:00','Anglican','Entrepreneur','Uninsured','yes','Diabetes, Atrial Fibrillation, COPD, Steroid use','2025-01-11 00:00:00','2025-01-11 00:00:00'),(12232021,'John','Doe',78,'Female','Caucasian','1945-08-01','5027486995','jdoe@gmail.com','7300 Halston Court','Louisville','KY','40059','2024-11-24 22:23:00','Catholic','Teacher','Medicare','yes','Asthma, Diabetes','2025-01-11 00:00:00','2025-01-11 00:00:00'),(12232022,'Dickson','Nyaga',89,'Male','African','1935-01-01','7222121849','dnyaga@gmail.com','7300 Shadwell Lane','Prospect','KY','40059','2024-11-24 22:29:00','Anglican','Agriculturalist','Uninsured','yes','Diabetes, COPD, Dementia','2025-01-11 00:00:00','2025-01-11 00:00:00'),(12305678,'Fredrick','Kananga',88,'Male','African','1934-01-01','7236789113','Frednyga@gmail.com','8580 Nyga rd','Carmel','IN','46037','2024-11-24 00:00:00','Anglican','Health officer','Medicaid','no','Diabetes, Smoker','2025-01-11 00:00:00','2025-01-11 00:00:00'),(86565159,'Osorio ','Singh',90,'Male','Hispanic','1936-08-03','50498764501','osorios@gmail.com','604 Helena ','Dowagiac','MI','46005','2020-12-25 00:00:00','Sikh','Communication','Uninsured','no','colon cancer','2025-01-11 00:00:00','2025-01-11 00:00:00'),(86565160,'Nimrod','Peterson',46,'Male','Caucasian','1974-06-18','3178654754','NimrodP@gmail.com','11250 Fall Creek Rd','Fishers','IN','46037','2020-02-18 00:00:00','Spiritual','Engineer','Private','yes','adrenal insufficiency','2025-01-11 00:00:00','2025-01-11 00:00:00'),(96901051,'Poline','Nyaga',88,'Female','African','1930-12-01','7345689312','pnyaga@yahoo.com','4930 Sunscape circle ','Indianapolis','IN','46208','2020-02-18 00:00:00','Anglican','Farmer','Medicaid','No','Colon cancer','2025-01-11 00:00:00','2025-01-11 00:00:00');
/*!40000 ALTER TABLE `patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_health_statistics`
--

DROP TABLE IF EXISTS `public_health_statistics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `public_health_statistics` (
  `stat_Id` int NOT NULL,
  `identification_of_patient` int DEFAULT NULL,
  `disease_name` varchar(100) DEFAULT NULL,
  `region` varchar(45) DEFAULT NULL,
  `year` datetime DEFAULT NULL,
  `prevalence_rate` decimal(3,2) DEFAULT NULL,
  `data_source` varchar(100) DEFAULT NULL,
  `created_at` varchar(45) DEFAULT NULL,
  `updated_at` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`stat_Id`),
  KEY `identifcation_of_patient_idx` (`identification_of_patient`),
  CONSTRAINT `identifcation_of_patient` FOREIGN KEY (`identification_of_patient`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_health_statistics`
--

LOCK TABLES `public_health_statistics` WRITE;
/*!40000 ALTER TABLE `public_health_statistics` DISABLE KEYS */;
/*!40000 ALTER TABLE `public_health_statistics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `research_links`
--

DROP TABLE IF EXISTS `research_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `research_links` (
  `link_id` int NOT NULL,
  `diagnosis_id` int DEFAULT NULL,
  `trial_id` int DEFAULT NULL,
  `trial_status` varchar(45) DEFAULT NULL,
  `published_results` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`link_id`),
  KEY `diagnosis_id_idx` (`diagnosis_id`),
  CONSTRAINT `diagnosis_id` FOREIGN KEY (`diagnosis_id`) REFERENCES `diagnoses` (`diagnosis_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `research_links`
--

LOCK TABLES `research_links` WRITE;
/*!40000 ALTER TABLE `research_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `research_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sales_department`
--

DROP TABLE IF EXISTS `sales_department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sales_department` (
  `sales_id` int NOT NULL,
  `sales_rep_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `employee_name` varchar(100) DEFAULT NULL,
  `product_name` varchar(200) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL,
  `sale_date` date DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `commission` decimal(10,2) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`sales_id`,`price`),
  KEY `sales_rep-id_idx` (`sales_rep_id`),
  KEY `customer_id_idx` (`customer_id`),
  CONSTRAINT `customer_id` FOREIGN KEY (`customer_id`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `sales_rep-id` FOREIGN KEY (`sales_rep_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sales_department`
--

LOCK TABLES `sales_department` WRITE;
/*!40000 ALTER TABLE `sales_department` DISABLE KEYS */;
INSERT INTO `sales_department` VALUES (10011,5008,10102456,'Meca Brewer','Leg compressor',389.90,'2024-11-20',2,100.00,'2025-01-12 01:37:29'),(10012,5012,10569891,'David Horton','Walker and oxygen tank, cannula',1000.00,'2024-11-29',1,250.00,'2025-01-12 01:37:29'),(10013,5013,11220200,'Janet Hamuel','wheelchai, walker',775.00,'2024-12-01',1,155.00,'2025-01-12 01:37:29'),(10014,5014,12223456,'Evona Edwin','leg compressor',389.00,'2024-12-03',2,100.00,'2025-01-12 01:37:29'),(10015,5015,12232020,'Nicole Miller','Hospital bed lease',5000.00,'2024-12-08',1,1000.00,'2025-01-12 01:37:29'),(10016,5016,12232021,'Lakisha Alexander','Nebulizer and walker',1000.00,'2024-12-03',1,205.00,'2025-01-12 01:37:29'),(10017,5017,12232022,'Darrick Colon','nebulizer , wheel chair and walker',505.00,'2024-12-01',1,200.00,'2025-01-12 01:37:29'),(10018,5018,12305678,'Kevin Maina','Home health, PT, OT',10000.00,'2024-12-05',1,2000.00,'2025-01-12 01:37:29'),(10019,5019,86565159,'Dick Derrick','Home health, PT, OT',12000.00,'2024-12-04',1,2500.00,'2025-01-12 01:37:29'),(10020,5020,86565160,'Guadalupe Lopez',' Home health care. wound vac',13000.00,'2024-12-06',1,2000.00,'2025-01-12 01:37:29');
/*!40000 ALTER TABLE `sales_department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services_claims`
--

DROP TABLE IF EXISTS `services_claims`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `services_claims` (
  `service_id` int NOT NULL,
  `patient_identification_number` int DEFAULT NULL,
  `service_name` varchar(90) DEFAULT NULL,
  `service_category` varchar(90) DEFAULT NULL,
  `cost` decimal(7,2) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`service_id`),
  KEY `patient_identifcation_number_idx` (`patient_identification_number`),
  CONSTRAINT `patient_identifcation_number` FOREIGN KEY (`patient_identification_number`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services_claims`
--

LOCK TABLES `services_claims` WRITE;
/*!40000 ALTER TABLE `services_claims` DISABLE KEYS */;
INSERT INTO `services_claims` VALUES (9001,12232020,'Blood test','Diagnostic',2567.00,'2025-01-19 00:00:00','2025-01-19 00:00:00'),(9002,12232021,'MRI Scan','Diagnostic',2000.00,'2025-01-19 00:00:00','2025-01-19 00:00:00');
/*!40000 ALTER TABLE `services_claims` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `socioeconomic_factors`
--

DROP TABLE IF EXISTS `socioeconomic_factors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `socioeconomic_factors` (
  `factor_id` int NOT NULL,
  `patient_identific` int DEFAULT NULL,
  `insurance_identification` int DEFAULT NULL,
  `housing_status` enum('own','lease','homeless') DEFAULT NULL,
  `employment_status` enum('w2fulltime','w2partime','1099','unemployed','retired') DEFAULT NULL,
  `access_to_healthcare` enum('poor','fair','moderate','excellent') DEFAULT NULL,
  `health_insurance_type` enum('private','medicaid','medicare','tricare','uninsured') DEFAULT NULL,
  `diet_quality` enum('poor','fair','moderate','excellent') DEFAULT NULL,
  `government_programs` enum('yes','no') DEFAULT NULL,
  PRIMARY KEY (`factor_id`),
  KEY `patient-identific_idx` (`patient_identific`),
  KEY `insurance_identification_idx` (`insurance_identification`),
  CONSTRAINT `insurance_identification` FOREIGN KEY (`insurance_identification`) REFERENCES `insurance_information` (`insurance_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient-identific` FOREIGN KEY (`patient_identific`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `socioeconomic_factors`
--

LOCK TABLES `socioeconomic_factors` WRITE;
/*!40000 ALTER TABLE `socioeconomic_factors` DISABLE KEYS */;
INSERT INTO `socioeconomic_factors` VALUES (1,12232020,7005,'own','retired','moderate','uninsured','moderate','no'),(2,10569891,7002,'lease','w2fulltime','excellent','private','excellent','no');
/*!40000 ALTER TABLE `socioeconomic_factors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL,
  `first_name` varchar(45) DEFAULT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `role` longtext,
  `specialization` longtext,
  `cell phone` varchar(45) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zipcode` varchar(45) DEFAULT NULL,
  `hire_date` date DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`staff_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (5001,'Gladys','Njoki','MSN','Nursing','3179670657','10208 Brushfield Lane ','Fishers ','IN ','46037','1998-08-01','2025-01-12 01:53:03'),(5002,'Hamuel ','Murage','MD','Cardiology','3177456789','4922 Nakuru Dr','Carmel ','IN','46077','2001-01-12','2025-01-12 01:53:03'),(5003,'Ephraim ','Wolcott','MD','Endocrinology','3179875432','4301 N Meridian st','Carmel In','IN','46077','2004-06-18','2025-01-12 01:53:03'),(5004,'Sarah','Peterson','MD','Infectiious Disease','546989034','7800 Maple Groove','Indianapolis','IN','46237','2012-12-20','2025-01-12 01:53:03'),(5005,'Michael ','Moore','Engineer','Maintenance','3177486995','2354 Sunscape circle','Indianapolis','IN','46237','2004-05-11','2025-01-12 01:53:03'),(5006,'Latoya','Murphy','MSW','Social work','3178564321','3400 Castleton way','Indianapolis','IN','46035','2009-08-18','2025-01-12 01:53:03'),(5007,'Sanddep','Singh','MCS','Data Engineer','504 8764344','1045 116th ','Fishers','IN','46037','2020-12-23','2025-01-12 01:53:03'),(5008,'Meca','Brewer','BA','VP  Sales','317 865 4617','1145 Compton ct','Fishers','IN','46037','2016-03-16','2025-01-12 01:53:03'),(5009,'Jose','Ciortez','RPH','Pharmacist','954 6773819','1608 N Meridian st','Indianapolis','IN','46208','1215-01-27','2025-01-12 01:53:03'),(5010,'Lori','Bridges','Custodian','Housekeeping','317 964 5312','3602 N Meridian st','Indianapolis','IN','46208','2013-01-13','2025-01-12 01:53:03'),(5011,'Meghan','Brooks','RDE','Dietitian','317 5554871','5003 terace','Fishers','IN','46037','2014-12-02','2025-01-12 01:53:03'),(5012,'David','Horton','BS','Director sales','5034234758','1062 State Rd 67','Camby','IN','46113','2006-06-06','2025-01-12 01:53:03'),(5013,'Janet','Hamuel','CS','Senior sales','317 748 6995','4905 Fields Balvd','Indianapolis','IN','46239','2017-06-18','2025-01-12 01:53:03'),(5014,'Evona','Edwin','BA','Senior Sales','317748 6997','4060 drive in','Brownsburg','IN','46112','2015-03-13','2025-01-12 01:53:03'),(5015,'Nicole','Miller','BA','Professional Sales','3175064355','126 116th','Carmel','IN','46113','2019-03-01','2025-01-12 01:53:03'),(5016,'Lakisha','Alexander','BA','Profesional sales','317 845 9876','3408 N meridian st','Indianapolis','IN','46208','2020-05-01','2025-01-12 01:53:03'),(5017,'Darrick','Colon','BS','Medical sales','317 785 6431','567 Pennysylavania','Indianapolis','IN','46208','2021-01-12','2025-01-12 01:53:03'),(5018,'Kevin','Maina','BA','Medical sales','317 906 6453','546 Sierra Terrace Apt C','Indianapolis','IN','46208','2021-06-13','2025-01-12 01:53:03'),(5019,'Dick ','Derrick','BS','Medical Sales','317-754-8997','145 Ronald Reagan','Avon ','IN ','46123','2021-12-08','2025-01-12 01:53:03'),(5020,'Guadalupe','Lopez','BS','Medical sales','317545 6347','689 Saratoga Highway','Plainfield','IN','46113','2022-01-06','2025-01-12 01:53:03');
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visits`
--

DROP TABLE IF EXISTS `visits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visits` (
  `visit_id` int NOT NULL,
  `patient_identification_number` int DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `staff_id` int DEFAULT NULL,
  `visit_date` date DEFAULT NULL,
  `reason_for_visit` varchar(100) DEFAULT NULL,
  `duration` varchar(45) DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`visit_id`),
  KEY `staff-id_idx` (`staff_id`),
  KEY `pateint-ID_idx` (`patient_identification_number`),
  KEY `facility_id_idx` (`facility_id`),
  CONSTRAINT `facility_id` FOREIGN KEY (`facility_id`) REFERENCES `healthcare_facilities` (`facility_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `patient_identification_number` FOREIGN KEY (`patient_identification_number`) REFERENCES `patients` (`patient_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `staff-id` FOREIGN KEY (`staff_id`) REFERENCES `staff` (`staff_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visits`
--

LOCK TABLES `visits` WRITE;
/*!40000 ALTER TABLE `visits` DISABLE KEYS */;
INSERT INTO `visits` VALUES (4001,10102456,102,5001,'2020-06-20','Cough, fever','0','2025-01-11 20:27:31'),(4002,10569891,103,5002,'2020-07-04','sore throat','14','2025-01-11 20:27:31'),(4003,11220200,110,5003,'2020-08-03','diarrhea, joint pains','17','2025-01-11 20:27:31'),(4004,12223456,104,5004,'2024-12-08','cough and flu','28','2025-01-11 20:27:31'),(4005,12232020,100,5005,'2024-11-24','Flu and fever','13','2025-01-11 20:27:31'),(4006,12232021,105,5006,'2024-11-24','flu','15','2025-01-11 20:27:31'),(4007,12232022,101,5007,'2024-11-24','chest congestion','16','2025-01-11 20:27:31'),(4008,12305678,106,5008,'2024-11-24','cold and loss of taste','18','2025-01-11 20:27:31'),(4009,86565159,107,5009,'2020-12-25','high blood pressure sna dcold','20','2025-01-11 20:27:31'),(4010,86565160,108,5010,'2020-02-18','cough and cold','22','2025-01-11 20:27:31'),(4011,96901051,109,5011,'2020-02-18','cough with emesis','16','2025-01-11 20:27:31');
/*!40000 ALTER TABLE `visits` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-01-25 16:23:39
