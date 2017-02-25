-- Table for member details
DROP TABLE IF EXISTS
  members_tab;

CREATE TABLE members_tab(
  ID INT NOT NULL,
  member_name VARCHAR(60) NOT NULL,
  NIC VARCHAR(20),
  email VARCHAR(150),
  DoB DATE,
  address VARCHAR(60),
  contactNo VARCHAR(20),
  category ENUM(
    'school',
    'local_1y',
    'local_5y',
    'foreign'
  ),
  receiptNo INT UNIQUE,
  dateOfReg DATE,
  member_status ENUM('1', '0', '-1'),
  PRIMARY KEY(ID)
);

--Table for admin details
DROP TABLE IF EXISTS
  admin_tab;

CREATE TABLE admin_tab(
  ID INT NOT NULL,
  admin_ID INT NOT NULL,
  admin_name VARCHAR(60),
  email VARCHAR(150),
  PRIMARY KEY(ID),
  CONSTRAINT fk_admin_id FOREIGN KEY(admin_ID) REFERENCES members_tab(ID) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_admin_name FOREIGN KEY(admin_name) REFERENCES members_tab(member_name) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT fk_email FOREIGN KEY(email) REFERENCES members_tab(email) ON DELETE CASCADE ON UPDATE CASCADE
);

-- View for basic member details
DROP VIEW IF EXISTS
  member_details;

CREATE VIEW member_details AS
SELECT
  ID,
  member_name,
  email,
  member_status
FROM
  members_tab;