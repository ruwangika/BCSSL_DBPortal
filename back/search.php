<?php

  require 'dbconn.php';

    $key=$_GET['key'];
    $array = array();

    // $con=mysql_connect("localhost","root","asdf");
    // $db=mysql_select_db("bcssl_test",$con);
    // $query=mysql_query("select * from members_tab where member_name LIKE '%{$key}%'");
    // while($row=mysql_fetch_assoc($query))
    // {
    //   $array[] = $row['member_name'];
    // }
    // echo json_encode($array);

  
    $con = getConnection();
    $sql = "SELECT member_name FROM members_tab WHERE member_name LIKE '%{$key}%'";
    $results = mysqli_query($con, $sql);
    $nor = mysqli_num_rows($results);
    $counter = 0;
    if($nor != 0){
        while ($row = mysqli_fetch_assoc($results)) {
          $array[] = $row['member_name'];
        }
        closeConnection($con);
    }else{
        closeConnection($con);
    } 

    echo json_encode($array);
?>
