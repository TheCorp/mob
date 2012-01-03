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

/* End of  set Default profile as another employer profile  */



/*employer Briefcase*/

var defaultInputTextColor = "#000000";
var contactId=0;


/* Added for Add Briefcase Item*/
function hideEditableFields(){
    var hiddenIdForEdit_id=$("#hiddenIdForEdit_id").val();
	if(hiddenIdForEdit_id!=0){
		$("#name"+hiddenIdForEdit_id).show();
		$("#category"+hiddenIdForEdit_id).show();	
		$("#privacySetting"+hiddenIdForEdit_id).show();
		$("#actionId"+hiddenIdForEdit_id).show();
		
		$("#name1"+hiddenIdForEdit_id).hide();
		$("#category1"+hiddenIdForEdit_id).hide();
		$("#privacySetting1"+hiddenIdForEdit_id).hide();
		$("#actionId1"+hiddenIdForEdit_id).hide();
	}
	
}

function addEmployerBriefcaseDocument()
{
    $("#nameId").hide();
    $("#nameId1").hide();
    $("#privacyId").hide();
	$("#fileId").hide();
    $("#validDocumentId").hide();
 	var nameOfItem=$("#nameid").val();
	if(nameOfItem==""){
	//alert("Please enter Name of Item");
	$("#nameId").show();
	return false;
	}
    if(nameOfItem.length>45){
	//alert("Please enter Name of Item");
	$("#nameId").hide();
	$("#nameId1").show();
	return false;
	}

	var privacySetting=$("#privacySettingId").val();
	if(privacySetting==1){
	//alert("Please select privacy Setting");
	$("#nameId").hide();
	$("#nameId1").hide();	
	$("#privacyId").show();
	return false;
	}
	/*
	var category=$("#categoryId").val();
	if(category==1){
	alert("Please select category");
	return false;
	}
	*/
	var file = $("#fileItem").val();
	if(file==""){
	//alert("Please upload a file");	
	$("#nameId").hide();
	$("#nameId1").hide();
	$("#privacyId").hide();
	$("#fileId").show();
	return false;
	}
	
   
    extArray = new Array(".txt",".doc",".dot",".pps",".ppt",".pot",".docx",".xls",".xla",".xlc","xlm",".pdf");
    allowSubmit = false;
    if (!file) return;
    while (file.indexOf("\\") != -1)
    file = file.slice(file.indexOf("\\") + 1);
    ext = file.slice(file.indexOf(".")).toLowerCase();
    for (var i = 0; i < extArray.length; i++) {
    if (extArray[i] == ext) { allowSubmit = true; break; }
    }
    if (allowSubmit) return true;
    else
   // alert("Sorry, this is not a valid document type");
     $("#nameId").hide();
     $("#nameId1").hide();
	$("#privacyId").hide();
	$("#fileId").hide();
     $("#validDocumentId").show();
    return false;

}
function validateNameOfItem()
{
    var nameOfItem=$("#nameid").val();
	if(nameOfItem==""){
		$("#nameId").show();
		$("#nameid").focus();
	    return false;
	}
	else
	{
	   $("#nameId").hide();
	   $("#privacySettingId").focus();
	   return false;
	}

     
}
function validatePrivacySetting()
{
     $("#nameId").hide();
      var nameOfItem=$("#nameid").val();
  if(nameOfItem=="")
  {  
        $("#nameId").show();
		$("#nameid").focus();
	    return false;
  }
  else
  {	    
    var privacySetting=$("#privacySettingId").val();
	if(privacySetting==1)
	{
	  $("#privacyId").show();
	  $("#privacySettingId").focus();
	  return false;
	}
	else
    { 
      $("#privacyId").hide();
	  return false;
    }
    
    
}
}


function addEmployerBriefcasePhoto()
{
    $("#nameId").hide();
    $("#nameId1").hide();
    $("#privacyId").hide();
	$("#fileId").hide();
    $("#validDocumentId").hide();
    
	var nameOfItem=$("#nameid").val();
	if(nameOfItem==""){
	//alert("Please enter Name of Item");
	$("#nameId").show();
	return false;
	}
     if(nameOfItem.length>45){
	//alert("Please enter Name of Item");
	$("#nameId").hide();	
	$("#nameId1").show();
	return false;
	}

	var privacySetting=$("#privacySettingId").val();
	if(privacySetting==1){
	//alert("Please select privacy Setting");
	$("#nameId").hide();
	 $("#nameId1").hide();	
	$("#privacyId").show();
	return false;
	}
	/*
	var category=$("#categoryId").val();
	if(category==1){
	alert("Please select category");
	return false;
	}
	*/
	var file = $("#fileItem").val();
	if(file==""){
	//alert("Please upload a file");
	$("#nameId").hide();
	 $("#nameId1").hide();
	$("#privacyId").hide();
	$("#fileId").show();
	return false;
	}
	
    
    extArray = new Array(".jpg");
    allowSubmit = false;
    if (!file) return;
    while (file.indexOf("\\") != -1)
    file = file.slice(file.indexOf("\\") + 1);
    ext = file.slice(file.indexOf(".")).toLowerCase();
    for (var i = 0; i < extArray.length; i++) {
    if (extArray[i] == ext) { allowSubmit = true; break; }
    }
    if (allowSubmit) return true;
    else
   // alert("Please only upload files that end in types:  "
    //+ (extArray.join("  ")) + "\nPlease select a new "
    //+ "file to upload and submit again.");
    var htmlText="<h6>Please only upload files that end in types:  "
    + (extArray.join("  ")) + "\nPlease select a new "
    + "file to upload and submit again.</h6>"
    $("#nameId").hide();
     $("#nameId1").hide();
	$("#privacyId").hide();
	$("#fileId").hide();
    $("#validDocumentId").html(htmlText);
    $("#validDocumentId").show();
    return false;
}

