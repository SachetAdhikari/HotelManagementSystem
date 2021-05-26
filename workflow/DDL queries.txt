CREATE TABLE `hotelmanagementsystem`.`customer_credentials` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `passsword` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  `age` INT NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE);

CREATE TABLE `hotelmanagementsystem`.`room` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `status` TINYINT NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `hotelmanagementsystem`.`hotels` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `hotelmanagementsystem`.`services` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `hotelmanagementsystem`.`food` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `type` TINYINT NULL,
  `rate` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `hotelmanagementsystem`.`bills` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` DATETIME NOT NULL,
  `total amount` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `hotelmanagementsystem`.`roomtype` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `ac` TINYINT NOT NULL,
  `capacity` INT NOT NULL,
  `rate` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`id`));

CREATE TABLE `hotelmanagementsystem`.`booking` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `checkindate` DATETIME NOT NULL,
  `checkoutdate` DATETIME NOT NULL,
  `noofguests` INT NOT NULL,
  `ratefactor` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`id`),
  CONSTRAINT `roomid`
    FOREIGN KEY (`id`)
    REFERENCES `hotelmanagementsystem`.`room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cusid`
    FOREIGN KEY (`id`)
    REFERENCES `hotelmanagementsystem`.`customer_credentials` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
ALTER TABLE `hotelmanagementsystem`.`booking` 
DROP FOREIGN KEY `roomid`,
DROP FOREIGN KEY `cusid`;
ALTER TABLE `hotelmanagementsystem`.`booking` 
ADD COLUMN `roomid` INT NOT NULL AFTER `ratefactor`,
ADD COLUMN `cusid` INT NOT NULL AFTER `roomid`;
ALTER TABLE `hotelmanagementsystem`.`booking` 
ADD INDEX `fk_roomid_idx` (`roomid` ASC) VISIBLE,
ADD INDEX `fk_cusid_idx` (`cusid` ASC) VISIBLE;
;
ALTER TABLE `hotelmanagementsystem`.`booking` 
ADD CONSTRAINT `fk_roomid`
  FOREIGN KEY (`roomid`)
  REFERENCES `hotelmanagementsystem`.`room` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_cusid`
  FOREIGN KEY (`cusid`)
  REFERENCES `hotelmanagementsystem`.`customer_credentials` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
CREATE TABLE `hotelmanagementsystem`.`hotelservices` (
  `idhotel` INT NOT NULL,
  `idservice` INT NOT NULL,
  `rate` DECIMAL(2) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `capacity` INT NOT NULL,
  `status` TINYINT NOT NULL,
  PRIMARY KEY (`idhotel`, `idservice`));
ALTER TABLE `hotelmanagementsystem`.`hotelservices` 
ADD INDEX `fk_idservice_idx` (`idservice` ASC) VISIBLE;
;
ALTER TABLE `hotelmanagementsystem`.`hotelservices` 
ADD CONSTRAINT `fk_idhotel`
  FOREIGN KEY (`idhotel`)
  REFERENCES `hotelmanagementsystem`.`hotels` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_idservice`
  FOREIGN KEY (`idservice`)
  REFERENCES `hotelmanagementsystem`.`services` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

CREATE TABLE `hotelmanagementsystem`.`hotelfood` (
  `hotelid` INT NOT NULL,
  `foodid` INT NOT NULL,
  `status` TINYINT NOT NULL,
  `description` VARCHAR(100) NULL,
  PRIMARY KEY (`hotelid`, `foodid`));
ALTER TABLE `hotelmanagementsystem`.`hotelfood` 
ADD INDEX `fk_foodid_idx` (`foodid` ASC) VISIBLE;
;
ALTER TABLE `hotelmanagementsystem`.`hotelfood` 
ADD CONSTRAINT `fk_foodhotelid`
  FOREIGN KEY (`hotelid`)
  REFERENCES `hotelmanagementsystem`.`hotels` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_foodid`
  FOREIGN KEY (`foodid`)
  REFERENCES `hotelmanagementsystem`.`food` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
