<?php

    function sendMembershipMail($email) {
        // $msg = "This is a test email.";
        // mail($email,"My subject",$msg);
        $from = 'membership@bcssl.lk';
        $to = $email; // The column where your e-mail was stored.
        $subject = 'Test';
        $msg = 'This is a test email.';
        mail($to, $subject, $msg, $from);
    }

    function sendMail($address, $reason) {
        $to = $address;
        $subject = getSubject($reason);
        $body = getMsg($reason);

        mail($to, $subject, $body);
    }

    function getSubject($reason) {
        return 'Test';
    }

    function getMsg($reason) {
        return 'This is a test email.';
    }
?>