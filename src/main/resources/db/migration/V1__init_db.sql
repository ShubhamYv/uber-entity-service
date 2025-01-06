-- Creating Booking Table
CREATE TABLE booking (
    id BIGINT AUTO_INCREMENT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    booking_status ENUM('SCHEDULED', 'CANCELLED', 'CAB_ARRIVED', 'ASSIGNING_DRIVER', 'IN_RIDE', 'COMPLETED') NULL,
    start_time DATETIME NULL,
    end_time DATETIME NULL,
    total_distance BIGINT NULL,
    driver_id BIGINT NULL,
    passenger_id BIGINT NULL,
    CONSTRAINT pk_booking PRIMARY KEY (id)
);

-- Creating Driver Table
CREATE TABLE driver (
    id BIGINT AUTO_INCREMENT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    name VARCHAR(255) NULL,
    license_number VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NULL,
    aadhar_card VARCHAR(255) NULL,
    CONSTRAINT pk_driver PRIMARY KEY (id)
);

-- Creating Passenger Table
CREATE TABLE passenger (
    id BIGINT AUTO_INCREMENT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    CONSTRAINT pk_passenger PRIMARY KEY (id)
);

-- Adding Unique Constraint for Driver License Number
ALTER TABLE driver
    ADD CONSTRAINT uc_driver_license_number UNIQUE (license_number);

-- Adding Foreign Key Constraints for Booking Table
ALTER TABLE booking
    ADD CONSTRAINT FK_BOOKING_ON_DRIVER FOREIGN KEY (driver_id) REFERENCES driver (id),
    ADD CONSTRAINT FK_BOOKING_ON_PASSENGER FOREIGN KEY (passenger_id) REFERENCES passenger (id);
