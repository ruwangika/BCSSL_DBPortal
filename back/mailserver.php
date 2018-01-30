<?php

    require_once 'dbaccess.php';

    function sendMembershipMail($email) {
        // $msg = "This is a test email.";
        // mail($email,"My subject",$msg);
        // $from = 'membership@bcssl.lk';
        $to = 'ruwangikagunawardana@gmail.com';
        $subject = 'Test';
        $msg = 'This is a test email.';
        $headers = 'From: butterflycssl@gmail.com\r\n';
        mail($to, $subject, $msg, $headers);
    }

    function sendMail($code, $address) {
        // $to = $address;
        $to = 'ruwangikagunawardana@gmail.com';
        $subject = getSubject($code);
        $body = getMsg($code);
        $headers  = 'MIME-Version: 1.0' . "\r\n";
        $headers .= 'Content-type: text/html; charset=iso-8859-1' . "\r\n";
        $headers .= 'From: Butterfly Conservation Society<butterflycssl@gmail.com>'."\r\n";

        echo 'code: '.$code.', address: '.$address.': ';
        mail($to, $subject, $body, $headers);
    }
?>