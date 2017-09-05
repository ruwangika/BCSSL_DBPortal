function dispAlert() {
    window.alert("Done");
}

// function loadNames(){
    
//     $.ajax({
//         url: "back/user_data.php",
//         method: "POST",
//         data: {r_type: 'get_names'},
//         dataType: "json",
//         success: function(data, status) {
//             console.log("Load Equations: " + status);
//             globalNameList = data;
//             loadNameList();
//         },
//         error: function(XMLHttpRequest, textStatus, errorThrown) { 
//             console.log("Load names error");
//             console.log(XMLHttpRequest);
//         }    
//     });

// }

function loadNames() {
    var nameDisp = $("#nameDisplay");
    nameDisp.empty();
    $.ajax({
        url: "load_data.php",
        method: "POST",
        data: {r_type: 'get_names'},
        dataType: "json",
        success: function(data, status) {
            var _len = data.Name.length;
            for (j = 0; j < _len; j++) {
                $('#nameDisplay').append($('<li/>', {
                    text: data.Name[j]
                }));
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            console.log(XMLHttpRequest);

        }
    });
}

function loadNameList(){
    // Load equations to the display. add equation pane onload->decComponents->loadEquations
    var _len = globalNameList.length;
    $("#nameDisplay").empty();
    for (var i = 0; i < _len; i++) {
        var name = globalNameList[i];   
        $("#equationList").append("<li>"+name+"</li>");
    }

}

function addMemberModalOpen() {
    $("#addMemberModal").show();
    $("#sendMailModal").hide();
    $("#findMemberModal").hide();
    $("#renewMembershipModal").hide();
}

function sendMailModalOpen() {
    $("#sendMailModal").show();
    $("#addMemberModal").hide();
    $("#findMemberModal").hide();
    $("#renewMembershipModal").hide();    
}

function findMemberModalOpen() {
    $("#findMemberModal").show();
    $("#sendMailModal").hide();
    $("#addMemberModal").hide();
    $("#renewMembershipModal").hide();    
}

function renewMembershipModalOpen() {
    $("#renewMembershipModal").show(); 
    $("#sendMailModal").hide();
    $("#addMemberModal").hide();
    $("#findMemberModal").hide();   
}


function addMember(){

    //var detailArray = [];

    var memberId = document.getElementById("memberIdText").value;
    var name = document.getElementById("nameText").value;
    var email = document.getElementById("emailText").value;
    var address = document.getElementById("addressText").value;
    var nic = document.getElementById("nicText").value;
    var dob = document.getElementById("dobText").value;
    var gender = document.getElementById("genderCombo").value;
    var contactNo = document.getElementById("contactNoText").value;
    var contactNo_extra = document.getElementById("contactNoExtraText").value;
    var category = document.getElementById("categoryCombo").value;
    var receiptNo = document.getElementById("receiptNoText").value;
    var regDate = document.getElementById("regDateText").value;

   // Save data to database
    $.ajax({
        url: "back/adapter.php",
        method: "POST",
        data: {
            r_type: 'add_member', 
            memberId: memberId, 
            name: name, 
            email:email, 
            address: address, 
            nic: nic, 
            dob: dob, 
            gender: gender,
            contactNo: contactNo, 
            contactNo_extra: contactNo_extra, 
            category: category, 
            receiptNo: receiptNo, 
            regDate: regDate
        },
        dataType: "text",
        success: function(data, status) {
            if (data=='"nulldata"') {
                console.log(data);
                window.alert("Enter data!");
            } else if (data=='"exists"') {
                console.log(data);
                window.alert("NIC already exists!");
            } else {
                console.log("Add member: " + status);
                window.alert("Member added");
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) { 
            console.log("Add member error.")
            console.log(XMLHttpRequest);
            window.alert("Error!");
        }    
    });

}

function sendMail() {
    
}

function logout() {
    $.ajax({
        url: "logout.php",
        method: "GET",
        dataType: "text",
        success: function(data, status) {
            console.log("Logout : " + status);
            location.href = 'login.php';
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) {
            console.log(XMLHttpRequest);

        }
    });

}

function update_memNo() {
    var category = $("#categoryCombo").val();
    var regDate = $("#regDateText").val();

    if (category == "" || regDate == "") return;

    var cat_str = category.slice(0, 1).toUpperCase();
    var date_str = regDate.slice(2, 4) + regDate.slice(5, 7);
    var id_str = "";
    
    $.ajax({
        url: "back/adapter.php",
        method: "POST",
        data: {r_type: 'get_id'},
        dataType: "text",
        success: function(data, status) {
            var str = (parseInt(data) + 1).toString();
            id_str = ("0000" + str).substr(-4,4);
            var memNo = cat_str + date_str + id_str;
            $("#memberIdText").val(memNo);

        },
        error: function(XMLHttpRequest, textStatus, errorThrown) { 
            console.log("Can't get ID!")
            console.log(XMLHttpRequest);
        }    
    });


}

// function zeroFill(number, width)
// {
//   width -= number.toString().length;
//   if ( width > 0 )
//   {
//     return new Array( width + (/\./.test( number ) ? 2 : 1) ).join( '0' ) + number;
//   }
//   return number + ""; // always return a string
// }

String.prototype.lpad = function(padString, length) {
    var str = this;
    while (str.length < length)
        str = padString + str;
    return str;
}

// On load
// $(function() {
//     var container = document.getElementById("addMemberModal");
//     container.onkeyup = function(e) {
//         var target = e.srcElement;
//         if (target.attributes["maxlength"]) {
//             var maxLength = parseInt(target.attributes["maxlength"].value, 10);
//             var myLength = target.value.length;
//             if (myLength >= maxLength) {
//                 var next = target;
//                 while (next = next.nextElementSibling) {
//                     console.log(next);
//                     if (next == null) {
//                         console.log("next==null");
//                         break;
//                     }
//                     if (next.tagName.toLowerCase() == "input") {
//                         console.log("next==input");
//                         next.focus();
//                         break;
//                     }
//                 }
//             }
//         }
//     }
// })
