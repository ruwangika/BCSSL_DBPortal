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
 `member_status` enum('1', '0', '-1') NOT NULL DEFAULT '1',
 UNIQUE KEY `ID` (`ID`),
 UNIQUE KEY `NIC` (`NIC`)
);

-- Table to queue emails
DROP TABLE IF EXISTS
  email_queue_tab;

CREATE TABLE email_queue_tab(
  ID INT(5) NOT NULL AUTO_INCREMENT,
  msg_code ENUM (
    'welcome',
    'expiry_warning',
    'expiry_notice',
    'suspended_notice',
    'renewal'
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
  (2, 'expiry_warning', 'Renew Your BCSSL Membership', 'Your BCSSL membership will expire in a week.'),
  (3, 'expiry_notice', 'BCSSL Membership Expiry Notice', '<div><span>Dear member,</span></div><div><span>&nbsp;</span></div><div><span>We&rsquo;d like to take this opportunity to thank you for being a valuable member of Butterfly Conservation Society of Sri Lanka (BCSSL). This is a kind reminder that your membership of BCSSL has expired.</span></div><div><strong><span>&nbsp;</span></strong></div><div><strong><span>How to renew your BCSSL membership:</span></strong></div><div dir="auto">&nbsp;</div><div>We have now introduced two membership categories:</div><div><ul><li><span>1 year (Membership fee: Rs. 300.00)<br /></span></li><li><span>5 year (Membership fee: Rs. 1200.00)<br /></span></li></ul></div><div>You can apply for either one of the above.</div><div dir="auto">Membership duration is considered as one/five years from the date of renewal.</div><div><span>&nbsp;</span></div><div><span>To renew your membership, either hand over the respective payment to our Treasurer/Vice President at any BCSSL event, or deposit it to the following account and send us a scanned/photographed copy of the approved bank slip.</span></div><div><span>&nbsp;</span></div><div><span>Bank&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp; Sampath Bank - Colombo Super Branch</span></div><div><span>Account holder&nbsp; &nbsp; &nbsp;: Butterfly Conservation Society of Sri Lanka</span></div><div><span>Account no.&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : 117561000469</span></div><div><span>&nbsp;</span></div><div><span>For further details, contact Himesh (0718181225) or Rukmal (0711315024).</span></div><div><span>&nbsp;</span></div><div>Renew your membership and remain a part of our community!<span><br /></span></div><div>&nbsp;</div><div><span>Thank you.</span></div><div><span>&nbsp;</span></div><div><span>Best regards</span></div><p><span class="HOEnZb adL"><span style="color: #888888;">--&nbsp;<br /></span></span></p><div class="m_-4880484799101703949m_5934944051611013559m_-4560651600740278142m_-6008271371926897064gmail_signature"><div dir="ltr"><div><div dir="ltr"><div><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div><div><img class="CToWUd a6T" tabindex="0" src="https://ci6.googleusercontent.com/proxy/OXLRrlfuGlnu8JpQyUDURLFnAewtYFNmhff9bk_z2GDTh7yx_r2W-rpNIpscaM5Ksj0QKugOVw75F2_cB0CKkd0BlBB92byqNb3rL-u7qZR0Fb-huMZVKf03cvD7Y2xG=s0-d-e1-ft#https://docs.google.com/uc?id=0B21RTe3dGIMqcm5tUWw4Vncxdms&amp;export=download" width="420" height="138" /></div></div><div>&nbsp;&nbsp;<span style="font-family: verdana, sans-serif; font-size: xx-small;"><strong><a href="http://www.bcssl.lk/" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://www.bcssl.lk/&amp;source=gmail&amp;ust=1517251504039000&amp;usg=AFQjCNHKgIgSlgjyDD89lt4PyQnH093zSA">http://www.bcssl.lk/</a><br /></strong></span></div><div><span style="font-family: verdana, sans-serif; font-size: xx-small;"><strong>&nbsp;&nbsp;<a href="http://www.slbutterflies.lk/" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://www.slbutterflies.lk/&amp;source=gmail&amp;ust=1517251504039000&amp;usg=AFQjCNHTZp9tHpVmgvkjRj051EKJF6Jc9w">http://www.slbutterflies.lk/</a></strong></span></div></div></div></div></div></div></div></div></div></div></div></div></div></div><p>&nbsp;</p>'),
  (4, 'suspended_notice', 'BCSSL Membership Suspended', 'BCSSL membership suspended.'),
  (5, 'renewed', 'BCSSL Membership Renewed', '<div><span>Dear member,</span></div><div><span>&nbsp;</span></div><div><span>Your membership of BCSSL (Butterfly Conservation Society of Sri Lanka) has been renewed successfully.&nbsp;</span></div><div><span>Thank you for being a valuable part of our community!</span></div><div><span>&nbsp;</span></div><div><span>Best regards</span></div><p><span class="HOEnZb adL"><span style="color: #888888;">--&nbsp;<br /></span></span></p><div class="m_-8334828822989707097gmail_signature"><div dir="ltr"><div><div dir="ltr"><div><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div><div><img class="CToWUd a6T" tabindex="0" src="https://ci6.googleusercontent.com/proxy/OXLRrlfuGlnu8JpQyUDURLFnAewtYFNmhff9bk_z2GDTh7yx_r2W-rpNIpscaM5Ksj0QKugOVw75F2_cB0CKkd0BlBB92byqNb3rL-u7qZR0Fb-huMZVKf03cvD7Y2xG=s0-d-e1-ft#https://docs.google.com/uc?id=0B21RTe3dGIMqcm5tUWw4Vncxdms&amp;export=download" width="420" height="138" /></div></div><div>&nbsp;&nbsp;<span style="font-family: verdana, sans-serif; font-size: xx-small;"><strong><a href="http://www.bcssl.lk/" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://www.bcssl.lk/&amp;source=gmail&amp;ust=1517250555757000&amp;usg=AFQjCNGKB1dlTPWQR3osbgZsWlBK0qsnHQ">http://www.bcssl.lk/</a><br /></strong></span></div><div><span style="font-family: verdana, sans-serif; font-size: xx-small;"><strong>&nbsp;&nbsp;<a href="http://www.slbutterflies.lk/" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://www.slbutterflies.lk/&amp;source=gmail&amp;ust=1517250555757000&amp;usg=AFQjCNFzeOaXOPppmnRlATZ0dzRc7Mpa_g">http://www.slbutterflies.lk/</a></strong></span></div></div></div></div></div></div></div></div></div></div></div></div></div></div><p>&nbsp;</p>')
;

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