-- Creating DB Constant Table
CREATE TABLE dbconstant (
    id BIGINT AUTO_INCREMENT NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    name VARCHAR(255) NOT NULL,
    value VARCHAR(255) NULL,
    CONSTRAINT pk_dbconstant PRIMARY KEY (id)
);

-- Adding Unique Constraint for DB Constant Name
ALTER TABLE dbconstant
    ADD CONSTRAINT uc_dbconstant_name UNIQUE (name);
