/* Edit employer Account*/
function editCulture()
{
  hide_pop_up('confirm_delete2');
  $("#cultureId1").hide();
  $("#cultureId2").show();
  $("#cultureImgId1").hide();
  $("#cultureImgId2").show();
 

}
function updateCultureEmplr(cultureImgId2)
{   
     
     var culture =$("#cultureTextId").val();
   
   $.post("updateEmployerAccount.action",{'employer.culture':culture},function (data)
   {
                
          if(data.result =="success"){
          // alert("updated Data sucessfully");
           $("#cultureId1").html(data.culture);
           bc_pop_up1('event',"confirm_delete2",["center",250])
           $("#updateSuccess").show();  
            if(cultureImgId2=="cultureImgId2")
            {
	               $("#cultureImgId2").hide();
	               $("#cultureId2").hide();
	               $("#cultureId1").show();
	               $("#cultureImgId1").show();
            }
         }  
     
 },"json"); 


}
function cancelCulture(cultureImgId2)
{
   hide_pop_up('confirm_delete2');
   $("#cultureImgId2").hide()
   $("#cultureId2").hide();
   $("#cultureId1").show();
   $("#cultureImgId1").show();

}
function editAdditionalInfo()
{
   hide_pop_up('confirm_delete2');
   $("#additionalInfoId1").hide();
   $("#additionalInfoId2").show();
   $("#additionalInfoImgId1").hide();
   $("#additionalInfoImgId2").show();
   
}

function updateAdditionalInfoEmplr(additionalInfoImgId2)
{
      var additionalInfo =$("#additionalInfoTextId").val();
   
   $.post("updateEmployerAccount.action",{'employer.additionalInfo':additionalInfo},function (data)
   {
                 
          if(data.result =="success"){
          // alert("updated Data sucessfully");
           $("#additionalInfoId1").html(data.additionalInfo);
           bc_pop_up1('event',"confirm_delete2",["center",250])
           $("#updateSuccess").show();  
            if(additionalInfoImgId2=="additionalInfoImgId2")
            {
	               $("#additionalInfoImgId2").hide();
	               $("#additionalInfoId2").hide();
	               $("#additionalInfoId1").show();
	               $("#additionalInfoImgId1").show();
            }
         }  
     
 },"json"); 


}
function cancelAdditionalInfo(cultureImgId2)
{

  hide_pop_up('confirm_delete2');
   $("#additionalInfoImgId2").hide()
   $("#additionalInfoId2").hide();
   $("#additionalInfoId1").show();
   $("#additionalInfoImgId1").show();
}

