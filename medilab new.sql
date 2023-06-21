CREATE TABLE `admin` (
	`admin_id` INT(50) NOT NULL AUTO_INCREMENT,
	`email` varchar(50) NOT NULL,
	`username` varchar(50) NOT NULL,
	`status` TEXT(50) NOT NULL DEFAULT 'True',
	`phone` varchar(50) NOT NULL,
	`password` varchar(200) NOT NULL,
	PRIMARY KEY (`admin_id`)
);

CREATE TABLE `locations` (
	`locations_id` INT(50) NOT NULL AUTO_INCREMENT,
	`location` varchar(50) NOT NULL,
	PRIMARY KEY (`locations_id`)
);

CREATE TABLE `members` (
	`member_id` INT(50) NOT NULL AUTO_INCREMENT,
	`surname` TEXT(50) NOT NULL,
	`other_name` TEXT(50) NOT NULL,
	`gender` TEXT(50) NOT NULL,
	`email` varchar(50) NOT NULL,
	`phone` varchar(50) NOT NULL,
	`dob` DATE NOT NULL,
	`status` TEXT(50) NOT NULL DEFAULT true,
	`password` varchar(200) NOT NULL,
	`location_id` INT(50) NOT NULL,
	`reg_date` TIMESTAMP NOT NULL,
	PRIMARY KEY (`member_id`)
);

CREATE TABLE `dependants` (
	`dependant_id` INT(50) NOT NULL AUTO_INCREMENT,
	`member_id` INT(50) NOT NULL,
	`surname` TEXT(50) NOT NULL,
	`other_name` TEXT(50) NOT NULL,
	`dob` DATE NOT NULL,
	`reg_date` TIMESTAMP NOT NULL,
	PRIMARY KEY (`dependant_id`)
);

CREATE TABLE `laboratories` (
	`lab_id` INT(50) NOT NULL AUTO_INCREMENT,
	`lab_name` TEXT(50) NOT NULL,
	`permit_id` varchar(50),
	`email` varchar(50) NOT NULL,
	`phone` varchar(50) NOT NULL,
	`password` varchar(200) NOT NULL,
	`reg_date` DATE NOT NULL,
	PRIMARY KEY (`lab_id`)
);

CREATE TABLE `lab_tests` (
	`test_id` INT(50) NOT NULL AUTO_INCREMENT,
	`lab_id` INT(50) NOT NULL,
	`test_name` TEXT(50) NOT NULL,
	`test_description` TEXT(200) NOT NULL,
	`test_cost` INT(50) NOT NULL,
	`test_discount` INT(50) NOT NULL,
	`reg_date` TIMESTAMP NOT NULL,
	PRIMARY KEY (`test_id`)
);

CREATE TABLE `bookings` (
	`book_id` INT(50) NOT NULL AUTO_INCREMENT,
	`member_id` INT(50) NOT NULL,
	`booked_for` varchar(50) NOT NULL,
	`dependant_id` INT(50),
	`test_id` INT(50) NOT NULL,
	`appointment_date` DATE NOT NULL,
	`appointment_time` TIME NOT NULL,
	`where_taken` TEXT(50) NOT NULL,
	`latitude` varchar(50) NOT NULL,
	`longitude` varchar(50) NOT NULL,
	`status` TEXT(50) NOT NULL DEFAULT 'Pending',
	`lab_id` INT(50) NOT NULL,
	`invoice_no` varchar(50) NOT NULL,
	PRIMARY KEY (`book_id`)
);

CREATE TABLE `nurses` (
	`nurse_id` INT(50) NOT NULL AUTO_INCREMENT,
	`username` TEXT(50) NOT NULL,
	`email` varchar(50) NOT NULL,
	`phone` varchar(50) NOT NULL,
	`password` varchar(50) NOT NULL,
	`reg_date` TIMESTAMP NOT NULL,
	`lab_id` INT(50) NOT NULL,
	PRIMARY KEY (`nurse_id`)
);

CREATE TABLE `nurse_lab_allocation` (
	`allocation_id` INT(50) NOT NULL AUTO_INCREMENT,
	`nurse_id` INT(50) NOT NULL,
	`invoice_no` varchar(50) NOT NULL,
	`reg_date` TIMESTAMP NOT NULL,
	PRIMARY KEY (`allocation_id`)
);

ALTER TABLE `members` ADD CONSTRAINT `members_fk0` FOREIGN KEY (`location_id`) REFERENCES `locations`(`locations_id`);

ALTER TABLE `dependants` ADD CONSTRAINT `dependants_fk0` FOREIGN KEY (`member_id`) REFERENCES `members`(`member_id`);

ALTER TABLE `lab_tests` ADD CONSTRAINT `lab_tests_fk0` FOREIGN KEY (`lab_id`) REFERENCES `laboratories`(`lab_id`);

ALTER TABLE `bookings` ADD CONSTRAINT `bookings_fk0` FOREIGN KEY (`member_id`) REFERENCES `members`(`member_id`);

ALTER TABLE `bookings` ADD CONSTRAINT `bookings_fk1` FOREIGN KEY (`dependant_id`) REFERENCES `dependants`(`dependant_id`);

ALTER TABLE `bookings` ADD CONSTRAINT `bookings_fk2` FOREIGN KEY (`test_id`) REFERENCES `lab_tests`(`test_id`);

ALTER TABLE `bookings` ADD CONSTRAINT `bookings_fk3` FOREIGN KEY (`lab_id`) REFERENCES `laboratories`(`lab_id`);

ALTER TABLE `nurses` ADD CONSTRAINT `nurses_fk0` FOREIGN KEY (`lab_id`) REFERENCES `laboratories`(`lab_id`);

ALTER TABLE `nurse_lab_allocation` ADD CONSTRAINT `nurse_lab_allocation_fk0` FOREIGN KEY (`nurse_id`) REFERENCES `nurses`(`nurse_id`);

ALTER TABLE `nurse_lab_allocation` ADD CONSTRAINT `nurse_lab_allocation_fk1` FOREIGN KEY (`invoice_no`) REFERENCES `bookings`(`invoice_no`);










