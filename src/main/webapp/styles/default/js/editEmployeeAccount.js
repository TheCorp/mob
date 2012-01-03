/* Start of edit EmployeeAccount.js */ 
var joinfreeValidate = 0;
var dtCh= "/";

var editEmployeeAccount;
function checkEditForm()
{
	editEmployeeAccount=true;
    var oldpassword =$("#oldPasswordId").val();
    var newpassword =$("#newPasswordId").val();
    var verifyNewpassword =$("#verifyNewPasswordId").val();
    
    
	validateEditAccount('firstName','imageArea','messageArea');
	validateEditAccount('lastName','imageArea1','messageArea1');
	CheckEditAccountEmail('email','imageArea2','messageArea2');
	validatePhoneNumber('phoneNumberId','pnImageArea','pnMessageArea');
	validateEmpCity('city','cityimageArea','citymessageArea');
	checkDate('dob','imageArea3','messageArea3');
	
	if(oldpassword!="" || newpassword!="" || verifyNewpassword!=""){
		validateEditAccountPwd(oldpassword,'imageArea5','messageArea5');
		validateNewPwd(newpassword,'imageArea6','messageArea6');
		validateVerifyNewPwd(newpassword,verifyNewpassword,'imageArea7','messageArea7');
    }
	
	return editEmployeeAccount;
 
 }
 
 function changePassword(){
 
 	var oldpassword =$("#oldPasswordId").val();
    var newpassword =$("#newPasswordId").val();
    var verifyNewpassword =$("#verifyNewPasswordId").val();
    
 	if(oldpassword!="" || newpassword!="" || verifyNewpassword!=""){
		validateEditAccountPwd(oldpassword,'imageArea5','messageArea5');
		validateNewPwd(newpassword,'imageArea6','messageArea6');
		validateVerifyNewPwd(newpassword,verifyNewpassword,'imageArea7','messageArea7');
    }
 }
 /*
function editEmployeeAccount(){
	
	var oldPassword=$("#oldPasswordId").val();
	var existingPassword=$("#existingPasswordId").val();
	var newPassword=$("#newPasswordId").val();
	var verifyNewPassword=$("#verifyNewPasswordId").val();
	
	if(newPassword!=verifyNewPassword){

		message="you have entered wrong verify password "
        flag="false"
        if(joinfreeValidate == 0)
        joinfreeValidate = 6
        setMessage1(message,flag);
        return false;
	
	}
	
	 else{
	 document.editAccountFormName.submit();
	 return true;
	 }

}
*/
function setMessage(message,isValid,imageArea,messageArea)
{
        var imageArea = document.getElementById(imageArea);            
        var messageArea = document.getElementById(messageArea);      

        var fontColor = "red";
        
        var src="../styles/default/images/mobc_redx.gif"
            
        if (isValid == "true")
         {
            src="../styles/default/images/grncheck-onwhite.jpg"
            fontColor = "green";
            imageArea.innerHTML = "";
            messageArea.innerHTML="<font color=" + fontColor + ">"+ message + " </font>";
         }else if(isValid == "false"){
           imageArea.innerHTML = "";
           messageArea.innerHTML="<font color=" + fontColor + ">"+ message + " </font>";
        }else{
           imageArea.innerHTML = "";
           messageArea.innerHTML="";
        }   
}

	function CheckEditAccountEmail(txtID,imageArea,messageArea){
	        
         flag="true"         
         email = document.getElementById(txtID).value;
         var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
         
         if(email==""){
         
        	 editEmployeeAccount=false;
             message="Please enter your email id"
             flag="false"
             setMessage(message,flag,imageArea,messageArea);
         }else if (filter.test(email)){
             emailValidate();
         }else{
         	
         	 editEmployeeAccount=false;
             message="Not a valid email address!"
             flag="false"
             setMessage(message,flag,imageArea,messageArea);
         }     
                  
	}
	
	function  emailValidate(){
	
	 var message="" 
	 var minLength=45; 
	   $.post("emailValidateForEditAccount.action",{email : $("#email").val()},function (data)
	   {      
	        if(data.result=="success"){
	        
	            var empEmailId=$("#email").val();
	            
	            if(empEmailId.length>minLength){
	            	
	            	 editEmployeeAccount=false;
		             message="Email address should be within" +  minLength +" characters long.Try again."
		             var fontColor = "red";                                      
		             $("#imageArea2").html("<img src='../styles/default/images/mobc_redx.gif'/>");
		             $("#messageArea2").html("<font color=" + fontColor + ">"+ message + " </font>");
		             flag="false"
	                       
	                 // setMessage(message,flag,imageArea2,messageArea2);
	            }else{
	                flag="true"
	               $("#imageArea2").html("<img src='../styles/default/images/grncheck-onwhite.jpg'/>");
	               $("#messageArea2").html("");
	            }  
	         }else
	              {
	              	editEmployeeAccount=false;
	                message="Email already Exist please try again"  
	                var fontColor = "red";                                      
	                $("#imageArea2").html("<img src='../styles/default/images/mobc_redx.gif'/>");
	                $("#messageArea2").html("<font color=" + fontColor + ">"+ message + " </font>");
	                flag="false"
                    // setMessage(message,flag,imageArea2,messageArea2);
	              }
	    },"json");
	}

