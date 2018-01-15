DELIMITER
    $$
CREATE FUNCTION getStatus(
    dateOfReg DATE,
    date_renewed DATE,
    category VARCHAR(15),
    status ENUM ('active', 'expired_noticed', 'expired_warned', 'susspended')
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
        (status == 'active') AND
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
DELIMITER
;