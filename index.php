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
<!--Side nav bar-->
    <nav class="w3-sidenav w3-white w3-card-2" style="width:18%">
        <br>
        <img src="img/logo.png" class="logo">
        <div style="width: 100%; height: 80px"></div>
        <a href="#" onclick="addMemberModalOpen()">Add Member</a>
        <a href="#" onclick="sendMailModalOpen()">Send Email</a>
        <a href="#" onclick="findMemberModalOpen()">Find a Member</a>
        <a href="#" onclick="renewMembershipModalOpen()">Renew Membership</a>
    </nav>

    <div style="margin-left:18%">

        <header class="portal-header w3-container">
            <h1 class="page-title">Admin Portal</h1>
            <button class="portal-button">LOGOUT</button>
        </header>

        <div class="w3-container" style="width: 100%; height: 80px; margin-top: 20px"></div>

<!--Add Member modal-->
        <div id="addMemberModal" class="w3-container">
            <h2>Enter details:</h2>
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Membership Number</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="memberIdText">
                </div>   
            </div>            
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Name</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="nameText">
                </div>   
            </div> 
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Email</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="emailText">
                </div>   
            </div>    
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Address</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <textarea id="addressText" rows="5" style="height:20%"></textarea>
                </div>   
            </div>  
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">NIC</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="nicText">
                </div>   
            </div> 
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Date of Birth</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="dobText">
                </div>   
            </div>                                                   
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Contact Number</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="contactNoText">
                </div>   
            </div>        
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Category</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <select id="categoryCombo" class="combo-1">
                        <option value="local_1y" selected>General - 1 year</option>
                        <option value="local_5y">General - 5 year</option>
                        <option value="school">School</option>
                        <option value="foreign">Foreign</option>
                    </select>
                </div>   
            </div>        
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Receipt Number</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="receiptNoText">
                </div>   
            </div>
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Date of Registration</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="regDateText">
                </div>   
            </div> 

            <div class="w3-container" style="width: 100%; height: 10px; margin-top: 20px"></div>

            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:65%">
                    <button id="submitBtn" onclick="addMember()" style="float:right">SUBMIT</button>  
                </div>   
            </div>                  
        </div>

<!--Send Email modal-->
        <div id="sendMailModal" class="w3-container">
            <h2>Compose your message:</h2>
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Send to:</p>
                </div>
                <div class="w3-col w3-container" style="width:40%">
                    <input type="text" id="recipientText"></textarea>
                </div>   
            </div>
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Subject</p>
                </div>
                <div class="w3-col w3-container" style="width:60%">
                    <textarea id="subjectText" rows="2"></textarea>
                </div>   
            </div>            
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Text</p>
                </div>            
                <div class="w3-col w3-container" style="width:60%">
                    <textarea id="mailText" rows="50" style="height:40%"></textarea>
                </div>   
            </div>
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Attachments</p>
                </div>
                <div class="w3-col w3-container" style="width:60%">
                    <input type="text" id="attachBox"></textarea>
                </div>   
            </div>

            <div class="w3-container" style="width: 100%; height: 10px; margin-top: 20px"></div>
            
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:75%">
                    <button id="sendMailBtn" onclick="sendMail()" style="float:right">SEND</button>  
                </div>   
            </div>            
        </div>

<!--Find a Member modal-->
        <div id="findMemberModal" class="w3-container">
            <h2>Enter member ID:</h2>
        </div>

<!--Renew Membership modal-->
        <div id="renewMembershipModal" class="w3-container">
            <h2>Enter member ID or name:</h2>
        </div>                

        <footer class="w3-container">
            <div class="w3-container" style="width: 100%; height: 10px; margin-top: 20px"></div>            
        </footer>

    </div>

    <script>
        window.onload = function() {
            addMemberModalOpen();
        }
    </script>

</body>

</html>