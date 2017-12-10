<?php
    session_start();
?>

<html>

<?php
    if(isset($_SESSION["login_user"])){
        $id = $_SESSION["login_user"];
    }else{
        $_SESSION['msg'] = "Welcome";
        $id = "none";
        echo "<script>location.href = 'login.php';</script>";
    }
?>

<head>
    <title>BCSSL DB Portal</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link rel="stylesheet" href="style/color.css">
    <link rel="stylesheet" href="style/style.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel="stylesheet" href="style/w3.css">
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script src="script/script.js"></script>
    <script src="script/typeahead.min.js"></script>
    <script>
      $(document).ready(function(){
        $('input.typeahead-name').typeahead({
            hint: false,
            name: 'typeahead-name',
            remote:'back/search.php?key=%QUERY',
            limit : 10,
        });
        $('input.typeahead-id').typeahead({
            hint: false,
            name: 'typeahead-id',
            remote:'back/searchid.php?id=%QUERY',
            limit : 10,
        });
      });
    </script>
    
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

        <!-- <header class="portal-header w3-container">
            <h1 class="page-title">Admin Portal</h1>
            <button class="portal-button" onclick="logout()">LOGOUT</button>
        </header> -->

        <div class="w3-container" style="width: 100%; height: 10px; margin-top: 0px"></div>

<!--Add Member modal-->
        <div id="addMemberModal" class="w3-container">
            <h2>Enter details:</h2>           
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
                    <input type="email" id="emailText">
                </div>   
            </div>    
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Address</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="addressText">
                </div>   
            </div>  
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">NIC</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input id="nicText" type="text" maxlength="10" />
                </div>   
            </div> 
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Date of Birth</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="date" id="dobText">
                </div>   
            </div>  
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Category</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <select id="genderCombo" class="combo-1">
                        <option value="M" selected>Male</option>
                        <option value="F">Female</option>
                    </select>
                </div>   
            </div>                                                  
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Contact Number</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="number" id="contactNoText" pattern="[0-9]+" maxlength="10">
                </div>   
            </div>     
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Contact Number 2</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="number" id="contactNoExtraText" pattern="[0-9]+" maxlength="10">
                </div>   
            </div>   
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Category</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <select id="categoryCombo" class="combo-1" onchange="update_memNo()">
                        <option value="general_1y" selected>General - 1 year</option>
                        <option value="general_5y">General - 5 year</option>
                        <option value="school">School</option>
                        <option value="foreign">Foreign</option>
                    </select>
                </div>   
            </div>  
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Date of Registration</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="date" id="regDateText" onchange="update_memNo()">
                </div>   
            </div>       
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Receipt Number</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="number" id="receiptNoText">
                </div>   
            </div>
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Membership Number</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="memberIdText" readonly>
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
            <h2>Enter member name:</h2>
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Name</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="nameText_renew" name="typeahead-name" class="typeahead-name tt-query" autocomplete="off" spellcheck="false">
                </div>   
            </div> 
            <div class="w3-row w3-container" style="display:none">
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Membership Number</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="text" id="memberIdText_renew" name="typeahead-id" class="typeahead-id tt-query" autocomplete="off" spellcheck="false">
                </div>   
            </div> 
            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Date of Renewal</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                    <input type="date" id="regDateText_renew">
                </div>   
            </div> 
            <div class="w3-row w3-container">
                <div class="w3-col w3-container" style="width:20%">
                    <p class="label-1">Membership Category</p>
                </div>
                <div class="w3-col w3-container" style="width:50%">
                <select id="categoryCombo_renew" class="combo-1">
                    <option value="general_1y" selected>General - 1 year</option>
                    <option value="general_5y">General - 5 year</option>
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
                    <input type="number" id="receiptNoText_renew">
                </div>   
            </div>
            <div class="w3-container" style="width: 100%; height: 10px; margin-top: 20px"></div>

            <div class="w3-row w3-container" >
                <div class="w3-col w3-container" style="width:65%">
                    <button id="submitBtn" style="float:right" onclick="renewMembership()">RENEW</button>  
                </div>   
            </div> 
        </div>                

        <footer class="w3-container">
            <div class="w3-container" style="width: 100%; height: 10px; margin-top: 20px"></div>            
        </footer>

    </div>

    <script>
        window.onload = function() {
            addMemberModalOpen();
        }
        $("#addMemberModal input").keyup(function () {
            if (this.value.length == this.maxLength) {
                var next = $(':input:eq(' + ($(':input').index(this) + 1) + ')');
                next.focus();
            }
        });
    </script>

</body>

</html>