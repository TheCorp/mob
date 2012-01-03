function retrievePassword(){
	
	$("#notification_id").remove();
	$("#mail_sentnotification_id").remove();
	   
	var emailId=$("#emailId").val();
	
	if(emailId=="")
	{
		var htmlText= "<div class='exp_entry' id='notification_id'><p>Please enter Email Id</p></div>";
		$("#failure_notification_id").append(htmlText)
		return false;
	}
	else
	{
	 $.post("checkExistingEmailId.action",{email :emailId},function (data)
	   {      
	   
	   if(data.result=="error"){
	   
	    var htmlText= "<div class='exp_entry' id='notification_id'><p>Please enter valid Email Id</p></div>";
		 $("#failure_notification_id").append(htmlText)
		 return false;
	   }
	   
	   else
	   {
	   $.post("forgotPasswordAction.action",{'user.email' :emailId},function (data)
	    {
	     if(data.result="success"){
	     $("#emailId").val("");
	     var htmlText= "<div class='exp_entry' id='mail_sentnotification_id'><p>Password has been sent successfully to your Email ID.</p></div>";
		 $("#mail_sent_notification").append(htmlText)
	     
	     }
	     
	     
	    },"json");
	   }
	   
	   },"json");
   
   }

    
    
	        
}

