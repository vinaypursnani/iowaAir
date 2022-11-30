USE `sql9581877` ;

-- FOREIGN KEY CONSTRAINTS ARE YET TO BE APPLIED
-- -----------------------------------------------------
-- Table `sql9581877`.`user`
--   FOREIGN KEY (`addressID`) REFERENCES `sql9581877`.`address`(`addressID`),
--  FOREIGN KEY (`transactionID`) REFERENCES `sql9581877`.`transactions`(`transactionsID`),
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql9581877`.`user` (
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
  PRIMARY KEY (`userID`));

-- -----------------------------------------------------
-- Table `sql9581877`.`transactions`
-- FOREIGN KEY (`userID`) REFERENCES `sql9581877`.`user`(`userID`),
-- FOREIGN KEY (`flightID`) REFERENCES `sql9581877`.`flight_schedule`(`flightID`),
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql9581877`.`transactions` (
  `transactionID` INT NOT NULL AUTO_INCREMENT,
  `flightID` INT NULL,
  `userID` INT NULL,
  `seat` INT NULL,
  `date` DATETIME NULL,
  PRIMARY KEY (`transactionID`));

-- -----------------------------------------------------
-- Table `sql9581877`.`flight_schedule`
-- FOREIGN KEY (`aircraftID`) REFERENCES `sql9581877`.`aircraft_detail`(`aircraftID`),
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql9581877`.`flight_schedule` (
  `flightID` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NULL,
  `departure time` DATETIME NULL,
  `arrival time` DATETIME NULL,
  `date` VARCHAR(45) NULL,
  `departure_location` VARCHAR(45) NULL,
  `arrival_location` VARCHAR(45) NULL,
  `aircraftID` VARCHAR(45) NULL,
  PRIMARY KEY (`flightID`));


-- -----------------------------------------------------
-- Table `sql9581877`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql9581877`.`address` (
  `addressID` INT NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(45) NULL,
  `state` VARCHAR(45) NULL,
  `zip` INT NULL,
  `address_type` VARCHAR(45) NULL,
  `address_line_one` VARCHAR(45) NULL,
  `address_line_two` VARCHAR(45) NULL,
  PRIMARY KEY (`addressID`));


-- -----------------------------------------------------
-- Table `sql9581877`.`aircraft_detail`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `sql9581877`.`aircraft_detail` (
  `aircraftID` INT NOT NULL,
  `plane_type` VARCHAR(45) NULL,
  PRIMARY KEY (`aircraftID`));