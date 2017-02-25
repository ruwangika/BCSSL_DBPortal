DROP VIEW IF EXISTS member_details;
DROP TABLE IF EXISTS members_tab;
DROP TABLE IF EXISTS admin_tab;

CREATE TABLE members_tab (
    ID INT NOT NULL,
    name VARCHAR(60) NOT NULL,
    NIC VARCHAR(20),
    email VARCHAR(150),
    DoB DATE,
    address VARCHAR(60),
    contactNo VARCHAR(20),
    category ENUM('school', 'local_1y', 'local_5y', 'foreign'),
    receiptNo INT UNIQUE,
    dateOfReg DATE,
    status ENUM('1', '0', '-1'),
    PRIMARY KEY (ID)
);

CREATE TABLE admin_tab (
    ID INT NOT NULL,
    member_ID INT NOT NULL,
    name VARCHAR(60),
    email VARCHAR(150),
    PRIMARY KEY (ID),
    FOREIGN KEY member_ID REFERENCES members_tab(ID) ON DELETE CASCADE,
    FOREIGN KEY name REFERENCES members_tab(name) ON DELETE CASCADE,
    FOREIGN KEY email REFERENCES members_tab(email) ON DELETE CASCADE
);

CREATE VIEW member_details AS
SELECT ID, name, email, status
FROM members_tab
;