CREATE TABLE `hotelmanagementsystem`.`customerservices` (
  `cusid` INT NOT NULL,
  `serviceid` INT NOT NULL,
  `usedate` DATETIME NOT NULL,
  PRIMARY KEY (`cusid`, `serviceid`, `usedate`));
ALTER TABLE `hotelmanagementsystem`.`customerservices` 
ADD INDEX `fk_customerserviceid_idx` (`serviceid` ASC) VISIBLE;
;
ALTER TABLE `hotelmanagementsystem`.`customerservices` 
ADD CONSTRAINT `fk_servicecusid`
  FOREIGN KEY (`cusid`)
  REFERENCES `hotelmanagementsystem`.`customer_credentials` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_customerserviceid`
  FOREIGN KEY (`serviceid`)
  REFERENCES `hotelmanagementsystem`.`services` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
CREATE TABLE `hotelmanagementsystem`.`customerfood` (
  `cusid` INT NOT NULL,
  `foodid` INT NOT NULL,
  `orderdate` DATETIME NOT NULL,
  `quantity` DECIMAL(2) NOT NULL,
  PRIMARY KEY (`cusid`, `foodid`, `orderdate`));
ALTER TABLE `hotelmanagementsystem`.`customerfood` 
ADD INDEX `fk_customerfoodid_idx` (`foodid` ASC) VISIBLE;
;
ALTER TABLE `hotelmanagementsystem`.`customerfood` 
ADD CONSTRAINT `fk_foodcusid`
  FOREIGN KEY (`cusid`)
  REFERENCES `hotelmanagementsystem`.`customer_credentials` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_customerfoodid`
  FOREIGN KEY (`foodid`)
  REFERENCES `hotelmanagementsystem`.`food` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
CREATE TABLE `hotelmanagementsystem`.`customerbill` (
  `cusid` INT NOT NULL,
  `billid` INT NOT NULL,
  PRIMARY KEY (`cusid`, `billid`));
ALTER TABLE `hotelmanagementsystem`.`customerbill` 
ADD INDEX `fk_customerbillid_idx` (`billid` ASC) VISIBLE;
;
ALTER TABLE `hotelmanagementsystem`.`customerbill` 
ADD CONSTRAINT `fk_billcusid`
  FOREIGN KEY (`cusid`)
  REFERENCES `hotelmanagementsystem`.`customer_credentials` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_customerbillid`
  FOREIGN KEY (`billid`)
  REFERENCES `hotelmanagementsystem`.`bills` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
CREATE TABLE `hotelmanagementsystem`.`guests` (
  `name` VARCHAR(30) NOT NULL,
  `bookingid` INT NOT NULL,
  PRIMARY KEY (`name`, `bookingid`),
  INDEX `fk_bookingid_idx` (`bookingid` ASC) VISIBLE,
  CONSTRAINT `fk_bookingid`
    FOREIGN KEY (`bookingid`)
    REFERENCES `hotelmanagementsystem`.`booking` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

ALTER TABLE `hotelmanagementsystem`.`room` 
ADD COLUMN `roomno` INT NOT NULL AFTER `status`,
ADD COLUMN `hotelid` INT NOT NULL AFTER `roomno`,
ADD COLUMN `roomtypeid` INT NOT NULL AFTER `hotelid`,
ADD INDEX `fk_hotelid_idx` (`hotelid` ASC) VISIBLE,
ADD INDEX `fk_roomtypeid_idx` (`roomtypeid` ASC) VISIBLE;
;
ALTER TABLE `hotelmanagementsystem`.`room` 
ADD CONSTRAINT `fk_roomtypeid`
  FOREIGN KEY (`roomtypeid`)
  REFERENCES `hotelmanagementsystem`.`roomtype` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_hotelid`
  FOREIGN KEY (`hotelid`)
  REFERENCES `hotelmanagementsystem`.`hotels` (`id`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;
