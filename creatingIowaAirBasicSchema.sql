CREATE SCHEMA IF NOT EXISTS `cs4400` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `cs4400` ;

-- -----------------------------------------------------
-- Table `cs4400`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs4400`.`user` (
  `userID` INT NOT NULL AUTO_INCREMENT,
  `first_name` VARCHAR(45) NOT NULL,
  `middle_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `suffix` VARCHAR(45) NULL,
  `DOB` DATETIME NULL,
  `gender` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `password` VARCHAR(256) NULL,
  `passport_number` VARCHAR(45) NULL,
  `drivers_license_number` VARCHAR(45) NULL,
  `addressID` VARCHAR(45) NULL,
  `transactionID` VARCHAR(45) NULL,
  CONSTRAINT `chk_gender` CHECK (`gender` IN ('Male', 'Female', 'Other')),
  CONSTRAINT `chk_suffix` CHECK (`gender` IN ('Mr', 'Mrs', 'Jr', 'Sr')),
  FOREIGN KEY (`addressID`) REFERENCES `cs4400`.`address`(`addressID`),
  FOREIGN KEY (`transactionID`) REFERENCES `cs4400`.`transactions`(`transactionsID`),
  PRIMARY KEY (`userID`));

-- -----------------------------------------------------
-- Table `cs4400`.`transactions`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs4400`.`transactions` (
  `transactionID` INT NOT NULL AUTO_INCREMENT,
  `flightID` INT NULL,
  `userID` INT NULL,
  `seat` INT NULL,
  `date` DATETIME NULL,
  FOREIGN KEY (`flightID`) REFERENCES `cs4400`.`flight_schedule`(`flightID`),
  FOREIGN KEY (`userID`) REFERENCES `cs4400`.`user`(`userID`),
  PRIMARY KEY (`transactionID`));

-- -----------------------------------------------------
-- Table `cs4400`.`flight_schedule`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs4400`.`flight_schedule` (
  `flightID` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NULL,
  `departure time` DATETIME NULL,
  `arrival time` DATETIME NULL,
  `date` VARCHAR(45) NULL,
  `departure_location` VARCHAR(45) NULL,
  `arrival_location` VARCHAR(45) NULL,
  `aircraftID` VARCHAR(45) NULL,
  FOREIGN KEY (`aircraftID`) REFERENCES `cs4400`.`aircraft_detail`(`aircraftID`),
  PRIMARY KEY (`flightID`));


-- -----------------------------------------------------
-- Table `cs4400`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs4400`.`address` (
  `addressID` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip` INT NULL,
  `address_type` VARCHAR(45) NULL,
  `address_line_one` VARCHAR(45) NULL,
  `address_line_two` VARCHAR(45) NULL,
  PRIMARY KEY (`addressID`));


-- -----------------------------------------------------
-- Table `cs4400`.`aircraft_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cs4400`.`aircraft_detail` (
  `aircraftID` INT NOT NULL,
  `plane_type` VARCHAR(45) NULL,
  PRIMARY KEY (`aircraftID`));
