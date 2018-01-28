-- Function to get member status
DROP FUNCTION IF EXISTS getStatus;
DELIMITER $$
CREATE FUNCTION getStatus(
    dateOfReg DATE,
    date_renewed DATE,
    category VARCHAR(15),
    status ENUM ('active', 'expired_noticed', 'expired_warned', 'suspended')
) RETURNS VARCHAR(5) 

BEGIN
    DECLARE
        member_status VARCHAR(20) ; DECLARE currentDate DATE ; DECLARE regDate DATE ;
    SET
        member_status = 'active' ;
    SET
        currentDate = CURRENT_DATE() ;
    SET
        regDate = dateOfReg ; 
    IF(date_renewed IS NOT NULL) THEN
        SET
            regDate = date_renewed ; 
    END IF;

    IF(
        (status = 'active') AND
        ((
            category = 'general_1y' AND DATEDIFF(currentDate, regDate) > 365
        ) OR(
            category = 'general_5y' AND DATEDIFF(currentDate, regDate > 365 * 5)
        ))
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
    DECLARE member_status VARCHAR(5) ;
    DECLARE expiry_status VARCHAR(30) ;
    DECLARE email_address VARCHAR(50) ;

    SET member_status = SELECT member_status FROM members_tab WHERE ID = memberID ;
    SET expiry_status = getExpiryStatus(dateOfReg, date_renewed, category) ;
    SET email_address = SELECT email FROM members_tab WHERE ID = memberID ;

    CASE 
        WHEN expiry_status = "none"
        THEN 
            SET member_status = member_status;
        WHEN expiry_status = "1week_to_expire"
        THEN 
            queueEmail(email_address, "expiry_warning");
            SET member_status = '1' ;
        WHEN expiry_status = "expires_today"
        THEN 
            queueEmail(email_address, "expiry_notice");
            SET member_status = '0' ;
        WHEN expiry_status = "expired_3months"
        THEN 
            queueEmail(email_address, "suspended_notice");
            SET member_status = '-1' ;
        
    RETURN member_status ;
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
    ELSEIF (date_diff = period + 30) THEN
        SET expiry_status = "expired_3months";
    ELSE
        SET expiry_status = "none";
    END IF;

    RETURN expiry_status;
END$$
DELIMITER ;