function audioOrVideo()
{
   $("#categoryTypeId").hide();
   var category1=$("#categoryId").val()
   var category="Video";	
	if(category1==category)
	{
	  $("#audioDiv").hide();
	  $("#videoDiv").show();
	
	}
	else
	{
	  $("#videoDiv").hide();
	  $("#audioDiv").show();
	 
	
	}
	
}
function validateAudioOrVideo()
{
   $("#nameId").hide();
    $("#nameId1").hide();
      var nameOfItem=$("#nameid").val();
      if(nameOfItem.length>45)
      {  
        $("#nameId").hide();
        $("#nameId1").show();
		$("#nameid").focus();
	    return false;
     }
  if(nameOfItem=="")
  {  
        $("#nameId1").hide();
        $("#nameId").show();
		$("#nameid").focus();
	    return false;
  }
  else
  {
   var privacySetting=$("#privacySettingId").val();
	if(privacySetting==1)
	{
	   $("#nameId").hide();
	   $("#nameId1").hide();
	  $("#privacyId").show();	
	  $("#privacySettingId").focus();  
	  return false;
	}
	else
    { 
      $("#privacyId").hide();
	  return false;
    }
}
}
function validateCategoryType()
{
 $("#nameId").hide();
      var nameOfItem=$("#nameid").val();
  if(nameOfItem=="")
  {  
        $("#nameId").show();
		$("#nameid").focus();
	    return false;
  }
  else
  {
    var category=$("#categoryId").val();
	if(category==1){
	$("#privacyId").hide();	
	$("#categoryTypeId").show();
	$("#categoryId").focus();
	return false;
	}
	else
	{
	  $("#categoryTypeId").hide();
	  return false;
	}
}
}

function addEmployerBriefcaseAudioVedio() 
{
    $("#nameId").hide();
    $("#nameId1").hide();
    $("#privacyId").hide();
	$("#fileId").hide();
	$("#categoryTypeId").hide();
	$("#urlId").hide();
    $("#validDocumentId").hide();
 
    var nameOfItem=$("#nameid").val();
	if(nameOfItem==""){
	//alert("Please enter Name of Item");
	$("#nameId").show();
	 $("#nameId1").hide();
	return false;
	}
      if(nameOfItem.length>45){
	//alert("Please enter Name of Item");
	$("#nameId").hide();	
	$("#nameId1").show();
	return false;
	}

	var privacySetting=$("#privacySettingId").val();
	if(privacySetting==1){
	//alert("Please select privacy Setting");
	$("#nameId").hide();
	 $("#nameId1").hide();	
	$("#privacyId").show();
	return false;
	}
	
	var category=$("#categoryId").val();
	if(category==1){
	//alert("Please select category");
	$("#nameId").hide();
	 $("#nameId1").hide();	
	$("#privacyId").hide();
	$("#categoryTypeId").show();
	return false;
	}
	
	var category1=$("#categoryId").val()
   	var category="Video";	
   	var category2="Audio";
	if(category1==category)
	{
	   var videourl=$("#videoUrl").val();
	   if(videourl==""){
	  // alert("Please provide Video URL");
	  $("#nameId").hide();	
	   $("#nameId1").hide();
	  $("#privacyId").hide();
	  $("#categoryTypeId").hide();
	  $("#urlId").show();
	   return false;
	   }
	}
	else if(category1==category2){
	 	var file = $("#fileItem").val();
		if(file==""){
		//alert("Please upload a file");
		$("#nameId").hide();
		 $("#nameId1").hide();
	    $("#privacyId").hide();
	     $("#categoryTypeId").hide();
	     $("#urlId").hide();
	    $("#fileId").show();
		return false;
		}
	else{
	extArray = new Array(".ra",".ram",".dss",".msv",".dvf",".mp4",".m4a",".gsm",".dct",".vox",".aac",".Xvid",".aac",".aif",".iff",".mp3",".mpa",".ra",".wav",".wma",".3g2",".3gp",".asf",".asx",".avi",".flv",".mov",".mpg",".rm",".swf",".vob",".wmv");
	
    allowSubmit = false;
    if (!file) return;
    while (file.indexOf("\\") != -1)
    file = file.slice(file.indexOf("\\") + 1);
    ext = file.slice(file.indexOf(".")).toLowerCase();
    for (var i = 0; i < extArray.length; i++) {
    if (extArray[i] == ext) { allowSubmit = true; break; }
    }
    if (allowSubmit) return true;
    else
   // alert("Please only upload files that end in type:  "
    //+ (extArray.join("  ")) + "\nPlease select a new "
    //+ "file to upload and submit again.");
     var htmlText="<h6>Please only upload files that end in type:  "
    + (extArray.join("  ")) + "\n<br><br>Please select a new "
    + "file to upload and submit again.</h6>"
    $("#nameId").hide();
     $("#nameId1").hide();
	$("#privacyId").hide();
	$("#fileId").hide();
    $("#categoryTypeId").hide();
	$("#urlId").hide();
    $("#validDocumentId").html(htmlText);
    $("#validDocumentId").show();
    return false;
    }	
   
	
	}

	
}
/* End of Add Briefcase Item*/


