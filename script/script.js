// $(function() {
//     $("#dobText").datepicker();

    
    
//     $("#dobText").datepicker("option", "dateFormat", "yy-mm-dd");
//     // $("#startDatePicker").datepicker("setDate", todayDate());
// });


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
        url: "back/post_adapter.php",
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
                clearForm();
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) { 
            console.log("Add member error.");
            console.log(XMLHttpRequest);
            window.alert("Error!");
        }    
    });

}

function renewMembership() {
    var name = document.getElementById("nameText_renew").value;
    var regDate_renew = document.getElementById("regDateText_renew").value;
    var category_renew = document.getElementById("categoryCombo_renew").value;
    var receiptNo_renew = document.getElementById("receiptNoText_renew").value;

    $.ajax({
        url: "back/post_adapter.php",
        method: "POST",
        data: {
            r_type: 'renew_membership',
            name: name, 
            regDate_renew: regDate_renew,
            category_renew: category_renew,
            receiptNo_renew: receiptNo_renew
        },
        dataType: "text",
        success: function(data, status) {
            if (data=='"nulldata"') {
                console.log(data);
                window.alert("Enter data!");
            } else if (data=='"notfound"') {
                console.log(data);
                window.alert("Member not found!");
            } else {
                console.log("Renew membership: " + status);
                window.alert("Membership renewed.");
            }
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) { 
            console.log("Renew membership error.");
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

    if (category === "" || regDate === "") return;

    var cat_str = category.slice(0, 1).toUpperCase();
    var date_str = regDate.slice(2, 4) + regDate.slice(5, 7);
    var id_str = "";
    
    $.ajax({
        url: "back/post_adapter.php",
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
            console.log("Can't get ID!");
            console.log(XMLHttpRequest);
        }    
    });


}

function clearForm() {
    $("input[type=text], input[type=date], input[type=number], input[type=email], textarea").val("");
}

function initDateTimePicker() {
    $('.input-append').datetimepicker({
        pickDate: false
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

//

// function initTypeaheadName() {
//     $('#nameText_renew').typeahead({
//         hint: false,
//         name: 'typeahead',
//         remote:'back/search.php?key=%QUERY',
//         limit : 10,
//     });
// }

// function initTypeaheadId() {
//     $('#memberIdText_renew').typeahead({
//         hint: false,
//         name: 'typeahead',
//         remote:'back/searchid.php?id=%QUERY',
//         limit : 10,
//     });
// }

function fetchMemberDetails() {
    emailAddressList = [];
    var tableBody = document.getElementById('memberDetailTabBody');
    $('#memberDetailTabBody').empty();
    var memberGroup = $("#memberGroupCombo").val();

    $.ajax({
        url: "back/get_adapter.php",
        method: "GET",
        data: {
            r_type: 'get_details',
            memGroup: memberGroup
        },
        dataType: "json",
        success: function(data, status) {
            displayDataInTable(data);
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) { 
            console.log("Cannot retrieve data!");
            console.log(XMLHttpRequest);
        }    
    });
}

function displayDataInTable(data) {
    for (var i = 0; i < data.length; i++) {
        var member = data[i];
        var rowStr = '<tr><td>'+member.ID+'</td><td>'+member.name+'</td><td>'+member.email+'</td><td>'+member.contactNo+'</td><td>'+member.membershipNo+'</td></tr>';
        emailAddressList.push(member.email);
        var tableBody = document.getElementById('memberDetailTabBody');
        tableBody.innerHTML += rowStr;
    }
}

function copyEmailAddresses() {
    copyToClipboard(emailAddressList.toString());
}

function copyToClipboard(text) {
    if (window.clipboardData && window.clipboardData.setData) {
        // IE specific code path to prevent textarea being shown while dialog is visible.
        return clipboardData.setData("Text", text); 

    } else if (document.queryCommandSupported && document.queryCommandSupported("copy")) {
        var textarea = document.createElement("textarea");
        textarea.textContent = text;
        textarea.style.position = "fixed";  // Prevent scrolling to bottom of page in MS Edge.
        document.body.appendChild(textarea);
        textarea.select();
        try {
            return document.execCommand("copy");  // Security exception may be thrown by some browsers.
        } catch (ex) {
            console.warn("Copy to clipboard failed.", ex);
            return false;
        } finally {
            document.body.removeChild(textarea);
        }
    }
}