<?php
    session_start();
?>

<html>

<head>
    <title>BCSSL DB Portal</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="style/color.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel="stylesheet" href="style/w3.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="script/script.js"></script>
    
</head>

<body>
    <nav class="w3-sidenav w3-white w3-card-2" style="width:18%">
        <br>
        <img src="img/logo.png" class="logo">
        <div style="width: 100%; height: 80px"></div>
        <a href="#" onclick="addMemberModalOpen()">Add Member</a>
        <a href="#" onclick="sendMailModalOpen()">Send Email</a>
        <a href="#">Find a Member</a>
        <a href="#">Renew Membership</a>
    </nav>

    <div style="margin-left:18%">

        <header class="portal-header w3-container">
            <h1 class="page-title">DB Portal</h1>
            <button class="portal-button">LOGOUT</button>
        </header>

        <div class="w3-container" style="width: 100%; height: 50px; margin-top: 90px"></div>

        <div id="addMemberModal" class="w3-container">
            <h2>Enter details:</h2>
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Membership Number</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="memberIdText" style="width:100%">
                </div>   
            </div>            
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Name</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="nameText" style="width:100%">
                </div>   
            </div> 
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Email</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="emailText" style="width:100%">
                </div>   
            </div>    
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Address</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="addressText" style="width:100%">
                </div>   
            </div>  
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">NIC</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="idText" style="width:100%">
                </div>   
            </div> 
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Date of Birth</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="bdaylText" style="width:100%">
                </div>   
            </div>                                                   
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Contact Number</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="contactNoText" style="width:100%">
                </div>   
            </div>        
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Category</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <select id="categoryText" style="width:100%">
                        <option value="" selected>General - 1 year</option>
                        <option value="">General - 5 year</option>
                        <option value="">School</option>
                        <option value="">Foreign</option>
                    </select>
                </div>   
            </div>        
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Receipt Number</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="receiptNoText" style="width:100%">
                </div>   
            </div>
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Date of Registration</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="regDateText" style="width:100%">
                </div>   
            </div>                    
        </div>

        <div id="sendMailModal" class="w3-container">
            <h2>Enter text here:</h2>
        </div>

        <footer class="w3-container">
        </footer>

    </div>

    <script>
        window.onload = function() {
            addMemberModalOpen();
        }
    </script>

</body>

</html>