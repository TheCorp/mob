var contactNames = "";
var defaultInputTextColor = "#000000";
var acfb2;
var contactNames = "";
var contactNames = "";
var acfb2;
$(document).ready(function() {
    $("#build_acfb").hide();
    $("#textId").show();
    acfb2 = acfbuild('.city3', 'contactListAction.action');
	//$("#contactnameId").html(acfb2.getData());
    function acfbuild(cls, url) {
        var ix = $("input" + cls);
        ix.addClass('acfb-input').wrap('<ul class="' + cls.replace(/\./, '') + ' acfb-holder"></ul>');
        return $("ul" + cls).autoCompletefb({urlLookup:url});
    }

});

function getContacts(){
var profileListId=$("#profileListId").val();
    contactNames = acfb2.getData();
    if(profileListId==""){
	    $("#fromAddressId").show();
	    $("#fromAddressId").html("Plase select from address")
    }else if (contactNames == "") {
         $("#messageId").show(); 
    } else {
        $("#messageId").hide();
        $("#fromAddressId").hide();
        $("#composeMessageForm").submit();
    }
}


function inputOnFocus(what)
	{
	if (!what.alreadyClicked)
		{
		what.value = "";
		what.style.color = defaultInputTextColor;
		what.alreadyClicked = true;
		}
	}
	
	
	