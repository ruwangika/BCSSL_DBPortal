<?php
	require 'dbaccess.php';

    // $field = $_POST["field"];
    // if($field == 'get_names') {         
    //     $data = getNameList();
    //     echo json_encode($data);
    
    // }

    $type = $_POST["r_type"];

    if($type == 'add_member') {         
        $memberId = $_POST["memberId"];
        $name = $_POST["name"];
        $email = $_POST["email"];
        $address = $_POST["address"];
        $nic = $_POST["nic"];
        $dob = $_POST["dob"];
        $gender = $_POST["gender"];
        $contactNo = $_POST["contactNo"];
        $contactNo_extra = $_POST["contactNo_extra"];
        $category = $_POST["category"];
        $receiptNo = $_POST["receiptNo"];
        $regDate = $_POST["regDate"];

        $data = addMemberToDb($memberId, $name, $email, $address, $nic, $dob, $gender, $contactNo, $contactNo_extra, $category, $receiptNo, $regDate);
        echo json_encode($data);    
    }

    if($type == 'get_id') { 
        $data = getMaxID();
        echo $data;    
    }

    if($type == 'renew_membership') {
        $name = $_POST["name"];
        $regDate_renew = $_POST["regDate_renew"];
        $receiptNo_renew = $_POST["receiptNo_renew"];

        $data = renewMembership($name, $regDate_renew, $receiptNo_renew);
        echo json_encode($data);    
    }

    if($type == 'get_id') { 
        $data = getMaxID();
        echo $data;    
    }

?>