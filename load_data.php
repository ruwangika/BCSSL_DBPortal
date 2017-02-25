<?php
	require 'dbaccess.php';

    $field = $_POST["field"];
    if($field == 'get_names') {         
        $data = getNameList();
        echo json_encode($data);
    
    }

?>