function editOrgInfo()
{
   hide_pop_up('confirm_delete2');
   $("#orgInfoId1").hide();
   $("#orgInfoId2").show();
   $("#orgInfoImgId1").hide();
   $("#orgInfoImgId2").show();


}
function updateOrgInfoEmplr(orgInfoImgId2)
{
     var orgInfoTextId =$("#orgInfoTextId").val();
   
   $.post("updateEmployerAccount.action",{'employer.orgInfo':orgInfoTextId},function (data)
   {
               
          if(data.result =="success"){
          // alert("updated Data sucessfully");
           $("#orgInfoId1").html(data.orgInfo);
           bc_pop_up1('event',"confirm_delete2",["center",250])
           $("#updateSuccess").show();  
            if(orgInfoImgId2=="orgInfoImgId2")
            {
	               $("#orgInfoId2").hide();
	               $("#orgInfoImgId2").hide();
	               $("#orgInfoId1").show();
	               $("#orgInfoImgId1").show();
            }
         }  
     
 },"json"); 

}
function cancelOrgInfo(orgInfoImgId2)
{
  hide_pop_up('confirm_delete2');
   $("#orgInfoId2").hide()
   $("#orgInfoImgId2").hide();
   $("#orgInfoId1").show();
   $("#orgInfoImgId1").show();
}
function editAccount(editid)
{
$("#success1").hide();
$("#success2").hide();
$("#updateSuccess").hide();
hide_pop_up('confirm_delete2');
	  if(editid=="edit"){
	     $("#data").hide();
	     $("#data1").show();
	     $("#editBtnId").hide();
	     $("#acceptId").show();
	     
	     $("#data11").show();
	     $("#data12").hide();
	     $("#editBtnId1").show();
	     $("#acceptId1").hide();
	     
	     $("#emailId").show();
	    $("#emailId1").hide();
	    $("#emprEditImgId").show();
	    $("#emilAcceptId").hide();
	     
	     
	   }else if(editid=="edit1"){
	     $("#data11").hide();
	     $("#data12").show();
	     $("#editBtnId1").hide();
	     $("#acceptId1").show();
	     
	     $("#data").show();
	     $("#data1").hide();
	     $("#editBtnId").show();
	     $("#acceptId").hide();
	     
	    $("#emailId").show();
	    $("#emailId1").hide();
	    $("#emprEditImgId").show();
	    $("#emilAcceptId").hide();
	     
	   }else if(editid=="emprEmaileditId"){
	    $("#emailId").hide();
	    $("#emailId1").show();
	    $("#emprEditImgId").hide();
	    $("#emilAcceptId").show();
	    
	     $("#data").show();
	     $("#data1").hide();
	     $("#editBtnId").show();
	     $("#acceptId").hide();
	     
	     $("#data11").show();
	     $("#data12").hide();
	     $("#editBtnId1").show();
	     $("#acceptId1").hide();
	    
	  }
      
}

 function updateAccountEmployer(accpetID){
   var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
   var  address = $("#addressId").val();
   var  city = $("#cityId").val();
   var  state = $("#stateId").val();
   var  zipcode = $("#zipCodeId").val();
   var email=$("#emprEmailId").val();
  
   if(address.length>45)
   {
     $("#addressLength").show();
     return false;
   }
    if(city.length>45)
   {
     $("#addressLength").show();
     return false;
   }
    if(state.length>45)
   {
     $("#addressLength").show();
     return false;
   }
  
$.post("updateEmployerAccount.action",{'employer.email' :email,'employer.address' :address,'employer.city':city,'employer.state':state,'employer.zipcode':zipcode},function (data)
 {     
          if(data.result =="success"){
          // alert("updated Data sucessfully");
           $("#addressLength").hide();
           bc_pop_up1('event',"confirm_delete2",["center",450])
           $("#updateSuccess").show();  
            if(accpetID=="acceptId"){
	          $("#data").show();
	          $("#data").html(address +" "+ city)
              $("#data1").hide();	
              $("#editBtnId").show();
              $("#acceptId").hide();
           }else if(accpetID=="acceptId1"){
             $("#data11").show();
           	 $("#data11").html(state +" "+ zipcode)
           	 $("#data12").hide();
           	 $("#editBtnId1").show();
           	 $("#acceptId1").hide();
           }else if(accpetID=="emilAcceptId"){
            $("#emailId").show();
             $("#emailId").html(email)
			$("#emailId1").hide();
			$("#emprEditImgId").show();
			$("#emilAcceptId").hide();
           }
          }
          else{
          
          //alert("Not updated Data sucessfully");
           bc_pop_up1('event',"confirm_delete2",["center",450])
           $("#updateSuccess").hide(); 
           $("#failure").show();
            
          }                           
     
 },"json"); 
 
}


function  cancelEmployerAccnt(cancelId)
{
 $("#success1").hide();
 $("#success2").hide();
hide_pop_up('confirm_delete2');
 if(cancelId=="acceptId"){
     $("#data").show();
     $("#data1").hide();
     $("#editBtnId").show();
     $("#acceptId").hide();
   }else if(cancelId=="acceptId1"){
     $("#data11").show();
     $("#data12").hide();
     $("#editBtnId1").show();
     $("#acceptId1").hide();
  }else if(cancelId=="emilAcceptId"){
	  $("#emailId").show();
	  $("#emailId1").hide();
	  $("#emprEditImgId").show();
	  $("#emilAcceptId").hide();
  }
  
}

