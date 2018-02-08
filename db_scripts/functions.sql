-- Function to get member status
DROP FUNCTION IF EXISTS getStatus;
DELIMITER $$
CREATE FUNCTION getStatus(
    dateOfReg DATE,
    date_renewed DATE,
    category VARCHAR(15)
) RETURNS VARCHAR(5) 

BEGIN
    DECLARE member_status VARCHAR(20) ; 
    DECLARE currentDate DATE ; 
    DECLARE regDate DATE ;
    SET
        member_status = '1' ;
    SET
        currentDate = CURRENT_DATE() ;
    SET
        regDate = dateOfReg ; 
    IF(date_renewed IS NOT NULL) THEN
        SET
            regDate = date_renewed ; 
    END IF;

    IF(
        (
            category = 'general_1y' AND DATEDIFF(currentDate, regDate) > 365
        ) OR(
            category = 'general_5y' AND DATEDIFF(currentDate, regDate > 365 * 5)
        )
    ) THEN
        SET
            member_status = '0' ;
    END IF ; 
        
    RETURN member_status ;
END $$
DELIMITER ;


-- Function to get member status and add emails to queue
DROP FUNCTION IF EXISTS getMemberStatus;
DELIMITER $$
CREATE FUNCTION getMemberStatus(
    memberID INT(5),
    dateOfReg DATE,
    date_renewed DATE,
    category VARCHAR(15)
) RETURNS VARCHAR(5) 

BEGIN
    DECLARE current_member_status VARCHAR(5) ;
    DECLARE expiry_status VARCHAR(30) ;
    DECLARE email_address VARCHAR(50) ;
    DECLARE RESULT INT(5);

    SET current_member_status = (SELECT member_status FROM members_tab WHERE ID = memberID) ;
    SET expiry_status = getExpiryStatus(dateOfReg, date_renewed, category) ;
    SET email_address = (SELECT email FROM members_tab WHERE ID = memberID) ;

    IF (expiry_status = "none") THEN 
        RETURN current_member_status;
    ELSEIF (expiry_status = "1week_to_expire") THEN 
        SELECT queueEmail(email_address, "expiry_warning") INTO RESULT;
        SET current_member_status = '1' ;
    ELSEIF (expiry_status = "expires_today") THEN 
        SELECT queueEmail(email_address, "expiry_notice") INTO RESULT;
        SET current_member_status = '0' ;
    ELSEIF (expiry_status = "expired_3months") THEN 
        SELECT queueEmail(email_address, "suspended_notice") INTO RESULT;
        SET current_member_status = '-1' ;
    END IF;

    RETURN current_member_status ;
END $$
DELIMITER ;

-- Function to get membership expiry status
DROP FUNCTION IF EXISTS getExpiryStatus;
DELIMITER $$
CREATE FUNCTION getExpiryStatus(
    dateOfReg DATE,
    date_renewed DATE,
    category VARCHAR(15)
) RETURNS VARCHAR(30) 

BEGIN
    DECLARE expiry_status VARCHAR(30) ; 
    DECLARE currentDate DATE ; 
    DECLARE regDate DATE ;
    DECLARE date_diff INT(5);
    DECLARE period INT(5);

    SET
        expiry_status = "" ;
    SET
        currentDate = CURRENT_DATE() ;
    SET
        regDate = dateOfReg ; 
    IF (date_renewed IS NOT NULL) THEN
        SET
            regDate = date_renewed ; 
    END IF;
    SET date_diff = DATEDIFF(currentDate, regDate) ;
    IF (category = "general_1y" OR category = "school") THEN
        SET period = 365 ;
    ELSEIF (category = "general_5y" OR category = "foreign") THEN 
        SET period = 365 * 5 ;
    END IF;

    IF (date_diff = period - 7) THEN
        SET expiry_status = "1week_to_expire";
    ELSEIF (date_diff = period) THEN
        SET expiry_status = "expires_today";
    ELSEIF (date_diff = period + 90) THEN
        SET expiry_status = "expired_3months";
    ELSE
        SET expiry_status = "none";
    END IF;

    RETURN expiry_status;
END$$
DELIMITER ;


-- Function to queue emails
DROP FUNCTION IF EXISTS queueEmail;
DELIMITER $$
CREATE FUNCTION queueEmail(
    email_address VARCHAR(100),
    email_code VARCHAR(30)
) RETURNS INT(5) 

BEGIN
    INSERT INTO email_queue_tab (msg_code, to_address)
    VALUES (email_code, email_address);

    RETURN 1;
END$$
DELIMITER ;
