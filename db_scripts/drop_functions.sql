SELECT
    CONCAT('DROP ',ROUTINE_TYPE,' `',ROUTINE_SCHEMA,'`.`',ROUTINE_NAME,'`;') as stmt
FROM information_schema.ROUTINES;


-- DROP FUNCTION `bcssllk_db`.`getStatus`;
-- DROP PROCEDURE `bcssllk_db`.`setMemberStatus`;
