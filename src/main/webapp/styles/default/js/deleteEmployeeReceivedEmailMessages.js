/*delete Employee Received email message  */

var listRecdMsgs=[];
var listEmpUnreadmsgs=[];

function selctMsgOption(){
	var optionId=$("#optionId").val();
	if(optionId==""){
	 alert("Please select option!")
	}
	 if(optionId=="delete"){
	 deleteEmplRecdMsgs();
	 $("#optionId").val("");
	}
	 if(optionId=="unread"){
	  markAsUnRead();
	 var selObj = document.getElementById("optionId");
	 selObj.options[0].selected = "";
	 $("#optionId").val("");
  }
}
function deleteEmplRecdMsgs(){
var count=0;
var	chkCnt=$("input:checkbox");
	for (i=0;i<chkCnt.length;++ i)
	  {
	  if (chkCnt[i].checked)
	    {
	    listRecdMsgs.push(chkCnt[i].value);
	    count++;
	    }
	  }
	 if(count!=0){
			var  return_val=confirm("Are you sure you want to delete these records?");
			 if(return_val==true){
			 document.inboxForm.action="deleteEmplRecdMsgsAction.action?ids="+listRecdMsgs;
			 document.inboxForm.submit();
			 }else{
			 // alert("Records not deleted!")
			  document.inboxForm.action="myInbox.action";
			  document.inboxForm.submit();
			 }
	
	 }else{
        var selObj = document.getElementById("optionId");
	    selObj.options[0].selected = "";
	    alert("Please select message to delete!");
	
	 }
}

function  markAsUnRead(){
var chkProid=$("#chkProid").val();
var cntVar=0;
var msgList="";
var idArray="";
var msgid=$("#msgesDivId").val();

var chkTotalCnt=$("input:checkbox");
for (j=0;j<chkTotalCnt.length;++ j){
	  if (chkTotalCnt[j].checked)
	    {
	    listEmpUnreadmsgs.push(chkTotalCnt[j].value);
	    cntVar++;
	    }
     }
      if(cntVar!=0){
     document.inboxForm.action="markAsEmplRecdMsgsAction.action?ids="+listEmpUnreadmsgs;
	 document.inboxForm.submit();
     msgList=listEmpUnreadmsgs +","; 
     msgList=msgList.substring(0, msgList.length-1)
     
     idArray=msgList.split(",");
     
      for(k=0;k<idArray.length;++k){
      $("#unreadDivId"+idArray[k]).show();
      $("#msgesDivId"+idArray[k]).hide();
   
      chkTotalCnt=""
      }
    
   }else{
    /* var selObj = document.getElementById("optionId");
	selObj.options[0].selected = ""; */
	
    alert("Please select message to  unread!");
    var selObj = document.getElementById("optionId");
	selObj.options[0].selected = "";
   
   } 
}
function deleteRecdReadMsgs(){
var inboxId=$("#inBoxId").val();
document.getElementById("deleteReadMsgs").href= "deleteEmplRecdReadMsgsAction.action?inBoxid="+inboxId;
}


function updateGroupRequest(){
//${ctx}/employee/updateGroupJoinRequest.action
var inboxId=$("#inBoxId").val();
document.getElementById("updateGrpRequestId").href="updateGroupJoinRequest.action?inbox.id="+inboxId;

/* 
alert("updateGroupRequest")
var inboxId=$("#inBoxId").val();
var associtedProfileId=$("#associtedProfileId").val();
alert(associtedProfileId);
var messageType=$("#messageType").val();
alert(messageType);
alert("updateGroupRequest()" +inboxId)
$.post("updateGroupJoinRequest.action",{'inbox.id' :inboxId},
	            function(data)
	            {
	                if (data.result == "success") {
	                	$("#msgSuccess").show().fadeOut(5000);
					}
	            }, "json"); */

}



/* End of delete Employee Received email message */