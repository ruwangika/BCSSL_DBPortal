DELIMITER $$
CREATE PROCEDURE setMemberStatus()
BEGIN
  UPDATE members_tab
    SET member_status = getStatus(dateOfReg, date_renewed, category)
    WHERE 1;
END$$
DELIMITER ;