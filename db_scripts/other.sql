SELECT `member_name`, `email`, `dateOfReg`, `date_renewed` FROM `members_tab` WHERE `member_status` = '0' AND `email` IS NOT NULL;


SELECT `member_name`, `email`, `dateOfReg`, `date_renewed` FROM `members_tab` WHERE `date_renewed` = '2017-01-07';


UPDATE members_tab
SET date_renewed = '2018-01-07'
WHERE `date_renewed` = '2017-01-07'


SELECT ID, `member_name`, `email`, `dateOfReg`, `date_renewed` 
FROM members_tab
WHERE (`dateOfReg` BETWEEN '2017-02-01' AND '2017-02-28') OR (`date_renewed` BETWEEN '2017-02-01' AND '2017-02-28');    


-- Cron job: 	/usr/local/bin/php /home/bcssllk/public_html/admin/back/scheduler.php

-- Dates
-- Feb: 2017-02-25 --> 2018-02-18
-- Mar: 2017-03-18 --> 2018-03-11
-- Apr: NA
-- May: 
-- June: 