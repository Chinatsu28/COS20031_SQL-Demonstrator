-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema employment_platform
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema employment_platform
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `employment_platform` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `employment_platform` ;

-- -----------------------------------------------------
-- Table `employment_platform`.`company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employment_platform`.`company` (
  `company_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `location` VARCHAR(50) NULL DEFAULT NULL,
  `email` VARCHAR(50) NULL DEFAULT NULL,
  `size` VARCHAR(50) NULL DEFAULT NULL,
  `review` DECIMAL(2,1) NULL DEFAULT NULL,
  `industry` VARCHAR(10) NULL DEFAULT NULL,
  `website` VARCHAR(1000) NULL DEFAULT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `phone` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`company_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employment_platform`.`course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employment_platform`.`course` (
  `course_id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `type` ENUM('F&B', 'Beauty & Spa', 'Tourism & Hospitality') NULL DEFAULT NULL,
  `introduction` TEXT NULL DEFAULT NULL,
  `length` VARCHAR(50) NULL DEFAULT NULL,
  `outline` VARCHAR(50) NULL DEFAULT NULL,
  `provider_id` INT NULL DEFAULT NULL,
  `benefit` TEXT NULL DEFAULT NULL,
  `price` INT NULL DEFAULT NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE INDEX `name` (`name` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employment_platform`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employment_platform`.`users` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(255) NOT NULL,
  `first_name` VARCHAR(255) NOT NULL,
  `last_name` VARCHAR(255) NOT NULL,
  `dob` DATE NULL DEFAULT NULL,
  `gender` ENUM('male', 'female', 'other') NOT NULL,
  `user_name` VARCHAR(255) NOT NULL,
  `password` VARCHAR(255) NOT NULL,
  `phone_number` VARCHAR(20) NOT NULL,
  `living_location` VARCHAR(255) NOT NULL,
  `role` ENUM('employer', 'administrator', 'jobseeker') NOT NULL,
  `education` VARCHAR(255) NULL DEFAULT NULL,
  `resume_cv` VARCHAR(255) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `email` (`email` ASC) VISIBLE,
  UNIQUE INDEX `phone_number` (`phone_number` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 70
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employment_platform`.`credit_cards`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employment_platform`.`credit_cards` (
  `card_id` INT NOT NULL AUTO_INCREMENT,
  `provider` VARCHAR(255) NOT NULL,
  `user_id` INT NOT NULL,
  `card_number` VARCHAR(16) NOT NULL,
  `expiration_date` DATETIME NOT NULL,
  PRIMARY KEY (`card_id`),
  INDEX `credit_card_cs1` (`user_id` ASC) VISIBLE,
  CONSTRAINT `credit_card_cs1`
    FOREIGN KEY (`user_id`)
    REFERENCES `employment_platform`.`users` (`user_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1001
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employment_platform`.`experience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employment_platform`.`experience` (
  `experience_id` INT NOT NULL AUTO_INCREMENT,
  `company_name` VARCHAR(255) NOT NULL,
  `position` VARCHAR(255) NOT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `location` VARCHAR(255) NULL DEFAULT NULL,
  `exp_description` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`experience_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employment_platform`.`skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employment_platform`.`skill` (
  `skill_id` INT NOT NULL AUTO_INCREMENT,
  `tag` ENUM('Culinary Skills', 'Restaurant Management', 'Cosmetology', 'Customer Service', 'Event Planning') NULL DEFAULT NULL,
  PRIMARY KEY (`skill_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 6
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employment_platform`.`experience_skill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employment_platform`.`experience_skill` (
  `experience_id` INT NULL DEFAULT NULL,
  `skill_id` INT NULL DEFAULT NULL,
  INDEX `experience_skill_fk1_idx` (`experience_id` ASC) VISIBLE,
  INDEX `experience_skill_fk2_idx` (`skill_id` ASC) VISIBLE,
  CONSTRAINT `experience_skill_fk1`
    FOREIGN KEY (`experience_id`)
    REFERENCES `employment_platform`.`experience` (`experience_id`),
  CONSTRAINT `experience_skill_fk2`
    FOREIGN KEY (`skill_id`)
    REFERENCES `employment_platform`.`skill` (`skill_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employment_platform`.`job`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employment_platform`.`job` (
  `job_id` INT NOT NULL AUTO_INCREMENT,
  `employer_id` INT NOT NULL,
  `deadline` DATE NOT NULL,
  `type` ENUM('Full-time', 'Part-time', 'Hybrid') NOT NULL,
  `salary` VARCHAR(50) NULL DEFAULT NULL,
  `location` VARCHAR(50) NULL DEFAULT NULL,
  `scope` LONGTEXT NULL DEFAULT NULL,
  `exp_req` LONGTEXT NULL DEFAULT NULL,
  `benefit` TEXT NULL DEFAULT NULL,
  `company_id` INT NULL DEFAULT NULL,
  `status` ENUM('Open', 'Closed') NOT NULL,
  `applicant` VARCHAR(10) NULL DEFAULT NULL,
  `title` VARCHAR(50) NULL DEFAULT NULL,
  `description` LONGTEXT NULL DEFAULT NULL,
  PRIMARY KEY (`job_id`),
  INDEX `employer_id` (`employer_id` ASC) VISIBLE)
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employment_platform`.`project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employment_platform`.`project` (
  `project_id` INT NOT NULL AUTO_INCREMENT,
  `project_name` VARCHAR(50) NULL DEFAULT NULL,
  `start_date` DATE NULL DEFAULT NULL,
  `end_date` DATE NULL DEFAULT NULL,
  `credential` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`project_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 51
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employment_platform`.`user_company`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employment_platform`.`user_company` (
  `user_id` INT NULL DEFAULT NULL,
  `company_id` INT NULL DEFAULT NULL,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  INDEX `company_id_idx` (`company_id` ASC) VISIBLE,
  CONSTRAINT `company_user_pk1`
    FOREIGN KEY (`company_id`)
    REFERENCES `employment_platform`.`company` (`company_id`),
  CONSTRAINT `company_user_pk2`
    FOREIGN KEY (`user_id`)
    REFERENCES `employment_platform`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employment_platform`.`user_course`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employment_platform`.`user_course` (
  `course_id` INT NULL DEFAULT NULL,
  `user_id` INT NULL DEFAULT NULL,
  INDEX `course_id_idx` (`course_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_course_fk1`
    FOREIGN KEY (`course_id`)
    REFERENCES `employment_platform`.`course` (`course_id`),
  CONSTRAINT `user_course_fk2`
    FOREIGN KEY (`user_id`)
    REFERENCES `employment_platform`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employment_platform`.`user_experience`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employment_platform`.`user_experience` (
  `user_id` INT NULL DEFAULT NULL,
  `experience_id` INT NULL DEFAULT NULL,
  INDEX `user_experience_fk1_idx` (`user_id` ASC) VISIBLE,
  INDEX `user_experience_fk2_idx` (`experience_id` ASC) VISIBLE,
  CONSTRAINT `user_experience_fk1`
    FOREIGN KEY (`user_id`)
    REFERENCES `employment_platform`.`users` (`user_id`),
  CONSTRAINT `user_experience_fk2`
    FOREIGN KEY (`experience_id`)
    REFERENCES `employment_platform`.`experience` (`experience_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employment_platform`.`user_headline`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employment_platform`.`user_headline` (
  `user_id` INT NULL DEFAULT NULL,
  `name` VARCHAR(50) NULL DEFAULT NULL,
  `job_title` VARCHAR(50) NULL DEFAULT NULL,
  `exp_level` ENUM('Entry', 'Junior', 'Senior', 'Manager') NULL DEFAULT NULL,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_headline_cs1`
    FOREIGN KEY (`user_id`)
    REFERENCES `employment_platform`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employment_platform`.`user_job`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employment_platform`.`user_job` (
  `job_id` INT NOT NULL,
  `user_id` INT NOT NULL,
  `status` ENUM('saved', 'applying', 'reviewing', 'failed', 'succeeded', 'interviewing') NOT NULL,
  `schedule` DATE NULL DEFAULT NULL,
  `meeting_link` VARCHAR(250) NULL DEFAULT NULL,
  INDEX `job_id_idx` (`job_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_job_fk1`
    FOREIGN KEY (`job_id`)
    REFERENCES `employment_platform`.`job` (`job_id`),
  CONSTRAINT `user_job_fk2`
    FOREIGN KEY (`user_id`)
    REFERENCES `employment_platform`.`users` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `employment_platform`.`user_project`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `employment_platform`.`user_project` (
  `project_id` INT NULL DEFAULT NULL,
  `user_id` INT NULL DEFAULT NULL,
  INDEX `project_id_idx` (`project_id` ASC) VISIBLE,
  INDEX `user_id_idx` (`user_id` ASC) VISIBLE,
  CONSTRAINT `user_project_fk1`
    FOREIGN KEY (`user_id`)
    REFERENCES `employment_platform`.`users` (`user_id`),
  CONSTRAINT `user_project_fk2`
    FOREIGN KEY (`project_id`)
    REFERENCES `employment_platform`.`project` (`project_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
