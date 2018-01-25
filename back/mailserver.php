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

    function sendMail($code, $address) {
        $to = $address;
        $subject = getSubject($code);
        $body = getMsg($code);
        $headers = "From: butterflycssl@gmail.com\r\n";

        echo "code: ".$code.", address: ".$address.": ";
        mail($to, $subject, $body, $headers);
    }

    function getSubject($code) {
        return 'Test';
    }

    function getMsg($code) {
        return 'This is a test email.';
    }
?>