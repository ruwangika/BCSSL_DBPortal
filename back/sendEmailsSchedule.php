<?php

    require 'dbconn.php';
    require 'mailserver.php';

    sendQueuedEmails();

    function sendQueuedEmails() {
        $con = getConnection();
        $sql = 'SELECT ID, msg_code, to_address FROM email_queue_tab WHERE msg_status = "queued"';
    
        $results = mysqli_query($con, $sql);
        $nor = mysqli_num_rows($results);
        $counter = 0;
        $msg_id = -1;
        $msg_code = "";
        $email_address = "";
        $status = "queued";
    
        if($nor != 0){
            while ($row = mysqli_fetch_assoc($results)) {
                $msg_id = $row["ID"];
                $msg_code = $row["msg_code"];
                $email_address = $row["to_address"];
                // $email_address = 'ruwangikagunawardana@gmail.com';
                sendMail($msg_code, $email_address);
                $status = 'sent';
                updateMsgStatus($con, $msg_id, $status);
            }
            closeConnection($con);
            echo $nor." emails sent.";
        }else{
            closeConnection($con);
            echo "No emails queued.";
        }
    }


    function updateMsgStatus($connection, $msg_id, $status) {
        $sql = "UPDATE email_queue_tab SET msg_status = ? WHERE ID = ?;";
        if ($stmt = mysqli_prepare($connection, $sql)) {
            mysqli_stmt_bind_param($stmt, "si", $status, $msg_id);
            mysqli_stmt_execute($stmt);            
            mysqli_stmt_close($stmt);
        }      
    }

?>