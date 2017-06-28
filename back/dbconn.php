<?php


	function getConnection(){
		$con = mysqli_connect("localhost", "root", "root", "bcssl_test"); //connection string
		if ($con->connect_error) {
	    	die("Connection failed: " . $con->connect_error);
		}else{
			return $con;
		}
	}

	function closeConnection($con){
		mysqli_close($con);
	}
    	
?>