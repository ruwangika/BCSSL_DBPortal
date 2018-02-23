<?php
	require 'dbaccess.php';

    $type = $_GET["r_type"];

    if($type == 'get_details') {
        $memGroup = $_GET["memGroup"];

        $data = getMemberDetails($memGroup);
        echo json_encode($data);    
    }

?>