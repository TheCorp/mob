listMsgs=[];
count=0;
function selOptionVal(){
	var optionValId=$("#optionValId").val();
	if(optionValId==""){
	  alert("Please select  option value!");
	}else if(optionValId=="delete"){
	  deleteSelctedMsgs();
	  $("#optionValId").val("");
	}
	/* else if(optionValId=="unread"){
	alert(optionValId);
	} */
}

function deleteSelctedMsgs(){
	chkCnt=$("input:checkbox");
	for (i=0;i<chkCnt.length;++ i)
	  {
	  if (chkCnt[i].checked){
	    listMsgs.push(chkCnt[i].value);
	    count++;
	    }
	  }
	 if(count!=0){
	 var  returnVal=confirm("Are you sure you want to delete these records?");
			 if(returnVal==true){
			 document.inboxForm.action="deleteMessageAction.action?ids="+listMsgs;
			 document.inboxForm.submit();
			  }else{
			  //alert("Records not deleted!")
			  document.inboxForm.action="myOutbox.action";
			   document.inboxForm.submit();
			  }
	
	 }else{
	  var selObj = document.getElementById("optionValId");
	  selObj.options[0].selected = "";
	  alert("Please select Message to delete!");
	 }
}

function deleteSentReadMsgs(){
var sentBoxId=$("#sentBoxId").val();
document.getElementById("deleteSentReadMsg").href= "deleteEmplSentReadMsgsAction.action?sentboxId="+sentBoxId;
}


