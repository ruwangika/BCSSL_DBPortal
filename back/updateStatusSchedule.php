<?php
    require 'dbconn.php';

    $con = getConnection();

    mysqli_query($con, "CALL updateMemberStatus()") or die("Query fail: " . mysqli_error());
    
    closeConnection($con);
?>