/* Added for Edit Briefcase Item*/
function editEmprBreifcaseListItems(id){

	hide_pop_up("confirm_delete");
	hide_pop_up("confirm_delete2");
    hide_pop_up("add_item");
   
 	var hiddenIdForEdit_id=$("#hiddenIdForEdit_id").val();
	if(hiddenIdForEdit_id!=0){
		$("#name"+hiddenIdForEdit_id).show();
		$("#category"+hiddenIdForEdit_id).show();	
		$("#privacySetting"+hiddenIdForEdit_id).show();
		$("#actionId"+hiddenIdForEdit_id).show();
		
		$("#name1"+hiddenIdForEdit_id).hide();
		$("#category1"+hiddenIdForEdit_id).hide();
		$("#privacySetting1"+hiddenIdForEdit_id).hide();
		$("#actionId1"+hiddenIdForEdit_id).hide();
		
	
	}
        $("#name"+id).hide();
		$("#name1"+id).show();
		$("#category"+id).hide();
		$("#category1"+id).show();
		var category=$("#category"+id).html();
		
		$("#privacySetting"+id).hide();
		$("#privacySetting1"+id).show();
		var privacySetting=$("#privacySetting"+id).html();
		$.post("getEmployerPrivacySettingList.action",{},function (data)
  		    {           
  		                         
                  var htmlText = '<select id="selprivacySetting'+id+'"><option>'+privacySetting+'</option> '
                  for(var i=0;i<data.privacySettingList.length;i++)
                  {
                     if(data.privacySettingList[i]!=privacySetting)
                     {
				     htmlText += '<option value='+data.privacySettingList[i]+'>' + data.privacySettingList[i] + '</option>\n';
				     }
	              }
	                 htmlText += '</select>';         	
                	        
			     $("#privacySetting1"+id).html(htmlText);
                 
           },"json");
		
		$("#actionId"+id).hide();
		$("#actionId1"+id).show();
		
		$("#hiddenIdForEdit_id").val(id);
}

