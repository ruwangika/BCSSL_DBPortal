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
  (1, 'welcome', 'Welcome to BCSSL', '<div><span style="font-family: calibri, sans-serif;">Dear member,<br class="gmail-m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" /><br /><span style="color: #000000;">Your application to become a member of Butterfly Conservation Society of Sri Lanka (BCSSL) has been received and processed. We are glad to have you as a part of our community.</span></span></div><div><div><span style="color: #000000; font-family: calibri, sans-serif;">As a member you will receive email updates about our lectures, field visits and all other events.</span></div><div><span style="color: #000000; font-family: calibri, sans-serif;">&nbsp;</span></div><div><span style="color: #000000; font-family: calibri, sans-serif;">Visit our website <a href="http://bcssl.lk/">here</a> to lean more about what we do.</span></div><div><div><span style="font-family: calibri, sans-serif;">Keep in touch with us on our social media channels:</span></div><div><ul><li><span style="font-family: calibri, sans-serif;"><a href="https://www.facebook.com/ButterflyConservationSociety/">Facebook</a></span></li><li><span style="font-family: calibri, sans-serif;"><a href="https://twitter.com/butterflycssl">Twitter</a></span></li></ul></div><div><span style="font-family: calibri, sans-serif;">To get our updates delivered free of charge to your mobile via SMS, send FOLLOW ButterflyCSSL to 40404.</span></div></div><br class="gmail-m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" /><span style="font-family: calibri, sans-serif;">Thank you.</span></div><div>&nbsp;</div><div><span style="font-family: calibri, sans-serif;">Best regards</span></div><p>--&nbsp;</p><div class="gmail_signature"><div dir="ltr"><div><div dir="ltr"><div><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div><div><img src="https://ci6.googleusercontent.com/proxy/OXLRrlfuGlnu8JpQyUDURLFnAewtYFNmhff9bk_z2GDTh7yx_r2W-rpNIpscaM5Ksj0QKugOVw75F2_cB0CKkd0BlBB92byqNb3rL-u7qZR0Fb-huMZVKf03cvD7Y2xG=s0-d-e1-ft#https://docs.google.com/uc?id=0B21RTe3dGIMqcm5tUWw4Vncxdms&amp;export=download" width="420" height="138" /></div></div><div>&nbsp;&nbsp;<span style="font-family: verdana, sans-serif; font-size: xx-small;"><strong><a href="http://www.bcssl.lk/" target="_blank">http://www.bcssl.lk/</a><br /></strong></span></div><div><span style="font-family: verdana, sans-serif; font-size: xx-small;"><strong>&nbsp;&nbsp;<a href="http://www.slbutterflies.lk/" target="_blank">http://www.slbutterflies.lk/</a></strong></span></div></div></div></div></div></div></div></div></div></div></div></div></div></div>'),
  (2, 'expiry_warning', 'Renew Your BCSSL Membership', '<div><div><span style="font-family: calibri, sans-serif;">Dear member,</span></div><div><span style="font-family: calibri, sans-serif;">&nbsp;</span></div><div><span style="font-family: calibri, sans-serif;">We&rsquo;d like to take this opportunity to thank you for being a valuable member of Butterfly Conservation Society of Sri Lanka (BCSSL).&nbsp;&nbsp;<strong id="gmail-docs-internal-guid-217a0d9d-7471-fdc4-4a41-790ac9f45340">Please note that your BCSSL membership will expire in one week''s time.</strong></span></div><div><span style="font-family: calibri, sans-serif;"><strong>&nbsp;</strong></span></div><div><span style="font-family: calibri, sans-serif;"><strong>How to renew your BCSSL membership:</strong></span></div><div dir="auto">&nbsp;</div><div><span style="font-family: calibri, sans-serif;">We have now introduced two membership categories:</span></div><div><ul><li><span style="font-family: calibri, sans-serif;">1 year (Membership fee: Rs. 300.00)<br /></span></li><li><span style="font-family: calibri, sans-serif;">5 year (Membership fee: Rs. 1200.00)<br /></span></li></ul></div><div><span style="font-family: calibri, sans-serif;">You can apply for either one of the above.</span></div><div dir="auto"><span style="font-family: calibri, sans-serif;">Membership duration is considered as one/five years from the date of renewal.</span></div><div><span style="font-family: calibri, sans-serif;">&nbsp;</span></div><div><span style="font-family: calibri, sans-serif;">To renew your membership, either hand over the respective payment to our Treasurer/Vice President at any BCSSL event, or deposit it to the following account and send us a scanned/photographed copy of the approved bank slip.&nbsp;(Note: Mention &lsquo;Membership renewal&rsquo; as the purpose for payment in the bank slip.)</span></div><div><span style="font-family: calibri, sans-serif;">&nbsp;</span></div><div><span style="font-family: calibri, sans-serif;">Bank&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp; Sampath Bank - Colombo Super Branch</span></div><div><span style="font-family: calibri, sans-serif;">Account holder&nbsp; &nbsp; &nbsp;: Butterfly Conservation Society of Sri Lanka</span></div><div><span style="font-family: calibri, sans-serif;">Account no.&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : 117561000469</span></div><div><span style="font-family: calibri, sans-serif;">&nbsp;</span></div><div><span style="font-family: calibri, sans-serif;">For further details, contact Himesh (0718181225) or Rukmal (0711315024).</span></div><div><span style="font-family: calibri, sans-serif;">&nbsp;</span></div><div><span style="font-family: calibri, sans-serif;">Renew your membership and remain a part of our community!<br /></span></div><div>&nbsp;</div><div><span style="font-family: calibri, sans-serif;">Thank you.</span></div><div><span style="font-family: calibri, sans-serif;">&nbsp;</span></div><div><span style="font-family: calibri, sans-serif;">Best regards</span></div></div><p>--&nbsp;</p><div class="gmail_signature"><div dir="ltr"><div><div dir="ltr"><div><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div><div><img src="https://ci6.googleusercontent.com/proxy/OXLRrlfuGlnu8JpQyUDURLFnAewtYFNmhff9bk_z2GDTh7yx_r2W-rpNIpscaM5Ksj0QKugOVw75F2_cB0CKkd0BlBB92byqNb3rL-u7qZR0Fb-huMZVKf03cvD7Y2xG=s0-d-e1-ft#https://docs.google.com/uc?id=0B21RTe3dGIMqcm5tUWw4Vncxdms&amp;export=download" width="420" height="138" /></div></div><div>&nbsp;&nbsp;<span style="font-family: verdana, sans-serif; font-size: xx-small;"><strong><a href="http://www.bcssl.lk/" target="_blank">http://www.bcssl.lk/</a><br /></strong></span></div><div><span style="font-family: verdana, sans-serif; font-size: xx-small;"><strong>&nbsp;&nbsp;<a href="http://www.slbutterflies.lk/" target="_blank">http://www.slbutterflies.lk/</a></strong></span></div></div></div></div></div></div></div></div></div></div></div></div></div></div>'),
  (3, 'expiry_notice', 'BCSSL Membership Expiry Notice', '<div><div><span style="font-family: calibri, sans-serif;">Dear member,</span></div><div><span style="font-family: calibri, sans-serif;">&nbsp;</span></div><div><span style="font-family: calibri, sans-serif;">We&rsquo;d like to take this opportunity to thank you for being a valuable member of Butterfly Conservation Society of Sri Lanka (BCSSL).&nbsp;&nbsp;This is a kind reminder that <strong>your membership of BCSSL has expired</strong>. <br />Please renew your membership within 3 months from this notice to continue receiving our updates.</span></div><div><span style="font-family: calibri, sans-serif;"><strong>&nbsp;</strong></span></div><div><span style="font-family: calibri, sans-serif;"><strong>How to renew your BCSSL membership:</strong></span></div><div dir="auto">&nbsp;</div><div><span style="font-family: calibri, sans-serif;">We have now introduced two membership categories:</span></div><div><ul><li><span style="font-family: calibri, sans-serif;">1 year (Membership fee: Rs. 300.00)<br /></span></li><li><span style="font-family: calibri, sans-serif;">5 year (Membership fee: Rs. 1200.00)<br /></span></li></ul></div><div><span style="font-family: calibri, sans-serif;">You can apply for either one of the above.</span></div><div dir="auto"><span style="font-family: calibri, sans-serif;">Membership duration is considered as one/five years from the date of renewal.</span></div><div><span style="font-family: calibri, sans-serif;">&nbsp;</span></div><div><span style="font-family: calibri, sans-serif;">To renew your membership, either hand over the respective payment to our Treasurer/Vice President at any BCSSL event, or deposit it to the following account and send us a scanned/photographed copy of the approved bank slip.&nbsp;(Note: Mention &lsquo;Membership renewal&rsquo; as the purpose for payment in the bank slip.)</span></div><div><span style="font-family: calibri, sans-serif;">&nbsp;</span></div><div><span style="font-family: calibri, sans-serif;">Bank&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;:&nbsp; Sampath Bank - Colombo Super Branch</span></div><div><span style="font-family: calibri, sans-serif;">Account holder&nbsp; &nbsp; &nbsp;: Butterfly Conservation Society of Sri Lanka</span></div><div><span style="font-family: calibri, sans-serif;">Account no.&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : 117561000469</span></div><div><span style="font-family: calibri, sans-serif;">&nbsp;</span></div><div><span style="font-family: calibri, sans-serif;">For further details, contact Himesh (0718181225) or Rukmal (0711315024).</span></div><div><span style="font-family: calibri, sans-serif;">&nbsp;</span></div><div><span style="font-family: calibri, sans-serif;">Renew your membership and remain a part of our community!<br /></span></div><div>&nbsp;</div><div><span style="font-family: calibri, sans-serif;">Thank you.</span></div><div><span style="font-family: calibri, sans-serif;">&nbsp;</span></div><div><span style="font-family: calibri, sans-serif;">Best regards</span></div></div><p>--&nbsp;</p><div class="gmail_signature"><div dir="ltr"><div><div dir="ltr"><div><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div><div><img src="https://ci6.googleusercontent.com/proxy/OXLRrlfuGlnu8JpQyUDURLFnAewtYFNmhff9bk_z2GDTh7yx_r2W-rpNIpscaM5Ksj0QKugOVw75F2_cB0CKkd0BlBB92byqNb3rL-u7qZR0Fb-huMZVKf03cvD7Y2xG=s0-d-e1-ft#https://docs.google.com/uc?id=0B21RTe3dGIMqcm5tUWw4Vncxdms&amp;export=download" width="420" height="138" /></div></div><div>&nbsp;&nbsp;<span style="font-family: verdana, sans-serif; font-size: xx-small;"><strong><a href="http://www.bcssl.lk/" target="_blank">http://www.bcssl.lk/</a><br /></strong></span></div><div><span style="font-family: verdana, sans-serif; font-size: xx-small;"><strong>&nbsp;&nbsp;<a href="http://www.slbutterflies.lk/" target="_blank">http://www.slbutterflies.lk/</a></strong></span></div></div></div></div></div></div></div></div></div></div></div></div></div></div>'),
  (4, 'suspended_notice', 'BCSSL Membership Suspended', '<p><span style="font-family: calibri, sans-serif;">Dear member,<br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" /><br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" />Please notice that your membership of Butterfly Conservation Society of Sri Lanka (BCSSL) has been <strong>suspended</strong> with effect from today. You will no longer receive email updates on our member-exclusive events. You can renew your membership to get back on track with us.<br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" /><br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" /><strong>How to renew your BCSSL membership:</strong><br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" /><br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" />We have now introduced two membership categories:<br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" /></span></p><ul><li><span style="font-family: calibri, sans-serif;">1 year (Membership fee: Rs. 300.00)</span></li><li><span style="font-family: calibri, sans-serif;">5 year (Membership fee: Rs. 1200.00)</span></li></ul><p><span style="font-family: calibri, sans-serif;">You can apply for either one of the above.<br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" />Membership duration is considered as one/five years from the date of renewal.<br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" /><br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" />To renew your membership, either hand over the respective payment to our Treasurer/Vice President at any BCSSL event, or deposit it to the following account and send us a scanned/photographed copy of the approved bank slip. (Note: Mention &lsquo;Membership renewal&rsquo; as the purpose for payment in the bank slip.)<br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" /><br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" />Bank &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: &nbsp;Sampath Bank - Colombo Super Branch<br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" />Account holder &nbsp;&nbsp;&nbsp;&nbsp;: Butterfly Conservation Society of Sri Lanka<br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" />Account no. &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 117561000469<br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" /><br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" />For further details, contact Himesh (0718181225) or Rukmal (0711315024).<br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" /><br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" />Renew your membership and remain a part of our community!<br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" /><br class="m_6742528723095208686m_-7700900569465061387gmail-kix-line-break" />Thank you.&nbsp;</span></p><div><div><span style="font-family: calibri, sans-serif;">Best regards</span></div> --&nbsp;<br /><div class="m_6742528723095208686m_-7700900569465061387gmail_signature" data-smartmail="gmail_signature"><div dir="ltr"><div><div dir="ltr"><div><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div><div><img src="https://ci6.googleusercontent.com/proxy/OXLRrlfuGlnu8JpQyUDURLFnAewtYFNmhff9bk_z2GDTh7yx_r2W-rpNIpscaM5Ksj0QKugOVw75F2_cB0CKkd0BlBB92byqNb3rL-u7qZR0Fb-huMZVKf03cvD7Y2xG=s0-d-e1-ft#https://docs.google.com/uc?id=0B21RTe3dGIMqcm5tUWw4Vncxdms&amp;export=download" width="420" height="138" /></div></div><div>&nbsp;&nbsp;<span style="font-family: verdana, sans-serif; font-size: xx-small;"><strong><a href="http://www.bcssl.lk/" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://www.bcssl.lk/&amp;source=gmail&amp;ust=1518165111272000&amp;usg=AFQjCNGDfLsuOadq26TNnvcHLbAlh-7qJg">http://www.bcssl.lk/</a><br /></strong></span></div><div><span style="font-family: verdana, sans-serif; font-size: xx-small;"><strong>&nbsp;&nbsp;<a href="http://www.slbutterflies.lk/" target="_blank" data-saferedirecturl="https://www.google.com/url?hl=en&amp;q=http://www.slbutterflies.lk/&amp;source=gmail&amp;ust=1518165111272000&amp;usg=AFQjCNFpzmriXeUiDaGULEohKcaL6IGevQ">http://www.slbutterflies.lk/</a></strong></span></div></div></div></div></div></div></div></div></div></div></div></div></div></div></div>'),
  (5, 'renewal', 'BCSSL Membership Renewed', '<p><span style="font-family: calibri, sans-serif;">Dear member,</span><br class="gmail-kix-line-break" /><br class="gmail-kix-line-break" /><span style="font-family: calibri, sans-serif;">Your membership of Butterfly Conservation Society of Sri Lanka (BCSSL) has been renewed successfully. </span><br class="gmail-kix-line-break" /><span style="font-family: calibri, sans-serif;">Thank you for being a valuable part of our community!</span></p><div><span style="color: #000000; font-family: calibri, sans-serif;">&nbsp;</span></div><div><span style="color: #000000; font-family: Roboto;"><span style="font-family: calibri, sans-serif;">Best regards</span><br /></span><div><div>--&nbsp;<br /><div class="gmail_signature" data-smartmail="gmail_signature"><div dir="ltr"><div><div dir="ltr"><div><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div dir="ltr"><div><div><img src="https://ci6.googleusercontent.com/proxy/OXLRrlfuGlnu8JpQyUDURLFnAewtYFNmhff9bk_z2GDTh7yx_r2W-rpNIpscaM5Ksj0QKugOVw75F2_cB0CKkd0BlBB92byqNb3rL-u7qZR0Fb-huMZVKf03cvD7Y2xG=s0-d-e1-ft#https://docs.google.com/uc?id=0B21RTe3dGIMqcm5tUWw4Vncxdms&amp;export=download" width="420" height="138" /></div></div><div>&nbsp;&nbsp;<span style="font-family: verdana, sans-serif; font-size: xx-small;"><strong><a href="http://www.bcssl.lk/" target="_blank">http://www.bcssl.lk/</a><br /></strong></span></div><div><span style="font-family: verdana, sans-serif; font-size: xx-small;"><strong>&nbsp;&nbsp;<a href="http://www.slbutterflies.lk/" target="_blank">http://www.slbutterflies.lk/</a></strong></span></div></div></div></div></div></div></div></div></div></div></div></div></div></div></div></div></div>')
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