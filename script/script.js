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
        data: {field: 'get_names'},
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
}

function sendMailModalOpen() {
    $("#sendMailModal").show();
    $("#addMemberModal").hide();
}
