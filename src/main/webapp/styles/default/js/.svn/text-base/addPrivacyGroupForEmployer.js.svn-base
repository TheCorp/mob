
function addPrivacygroup(){
	$("#privacygroupFailure").hide();
	$("#privacygroupSuccess").hide();
	$("#privacygroupEmpty").hide();
	var currentTime = new Date()
	var month = currentTime.getMonth() + 1
	var day = currentTime.getDate()
	var year = currentTime.getFullYear()
	
	if(day<10){
	day="0"+day;
	}	
	if(month<10){
	month="0"+month;
	}	

	var groupName = $("#groupName").val();	
  
	if(groupName=="")
	{
		$("#privacygroupEmpty").show();
		return;	
	}	
	    
	var c = groupName.charAt(0);
	var name = groupName.substring(1,groupName.length)
	groupName = c.toUpperCase()+name;  
	
	var htmlText= "<div class='sel_prof_row'><div class='sel_prof_col spc_privacygroup' >"+groupName+"</div><div class='sel_prof_col spc_accessto'></div>"+
	              "<div class='sel_prof_col spc_datecreated'>"+month + "-" + day + "-" + year+"</div></div>"
			 			 
		 $("#privacygroups").append(htmlText);
		 
		 $("#groupName").val("");
		 
		 $.post("../employer/newPrivacyGroupForEmployer.action",{'groupName':groupName,'profile.id':$("#profileId").val()},function(data)
	     {
	        if(data.result=="success")
	        {
	 	    //alert("Privacy group have been added successfully");
	 	    $("#privacygroupEmpty").hide();
			$("#privacygroupFailure").hide();
	 	    $("#privacygroupSuccess").show();
			}
			else{
			 $("#privacygroupEmpty").hide();
			 $("#privacygroupSuccess").hide();
			 $("#privacygroupFailure").show();	
			 }
		},"json");
	}
	
	