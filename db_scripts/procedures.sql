-- Procedure to set member status
DELIMITER $$
CREATE PROCEDURE setMemberStatus()
BEGIN
  UPDATE members_tab
    SET member_status = getStatus(dateOfReg, date_renewed, category)
    WHERE 1;
END$$
DELIMITER ;

-- Procedure to update member status (and add emails to queue)
DELIMITER $$
CREATE PROCEDURE updateMemberStatus()
BEGIN
  UPDATE members_tab
    SET member_status = getMemberStatus(ID, dateOfReg, date_renewed, category)
    WHERE 1;  
END$$
DELIMITER ;