function updateEmailAccountEmplr(accpetID){
 var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
 var email=$("#emprEmailId").val();
    
 
    if (filter.test(email)){
        $("#success1").hide();
        $("#success2").hide();
        $("#emilLength").hide();
       emprEmailValidate(accpetID);
     }else if(email==""){
      //alert("Please Enter Email address!");
      $("#success1").hide();
      $("#emilLength").hide();
      $("#success2").show();
       return false;
     }else if(email.length>45)
     {
       $("#success1").hide();
       $("#success2").hide();
       $("#emilLength").show();
       return false;
     }
     else{
     //alert("Not a valid Email address!");
     $("#success2").hide();
     $("#emilLength").hide();
     $("#success1").show();
     return false;
    }
}
function  emprEmailValidate(accpetID)
{
    
   $.post("emprEmailValidate.action",{email : $("#emprEmailId").val()},function (data)
   {      
                                       
        if(data.result=="success")
         {
              updateAccountEmployer(accpetID)  
               return  true;
         }else
              {
              //alert("Email already Exist please try again");
             bc_pop_up1('event',"confirm_delete2",["center",400])
              $("#success").show();  
               return false;
              }
    },"json");
}

function  updateEmprEmail(){
alert("updated:-");
}

/* popup for displaing messagebox  */
function bc_pop_up1(e,pop_up_id,location)
	{
	 
	  
	if (!e) var e = window.event;
	var p = document.getElementById(pop_up_id);
	p.style.visibility = "hidden";
	p.style.display = "block"; // have to display the element to grab its width + height
	if (location)
		{
		var x = 0;
		var y = 0;
		var rel;
		var ctr = getCenterOfScreen();
		var whe = getWidthHeightOf(p);
		switch(location[2])
			{
			case "absolute" : rel = "absolute";break;
			case "relative" : rel = "relative";break;
			case "mouse" : rel = "absolute";break;
			case "offset_mouse" : rel = "absolute";break;
			default : rel = "absolute";
			}
		if (!isNaN(location[0])) x = location[0];
		else if (location[0] == "center" || location[0] == "middle") x = ctr[0]-whe[0]/2;
		if (!isNaN(location[1])) y = location[1];
		else if (location[1] == "center" || location[1] == "middle") y = ctr[1]-whe[1]/2;
		if (location[2] == "mouse")
			{
			var mxy = getMouseXY(e);
			x += mxy[0];
			y += mxy[1];
			}
		else if (location[2] == "negoffset_mouse")
			{
			var mxy = getMouseXY(e);
			x = mxy[0] - whe[0] - x;
			y = mxy[1] - whe[1] - y;			
			}
		p.style.position = rel;
		p.style.left = Math.round(x)+"px";
		p.style.top = Math.round(y)+"px";
		}
	p.style.visibility = "visible";
	
	return false;
	}
function hide_pop_up(pop_up_id)
	{
	
	document.getElementById(pop_up_id).style.display = "none";
	return false;
	}
function getWidthHeightOf(element)
	{
	var w = 0;
	var h = 0;
	if (element.clientWidth && element.clientHeight)
		{
		w = element.clientWidth;
		h = element.clientHeight;
		}
	return [w,h];
	}

function getCenterOfScreen()
	{
	var x = 0;
	var y = 0;
	if (window.clientWidth && window.clientHeight)
		{
		x = window.clientWidth/2;
		y = window.clientHeight/2;
		}
	else
		{
		var b = document.getElementsByTagName("body")[0];
		if (b.clientWidth && b.clientHeight)
			{
			x = b.clientWidth/2;
			y = b.clientHeight/2;			
			}
		}
	return [x,y];
	}

