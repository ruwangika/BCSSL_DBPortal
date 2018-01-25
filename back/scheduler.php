<?php

    require 'dbconn.php';
    require 'mailserver.php';

    $con = getConnection();
    // $statusQueued = 'queued';
    $sql = 'SELECT ID, msg_code, to_address FROM email_queue_tab WHERE msg_status = "queued"';
    // mysqli_stmt_bind_param($stmt, "s", $statusQueued);
    // mysqli_stmt_execute($stmt);
    // mysqli_stmt_bind_result($stmt, $result);
    // while(mysqli_stmt_fetch($stmt)) {
    //     $email = $result;
    // }
    // mysqli_stmt_close($stmt);

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
            sendMail($msg_code, $email_address);
            $status = "sent";
            updateStatus($con, $msg_id, $status);
        }
        closeConnection($con);
        echo $nor." emails sent.";
    }else{
        closeConnection($con);
        echo "No emails queued.";
    }

    function updateStatus($connection, $msg_id, $status) {
        // $con = getConnection();
        $sql = "UPDATE email_queue_tab SET msg_status = ? WHERE ID = ?;";
        if ($stmt = mysqli_prepare($connection, $sql)) {
            mysqli_stmt_bind_param($stmt, "si", $status, $msg_id);
            mysqli_stmt_execute($stmt);            
            mysqli_stmt_close($stmt);
        }
        // closeConnection($con);        
    }

?>