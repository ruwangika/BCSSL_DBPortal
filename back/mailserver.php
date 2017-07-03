<?php

    function sendMembershipMail($email) {
        $msg = "This is a test email.";
        mail($email,"My subject",$msg);
    }
?>