function validateEditAccountPwd(password,imageArea,messageArea)
{
    var invalid = " ";
    var minLength = 6; 
    var flag="true";
   
      
              if(password==""){
                    editEmployeeAccount=false;
                    message="Please enter Password "
                    flag="false"
                    setMessage(message,flag,imageArea,messageArea);
              }
              else
                    // check for minimum length
                    if (password.length < minLength)
                     {
                  		 editEmployeeAccount=false;
                         message="Your password must be at least " + minLength + " characters long. Try again."
                         flag="false"
                         setMessage(message,flag,imageArea,messageArea);
                     }
                     else
                     
                           // check for spaces
                           if (password.indexOf(invalid) > -1)
                            {
                        			editEmployeeAccount=false;
                                    message="Sorry, spaces are not allowed."
                                    flag="false"
                                    setMessage(message,flag,imageArea,messageArea);
                            }
                            else {
                            
                            $.post("checkExistingPassword.action",{'oldPassword':password},function (data){     
								 if(data.result=="error")
							          {
							          	editEmployeeAccount=false;
							          	message="you have entered wrong Old password "
								        flag="false"
								        setMessage(message,flag,imageArea,messageArea);
								          }
								 else{
								 	message=""
                                    setMessage(message,flag,imageArea,messageArea);
								 }
							    	
							 	},"json"); 
								
								}
                          
}
function validateNewPwd(password,imageArea,messageArea)
{
    var invalid = " ";
    var minLength = 6; 
    var flag="true";
      
     if(password=="")
     {
           editEmployeeAccount=false;
           message="Please enter Password "
           flag="false"
           setMessage(message,flag,imageArea,messageArea);
     }
     else
           // check for minimum length
           if (password.length < minLength)
            {
         		editEmployeeAccount=false;
                message="Your password must be at least " + minLength + " characters long. Try again."
                flag="false"
                setMessage(message,flag,imageArea,messageArea);
            }
            else
                  // check for spaces
                  if (password.indexOf(invalid) > -1)
                   {
               			   editEmployeeAccount=false;	
                           message="Sorry, spaces are not allowed."
                           flag="false"
                           setMessage(message,flag,imageArea,messageArea);
                   }
                   else {
                           message=""
                           setMessage(message,flag,imageArea,messageArea);
                   }
}
function validateVerifyNewPwd(newPassword,verifyNewPassword,imageArea,messageArea)
{
    var invalid = " ";
    var minLength = 6; 
    var flag="true";
    
    //var newPassword=$("#newPasswordId").val();
	//var verifyNewPassword=$("#verifyNewPasswordId").val();
    
  
    //  var password =$("#verifyNewPasswordId").val();
      
              if(verifyNewPassword=="")
              {
                    editEmployeeAccount=false;
                    message="Please enter Password "
                    flag="false"
                    setMessage(message,flag,imageArea,messageArea);
              }
              else
                    // check for minimum length
                    if (verifyNewPassword.length < minLength)
                     {
                  		 editEmployeeAccount=false;
                         message="Your password must be at least " + minLength + " characters long. Try again."
                         flag="false"
                         setMessage(message,flag,imageArea,messageArea);
                     }
                     else
                     
                           // check for spaces
                           if (verifyNewPassword.indexOf(invalid) > -1)
                            {
                        			editEmployeeAccount=false;
                                    message="Sorry, spaces are not allowed."
                                    flag="false"
                                    
                                    setMessage(message,flag,imageArea,messageArea);
                            }
                            
                            else if(newPassword!=verifyNewPassword){
									editEmployeeAccount=false;
									message="you have entered wrong verify password "
							        flag="false"
							        setMessage(message,flag,imageArea,messageArea);
							}else {
                                message=""
                                setMessage(message,flag,imageArea,messageArea);
                             }
}
	
	function validateEditAccount(txtID,imageArea,messageArea){
    
      flag  ="true"        
      var  msg   =""
      var  fName =""   
      var  lName =""
      
      var  txtElement = document.getElementById(txtID);  
      
      if (txtElement.value.length>20) {
      		
      	  editEmployeeAccount=false;	
          msg="should have less than 20 characters"          
          flag="false"
          setMessage(msg,flag,imageArea,messageArea);
      
      }else if (txtElement.value==""){
        
          editEmployeeAccount=false;
         
          if(txtID=="firstName"){
               msg="Please enter your"+" "+"first name"
               flag="false" 
               setMessage(msg,flag,imageArea,messageArea);
          } 
          if(txtID=="lastName"){
                  msg ="Please enter your"+" "+"last name"
                  flag="false" 
                                           
                  setMessage(msg,flag,imageArea,messageArea);
          }
      }else {
          setMessage(msg,flag,imageArea,messageArea);
      }
	}



