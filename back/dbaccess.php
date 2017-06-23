<?php

    require 'dbconn.php';

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

    function addMemberToDb($id, $name, $email, $address, $nic, $dob, $contactNo, $category, $receiptNo, $regDate){
        $con = getConnection();
        $sql = "INSERT INTO members_tab (ID, member_name, email) VALUES (?, ?, ?);";
        if ($stmt = mysqli_prepare($con, $sql)) {
            mysqli_stmt_bind_param($stmt, "iss", $id, $name, $email);
            mysqli_stmt_execute($stmt);            
            mysqli_stmt_close($stmt);
        }
    }

?>