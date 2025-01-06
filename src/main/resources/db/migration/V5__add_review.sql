-- Creating Booking Review Table
CREATE TABLE booking_review (
    id BIGINT AUTO_INCREMENT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    content VARCHAR(255) NOT NULL,
    rating DOUBLE NULL,
    booking_id BIGINT NOT NULL,
    CONSTRAINT pk_booking_review PRIMARY KEY (id)
);

-- Creating Passenger Review Table
CREATE TABLE passenger_review (
    id BIGINT NOT NULL,
    passenger_review_content VARCHAR(255) NOT NULL,
    passenger_rating VARCHAR(255) NOT NULL,
    CONSTRAINT pk_passengerreview PRIMARY KEY (id)
);

-- Adding Columns and Constraints for Driver Table
ALTER TABLE driver
    ADD active_city VARCHAR(255) NULL,
    ADD driver_approval_status ENUM('APPROVED', 'DENIED', 'PENDING') NULL,
    ADD home_id BIGINT NULL,
    ADD last_known_location_id BIGINT NULL,
    ADD rating DOUBLE NULL;

ALTER TABLE driver
    MODIFY rating DOUBLE NOT NULL;

-- Adding Constraints for Booking Review Table
ALTER TABLE booking_review
    ADD CONSTRAINT uc_booking_review_booking UNIQUE (booking_id),
    ADD CONSTRAINT FK_BOOKING_REVIEW_ON_BOOKING FOREIGN KEY (booking_id) REFERENCES booking (id);

-- Adding Foreign Key Constraints for Driver Table
ALTER TABLE driver
    ADD CONSTRAINT FK_DRIVER_ON_HOME FOREIGN KEY (home_id) REFERENCES exact_location (id),
    ADD CONSTRAINT FK_DRIVER_ON_LAST_KNOWN_LOCATION FOREIGN KEY (last_known_location_id) REFERENCES exact_location (id);

-- Adding Foreign Key for Passenger Review Table
ALTER TABLE passenger_review
    ADD CONSTRAINT FK_PASSENGERREVIEW_ON_ID FOREIGN KEY (id) REFERENCES booking_review (id);

-- Adding Rating Check Constraint for Driver
ALTER TABLE driver
    ADD CONSTRAINT check_rating CHECK (driver.rating >= 0 AND driver.rating <= 5);