function checkDate(txtID,imageArea,messageArea)
{
    var flag="true";
    var input = document.getElementById(txtID).value ;
    var msg="" 
       
    if(input==""){
          flag = ""; 
          setMessage(msg,flag,imageArea,messageArea);      
    }else if(isDate(input,imageArea,messageArea)==false){
     	editEmployeeAccount=false;	
    }else{        
          flag="true"; 
          msg=""
          setMessage(msg,flag,imageArea,messageArea); 
    }
}
    
function isDate(dtStr,imageArea,messageArea){

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
		msg = "The date format should be : mm/dd/yyyy"
		if(joinfreeValidate == 0)
         joinfreeValidate = 3     
        flag = "false"; 
        setMessage(msg,flag,imageArea,messageArea);  
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		msg = "Please enter a valid month"
		if(joinfreeValidate == 0)
         joinfreeValidate = 3     
        flag = "false"; 
        setMessage(msg,flag,imageArea,messageArea); 
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		msg = "Please enter a valid day"
        flag = "false"; 
        setMessage(msg,flag,imageArea,messageArea);
        if(joinfreeValidate == 0)
          joinfreeValidate = 3     
		return false
	}
	if (strYear.length != 4 || year==0){
		msg = "Please enter a valid 4 digit year"
        flag = "false"; 
        setMessage(msg,flag,imageArea,messageArea);
        if(joinfreeValidate == 0)
         joinfreeValidate = 3     
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		msg = "Please enter a valid date"
        flag = "false"; 
        setMessage(msg,flag,imageArea,messageArea);
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


	function validatePhoneNumber(txtID,imageArea,messageArea){
	
	     var flag  ="true";    
	     var message=""  
	     var phoneNo = document.getElementById(txtID).value;
	   
	     var phoneRESpace = /^\(\d\d\d\) \d\d\d-\d\d\d\d$/;
	     var phoneRE = /^\(\d\d\d\)\d\d\d-\d\d\d\d$/;
	     var re10digit= /^\d{3}-\d{3}-\d{4}$/; 
	     
       if(phoneNo==""){
          setMessage("","",imageArea,messageArea);
	   }
	   else if (phoneNo.match(phoneRE)){
           setMessage(message,flag,imageArea,messageArea);
           
	   }else if(phoneNo.match(re10digit)){
           setMessage(message,flag,imageArea,messageArea);
           
	   }else if(phoneNo.match(phoneRESpace)){
           setMessage(message,flag,imageArea,messageArea);
	   }else{
	      editEmployeeAccount=false;        
	      message="The phone number entered is invalid!"
          flag="false"
          setMessage(message,flag,imageArea,messageArea);
	   }
	}
	
	function validateEmpCity(txtID,imageArea,messageArea){
	 var flag  ="true";
	 var message=""        
	 var empCity = document.getElementById(txtID).value;
	 var minLength = 25; 
	            
     
     if (empCity==""){
	        setMessage("","",imageArea,messageArea);
      }else if (empCity!="" && empCity.length > minLength){// check for minimum length
     		editEmployeeAccount=false;
	        message="City should be  within" + minLength + " characters long. Try again."
	        flag="false"
	        setMessage(message,flag,imageArea,messageArea);
      }else if(empCity!="" && trimFieldVal(empCity)==""){
      		editEmployeeAccount=false;
	        message="Please enter City!"
	        flag="false"
	        setMessage(message,flag,imageArea,messageArea);
      }else {
	         setMessage("","true",imageArea,messageArea);
      }
	              
	}
	
	function trimFieldVal(fieldVal){
		var a = fieldVal.replace(/^\s+/, '');
		return a.replace(/\s+$/, '')
	}
/* End of edit EmployeeAccount.js */ 