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
?>