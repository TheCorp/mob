/* search contact for employer skype  */
var contactNames = new Array();
var contactSkypeIds = new Array();
var contactImages = new Array();
function searchContactsForEmployer() {
    var searchValue = $("#searchId").val();
    $.post("getContactsForEmployerSkype.action", 
    		{'name':searchValue}, function (data)
    {
         $("#divTable").remove();


        var htmlText = "<div class='bcb_controw-right22' id='divTable'><table  class='bc_bc_table' cellspacing='0' id='bcip_table1'>";
                      

		var names = data.names;
		var images = data.resizedMinPicture;
        for (var i = 0; i < names.length; i++) {
            var contacts = names[i];
            var name = contacts.name;
               var resizedMinPicture = contacts.resizedMinPicture;
            var skype = contacts.skype;
            if(skype != null){
                contactNames[i] = name;
                 contactImages[i] = resizedMinPicture;
                contactSkypeIds[i] = skype;
                if(resizedMinPicture != undefined && resizedMinPicture.length>0){
                	htmlText += "<tr><td width='11%'><img src='"+resizedMinPicture+"' width='44' height='44' /></td>" +
                            "<td class='bc_tbl_shad' width='60%'><div class='ER_hard_value'><div class='ER_hard_value'>" + name +
                            "</div></div></td><td width='29%'>"+
                            "<img src='http://c.skype.com/i/images/icons/favicon.ico'" + skype + "'/>&nbsp;&nbsp;<a href='#' onclick=selectContactForEmployer(" + i + ")>Chat!</a></td></tr>";
               }else{
					htmlText += "<tr><td width='11%'><img src='../styles/default/images/mobc_placeholder_thumb.jpg' width='44' height='44' /></td>" +
					"<td class='bc_tbl_shad' width='60%'><div class='ER_hard_value'><div class='ER_hard_value'>" + name +
					"</div></div></td><td width='29%'>"+
					"<img src='http://c.skype.com/i/images/icons/favicon.ico'" + skype + "'/>&nbsp;&nbsp;<a href='#' onclick=selectContactForEmployer(" + i + ")>Chat!</a></td></tr>";
                }
            
			}
		}
        htmlText += "</table></div>";

        $("#bcb_controw-right2").append(htmlText);

    }, "json");
    
}


function selectContactForEmployer(index){
    $("#selfrnd").css("display","none");
    $("#selectedfrnd").css("display","");

    $("#selectedname").html(contactNames[index]);
    $("#skypelink").attr("href","skype:" + contactSkypeIds[index] + "?call");
}

/* End search contact for employer skype */ 