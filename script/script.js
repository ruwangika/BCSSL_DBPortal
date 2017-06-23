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

    var id = parseInt(document.getElementById("memberIdText").value);
    var name = document.getElementById("nameText").value;
    var email = document.getElementById("emailText").value;
    var address = document.getElementById("addressText").value;
    var nic = document.getElementById("nicText").value;
    var dob = document.getElementById("dobText").value;
    var contactNo = document.getElementById("contactNoText").value;
    var category = document.getElementById("categoryCombo").value;
    var receiptNo = document.getElementById("receiptNoText").value;
    var regDate = document.getElementById("regDateText").value;

    //detailArray.push(id, name, email, address, nic, dob, contactNo, category, receiptNo, regDate);
    
    //window.alert(detailArray);

    $.ajax({
        url: "back/adapter.php",
        method: "POST",
        data: {r_type: 'add_member', id: id, name: name, email:email, address: address, nic: nic, dob: dob, contactNo: contactNo, category: category, receiptNo: receiptNo, regDate: regDate},
        dataType: "text",
        success: function(data, status) {
            console.log("Add member: " + status);
            window.alert("Member added");
        },
        error: function(XMLHttpRequest, textStatus, errorThrown) { 
            console.log("Add member error.")
            console.log(XMLHttpRequest);
        }    
    });

}

function sendMail() {
    
}
