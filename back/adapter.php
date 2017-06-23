<?php
	require 'dbaccess.php';

    // $field = $_POST["field"];
    // if($field == 'get_names') {         
    //     $data = getNameList();
    //     echo json_encode($data);
    
    // }

    $type = $_POST["r_type"];
    if($type == 'add_member') { 
        
        $id = $_POST["id"];
        $name = $_POST["name"];
        $email = $_POST["email"];
        $address = $_POST["address"];
        $nic = $_POST["nic"];
        $dob = $_POST["dob"];
        $contactNo = $_POST["contactNo"];
        $category = $_POST["category"];
        $receiptNo = $_POST["receiptNo"];
        $regDate = $_POST["regDate"];

        $data = addMemberToDb($id, $name, $email, $address, $nic, $dob, $contactNo, $category, $receiptNo, $regDate);
        echo json_encode($data);
    
    }


?>