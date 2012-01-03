/*Start of deleteEmprsentEmailMessages  */
listMsgs=[];
count=0;
cnt=0;
var msgList="";
var idArray="";
function emprSentMsgOptionVal(){
var emprOptionId=$("#emprOptionId").val();
	if(emprOptionId==""){
	  alert("Please select option!");
	}else if(emprOptionId=="delete"){
	  deleteSelctedMsgs();
	   $("#emprOptionId").val("");
	}
	/* else if(emprOptionId=="unread"){
	 markAsEmprUnreadMsgs();
	} */
}
function deleteSelctedMsgs(){
	chkCnt=$("input:checkbox");
	for (i=0;i<chkCnt.length;++ i)
	  {
	  if (chkCnt[i].checked)
	    {
	    listMsgs.push(chkCnt[i].value);
	    count++;
	    }
	  }
	 if(count!=0){
	 var  return_val=confirm("Are you sure you want to delete these records?");
		 if(return_val==true){
		 document.inboxForm.action="deleteEmplrMessageAction.action?ids="+listMsgs;
		 document.inboxForm.submit();
		  }else{
		 // alert("Records not deleted!")
		  document.inboxForm.action="employerOutBox.action";
		  document.inboxForm.submit();
		  }
	// document.getElementById("delete").href= "deleteEmplrMessageAction.action?ids="+listMsgs;
	 }else{
	 var selObj = document.getElementById("emprOptionId");
	 selObj.options[0].selected = "";
	 alert("Please select Message to delete!");
	 }
}

function markAsEmprUnreadMsgs(){
chkTotalCnt=$("input:checkbox");
for (j=0;j<chkTotalCnt.length;++ j){
	  if (chkTotalCnt[j].checked)
	    {
	    listMsgs.push(chkTotalCnt[j].value);
	    cnt++;
	    }
     }
     if(cnt!=0){
      msgList=listMsgs +","; 
      msgList=msgList.substring(0, msgList.length-1)
      idArray=msgList.split(",");
      for(k=0;k<idArray.length;++k){
      $("#unreadDivId"+idArray[k]).show();
      $("#msgesDivId"+idArray[k]).hide();
      }
   }else{
    var selObj = document.getElementById("emprOptionId");
	selObj.options[0].selected = "";
   alert("Please select message to  unread!");
   } 
}

function deleteEmprSentReadMsgs(){
var sentBoxRecdId=$("#sentBoxRecdId").val();
document.getElementById("deleteSentReadMsgs").href="deleteEmprSentMsgReadAction.action?setboxRecdId="+sentBoxRecdId;
}


/* End of deleteEmprSentEmailMessages  */