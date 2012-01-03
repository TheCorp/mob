/*Start of delete EmprReceivedEmail Message  */
var listEmprRecdMsgs=[];
var listEmprUnreadmsgs=[];

function selectEmprMsgOption(){
	var emprInboxSelId=$("#emprInboxSelId").val();
	 if(emprInboxSelId==""){
	 alert("Please select option!")
	 }
	 if(emprInboxSelId=="unread"){
	   //code for higlight checked messages
	   markAsEmprUnreadMsgs();
	   $("#emprInboxSelId").val("");
	}
	 if(emprInboxSelId=="delete"){
	 //code for deleting checked messages
	  deleteEmplrRecdMsgs()
	  $("#emprInboxSelId").val("");
	 }
}

function deleteEmplrRecdMsgs(){
  var count=0;
	var chkCnt=$("input:checkbox");
	for (i=0;i<chkCnt.length;++ i)
	  {
	  if (chkCnt[i].checked)
	    {
	    listEmprRecdMsgs.push(chkCnt[i].value);
	    count++;
	    }
    }
	  
	 if(count!=0){
		 var  return_val=confirm("Are you sure you want to delete these records?");
		 if(return_val==true){
		 document.inboxForm.action="deleteEmplrRecdMsgsAction.action?ids="+listEmprRecdMsgs;
		 document.inboxForm.submit();
		  }else{
		  //alert("Records not deleted!")
		  document.inboxForm.action="employerInbox.action";
		  document.inboxForm.submit();
		  }
	 }else{
	 var selObj = document.getElementById("emprInboxSelId");
	 selObj.options[0].selected = "";
	 alert("Select Message to delete!");
	 }
}

function markAsEmprUnreadMsgs(){
	var cnt=0;
	var msgList="";
	var idArray="";
	
	var chkTotalCnt=$("input:checkbox");
	for (j=0;j<chkTotalCnt.length;++ j){
	  if (chkTotalCnt[j].checked)
	    {
	    listEmprUnreadmsgs.push(chkTotalCnt[j].value);
	    cnt++;
	    }
     }
      if(cnt!=0){
      document.inboxForm.action="markAsUnreadEmprAction.action?ids="+listEmprUnreadmsgs;
	  document.inboxForm.submit();
	  
      msgList=listEmprUnreadmsgs +","; 
      msgList=msgList.substring(0, msgList.length-1)
      idArray=msgList.split(",");
      for(k=0;k<idArray.length;++k){
      $("#unreadDivId"+idArray[k]).show();
      $("#msgesDivId"+idArray[k]).hide();
      $("#emprInboxSelId").val("");
      
      }
   }else{
	   var selObj = document.getElementById("emprInboxSelId");
	   selObj.options[0].selected = "";
	   $("#emprInboxSelId").val("");
   } 
    
}
function deleteEmprRecdReadMsgs(){
var emprinBoxId=$("#emprinBoxId").val();
document.getElementById("deleteEmprReadMsg").href="deleteEmprReadMsgs.action?recdReadEmprId="+emprinBoxId;
}

/* End of deleteEmprReceivedEmailMessages */