function getMouseXY(e)
	{
	var x = 0;
	var y = 0;
	if (e.pageX && e.pageY)
		{
		x = e.pageX;
		y = e.pageY;
		}
	else if (e.clientX && e.clientY)
		{
		x = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
		y = e.clientY + document.body.scrollTop + document.documentElement.scrollTop;
		}
	return [x,y];
	}

function addOnloadEvent(func)
	{
	if (window.addEventListener) window.addEventListener("load",func,false);
	else if (window.attachEvent) window.attachEvent("onload",func);
	}

function checkClass(element,name)
	{
	var names = name.split(" ");
	for (var i=0;i<names.length;i++)
		{
		if (element.attributes["class"] && element.attributes["class"].value == names[i]) return true;
		else if (element.className && element.className == names[i]) return true;
		else if (element.getAttribute && element.getAttribute("class") == names[i]) return true;
		}
	return false;
	}
/* End of edit employer Account    */	


/* edit image for employer   */
function editImage()
{
 
 bc_pop_up1('event',"confirm_delete3",[100,320])
 
}
function editImageForEmployer()
{
   $("#emprPicId").html("");
  if($("#uploadpic").val()=="")
  {
    //alert("Please Select Picture");
     $("#emprPicId").html("Please select picture");
    return false;
  }
  var file = $("#uploadpic").val();
    extArray = new Array(".jpg", ".gif");
    allowSubmit = false;
    
    if (!file) return;
    while (file.indexOf("\\") != -1)
    
        file = file.slice(file.indexOf("\\") + 1);
        ext = file.slice(file.indexOf(".")).toLowerCase();
        for (var i = 0; i < extArray.length; i++) {
            if (extArray[i] == ext) {
                allowSubmit = true;
                break;
            }
        }
        if (allowSubmit)
        {
           $("#emprPicId").html('');	
            document.editFormId.submit();     
           return true;
         }
        else
        {
           /* alert("Please only upload files that end in types:  "
                    + (extArray.join("  ")) + "\nPlease select a new "
                    + "file to upload and submit again."); */
            
        $("#emprPicId").html('<h5>Please upload .jpg or .gif files');      
        return false;            
               
       }
 

}
function cancelEditImage()
{
$("#emprPicId").html('');	
 hide_pop_up("confirm_delete3");
}


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
    var  old_password = $("#old_password").val();
    var  new_password = $("#new_password").val();
    var  verify_new_password = $("#verify_new_password").val();
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

/* set Default profile as another employer profile  */
function getProfilesList(){
	$("#defaultProfileForm").attr("action","listProfile.action");
	$("#defaultProfileForm").submit();
}
function deleteOldDefaultProfile(){
	
	$("#defaultProfileForm").submit();
}
function setAsDefaultProfile(divid){
		var newDefaultProfileId=$("#newDefaultProfileId").val();
		$("#progress").show();
		$("#selContact").hide();
			$.post("setAsDefaultProfileForEmployer.action",{'newDefaultProfile.id':newDefaultProfileId},function (data)
			{
	                if(data.result=="success")
	                {
	                	$("#contact_details").hide();	
	                  	$("#progress").hide();
	                  	$("#changeprofile").hide();	
	                  	$("#success").show();
	                }
	                else
	                {
	                	$("#contact_details").hide();	
	                	$("#changeprofile").hide();	
	                	$("#progress").hide();
	                	$("#failure").show();
	                }        
			},"json");
		
			
}

