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
  is_admin TINYINT(1),
  PRIMARY KEY(ID)
);

-- Table to queue emails
DROP TABLE IF EXISTS
  email_queue_tab;

CREATE TABLE email_queue_tab(
  ID INT NOT NULL,
  msg_id ENUM (
    'welcome',
    'expiry',
    'expiry_warning',
    'renewal',
    'suspended'
  ),
  msg_from VARCHAR(128) NOT NULL DEFAULT 'butterflycssl@gmail.com',
  msg_to VARCHAR(128) NOT NULL,
  msg_cc VARCHAR(128) DEFAULT NULL,
  msg_bcc VARCHAR(128) DEFAULT NULL,
  msg_subject VARCHAR(256) DEFAULT 'BCSSL',
  msg_body LONGTEXT DEFAULT NULL,
  date_added DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  date_updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  msg_status ENUM (
    'queued',
    'sent',
    'failed'
  ),
  email_sent bit(1) DEFAULT b'0',
  send_tried int(11) DEFAULT '0',
  send_result text,
  PRIMARY KEY (ID),
  UNIQUE KEY ID_UNIQUE (ID)
);

-- Table for email texts
DROP TABLE IF EXISTS
  email_text_tab;

CREATE TABLE email_text_tab(
  ID INT NOT NULL,
  email_subject ENUM (
    'Welcome to BCSSL!',
    'BCSSL Membership Expiry Notice',
    'Renew Your BCSSL Membership',
    'BCSSL Membership Suspended'
  ),
  email_text LONGTEXT,
  PRIMARY KEY (ID)
);

INSERT INTO email_text_tab(ID, email_subject, email_text)
VALUES (1, 'Welcome to BCSSL!', 'Welcome to Butterfly Conservation Society of Sri Lanka!');

-- Table for admin details
-- DROP TABLE IF EXISTS
--   admin_tab;

-- CREATE TABLE admin_tab(
--   ID INT NOT NULL,
--   admin_ID INT NOT NULL,
--   admin_name VARCHAR(60),
--   email VARCHAR(150),
--   PRIMARY KEY(ID),
--   CONSTRAINT fk_admin_id FOREIGN KEY(admin_ID) REFERENCES members_tab(ID) ON DELETE CASCADE ON UPDATE CASCADE,
--   CONSTRAINT fk_admin_name FOREIGN KEY(admin_name) REFERENCES members_tab(member_name) ON DELETE CASCADE ON UPDATE CASCADE,
--   CONSTRAINT fk_email FOREIGN KEY(email) REFERENCES members_tab(email) ON DELETE CASCADE ON UPDATE CASCADE
-- );


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

-- View for admin details
DROP VIEW IF EXISTS
  admin_details;

CREATE VIEW admin_details AS
SELECT
  ID,
  member_name,
  email
FROM
  members_tab
WHERE 
  is_admin > 0;  