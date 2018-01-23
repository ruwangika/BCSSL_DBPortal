<?php

    require 'dbconn.php';
    require 'mailserver.php';

    function getNameList(){
        $con = getConnection();
        $sql = "SELECT member_name FROM members_tab";
        $results = mysqli_query($con, $sql);
        $nor = mysqli_num_rows($results);
        $counter = 0;
        if($nor != 0){
            while ($row = mysqli_fetch_assoc($results)) {
                $data["Name"][$counter++] = $row["member_name"]; 
            }
            closeConnection($con);
            return $data;
        }else{
            closeConnection($con);
            return "Null Data";
        }  
    }

    function addMemberToDb($memberId, $name, $email, $address, $nic, $dob, $gender, $contactNo, $contactNo_extra, $category, $receiptNo, $regDate){
        if ($memberId=="" || $name=="") {
            return "nulldata";
        }
        $con = getConnection();
        // Check if NIC exists
        $id = 0;
        $sql = "SELECT ID FROM members_tab WHERE NIC = ?;";
        if ($stmt = mysqli_prepare($con, $sql)) {
            mysqli_stmt_bind_param($stmt, "s", $nic);
            mysqli_stmt_execute($stmt); 
            mysqli_stmt_bind_result($stmt, $result);
            while(mysqli_stmt_fetch($stmt)) {
                $id = $result;
            }
            mysqli_stmt_close($stmt);
        }
        if ($id != 0) {
            return "exists";
        } else {
            // Add data
            //$status = 1;
            $sql = "INSERT INTO members_tab (membership_no, member_name, email, address, NIC, DoB, gender, contactNo, contactNo_extra, category, receiptNo, dateOfReg) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
            if ($stmt = mysqli_prepare($con, $sql)) {
                mysqli_stmt_bind_param($stmt, "ssssssssssis", $memberId, $name, $email, $address, $nic, $dob, $gender, $contactNo, $contactNo_extra, $category, $receiptNo, $regDate);
                mysqli_stmt_execute($stmt);            
                mysqli_stmt_close($stmt);
            }

            sendMembershipMail($email);
        }
    }

    function getMaxID() {
        $con = getConnection();
        $sql = "SELECT MAX(ID) FROM members_tab;";
        
        if ($stmt = mysqli_prepare($con, $sql)) {
            mysqli_stmt_execute($stmt);
            mysqli_stmt_bind_result($stmt, $data);  
            while (mysqli_stmt_fetch($stmt)) {
                return $data;
            }              
            mysqli_stmt_close($stmt);
        }
    }

    function checkNIC($nic) {
        $con = getConnection();
        $sql = "SELECT ID FROM members_tab WHERE NIC = ?;";
        if ($stmt = mysqli_prepare($con, $sql)) {
            mysqli_stmt_bind_param($stmt, "s");
            mysqli_stmt_execute($stmt); 
            mysqli_stmt_bind_result($stmt, $result);     
            if(mysql_num_rows($result) != 0) {
                return "exists";
            } 
            mysqli_stmt_close($stmt);
        }
    }

    function renewMembership($name, $regDate_renew, $category_renew, $receiptNo_renew) {
        if ($name=="" || $regDate_renew=="" || $category_renew=="" || $receiptNo_renew=="") {
            return "nulldata";
        }
        $con = getConnection();
        // Check if member exists
        $id = 0;
        $sql = "SELECT ID FROM members_tab WHERE member_name = ?;";
        if ($stmt = mysqli_prepare($con, $sql)) {
            mysqli_stmt_bind_param($stmt, "s", $name);
            mysqli_stmt_execute($stmt); 
            mysqli_stmt_bind_result($stmt, $result);
            while(mysqli_stmt_fetch($stmt)) {
                $id = $result;
            }
            mysqli_stmt_close($stmt);
        }
        if ($id == 0) {
            return "notfound";
        } else {
            $status = 'active';
            $sql = "UPDATE members_tab SET date_renewed = ?, category = ?, receiptNo_renewed = ?, member_status = ? WHERE member_name = ?;";
            if ($stmt = mysqli_prepare($con, $sql)) {
                mysqli_stmt_bind_param($stmt, "sssss", $regDate_renew, $category_renew, $receiptNo_renew, $status, $name);
                mysqli_stmt_execute($stmt);            
                mysqli_stmt_close($stmt);
            }
            $address = getEmail($id);
            queueEmail($address, 'renewal');
            sendMail("ruwangikagunawardana@gmail.com", "renewal");
        }
    }

    function queueEmail1($id, $code) {
        // switch ($code) {
        //     case "welcome":
        //         echo "welcome";
        //         break;
        //     case "expiry":
        //         echo "expiry";
        //         break;
        //     case "expiry_warning":
        //         echo "expiry_warning";
        //         break;
        //     case "renewal":
        //         echo "renewal";
        //         $subject = "Renew Your BCSSL Membership";
        //         $body = "Renew your BCSSL membership today.";
        //         break;
        //     case "suspended":
        //         echo "suspended";
        //         break;            
        // }

        $con = getConnection();
        // Get email address
        $address = getEmail($ID);
        $sql_insert = "INSERT INTO email_queue_tab (msg_id, msg_to, msg_subject, msg_body) VALUES (?, ?, ?, ?);";
        if ($stmt = mysqli_prepare($con, $sql_insert)) {
            mysqli_stmt_bind_param($stmt, "ssss", $msg_id, $address, $subject, $body);
            mysqli_stmt_execute($stmt);        
            mysqli_stmt_close($stmt);
        }
    }

    function queueEmail($address, $code) {
        $con = getConnection();
        $sql_insert = "INSERT INTO email_queue_tab (msg_id, to_address) VALUES (?, ?);";
        if ($stmt = mysqli_prepare($con, $sql_insert)) {
            mysqli_stmt_bind_param($stmt, "ss", $code, $address);
            mysqli_stmt_execute($stmt);        
            mysqli_stmt_close($stmt);
        }
    }

    function getEmail($ID) {
        $con = getConnection();
        $sql = "SELECT email FROM members_tab WHERE ID = ?;";
        if ($stmt = mysqli_prepare($con, $sql)) {
            mysqli_stmt_bind_param($stmt, "i", $ID);
            mysqli_stmt_execute($stmt); 
            mysqli_stmt_bind_result($stmt, $result);
            while(mysqli_stmt_fetch($stmt)) {
                $email = $result;
            }
            mysqli_stmt_close($stmt);
        }
        return $email;
    }
?>