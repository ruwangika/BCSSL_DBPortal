SELECT `member_name`, `email`, `dateOfReg`, `date_renewed` FROM `members_tab` WHERE `member_status` = '0' AND `email` IS NOT NULL;


SELECT `member_name`, `email`, `dateOfReg`, `date_renewed` FROM `members_tab` WHERE `date_renewed` = '2017-01-07';


    UPDATE members_tab
    SET date_renewed = '2018-01-07'
    WHERE `date_renewed` = '2017-01-07'


-- Cron job: 	/usr/local/bin/php /home/bcssllk/public_html/admin/back/scheduler.php