function hide_pop_up(pop_up_id)
	{
	$("#progress").hide();
	$("#success").hide();
	$("#failure").hide();
	$("#selContact").show();
	$("#changeprofile").hide();	
	//var firstValue = document.getElementById("selContactId").options[0].value;
	//document.getElementById("selContactId").value=firstValue
	document.getElementById(pop_up_id).style.display = "none";
	return false;
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

function popup_delete_defaultProfile(e,profileId,pop_up_id,location)
	{
	 hide_pop_up('confirm_delete2');
	$("#defaultProfileId").val(profileId);	
	if (!e) var e = window.event;
	var p = document.getElementById(pop_up_id);
	p.style.visibility = "hidden";
	p.style.display = "block"; // have to display the element to grab its width + height
	if (location)
		{
		var x = 0;
		var y = 0;
		var rel;
		var ctr = getCenterOfScreen();
		var whe = getWidthHeightOf(p);
		switch(location[2])
			{
			case "absolute" : rel = "absolute";break;
			case "relative" : rel = "relative";break;
			case "mouse" : rel = "absolute";break;
			case "offset_mouse" : rel = "absolute";break;
			default : rel = "absolute";
			}
		if (!isNaN(location[0])) x = location[0];
		else if (location[0] == "center" || location[0] == "middle") x = ctr[0]-whe[0]/2;
		if (!isNaN(location[1])) y = location[1];
		else if (location[1] == "center" || location[1] == "middle") y = ctr[1]-whe[1]/2;
		if (location[2] == "mouse")
			{
			var mxy = getMouseXY(e);
			x += mxy[0];
			y += mxy[1];
			}
		else if (location[2] == "negoffset_mouse")
			{
			var mxy = getMouseXY(e);
			x = mxy[0] - whe[0] - x;
			y = mxy[1] - whe[1] - y;			
			}
		p.style.position = rel;
		p.style.left = Math.round(x)+"px";
		p.style.top = Math.round(y)+"px";
		}
	p.style.visibility = "visible";
	return false;
	}


function getWidthHeightOf(element)
	{
	var w = 0;
	var h = 0;
	if (element.clientWidth && element.clientHeight)
		{
		w = element.clientWidth;
		h = element.clientHeight;
		}
	return [w,h];
	}

function getCenterOfScreen()
	{
	var x = 0;
	var y = 0;
	if (window.clientWidth && window.clientHeight)
		{
		x = window.clientWidth/2;
		y = window.clientHeight/2;
		}
	else
		{
		var b = document.getElementsByTagName("body")[0];
		if (b.clientWidth && b.clientHeight)
			{
			x = b.clientWidth/2;
			y = b.clientHeight/2;			
			}
		}
	return [x,y];
	}

function getMouseXY(e)
	{
	var x = 0;
	var y = 0;
	if (e.pageX && e.pageY)
		{
		x = e.pageX;
		y = e.pageY;
		}
	else if (e.clientX && e.clientY)
		{
		x = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft;
		y = e.clientY + document.body.scrollTop + document.documentElement.scrollTop;
		}
	return [x,y];
}
	var editEmployerAccountStatus;
	
	function editEmployerAccDetails1(){

		editEmployerAccountStatus=true;
		var organizationName=$("#organizationName").val();
		var emailId=$("#emailId").val();
		var website=$("#WebsiteId").val();
		var phoneNumber=$("#phoneNumberId").val();
		var SkypeId=$("#SkypeId").val();
		var missionStmt=$("#missionstatementId").val();
		var city=$("#CityID").val();
		var add1=$("#address1Id").val();
		var add2=$("#address2Id").val();
		var zip=$("#zipcodeId").val();
		
		validateEmployer(organizationName,'orgNameimageArea','orgNamemessageArea');
		validateEmprWebSite(website,'webSiteimageArea','webSitemessageArea');
		checkUserEmail(emailId,'emailimageArea','emailmessageArea');
	 	validatePhoneNumber(phoneNumber,'phoneNoimageArea','phoneNomessageArea');
	 	
	 	validateEmprAddress(add1,'add1imageArea','add1messageArea');
	 	validateEmprAddress(add2,'add2imageArea','add2messageArea');
	 	
	 	validateEmprCity(city,'cityimageArea','citymessageArea');
	 	validateEmpZipCode(zip,'zipimageArea','zipmessageArea')
	 	
	 	validateMissionStateMent(missionStmt,'missionimageArea','missionmessageArea');
	 	
	 	validateChangePassword();
	 	if(editEmployerAccountStatus){
	 		$("#employerEditProfile").attr("action", "listopportunities1.action");
	 	}
	 	return editEmployerAccountStatus;
	}
	
	var resetPasswordStatus;
	function validateChangePassword(currentPassword,newPassword,confirmPassword){
	
		resetPasswordStatus= true;
	
		//var currentPass=$("#currentPass").val();
		var currentPassword=$("#old_password").val();
		var newPassword=$("#new_password").val();
		var confirmPassword=$("#verify_new_password").val();
		
		if(currentPassword!="" || newPassword!="" || confirmPassword!=""){
			checkFieldValidations(currentPassword,'currPassimageArea','currPassmessageArea',"Current password", 6, 12);
			checkFieldValidations(newPassword,'newPassimageArea','newPassmessageArea',"New password", 6, 12);
			checkFieldValidations(confirmPassword,'confirmPassimageArea','confirmPassmessageArea',"Confirm password", 6, 12);
			
			if(resetPasswordStatus){
				/*if (currentPass != currentPassword) {
				
					setMessageForEmprAccountValidation("Current password given is incorrect"
					,false,'currPassimageArea','currPassmessageArea');
					editEmployerAccountStatus=false;
					
				} else*/ 
				
				if (currentPassword == newPassword) {
					
					setMessageForEmprAccountValidation("Old and New passwords should not be same"
					,false,'newPassimageArea','newPassmessageArea');
					editEmployerAccountStatus=false;
					
				} else if (newPassword != confirmPassword) {
					
					setMessageForEmprAccountValidation("Passwords do not match, please re-enter"
					,false,'confirmPassimageArea','confirmPassmessageArea');
					editEmployerAccountStatus=false;
					
				} else {
					
					setMessageForEmprAccountValidation("",true,'currPassimageArea','currPassmessageArea');
					setMessageForEmprAccountValidation("",true,'newPassimageArea','newPassmessageArea');
					setMessageForEmprAccountValidation("",true,'confirmPassimageArea','confirmPassmessageArea');
				}
			}else{
				editEmployerAccountStatus=false;
			}
		}else{
			setMessageForEmprAccountValidation("",true,'currPassimageArea','currPassmessageArea');
			setMessageForEmprAccountValidation("",true,'newPassimageArea','newPassmessageArea');
			setMessageForEmprAccountValidation("",true,'confirmPassimageArea','confirmPassmessageArea');
		}
	}
	
	function checkFieldValidations(field, warnImg,warnMsg, fieldName, min, max) {
		
		var msg1 = "Please enter " + fieldName;
		var msg2 = fieldName + " must have atleast " + min + " characters";
		var msg3 = fieldName + " allows maximum " + max + " characters";
	
		if (field.replace(/ /g, "") == "") {
		
			setMessageForEmprAccountValidation(msg1,false,warnImg,warnMsg);
			resetPasswordStatus = false;
			
		} else if (min != 0 && field.length < min) {
		
			setMessageForEmprAccountValidation(msg2,false,warnImg,warnMsg);
			resetPasswordStatus = false;
			
		} else if (max != 0 && field.length > max) {
		
			setMessageForEmprAccountValidation(msg3,false,warnImg,warnMsg);
			resetPasswordStatus = false;
			
		} else {
			setMessageForEmprAccountValidation("",true,warnImg,warnMsg);
		}
	}
	
	function validateEmployer(organizationName,imageArea,messageArea){
      var flag  ="true"        
      var  msg =""
      var  lName =""
	 
 	  if(organizationName==""){
            msg="Please enter Organization Name"
            flag="false" 
            setMessageForEmprAccountValidation(msg,flag,imageArea,messageArea);
            editEmployerAccountStatus=false;
             
        }else if(organizationName>20){
            msg="should be less than 20 characters"          
            flag="false"
            setMessageForEmprAccountValidation(msg,flag,imageArea,messageArea);
	      	editEmployerAccountStatus=false;
	     }else if(!isNaN(organizationName)){
            msg="Only letters are allowed" 
            flag="false"
            setMessageForEmprAccountValidation(msg,flag,imageArea,messageArea);
            editEmployerAccountStatus=false;
         }else{
              setMessageForEmprAccountValidation(msg,flag,imageArea,messageArea);
         }
	}
	
	function validateEmprWebSite(website,imageArea,messageArea){
		var minLength = 40; 
		var flag="true";
	
	    if(website==""){
		     message="Please enter name of URL "
		     flag="false"
		     setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
		     editEmployerAccountStatus=false;
	    }else  if(website > minLength){// check for minimum length
		     message="Website should be within" + minLength + " characters long. Try again."
		     flag="false"
		     setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
		     editEmployerAccountStatus=false;
	    }else if(trimFieldVal(website)==""){
	          message="Please enter Website"
	          flag="false"
		      setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
		      editEmployerAccountStatus=false;
	    }else {
		      message=""
		      setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
	    }
	}
	
	function validatePhoneNumber(phoneNo,imageArea,messageArea){
	
	     var flag  ="true";    
	     var message=""  
	   
	     var phoneRESpace = /^\(\d\d\d\) \d\d\d-\d\d\d\d$/;
	     var phoneRE = /^\(\d\d\d\)\d\d\d-\d\d\d\d$/;
	     var re10digit= /^\d{3}-\d{3}-\d{4}$/; 
	     
	      if(phoneNo==""){
		      message=""
	          flag="true"
	          setMessageForSignup(message,flag,imageArea,messageArea);
		   }else if (phoneNo.match(phoneRE)){
	            message=""
	            setMessageForSignup(message,flag,imageArea,messageArea);
		   }else if(phoneNo.match(re10digit)){
	            message=""
	            setMessageForSignup(message,flag,imageArea,messageArea);
		   }else if(phoneNo.match(phoneRESpace)){
	            message=""
	            setMessageForSignup(message,flag,imageArea,messageArea);
		   }else  {
		      message="The phone number entered is invalid!"
	          flag="false"
	          setMessageForSignup(message,flag,imageArea,messageArea);
	          editEmployerAccountStatus=false;
		   }
	}
	
	function checkUserEmail(email,imageArea,messageArea)
	{
        var flag="true"     
        var message=""   
       
        var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
        
        if(email==""){
             message="Please enter email id"
             flag="false"
             setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
             editEmployerAccountStatus=false;
        }else if (filter.test(email)){
             //if(!emailValidate(email,imageArea,messageArea))
             //	editEmployerAccountStatus=false;
            emailValidate(email,imageArea,messageArea);
        }else{
              message="Not a valid Email address!"
              flag="false"
              setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
              editEmployerAccountStatus=false;
        }
	}
	
	/*function  emailValidate(empEmailId,imageArea,messageArea){
	
	 var message="" 
	 var minLength=45; 
	   $.post("emailValidateForEditAccount.action",{email : empEmailId},function (data)
	   {      
	   		//alert("data.result"+data.result)
	        if(data.result=="success"){
	        
	            if(empEmailId.length>minLength){
		             message="Email address should be within" +  minLength +" characters long.Try again.";
		             //var fontColor = "red";                                      
		             //$("#imageArea2").html("<img src='../styles/default/images/mobc_redx.gif'/>");
		             //$("#messageArea2").html("<font color=" + fontColor + ">"+ message + " </font>");
		             flag="false";
	                 setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
	                 return false;
	            }else{
	                flag="true"
	                setMessageForEmprAccountValidation("",flag,imageArea,messageArea);
	                return true;
	            }  
	            
	         }else
	              {
	              	editEmployerAccountStatus=false;
	                message="Email already Exist please try again";  
	                flag="false";
	                setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
	                return false;
	              }
	    },"json");
	    //alert("editEmployerAccountStatus:"+editEmployerAccountStatus)
	}
	*/
	
	function emailValidate(empEmailId,imageArea,messageArea){
		// email=$("#alternateEmail").val();
		var minLength=45; 
		var s1="success";
		 jQuery.ajax({
		 url:    '..employer/emailValidateForEditAccount.action' 
		 + '?email=' 
		 + empEmailId,
		 success: function(data) {
		 var res = eval('('+data+')');
		 
		 if(res.result == s1 || res.result =="success"){
		
		 	if(empEmailId.length>minLength){
	 			 editEmployerAccountStatus=false;
	             message="Email address should be within" +  minLength +" characters long.Try again.";
	             flag="false";
                 setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
            }else{
                flag="true"
                setMessageForEmprAccountValidation("",flag,imageArea,messageArea);
            }
		 }else{
		 	
			 editEmployerAccountStatus=false;
             message="Email already Exist please try again";  
             flag="false";
             setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
		 }
		
		 },
		 async:   false
		 }); 
	}
	/* End of  set Default profile as another employer profile  */

	// Method for validating MissionStateMent
	function validateMissionStateMent(txtID,imageArea,messageArea){
		var minLength = 200; 
		var flag="true";
	             
        if (txtID!="" && txtID.length > minLength){
                  message="Mission Statement should be within" + minLength + " characters long. Try again."
                  flag="false"
                  setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                  editEmployerAccountStatus=false;
              }else if(txtID!="" && trimFieldVal(txtID)==""){// check for only spaces allowed in  
	                message="Please enter Mission StateMent"
	                flag="false"
	                setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
	                editEmployerAccountStatus=false;
              }else {
                     message=""
                     setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
             }
	
	
	}//End of  validating MissionStateMent
	
	/* Method for validating Employer City*/
	function validateEmprCity(text,imageArea,messageArea){
		var minLength=25;
		var flag="true";
	      
        if (text!="" && text.length > minLength){
            message="City should be within" + minLength + " characters long. Try again."
            flag="false"
            setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
            editEmployerAccountStatus=false;
        }else if(text!="" && trimFieldVal(text)==""){
           message="Please enter City"
           flag="false"
           setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
           editEmployerAccountStatus=false;
        }else {
           message=""
           setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
       }
	}//End of  validateEmprCity(txtID,imageArea,messageArea)
	
	function validateEmpZipCode(txt,imageArea,messageArea)
	{
		 var flag  ="true";    
		 var message=""  
		 var regExpZipCode = new RegExp(/(^\d{5}$)|(^\d{5}-\d{4}$)/);
	     
        if(txt!="" && trimFieldVal(txt)==""){
	         message="Please enter Postal code"
	         flag="false"
	         setMessageForSignup(message,flag,imageArea,messageArea);
	         editEmployerAccountStatus=false;
       	}else if (txt!="" && !regExpZipCode.test(txt)){
	         message="Zip code must be 5 digits or 5 digits with a 4 digit suffix!"
	         flag="false"
	         setMessageForSignup(message,flag,imageArea,messageArea);
	         editEmployerAccountStatus=false;
	     } else {
		      message=""
		      setMessageForSignup(message,flag,imageArea,messageArea);
	 	}
	}
	
	
	/* Method for validating Address */
	function  validateEmprAddress(txt,imageArea,messageArea){
	    var invalid = " ";
	    var minLength = 45; 
	    var flag="true";
	      
        if (txt!="" && txt.length > minLength){
	          message="Address  should be within " + minLength + " characters long. Try again."
	          flag="false"
	          setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
	          editEmployerAccountStatus=false;
        }else if(txt!="" && trimFieldVal(txt)==""){
	         message="Please enter Address"
	         flag="false"
	         setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
	         editEmployerAccountStatus=false;
        }else {
	         message=""
	         setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
       }
	
	}//End of function  validateEmprAddress(txtID,imageArea,messageArea)