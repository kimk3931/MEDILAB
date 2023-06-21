CREATE TABLE `admin` (
	`admin_id` INT NOT NULL AUTO_INCREMENT,
	`email` varchar NOT NULL,
	`username` varchar NOT NULL,
	`status` BOOLEAN NOT NULL DEFAULT 'True',
	`phone` varchar NOT NULL,
	`password` varchar NOT NULL,
	PRIMARY KEY (`admin_id`)
);

CREATE TABLE `locations` (
	`locations_id` INT NOT NULL AUTO_INCREMENT,
	`location` varchar NOT NULL,
	PRIMARY KEY (`locations_id`)
);

CREATE TABLE `members` (
	`member_id` INT NOT NULL AUTO_INCREMENT,
	`surname` TEXT NOT NULL,
	`other_name` TEXT NOT NULL,
	`gender` TEXT NOT NULL,
	`email` varchar NOT NULL,
	`phone` varchar NOT NULL,
	`dob` DATE NOT NULL,
	`status` BOOLEAN NOT NULL DEFAULT true,
	`password` varchar NOT NULL,
	`location_id` INT NOT NULL,
	`reg_date` TIMESTAMP NOT NULL,
	PRIMARY KEY (`member_id`)
);

CREATE TABLE `dependants` (
	`dependant_id` INT NOT NULL AUTO_INCREMENT,
	`member_id` INT NOT NULL,
	`surname` TEXT NOT NULL,
	`other_name` TEXT NOT NULL,
	`dob` DATE NOT NULL,
	`reg_date` TIMESTAMP NOT NULL,
	PRIMARY KEY (`dependant_id`)
);

CREATE TABLE `laboratories` (
	`lab_id` INT NOT NULL AUTO_INCREMENT,
	`lab_name` TEXT NOT NULL,
	`permit_id` varchar,
	`email` varchar NOT NULL,
	`phone` varchar NOT NULL,
	`password` varchar NOT NULL,
	`reg_date` DATE NOT NULL,
	PRIMARY KEY (`lab_id`)
);

CREATE TABLE `lab_tests` (
	`test_id` INT NOT NULL AUTO_INCREMENT,
	`lab_id` INT NOT NULL,
	`test_name` TEXT NOT NULL,
	`test_description` TEXT NOT NULL,
	`test_cost` INT NOT NULL,
	`test_discount` INT NOT NULL,
	`reg_date` TIMESTAMP NOT NULL,
	PRIMARY KEY (`test_id`)
);

CREATE TABLE `bookings` (
	`book_id` INT NOT NULL AUTO_INCREMENT,
	`member_id` INT NOT NULL,
	`booked_for` varchar NOT NULL,
	`dependant_id` INT,
	`test_id` INT NOT NULL,
	`appointment_date` DATE NOT NULL,
	`appointment_time` TIME NOT NULL,
	`where_taken` TEXT NOT NULL,
	`latitude` varchar NOT NULL,
	`longitude` varchar NOT NULL,
	`status` TEXT NOT NULL DEFAULT 'Pending',
	`lab_id` INT NOT NULL,
	`invoice_no` varchar NOT NULL,
	PRIMARY KEY (`book_id`)
);

ALTER TABLE `members` ADD CONSTRAINT `members_fk0` FOREIGN KEY (`location_id`) REFERENCES `locations`(`locations_id`);

ALTER TABLE `dependants` ADD CONSTRAINT `dependants_fk0` FOREIGN KEY (`member_id`) REFERENCES `members`(`member_id`);

ALTER TABLE `lab_tests` ADD CONSTRAINT `lab_tests_fk0` FOREIGN KEY (`lab_id`) REFERENCES `laboratories`(`lab_id`);

ALTER TABLE `bookings` ADD CONSTRAINT `bookings_fk0` FOREIGN KEY (`member_id`) REFERENCES `members`(`member_id`);

ALTER TABLE `bookings` ADD CONSTRAINT `bookings_fk1` FOREIGN KEY (`dependant_id`) REFERENCES `dependants`(`dependant_id`);

ALTER TABLE `bookings` ADD CONSTRAINT `bookings_fk2` FOREIGN KEY (`test_id`) REFERENCES `lab_tests`(`test_id`);

ALTER TABLE `bookings` ADD CONSTRAINT `bookings_fk3` FOREIGN KEY (`lab_id`) REFERENCES `laboratories`(`lab_id`);








