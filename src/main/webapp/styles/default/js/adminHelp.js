
function editHelpContentInformation(id){
    var pageNameId=$("#pageNameId"+id).val();
	var valueId=$("#valueId"+id).val();
	$("#pageNametxtId").val(pageNameId);
    tinyMCE.get('helpTextareaId').setContent(valueId);
    $("#hellpId").val(id);
}

function checkadminHelpId(){
	var helpId=$("#hellpId").val();
    if(helpId==""){
       $("#helpForm").attr("action","addAdminHelpInfo.action");
       $("#helpForm").submit();
    
    }else {
    
    $("#helpForm").attr("action","updateAdminHelpInfo.action");
     $("#helpForm").submit();
    }
    
}