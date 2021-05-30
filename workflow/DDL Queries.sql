CREATE TABLE `hotelmanagementsystemv2`.`customer_credentials` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `passsword` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);

CREATE TABLE `hotelmanagementsystemv2`.`room` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` TINYINT NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `hotelmanagementsystemv2`.`hotels` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `hotelmanagementsystemv2`.`services` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `hotelmanagementsystemv2`.`food` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `type` TINYINT NULL,
  `rate` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `hotelmanagementsystemv2`.`bills` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `total amount` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `hotelmanagementsystemv2`.`roomtype` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ac` TINYINT NOT NULL,
  `capacity` INT NOT NULL,
  `rate` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `hotelmanagementsystemv2`.`booking` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `checkindate` DATETIME NOT NULL,
  `checkoutdate` DATETIME NOT NULL,
  `noofguests` INT NOT NULL,
  `ratefactor` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `roomid`
    FOREIGN KEY (`id`)
    REFERENCES `hotelmanagementsystemv2`.`room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cusid`
    FOREIGN KEY (`id`)
    REFERENCES `hotelmanagementsystemv2`.`customer_credentials` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
ALTER TABLE `hotelmanagementsystemv2`.`booking` 
DROP FOREIGN KEY `roomid`,
DROP FOREIGN KEY `cusid`;
ALTER TABLE `hotelmanagementsystemv2`.`booking` 
ADD COLUMN `roomid` INT NOT NULL AFTER `ratefactor`,
ADD COLUMN `cusid` INT NOT NULL AFTER `roomid`;
ALTER TABLE `hotelmanagementsystemv2`.`booking` 
ADD INDEX `fk_roomid_idx` (`roomid` ASC) VISIBLE,
ADD INDEX `fk_cusid_idx` (`cusid` ASC) VISIBLE;
;
ALTER TABLE `hotelmanagementsystemv2`.`booking` 
ADD CONSTRAINT `fk_roomid`
  FOREIGN KEY (`roomid`)
  REFERENCES `hotelmanagementsystemv2`.`room` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_cusid`
  FOREIGN KEY (`cusid`)
  REFERENCES `hotelmanagementsystemv2`.`customer_credentials` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
CREATE TABLE `hotelmanagementsystemv2`.`hotelservices` (
  `idhotel` INT NOT NULL,
  `idservice` INT NOT NULL,
  `rate` DECIMAL(2) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `capacity` INT NOT NULL,
  `status` TINYINT NOT NULL,
  PRIMARY KEY (`idhotel`, `idservice`));
ALTER TABLE `hotelmanagementsystemv2`.`hotelservices` 
ADD INDEX `fk_idservice_idx` (`idservice` ASC) VISIBLE;
;
ALTER TABLE `hotelmanagementsystemv2`.`hotelservices` 
ADD CONSTRAINT `fk_idhotel`
  FOREIGN KEY (`idhotel`)
  REFERENCES `hotelmanagementsystemv2`.`hotels` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_idservice`
  FOREIGN KEY (`idservice`)
  REFERENCES `hotelmanagementsystemv2`.`services` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `hotelmanagementsystemv2`.`hotelfood` (
  `hotelid` INT NOT NULL,
  `foodid` INT NOT NULL,
  `status` TINYINT NOT NULL,
  `description` VARCHAR(100) NULL,
  PRIMARY KEY (`hotelid`, `foodid`));
