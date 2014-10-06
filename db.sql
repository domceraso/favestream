-- Author - Dominic Ceraso @ Steel City Developers, llc - 10/3/2014
--
--

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`socialAccounts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`socialAccounts` ;

CREATE TABLE IF NOT EXISTS `mydb`.`socialAccounts` (
 `userID` INT NOT NULL,
 `facebookProfile` VARCHAR(45) NULL,
 `twitterProfile` VARCHAR(45) NULL,
 `linkedinProfile` VARCHAR(45) NULL,
 `googleProfile` VARCHAR(45) NULL,
 `youtubeProfile` VARCHAR(45) NULL,
 `pinterestProfile` VARCHAR(45) NULL,
 `instagramProfile` VARCHAR(45) NULL,
 PRIMARY KEY (`userID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`membershipType`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`membershipType` ;

CREATE TABLE IF NOT EXISTS `mydb`.`membershipType` (
 `idmembershipType` INT NOT NULL,
 `consumerAccount` VARCHAR(45) NULL,
 `PublisherPrimary` VARCHAR(45) NULL,
 `PublisherSub` VARCHAR(45) NULL,
 `administrative` VARCHAR(45) NULL,
 PRIMARY KEY (`idmembershipType`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`relationshipLink`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`relationshipLink` ;

CREATE TABLE IF NOT EXISTS `mydb`.`relationshipLink` (
 `idrelationshipLink` INT NOT NULL,
 `userIDconsumer` VARCHAR(45) NULL,
 `userIDPublisher` VARCHAR(45) NULL,
 PRIMARY KEY (`idrelationshipLink`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`userProfileConsumer`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`userProfileConsumer` ;

CREATE TABLE IF NOT EXISTS `mydb`.`userProfileConsumer` (
 `userIDConsumer` INT NOT NULL,
 `userName` VARCHAR(45) NULL,
 `sessionID` INT NULL,
 `profileID` INT NULL,
 `password` VARCHAR(45) NULL,
 `email` VARCHAR(45) NULL,
 `cellPhone` INT NULL,
 `city` VARCHAR(45) NULL,
 `state` VARCHAR(45) NULL,
 `zipCode` INT NULL,
 `socialAccounts` VARCHAR(45) NOT NULL,
 `profileDetails` VARCHAR(45) NULL,
 `photoID` VARCHAR(45) NULL,
 `socialAccounts_userID` INT NOT NULL,
 `membershipType_idmembershipType` INT NOT NULL,
 `relationshipLink_idrelationshipLink` INT NOT NULL,
 PRIMARY KEY (`userIDConsumer`, `socialAccounts`),
 CONSTRAINT `fk_userProfileConsumer_socialAccounts`
   FOREIGN KEY (`socialAccounts_userID`)
   REFERENCES `mydb`.`socialAccounts` (`userID`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 CONSTRAINT `fk_userProfileConsumer_membershipType1`
   FOREIGN KEY (`membershipType_idmembershipType`)
   REFERENCES `mydb`.`membershipType` (`idmembershipType`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 CONSTRAINT `fk_userProfileConsumer_relationshipLink1`
   FOREIGN KEY (`relationshipLink_idrelationshipLink`)
   REFERENCES `mydb`.`relationshipLink` (`idrelationshipLink`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_userProfileConsumer_socialAccounts_idx` ON `mydb`.`userProfileConsumer` (`socialAccounts_userID` ASC);

CREATE INDEX `fk_userProfileConsumer_membershipType1_idx` ON `mydb`.`userProfileConsumer` (`membershipType_idmembershipType` ASC);

CREATE INDEX `fk_userProfileConsumer_relationshipLink1_idx` ON `mydb`.`userProfileConsumer` (`relationshipLink_idrelationshipLink` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`userProfilePublisher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`userProfilePublisher` ;

CREATE TABLE IF NOT EXISTS `mydb`.`userProfilePublisher` (
 `userIDPublisher` INT NOT NULL,
 `userName` VARCHAR(45) NULL,
 `sessionID` INT NULL,
 `profileID` INT NULL,
 `password` VARCHAR(45) NULL,
 `businessName` VARCHAR(45) NULL,
 `primaryEmail` VARCHAR(45) NULL,
 `phone` INT NULL,
 `phone2` INT NULL,
 `city` VARCHAR(45) NULL,
 `state` VARCHAR(45) NULL,
 `zipCode` INT NULL,
 `socialAccounts` VARCHAR(45) NOT NULL,
 `subAccounts` VARCHAR(45) NOT NULL,
 `profileDetails` VARCHAR(45) NULL,
 `photoID` VARCHAR(45) NULL,
 `socialAccounts_userID` INT NOT NULL,
 `membershipType_idmembershipType` INT NOT NULL,
 `relationshipLink_idrelationshipLink` INT NOT NULL,
 PRIMARY KEY (`userIDPublisher`, `subAccounts`),
 CONSTRAINT `fk_userProfilePublisher_socialAccounts1`
   FOREIGN KEY (`socialAccounts_userID`)
   REFERENCES `mydb`.`socialAccounts` (`userID`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 CONSTRAINT `fk_userProfilePublisher_membershipType1`
   FOREIGN KEY (`membershipType_idmembershipType`)
   REFERENCES `mydb`.`membershipType` (`idmembershipType`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 CONSTRAINT `fk_userProfilePublisher_relationshipLink1`
   FOREIGN KEY (`relationshipLink_idrelationshipLink`)
   REFERENCES `mydb`.`relationshipLink` (`idrelationshipLink`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_userProfilePublisher_socialAccounts1_idx` ON `mydb`.`userProfilePublisher` (`socialAccounts_userID` ASC);

CREATE INDEX `fk_userProfilePublisher_membershipType1_idx` ON `mydb`.`userProfilePublisher` (`membershipType_idmembershipType` ASC);

CREATE INDEX `fk_userProfilePublisher_relationshipLink1_idx` ON `mydb`.`userProfilePublisher` (`relationshipLink_idrelationshipLink` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`socialAccountApi`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`socialAccountApi` ;

CREATE TABLE IF NOT EXISTS `mydb`.`socialAccountApi` (
 `userID` INT NOT NULL,
 `sessionID` INT NULL,
 `facebookAPI` VARCHAR(45) NULL,
 `twitterAPI` VARCHAR(45) NULL,
 `linkedinAPI` VARCHAR(45) NULL,
 `googleAPI` VARCHAR(45) NULL,
 `youtubeAPI` VARCHAR(45) NULL,
 `pinterestAPI` VARCHAR(45) NULL,
 `instagramAPI` VARCHAR(45) NULL,
 PRIMARY KEY (`userID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`socialAccounts_has_socialAccountApi`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`socialAccounts_has_socialAccountApi` ;

CREATE TABLE IF NOT EXISTS `mydb`.`socialAccounts_has_socialAccountApi` (
 `socialAccounts_userID` INT NOT NULL,
 `socialAccountApi_userID` INT NOT NULL,
 PRIMARY KEY (`socialAccounts_userID`, `socialAccountApi_userID`),
 CONSTRAINT `fk_socialAccounts_has_socialAccountApi_socialAccounts1`
   FOREIGN KEY (`socialAccounts_userID`)
   REFERENCES `mydb`.`socialAccounts` (`userID`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION,
 CONSTRAINT `fk_socialAccounts_has_socialAccountApi_socialAccountApi1`
   FOREIGN KEY (`socialAccountApi_userID`)
   REFERENCES `mydb`.`socialAccountApi` (`userID`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE INDEX `fk_socialAccounts_has_socialAccountApi_socialAccountApi1_idx` ON `mydb`.`socialAccounts_has_socialAccountApi` (`socialAccountApi_userID` ASC);

CREATE INDEX `fk_socialAccounts_has_socialAccountApi_socialAccounts1_idx` ON `mydb`.`socialAccounts_has_socialAccountApi` (`socialAccounts_userID` ASC);


-- -----------------------------------------------------
-- Table `mydb`.`reportsPublisher`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`reportsPublisher` ;

CREATE TABLE IF NOT EXISTS `mydb`.`reportsPublisher` (
 `userIDPublisher` INT NOT NULL,
 `postCount` INT NULL,
 `postViews` INT NULL,
 `postLikes` INT NULL,
 `postShares` INT NULL,
 `newLinks` INT NULL,
 `scheduledPost` DATETIME NULL,
 `cancelledPost` DATETIME NULL,
 PRIMARY KEY (`userIDPublisher`),
 CONSTRAINT `reporting`
   FOREIGN KEY (`userIDPublisher`)
   REFERENCES `mydb`.`socialAccountApi` (`userID`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`postTemplate`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`postTemplate` ;

CREATE TABLE IF NOT EXISTS `mydb`.`postTemplate` (
 `userIDPublisher` INT NOT NULL,
 `template1` VARCHAR(45) NULL,
 `template2` VARCHAR(45) NULL,
 `template3` VARCHAR(45) NULL,
 `template4` VARCHAR(45) NULL,
 `template5` VARCHAR(45) NULL,
 `scheduledPost` DATETIME NULL,
 PRIMARY KEY (`userIDPublisher`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`favoritePublishers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`favoritePublishers` ;

CREATE TABLE IF NOT EXISTS `mydb`.`favoritePublishers` (
 `userIDConsumer` INT NOT NULL,
 `userIDPublisher` VARCHAR(45) NULL,
 PRIMARY KEY (`userIDConsumer`),
 CONSTRAINT `link`
   FOREIGN KEY (`userIDConsumer`)
   REFERENCES `mydb`.`userProfilePublisher` (`userIDPublisher`)
   ON DELETE NO ACTION
   ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;