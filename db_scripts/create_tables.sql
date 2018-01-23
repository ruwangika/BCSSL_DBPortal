-- Table for member details
DROP TABLE IF EXISTS
  members_tab;

CREATE TABLE `members_tab` (
 `ID` int(5) NOT NULL AUTO_INCREMENT,
 `member_name` varchar(60) DEFAULT NULL,
 `DoB` date DEFAULT NULL,
 `gender` enum('M','F') DEFAULT NULL,
 `address` varchar(64) DEFAULT NULL,
 `NIC` varchar(10) DEFAULT NULL,
 `contactNo` varchar(16) DEFAULT NULL,
 `contactNo_extra` varchar(16) DEFAULT NULL,
 `email` varchar(41) DEFAULT NULL,
 `membership_no` varchar(41) DEFAULT NULL,
 `category` enum('general_1y','general_5y','school','foreign') DEFAULT NULL,
 `dateOfReg` date DEFAULT NULL,
 `receiptNo` int(11) DEFAULT NULL,
 `date_renewed` date DEFAULT NULL,
 `receiptNo_renewed` int(11) DEFAULT NULL,
 `member_status` enum('active','expired_noticed','expired_warned','suspended') NOT NULL DEFAULT 'active',
 UNIQUE KEY `ID` (`ID`),
 UNIQUE KEY `NIC` (`NIC`)
);

-- Table to queue emails
-- DROP TABLE IF EXISTS
--   email_queue_tab1;

-- CREATE TABLE email_queue_tab1(
--   ID INT NOT NULL,
--   msg_id ENUM (
--     'welcome',
--     'expiry',
--     'expiry_warning',
--     'renewal',
--     'suspended'
--   ),
--   msg_from VARCHAR(128) NOT NULL DEFAULT 'butterflycssl@gmail.com',
--   msg_to VARCHAR(128) NOT NULL,
--   msg_cc VARCHAR(128) DEFAULT NULL,
--   msg_bcc VARCHAR(128) DEFAULT NULL,
--   msg_subject VARCHAR(256) DEFAULT 'BCSSL',
--   msg_body LONGTEXT DEFAULT NULL,
--   date_added DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
--   date_updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
--   msg_status ENUM (
--     'queued',
--     'sent',
--     'failed'
--   ),
--   email_sent bit(1) DEFAULT b'0',
--   send_tried int(11) DEFAULT '0',
--   send_result text,
--   PRIMARY KEY (ID),
--   UNIQUE KEY ID_UNIQUE (ID)
-- );

-- Table to queue emails - new
DROP TABLE IF EXISTS
  email_queue_tab;

CREATE TABLE email_queue_tab(
  ID INT(5) NOT NULL AUTO_INCREMENT,
  msg_id ENUM (
    'welcome',
    'expiry',
    'expiry_warning',
    'renewal',
    'suspended'
  ),
  to_address VARCHAR(256),
  date_added DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  date_updated TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  msg_status ENUM (
    'queued',
    'sent',
    'failed'
  ) DEFAULT 'queued',
  PRIMARY KEY (ID)
);

-- Table for email texts
DROP TABLE IF EXISTS
  email_text_tab;

CREATE TABLE email_text_tab(
  ID INT NOT NULL,
  email_code VARCHAR(100),
  email_subject VARCHAR(100),
  email_text LONGTEXT,
  PRIMARY KEY (ID)
);



INSERT INTO email_text_tab(ID, email_code, email_subject, email_text)
VALUES 
  (1, 'welcome', 'Welcome to BCSSL!', 'Welcome to Butterfly Conservation Society of Sri Lanka!'),
  (2, 'expiry', 'BCSSL Membership Expiry Notice', 'Your BCSSL membership has expired.'),
  (3, 'expiry_warning', 'Renew Your BCSSL Membership', 'Renew your BCSSL membership today.'),
  (4, 'suspended', 'BCSSL Membership Suspended', 'BCSSL membership suspended.'),
  (5, 'renewed', 'Membership Renewed', 'BCSSL membership renewed successfully.')
;

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
-- DROP VIEW IF EXISTS
--   admin_details;

-- CREATE VIEW admin_details AS
-- SELECT
--   ID,
--   member_name,
--   email
-- FROM
--   members_tab
-- WHERE 
--   is_admin > 0;  