ALTER TABLE `hotelmanagementsystemv2`.`hotelfood` 
ADD INDEX `fk_foodid_idx` (`foodid` ASC) VISIBLE;
;
ALTER TABLE `hotelmanagementsystemv2`.`hotelfood` 
ADD CONSTRAINT `fk_foodhotelid`
  FOREIGN KEY (`hotelid`)
  REFERENCES `hotelmanagementsystemv2`.`hotels` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_foodid`
  FOREIGN KEY (`foodid`)
  REFERENCES `hotelmanagementsystemv2`.`food` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
CREATE TABLE `hotelmanagementsystemv2`.`customerservices` (
  `cusid` INT NOT NULL,
  `serviceid` INT NOT NULL,
  `usedate` DATETIME NOT NULL,
  PRIMARY KEY (`cusid`, `serviceid`, `usedate`));
ALTER TABLE `hotelmanagementsystemv2`.`customerservices` 
ADD INDEX `fk_customerserviceid_idx` (`serviceid` ASC) VISIBLE;
;
ALTER TABLE `hotelmanagementsystemv2`.`customerservices` 
ADD CONSTRAINT `fk_servicecusid`
  FOREIGN KEY (`cusid`)
  REFERENCES `hotelmanagementsystemv2`.`customer_credentials` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_customerserviceid`
  FOREIGN KEY (`serviceid`)
  REFERENCES `hotelmanagementsystemv2`.`services` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
CREATE TABLE `hotelmanagementsystemv2`.`customerfood` (
  `cusid` INT NOT NULL,
  `foodid` INT NOT NULL,
  `orderdate` DATETIME NOT NULL,
  `quantity` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`cusid`, `foodid`, `orderdate`));
ALTER TABLE `hotelmanagementsystemv2`.`customerfood` 
ADD INDEX `fk_customerfoodid_idx` (`foodid` ASC) VISIBLE;
;
ALTER TABLE `hotelmanagementsystemv2`.`customerfood` 
ADD CONSTRAINT `fk_foodcusid`
  FOREIGN KEY (`cusid`)
  REFERENCES `hotelmanagementsystemv2`.`customer_credentials` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_customerfoodid`
  FOREIGN KEY (`foodid`)
  REFERENCES `hotelmanagementsystemv2`.`food` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
CREATE TABLE `hotelmanagementsystemv2`.`customerbill` (
  `cusid` INT NOT NULL,
  `billid` INT NOT NULL,
  PRIMARY KEY (`cusid`, `billid`));
ALTER TABLE `hotelmanagementsystemv2`.`customerbill` 
ADD INDEX `fk_customerbillid_idx` (`billid` ASC) VISIBLE;
;
ALTER TABLE `hotelmanagementsystemv2`.`customerbill` 
ADD CONSTRAINT `fk_billcusid`
  FOREIGN KEY (`cusid`)
  REFERENCES `hotelmanagementsystemv2`.`customer_credentials` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_customerbillid`
  FOREIGN KEY (`billid`)
  REFERENCES `hotelmanagementsystemv2`.`bills` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
CREATE TABLE `hotelmanagementsystemv2`.`guests` (
  `name` VARCHAR(30) NOT NULL,
  `bookingid` INT NOT NULL,
  PRIMARY KEY (`name`, `bookingid`),
  INDEX `fk_bookingid_idx` (`bookingid` ASC) VISIBLE,
  CONSTRAINT `fk_bookingid`
    FOREIGN KEY (`bookingid`)
    REFERENCES `hotelmanagementsystemv2`.`booking` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `hotelmanagementsystemv2`.`room` 
ADD COLUMN `roomno` INT NOT NULL AFTER `status`,
ADD COLUMN `hotelid` INT NOT NULL AFTER `roomno`,
ADD COLUMN `roomtypeid` INT NOT NULL AFTER `hotelid`,
ADD INDEX `fk_hotelid_idx` (`hotelid` ASC) VISIBLE,
ADD INDEX `fk_roomtypeid_idx` (`roomtypeid` ASC) VISIBLE;
;
ALTER TABLE `hotelmanagementsystemv2`.`room` 
ADD CONSTRAINT `fk_roomtypeid`
  FOREIGN KEY (`roomtypeid`)
  REFERENCES `hotelmanagementsystemv2`.`roomtype` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_hotelid`
  FOREIGN KEY (`hotelid`)
  REFERENCES `hotelmanagementsystemv2`.`hotels` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
