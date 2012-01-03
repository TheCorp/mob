/* Change Password */

function validateNewPassword()
{
    if($("#new_password").val()=="")
	{
		   //alert("Please enter New Password");
		   $("#newPassId").show();
		   $("#new_password").focus();
		   return false;
	}
	else
	{
	 $("#newPassId").hide();
	 $("#new_password").blur();
	}		
}
function validateVerifyNewPassword()
{
  if($("#verify_new_password").val()=="")
  {
		$("#newPassId").hide();
		$("#verifyNewPassId").show();
		$("#verify_new_password").focus();
		//alert("Please enter Verify New Password");
		return false;
  }
  else
  {
    $("#newPassId").hide();
   	$("#verifyNewPassId").hide();
	$("#verify_new_password").blur();
     
  }
}
function chageEmplrPassword()
{
		if($("#new_password").val()=="")
		{
		   //alert("Please enter New Password");
		   $("#newPassId").show();
		   return false;
		}		
		if($("#verify_new_password").val()==""){
		$("#newPassId").hide();
		$("#verifyNewPassId").show();
		//alert("Please enter Verify New Password");
		return false;
		}
		 if($("#old_password").val()==""){
		//alert("Please enter Old Password");
		$("#newPassId").hide();
		$("#verifyNewPassId").hide();
		$("#oldPassId").show();
		return false;
		}
		if($("#new_password").val()!=$("#verify_new_password").val()){
		//alert("you have entered wrong verify password");
		$("#newPassId").hide();
		$("#verifyNewPassId").hide();
		$("#oldPassId").hide();
		$("#wrongPassId").show();
		return false;
		} else{	
		checkPassword();
		}
		
	function checkPassword(){
	 var oldPassword=$("#old_password").val()
	 var newPassword=$("#new_password").val();
	  $.post("checkPassword.action",{oldPassword :oldPassword ,newPassword :newPassword },function(data)
   		{ 
	   		if(data.result=="success"){
	   		//alert("password has been changed. Please Re-Login");
	   		$("#wrongOldPassId").hide();
	   		$("#newPassId").hide();
		    $("#verifyNewPassId").hide();
		    $("#oldPassId").hide();
	   		$("#wrongPassId").hide();
	   		 bc_pop_up1('event',"confirm_delete2",["center",500]);
             $("#reLoginId").show(); 
	   		//document.editEmpForm.action = "${ctx}/public/landingpage.action";
	   		$("#new_password").val("");
	   		$("#verify_new_password").val("");
	   		$("#old_password").val("");
	   		return  true;
	   		}else{
	   		//alert("Wrong old password!")
	   		$("#newPassId").hide();
		    $("#verifyNewPassId").hide();
		    $("#oldPassId").hide();
	   		$("#wrongPassId").hide();
	   		$("#wrongOldPassId").show();
	   		return false;
	   		}
       },"json");
   }
}

/* End of Change Password */