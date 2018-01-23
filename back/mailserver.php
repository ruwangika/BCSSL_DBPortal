<?php

    function sendMembershipMail($email) {
        // $msg = "This is a test email.";
        // mail($email,"My subject",$msg);
        // $from = 'membership@bcssl.lk';
        $to = 'ruwangikagunawardana@gmail.com';
        $subject = 'Test';
        $msg = 'This is a test email.';
        $headers = "From: butterflycssl@gmail.com\r\n";
        mail($to, $subject, $msg, $headers);
    }

    function sendMail($address, $reason) {
        $to = $address;
        $subject = getSubject($reason);
        $body = getMsg($reason);
        $headers = "From: butterflycssl@gmail.com\r\n";

        mail($to, $subject, $body, $headers);
    }

    function getSubject($reason) {
        return 'Test';
    }

    function getMsg($reason) {
        return 'This is a test email.';
    }
?>