function editEmployerBriefcaseDetails(id)
{
     
    
     var  itemName = $("#txtname"+id).val();
     if(itemName.length>45)
     {
      // alert("Should have less than 45 characters")
       bc_pop_up1('event',"confirm_delete2",["center",300]);
       $("#success").hide();
        $("#failure").hide();
       $("#validateTitleName").show();
       return false;
     }
    //var  itemCategory = $('#selcategory'+id+' :selected').text();  
    var  itemPrivacySetting = $("#selprivacySetting"+id).val(); 
    
    $.post("editEmployerBriefcaseItems.action",{'item.id' :id,'name':itemName,'privacySetting':itemPrivacySetting},function (data)
   {       
            
            if(data.result =="success")
            {
             
				$("#name1"+id).hide();
				$("#name"+id).show();
				$("#name"+id).html(data.name);
				
				$("#category1"+id).hide();
				$("#category"+id).show();
			//	$("#category"+id).html(data.category);
				
				$("#privacySetting"+id).show();
				$("#privacySetting"+id).html(data.privacySetting);
				$("#privacySetting1"+id).hide();
				
				$("#actionId"+id).show();
				$("#actionId1"+id).hide();
			// alert("updated Data sucessfully");
			bc_pop_up1('event',"confirm_delete2",["center",300])
			$("#validateTitleName").hide();
              $("#success").show();
            }else{
            //alert("Not updated Data sucessfully");
            bc_pop_up1('event',"confirm_delete2",["center",300])
            $("#success").hide();
            $("#validateTitleName").hide();
            $("#failure").show();
          }                           
       
   },"json");
  
}
function cancelBriefcaseDetails(id){
 hide_pop_up("confirm_delete2");
        $("#name"+id).show();
		$("#name1"+id).hide();
		$("#category"+id).show();
		$("#category1"+id).hide();
		$("#privacySetting"+id).show();
		$("#privacySetting1"+id).hide();
		$("#actionId"+id).show();
		$("#actionId1"+id).hide();

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

/* End of Edit Briefcase Item*/

/* Added for Delete Briefcase Item*/
function deleteEmployerBriefcaseDocument()
{
 
 document.getElementById("delete").href= "deleteEmployerBriefcaseDocument.action?item.id="+contactId;
  
}	

function deleteEmployerBriefcasePhoto(){

	document.getElementById("delete").href= "deleteEmployerBriefcasePhoto.action?item.id="+contactId;
}


function deleteEmployerBriefcaseAudioOrVideo(){

	document.getElementById("delete").href= "deleteEmployerBriefcaseAudioOrVideo.action?item.id="+contactId;
}

/* End of Delete Briefcase Item*/


/* Added for Briefcase pop_up's */
function bc_pop_up(e,pop_up_id,location)
	{
	 $("#nameId").hide();
     $("#privacyId").hide();
	 $("#fileId").hide();
	  $("#validDocumentId").hide();
	hide_pop_up("confirm_delete");
	hide_pop_up("confirm_delete2");
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


function pop_up(e,id,name,spanid,pop_up_id,location)
	{
	
	hide_pop_up("add_item");
	hide_pop_up("confirm_delete2");
	 var hiddenIdForEdit_id=$("#hiddenIdForEdit_id").val();
		if(hiddenIdForEdit_id!=0){
		$("#name"+hiddenIdForEdit_id).show();
		$("#category"+hiddenIdForEdit_id).show();	
		$("#privacySetting"+hiddenIdForEdit_id).show();
		$("#actionId"+hiddenIdForEdit_id).show();
		
		$("#name1"+hiddenIdForEdit_id).hide();
		$("#category1"+hiddenIdForEdit_id).hide();
		$("#privacySetting1"+hiddenIdForEdit_id).hide();
		$("#actionId1"+hiddenIdForEdit_id).hide();
	}
	
	
	contactId=id; 
	var name=document.getElementById("name"+id).innerText
	document.getElementById(spanid).innerText=name
	
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
/* End of Briefcase pop_up's */

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
/* End of employerBriefcase*/

/* Employer contacts  */

var defaultInputTextColor = "#000000";
var contactId=0;

/* Added for Edit contacts */
function editContactList(id){
	hide_pop_up("confirm_delete");	
	hide_pop_up("confirm_delete2");
	var hiddenIdForEdit_id=$("#hiddenIdForEdit_id").val();
	
	if(hiddenIdForEdit_id!=0){
	
		var lablelName=$("#lblId"+hiddenIdForEdit_id).html();
	
		$("#lblId"+hiddenIdForEdit_id).show();
		$("#lblId1"+hiddenIdForEdit_id).show();	
		$("#imgIds"+hiddenIdForEdit_id).show();
		
		$("#nickName"+hiddenIdForEdit_id).hide();
		$("#contTypeID"+hiddenIdForEdit_id).hide();
		$("#imgIds1"+hiddenIdForEdit_id).hide();
		$("#nickNames"+hiddenIdForEdit_id).val(lablelName);
	
	}
			$("#lblId"+id).hide();
			$("#nickName"+id).show();		
			var ContactType=$("#lblId1"+id).html();
			$("#lblId1"+id).hide();	
			
			
			$.post("getContactTypeList.action",{},function (data)
  		    {                             
                  var htmlText = '<select id="contTypeIDs'+id+'"><option>'+ContactType+'</option> '
                  for(var i=0;i<data.contactTypes.length;i++)
                  {
                     if(data.contactTypes[i]!=ContactType)
                     {
				     htmlText += '<option value='+data.contactTypes[i]+'>' + data.contactTypes[i] + '</option>\n';
				     }
	              }
	                 htmlText += '</select>';         	
                	        
			     $("#contTypeID"+id).html(htmlText);
                 
           },"json"); 

			$("#contTypeID"+id).show();					
			$("#imgIds"+id).hide();
			$("#imgIds1"+id).show();
			$("#hiddenIdForEdit_id").val(id);
			
			
}
function updateContacts(id){
   
	var nickName=$("#nickNames"+id).val();
	var contactType=$("#contTypeIDs"+id).val();
	
		 $.post("editEmployerContactsItems.action",{'contact.id' :id,'contact.nickName':nickName,'contact.contactType':contactType},function (data)
  		 {      
  		 
  		   
            if(data.result =="success")
            {
             
	             $("#nickName"+id).hide();
	             $("#lblId"+id).show();
	             $("#lblId"+id).html(data.nickName)
	             $("#lblId1"+id).show();
	             $("#lblId1"+id).html(data.contactType)
				 $("#contTypeID"+id).hide();				 
				 $("#imgIds"+id).show();
				 $("#imgIds1"+id).hide();
				 $("#modifiedDateId"+id).html(data.modifiedDate);
				// alert("updated Data sucessfully");
				bc_pop_up1('event',"confirm_delete2",["center",300]);
				$("#success").show();
				
            }
            else
            {
               // alert("Not updated Data sucessfully");
               bc_pop_up1('event',"confirm_delete2",["center",300]);
				$("#success").hide();
				$("#failure").show();
            }                           
       
   },"json"); 
}

function cancelContactsAction(id){

            $("#lblId"+id).show();
			$("#nickName"+id).hide();
			$("#lblId1"+id).show();	
			$("#contTypeID"+id).hide();
				         
			$("#imgIds"+id).show();
			$("#imgIds1"+id).hide();

}
/* End of Edit contacts */

/*Added for pop_up's */
function inputOnFocus(what)
	{
	if (!what.alreadyClicked)
		{
		what.value = "";
		what.style.color = defaultInputTextColor;
		what.alreadyClicked = true;
		}
	}


function contactpop_up(e,id,name,pop_up_id,location)
	{
	 hide_pop_up("confirm_delete2");
	var hiddenIdForEdit_id=$("#hiddenIdForEdit_id").val();
	if(hiddenIdForEdit_id!=0){
		$("#lblId"+hiddenIdForEdit_id).show();
		$("#lblId1"+hiddenIdForEdit_id).show();	
		$("#imgIds"+hiddenIdForEdit_id).show();
		
		$("#nickName"+hiddenIdForEdit_id).hide();
		$("#contTypeID"+hiddenIdForEdit_id).hide();
		$("#imgIds1"+hiddenIdForEdit_id).hide();
	
	}  
	
	
	contactId=id; 
	$("#contactName").html(name);
	
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
	
function deleteConactDetails()
{
    
 
 document.getElementById("delete").href= "deleteContact.action?contact.id="+contactId;
  
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
/*End of pop_up's */
/*for displaying message box */
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

/* End of Employer Contact   */

/* delete EmprReceivedEmail Message  */
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


$(document).ready(function(){
	$("#addbtn_opportunity").click(addEditedOpportunitySkills);
});

/*  opportunity skills   */

var count =0;
var Edit =0; 
var Delete =0;

function addOpportunitySkills(){

  
    var skilLlist1 = $("#skillfromlist1").val();
	var skillLevel= $("#skillfromlist2").val();
	var jobType = $("#jobType").val();
	var nofYears = $("#nofYears").val();	
    
    if(Edit == 0)
    { 
    if(skilLlist1=="1"){
	     alert("Please enter Skill Name")
	     return;
	   }
	  if(skillLevel=="1"){
	     alert("Please enter Skill Level")
	     return;
	   }
	  if(jobType=="1"){
	     alert("Please enter Job Type")
	     return;
	   }
	   if(nofYears==""){
	     alert("Please enter Number of Years")
	     return;
	   }
	   if(nofYears.length>20){
	     alert("Should have less than 20 characters")
	     return;
	   }
	count=count+1
	 var htmlText="<div class='sel_prof_row' id='divTable"+count+"'><table border='0'><tr><td><table  border='0'> <tr>"+
		 "<td class='sel_prof_col spc_skillname'id='skillList1"+count+"'>" + skilLlist1+ "</td>" +
		 "<td class='sel_prof_col spc_skilllevel'id='skillList2"+count+"'>" + skillLevel + "</td>" +
		 "<td class='sel_prof_col spc_jobtype'id='jobType"+count+"'>" + jobType + "</td>" +
		 "<td class='sel_prof_col spc_numyears'id='noOfYear"+count+"'>" + nofYears + 
		 "</td>" + "</tr></table></td><td><div class='sel_prof_col spc_actions'>"+
		 "<table  border='0'><tr>"+
		 "<td id='image_edit'onclick='editOpportunitySkills("+count+")'></td><td id='image_cross' onclick='deleteOpportunitySkills1("+count+")'></td></tr>"+
		 "</table></div></td></tr></table>" +
		 "<input type='hidden' id='skillList11"+count+"' name='skillName' value='"+skilLlist1+"'/>"+ 
		 "<input type='hidden' id='skillList21"+count+"' name='skillLevel' value='" + skillLevel + "'/>"+
		 "<input type='hidden' id='jobType1"+count+"' name='jobTypeName' value='" + jobType + "'/>"+
		 "<input type='hidden' id='noOfYear1"+count+"' name='nofYears' value='" + nofYears + "'/>"; 
		  
	 $("#opportunity_list").append(htmlText)
	 
    }
    else{	
	/* Editing for display purpose in table */ 
	  
	  $("#skillList1"+ Edit).html(skilLlist1);
	  	 
	  $("#skillList2"+ Edit).html(skillLevel);
	  	 
	  $("#jobType"+ Edit).html(jobType);
	  
	  $("#noOfYear"+ Edit).html(nofYears);
	    	   
	  /* Editing values for hidden feilds for stroing into database */
	  
	  $("#skillList11"+ Edit).html(skilLlist1);
	  	 
	  $("#skillList21"+ Edit).html(skillLevel);
	  	 
	  $("#jobType1"+ Edit).html(jobType);
	  
	  $("#noOfYear1"+ Edit).html(nofYears);
	  
	  Edit = 0	 
	}
    $("#skillfromlist1").val("1");
    $("#skillfromlist2").val("1");
	$("#jobType").val("1");
	$("#nofYears").val("");
	
	
	
}

function editOpportunitySkills(count){

 Edit = count;

	  //#fetching starts here
	 
	 var skillName =$("#skillList11"+ count).val();
	  
	 var skillLevel =$("#skillList21"+ count).val();
	  
	 var jobType =$("#jobType1"+ count).val();
	  
	 var noOfYear =$("#noOfYear1"+ count).val();
	 
	 
	 // Fetching ends here
	 
	 //Restoring the fetched data into text boxes
     $("#skillfromlist1").val(skillName);
     $("#skillfromlist2").val(skillLevel);
     $("#jobType").val(jobType);
     $("#nofYears").val(noOfYear);
}

function deleteOpportunitySkills1(delID)
{
   
    $("#divTable"+delID).remove();
    
	//if your deleting the same row which is about to get edited. 
		if(delID == Edit)
		{ 
	 		Edit = 0;
	 		 $("#skillfromlist1").val("1");
      		 $("#skillfromlist2").val("1");
      		 $("#jobType").val("1");
      		 $("#nofYears").val("");
	 	}

}
/* End opportunity skills */

/*  opportunity    */

var dtCh= "/";
function oppDateValidation()
{
 var startDate = $("#startDate").val();
 
if(validateJobName()==false)
{
  return false;
}
else if(validateDescription()==false)
{

return false;
}
else if(validatePosition()==false)
{
 return false;
}
else if(validateLocation()==false)
{
  return false;
}
else if(validateTypeOfWorkTxt()==false)
{
 return false;
}
else if(validateEducationText()==false)
{
  return false;
}
else if(validateBenefitsId()==false)
{
  return false;
}
else if(validateWorkingText()==false)
{
 return false;
}
else if(startDate!="")
{
    if(isDate(startDate)==false){
	 return false
  }
	 
}
else
{
   return true; 
}



}
function validatePosition()
{
 
  var PositionTextId=$("#PositionTextId").val();
  if(PositionTextId.length>45)
  {
   $("#PositionId").html("<h5>Should have less than 45 characters</h5>");
   return false;
  }
  else
  {
    $("#PositionId").html("");
    return true;
  }
  
}

function validateLocation()
{
 
  var locationText=$("#locationText").val();
  if(locationText.length>45)
  {
   $("#locationId").html("<h5>Should have less than 45 characters</h5>");
   return false;
  }
  else
  {
    $("#locationId").html("");
    return true;
  }
  
}
function validateTypeOfWorkTxt()
{
 
  var typeOfWorkTxt=$("#typeOfWorkTxt").val();
  if(typeOfWorkTxt.length>45)
  {
   $("#typeofworkId").html("<h5>Should have less than 45 characters</h5>");
   return false;
  }
  else
  {
    $("#typeofworkId").html("");
    return true;
  }
  
}
function validateEducationText()
{
 
  var educationText=$("#educationText").val();
  if(educationText.length>45)
  {
   $("#requirementsId").html("<h5>Should have less than 45 characters</h5>");
   return false;
  }
  else
  {
    $("#requirementsId").html("");
    return true;
  }
  
}
function validateBenefitsId()
{
 
  var benefitsText=$("#benefitsText").val();
  if(benefitsText.length>45)
  {
   $("#benefitsId").html("<h5>Should have less than 45 characters</h5>");
   return false;
  }
  else
  {
    $("#benefitsId").html("");
    return true;
  }
  
}
function validateWorkingText()
{
 
  var workingText=$("#workingText").val();
  if(workingText.length>45)
  {
   $("#workingHoursId").html("<h5>Should have less than 45 characters</h5>");
   return false;
  }
  else
  {
    $("#workingHoursId").html("");
    return true;
  }
  
}

function validateJobName()
{
	var jodNameId=$("#jodNameId").val();   
	if(jodNameId=="")
	{
	    $("#oppId").html("<h5>Please enter jobname</h5>");
	    return false;
	}else if(jodNameId.length>45)
	{
	    $("#oppId").html("<h5>Should have less than 45 characters</h5>");
	    return false;
	}
	else
	{
	 $("#oppId").html("");
	 return true;
	}
}
function validateDescription()
{
	var descriptionId=$("#descId").val();
      
	if(descriptionId=="")
    {
       
       $("#oppId1").html("<h5>Please enter description</h5>");
       return false;
    }else if(descriptionId.length>45)
	{
	    $("#oppId1").html("<h5>Should have less than 45 characters</h5>");
	    return false;
	}
    else
    {
      $("#oppId1").html("");
        return true;
    }
}

/* Added for checking validation when user enters date manually */		
function isDate(dtStr){
	
	var daysInMonth = DaysArray(12)
	var pos1=dtStr.indexOf(dtCh)
	var pos2=dtStr.indexOf(dtCh,pos1+1)
	var strMonth=dtStr.substring(0,pos1)
	var strDay=dtStr.substring(pos1+1,pos2)
	var strYear=dtStr.substring(pos2+1)
	strYr=strYear
	if (strDay.charAt(0)=="0" && strDay.length>1) strDay=strDay.substring(1)
	if (strMonth.charAt(0)=="0" && strMonth.length>1) strMonth=strMonth.substring(1)
	for (var i = 1; i <= 3; i++) {
		if (strYr.charAt(0)=="0" && strYr.length>1) strYr=strYr.substring(1)
	}
	month=parseInt(strMonth)
	day=parseInt(strDay)
	year=parseInt(strYr)
	if (pos1==-1 || pos2==-1){
		alert("The date format should be : mm/dd/yyyy for StartDate field")
        return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		alert("Please enter a valid month for StartDate field")
        
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		alert("Please enter a valid day for StartDate field")
        
		return false
	}
	if (strYear.length != 4 || year==0){
		alert("Please enter a valid 4 digit year for StartDate field")
        
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		alert("Please enter a valid date for StartDate field")
        
		return false
	}
return true
}

function isInteger(s){
	var i;
    for (i = 0; i < s.length; i++){   
        // Check that current character is number.
        var c = s.charAt(i);
        if (((c < "0") || (c > "9"))) return false;
    }
    // All characters are numbers.
    return true;
}

function stripCharsInBag(s, bag){
	var i;
    var returnString = "";
    // Search through string's characters one by one.
    // If character is not in bag, append to returnString.
    for (i = 0; i < s.length; i++){   
        var c = s.charAt(i);
        if (bag.indexOf(c) == -1) returnString += c;
    }
    return returnString;
}

function daysInFebruary (year){
	// February has 29 days in any year evenly divisible by four,
    // EXCEPT for centurial years which are not also divisible by 400.
    return (((year % 4 == 0) && ( (!(year % 100 == 0)) || (year % 400 == 0))) ? 29 : 28 );
}
function DaysArray(n) {
	for (var i = 1; i <= n; i++) {
		this[i] = 31
		
		if (i==4 || i==6 || i==9 || i==11) {this[i] = 30}
		if (i==2) {this[i] = 29}
   } 
   return this
}
/* End of validation when user enters date manually */

/* End of opprtunity */

/* Edit opportunity skills  */

var Edit=0
var count=0
var idForEdit;
function loadEditOpportunitySkils(id){

    var skillNedded=$("#skillsNeeded"+id).val();
	var skilllevel =$("#level"+id).val();
	var jobtype =$("#jobType"+id).val();
	var noOfYears =$("#noOfYears"+id).val();
	
	$("#skillfromlist1").val(skillNedded)
	$("#skillfromlist2").val(skilllevel)
	$("#jobType").val(jobtype)
	$("#nofYears").val(noOfYears)
	
	idForEdit=id
	
	$("#addbtn_opportunity").unbind();
    $("#addbtn_opportunity").click(editOpportunitySkils); 	

}

function loadNewEditOpportunitySkils(id){

    var skillNedded=$("#skillsNeedednew"+id).val();
	var skilllevel =$("#levelnew"+id).val();
	var jobtype =$("#jobTypenew"+id).val();
	var noOfYears =$("#noOfYearsnew"+id).val();
	
	$("#skillfromlist1").val(skillNedded)
	$("#skillfromlist2").val(skilllevel)
	$("#jobType").val(jobtype)
	$("#nofYears").val(noOfYears)
	
	idForEdit=id
	
	$("#addbtn_opportunity").unbind();
    $("#addbtn_opportunity").click(editNewOpportunitySkils); 

}

function editOpportunitySkils(){
	
	
	var skillNedded_from_tb=$("#skillfromlist1").val()
	var skilllevel_from_tb=$("#skillfromlist2").val()
	var jobtype_from_tb=$("#jobType").val()
	var noofyears_from_tb=$("#nofYears").val()
	
	
	  if(skillNedded_from_tb=="1"){
	     alert("Please enter Skill Name")
	     return;
	   }
	  if(skilllevel_from_tb=="1"){
	     alert("Please enter Skill Level")
	     return;
	   }
	  if(jobtype_from_tb=="1"){
	     alert("Please enter Job Type")
	     return;
	   }
	   if(noofyears_from_tb==""){
	     alert("Please enter Number of Years")
	     return;
	   }
	   if(noofyears_from_tb.length>20){
     alert("Should have less than 20 characters");
     return;
   }
   
	$("#skillsNeeded"+idForEdit).val(skillNedded_from_tb)
	$("#level"+idForEdit).val(skilllevel_from_tb)
	$("#jobType"+idForEdit).val(jobtype_from_tb)
	$("#noOfYears"+idForEdit).val(noofyears_from_tb)
	
	
	$("#skillnamediv"+idForEdit).html(skillNedded_from_tb)
	$("#skillleveldiv"+idForEdit).html(skilllevel_from_tb)
	$("#jobtypediv"+idForEdit).html(jobtype_from_tb)
	$("#numyearsdiv"+idForEdit).html(noofyears_from_tb)

	$("#skillfromlist1").val(1)
	$("#skillfromlist2").val(1)
	$("#jobType").val(1)
	$("#nofYears").val("")

	$("#addbtn_opportunity").unbind();
    $("#addbtn_opportunity").click(addEditedOpportunitySkills); 

}

function editNewOpportunitySkils(){
	
	
	var skillNedded_from_tb=$("#skillfromlist1").val()
	var skilllevel_from_tb=$("#skillfromlist2").val()
	var jobtype_from_tb=$("#jobType").val()
	var noofyears_from_tb=$("#nofYears").val()
	
	
	  if(skillNedded_from_tb=="1"){
	     alert("Please enter Skill Name")
	     return;
	   }
	  if(skilllevel_from_tb=="1"){
	     alert("Please enter Skill Level")
	     return;
	   }
	  if(jobtype_from_tb=="1"){
	     alert("Please enter Job Type")
	     return;
	   }
	   if(noofyears_from_tb==""){
	     alert("Please enter Number of Years")
	     return;
	   }
	   if(noofyears_from_tb.length>20){
     alert("Should have less than 20 characters");
     return;
   }
   
	$("#skillsNeedednew"+idForEdit).val(skillNedded_from_tb)
	$("#levelnew"+idForEdit).val(skilllevel_from_tb)
	$("#jobTypenew"+idForEdit).val(jobtype_from_tb)
	$("#noOfYearsnew"+idForEdit).val(noofyears_from_tb)
	
	
	$("#skillnamedivnew"+idForEdit).html(skillNedded_from_tb)
	$("#skillleveldivnew"+idForEdit).html(skilllevel_from_tb)
	$("#jobtypedivnew"+idForEdit).html(jobtype_from_tb)
	$("#numyearsdivnew"+idForEdit).html(noofyears_from_tb)

	$("#skillfromlist1").val(1)
	$("#skillfromlist2").val(1)
	$("#jobType").val(1)
	$("#nofYears").val("")

	$("#addbtn_opportunity").unbind();
    $("#addbtn_opportunity").click(addEditedOpportunitySkills); 

}
function addEditedOpportunitySkills(){

	
	var skillNedded_from_tb=$("#skillfromlist1").val()
	var skilllevel_from_tb=$("#skillfromlist2").val()
	var jobtype_from_tb=$("#jobType").val()
	var noofyears_from_tb=$("#nofYears").val()
	
		
   if(skillNedded_from_tb=="1"){
     alert("Please enter skill name")
     return;
   }
   if(skilllevel_from_tb=="1"){
     alert("Please enter skill level")
     return;
   }
   if(jobtype_from_tb=="1"){
     alert("Please enter Job Type")
     return;
   }
   if(noofyears_from_tb==""){
     alert("Please enter number of years")
     return;
   }
   if(noofyears_from_tb.length>20){
     alert("Should have less than 20 characters");
     return;
   }
	count=count+6
	
	var htmlText="<div class='sel_prof_row' id='sel_prof_row"+count+"'><table border='0'>"+
					  "<tr><td class='sel_prof_col spc_skillname' id='skillnamedivnew"+count+"'>"+skillNedded_from_tb+"</td>"+
		              "<td class='sel_prof_col spc_skilllevel' id='skillleveldivnew"+count+"'>"+skilllevel_from_tb+"</td>"+
		              "<td class='sel_prof_col spc_jobtype' id='jobtypedivnew"+count+"'>"+jobtype_from_tb+ "</td>"+
		              "<td class='sel_prof_col spc_numyears' id='numyearsdivnew"+count+"'>"+noofyears_from_tb+ "</td>"+
		              "<td><div class='sel_prof_col spc_actions'><table  border='0'><tr>"+
			          "<td id='image_edit'onclick='loadNewEditOpportunitySkils("+count+")'></td>"+
			          "<td id='image_cross' onclick='deleteNewOpportunitySkills("+count+")'></td></tr></table></div></td></tr></table>"+
		              "<input type='hidden' name='newSkillsNeeded' value='"+skillNedded_from_tb+"' id='skillsNeedednew"+count+"'/>"+
		              "<input type='hidden' name='newLevel' value='"+skilllevel_from_tb+"' id='levelnew"+count+"'/>"+
		              "<input type='hidden' name='newJobType' value='"+jobtype_from_tb+"' id='jobTypenew"+count+"'/>"+
		              "<input type='hidden' name='newNoOfYears' value='"+noofyears_from_tb+"' id='noOfYearsnew"+count+"'/></div>"
		              
		              $("#opportunity_list").append(htmlText)
		              
	            $("#skillfromlist1").val(1)
				$("#skillfromlist2").val(1)
				$("#jobType").val(1)
				$("#nofYears").val("")
				$("#oppSkillId_tb").val("")

}



function deleteNewOpportunitySkills(id){
	
	$("#sel_prof_row"+id).remove();
	
	$("#skillfromlist1").val(1)
	$("#skillfromlist2").val(1)
	$("#jobType").val(1)
	$("#nofYears").val("")
	
}

function deleteOpportunitySkills(id){
	
	/*Added for storing deleted rowid into a textfield */
	var htmlText="<div class='deldiv' id='del"+id+"'>"+
				 "<input type='hidden' name='deloppSkillsrow' id='delrowid"+id+"' value='"+id+"'/></div>";
	$("#deloppodiv").append(htmlText) 
	
	/*Added for deleting existing rows from db  */
	$("#oppskillsdiv"+id).remove();
	
	$("#skillfromlist1").val(1)
	$("#skillfromlist2").val(1)
	$("#jobType").val(1)
	$("#nofYears").val("")

}
/* End of edit oppprtunity Skills  */

/* view Employer opportunity  */

function viewOpportunity(id){
document.getElementById("viewOppId"+id).href= "viewEmployerOwnOpportunities.action?Opportunityid="+id;
}

/* End of view Employer Opportunity */

/* edit employer profile     */

function editEmployerProfile(){

	var profileName=$("#profileNameId").val();
 	if(profileName==""){
     $("#employerProfileId").html("<h5>Please enter profile name</h5>");
 	return false;
 	}else if(profileName.length>45)
 	{
 	    $("#employerProfileId").html("<h5>should have less than 45 characters</h5>");
 	    return false;
 	} 
 	else
 	{
 	$("#employerProfileId").html("");
 	}
}
/* End of edit employer profile */



/* send employer replay message to contacts  */

function sendEmprReadMsgInboxReply(){
 var emprinBoxReplyId=$("#emprinBoxReplyId").val();
 document.getElementById("msgReadInboxEmprid").href= "composeEmprInboxReplyMsg.action?inboxReadId="+emprinBoxReplyId;
}

var contactNames="";
var acfb2;
var acfb3;
var acfb;
		$(document).ready(function() {
		     $("#build_acfb").hide();
			  $("#textId").show();
			  acfb = $("ul.first").autoCompletefb({urlLookup:'emprMsgContactListAction.action'});
			  acfb2 = acfbuild('.city3','emprMsgContactListAction.action');
			   $('.btn2').show();
				
			function acfbuild(cls,url){
				var ix = $("input"+cls);
				 ix.addClass('acfb-input').wrap('<ul class="'+cls.replace(/\./,'')+' acfb-holder"></ul>');
				return $("ul"+cls).autoCompletefb({urlLookup:url});
			}
		});
			
			function sendEmprReplyMsgToContacts()
			{
				var inBoxId=$("#inBoxId").val();
				var inboxProfileId=$("#inboxProfileId").val();
				var associtedProfileid=$("#associatedProfileId").val();
				contactNames=acfb.getData();
				 
				 if(contactNames==""){
				 $("#messageId").show();
				 }else{
				  $("#messageId").hide();
				  $("#profileId").val(inboxProfileId);
				  $("#inBoxId1").val(inBoxId);
				  $("#associtedProfileid").val(associtedProfileid);
                 $("#composeMessageForm").submit();
	        	 }
			}
			
/* End of send employer replay message to contacts  */		

/* addEmployerPrpfile */

function addEmployerProfile(){
 	
 	var profileName=$("#ProfileName").val();
 	if(profileName==""){
 	//alert("Please enter Profile Name");
 	$("#employerProfileId").html("<h5>Please enter profilename</h5>");
 	return false;
 	}else if(profileName.length>45)
 	{
 	 $("#employerProfileId").html("<h5>Should have less than 45 characters</h5>");
 	 return false;
 	}
 	else
 	{
 	$("#employerProfileId").html("");
 	}
}

/* End of Employer Profile   */	

/* add privacy Group For Employer */

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
	
/* End of add privacy group for employer   */	

/* retrieve password */
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
/*  End of retrieve password */ 

/* search contact for employer skype  */
var contactNames = new Array();
var contactSkypeIds = new Array();

function searchContactsForEmployer() {
    var searchValue = $("#searchId").val();
    $.post("getContactsForEmployerSkype.action", {'name':searchValue}, function (data)
    {
         $("#divTable").remove();


        var htmlText = "<div class='bcb_controw-right22' id='divTable'><table  class='bc_bc_table' cellspacing='0' id='bcip_table1'>" +
                       "<tr> <th width='11%' class='bc_tbl_pic' scope='col'>Pic</th><th width='60%' class='bc_tbl_name' scope='col'>Name</th>" +
                       "<th width='29%' class='bc_tbl_name' scope='col'>Skype</th></tr>";

			var names = data.names;
        for (var i = 0; i < names.length; i++) {
            var contacts = names[i];
            var name = contacts.name;
            var skype = contacts.skype;
            if(skype != null){
                contactNames[i] = name;
                contactSkypeIds[i] = skype;
                htmlText += "<tr><td> <span onclick=selectContactForEmployer(" + i + ")><img src='../styles/default/images/mobc_placeholder_thumb.jpg' width='44' height='44' /></span></td>" +
                            "<td class='bc_tbl_shad'><div class='ER_hard_value'><div class='ER_hard_value'>" + name +
                            "</div></div></td><td><img src='http://mystatus.skype.com/smallicon/" + skype + "'/></td></tr>";
            }
        }
        htmlText += "</table></div>";

        $("#bcb_controw-right2").append(htmlText);

    }, "json");

}


function selectContactForEmployer(index){
    $("#selfrnd").css("display","none");
    $("#selectedfrnd").css("display","");

    $("#selectedname").html(contactNames[index]);
    $("#skypelink").attr("href","skype:" + contactSkypeIds[index] + "?call");
}

/*  End search contact for employer skype  */ 

/* delete Empr sent Email Messages  */
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


/* End of delete empr sent email messages  */

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
