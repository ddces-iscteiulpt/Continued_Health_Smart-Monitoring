DROP TABLE IF EXISTS `body_states`;
DROP TABLE IF EXISTS `sleep_data`;
DROP TABLE IF EXISTS `daily_activity`;
DROP TABLE IF EXISTS `sensors_data`;
DROP TABLE IF EXISTS `device_sensor`;
DROP TABLE IF EXISTS `measure_type`;
DROP TABLE IF EXISTS `patient`;


CREATE TABLE `patient` ( 
   `patient_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
   `gender` VARCHAR(10),
   `birthday` DATE,
   `timestamp` DATETIME NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (
   `patient_id`
    )
);

CREATE TABLE `body_states` ( 
   `body_states_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
   `patient_id` BIGINT(20) NOT NULL,
   `height` DOUBLE COMMENT 'm',
   `weight` DOUBLE COMMENT 'kg',
   `bmi` DOUBLE,
   `body_fat` DOUBLE COMMENT '%',
   `visceral_fat` INT,
   `muscle` DOUBLE COMMENT 'kg',
   `bone_mass` DOUBLE COMMENT 'kg',
   `body_water` DOUBLE COMMENT '%',
   `metabolism` INT COMMENT 'kcal/day',
   `impedance` INT,
   `timestamp` DATETIME NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (
   `body_states_id`
    )
);

CREATE TABLE `sleep_data` ( 
   `sleep_data_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
   `patient_id` BIGINT(20) NOT NULL,
   `data_day` DATE,
   `end_sleep` TIME,
   `start_sleep` TIME,
   `deep_sleepTime` INT COMMENT 'min',
   `shallow_sleepTime` INT COMMENT 'min',
   `wake_Time` INT COMMENT 'min',
   `timestamp` DATETIME NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (
   `sleep_data_id`
    )
);

CREATE TABLE `daily_activity` ( 
   `daily_activity_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
   `patient_id` BIGINT(20) NOT NULL,
   `calories` INT COMMENT 'kcal',
   `distance` INT COMMENT 'm',
   `steps_count` ()=>"INT",
   `date` DATE,
   `timestamp` DATETIME NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (
   `daily_activity_id`
    )
);

CREATE TABLE `sensors_data` ( 
   `sensors_data_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
   `patient_id` BIGINT(20) NOT NULL,
   `device_sensor_id` BIGINT(20) NOT NULL,
   `measure_type_id` BIGINT(20) NOT NULL,
   `value` DOUBLE,
   `date` DATE,
   `time` TIME,
   `timestamp` DATETIME NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (
   `sensors_data_id`
    )
);

CREATE TABLE `measure_type` ( 
   `measure_type_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(255) NOT NULL,
   `type` VARCHAR(255),
   `unity` VARCHAR(255),
   `code` VARCHAR(4) NOT NULL,
   `timestamp` DATETIME NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (
   `measure_type_id`
    )
);

CREATE TABLE `device_sensor` ( 
   `device_sensor_id` BIGINT(20) NOT NULL AUTO_INCREMENT,
   `name` VARCHAR(255) NOT NULL,
   `status` VARCHAR(255),
   `type` VARCHAR(255),
   `address` VARCHAR(64),
   `api` VARCHAR(64),
   `timestamp` DATETIME NOT NULL DEFAULT current_timestamp(),
    PRIMARY KEY (
   `device_sensor_id`
    )
);

CREATE TABLE `pacient_device_relat` ( 
   `patient_id` BIGINT(20) NOT NULL,
   `device_sensor_id` BIGINT(20) NOT NULL,
   `timestamp` DATETIME NOT NULL DEFAULT current_timestamp()
);

ALTER TABLE `body_states` 
  ADD CONSTRAINT `patient-body_states`
  FOREIGN KEY ( 
   `patient_id`
)   REFERENCES `patient`( 
   `patient_id`
) ;


ALTER TABLE `sleep_data` 
  ADD CONSTRAINT `patient-sleep_data`
  FOREIGN KEY ( 
   `patient_id`
)   REFERENCES `patient`( 
   `patient_id`
) ;


ALTER TABLE `daily_activity` 
  ADD CONSTRAINT `patient-activity_data`
  FOREIGN KEY ( 
   `patient_id`
)   REFERENCES `patient`( 
   `patient_id`
) ;


ALTER TABLE `sensors_data` 
  ADD CONSTRAINT `patient-table1`
  FOREIGN KEY ( 
   `patient_id`
)   REFERENCES `patient`( 
   `patient_id`
) ;


ALTER TABLE `sensors_data` 
  ADD CONSTRAINT `measure_type-table1`
  FOREIGN KEY ( 
   `measure_type_id`
)   REFERENCES `measure_type`( 
   `measure_type_id`
) ;


ALTER TABLE `sensors_data` 
  ADD CONSTRAINT `device_sensor-sensors_data`
  FOREIGN KEY ( 
   `device_sensor_id`
)   REFERENCES `device_sensor`( 
   `device_sensor_id`
) ;


ALTER TABLE `pacient_device_relat` 
  ADD CONSTRAINT `patient-pacient_device_relat`
  FOREIGN KEY ( 
   `patient_id`
)   REFERENCES `patient`( 
   `patient_id`
) ;


ALTER TABLE `pacient_device_relat` 
  ADD CONSTRAINT `device_sensor-pacient_device_relat`
  FOREIGN KEY ( 
   `device_sensor_id`
)   REFERENCES `device_sensor`( 
   `device_sensor_id`
) ;

