/*  Employee Account Validation*/
var joinfreeValidate = 0;

var dtCh= "/";

function checkVerificationCode(){
	
 $.post("checkJcaptcha.action",{captchaId : $("#captchaId").val()},function (data){
 {      
 
        if(data.result=="success"){
            flag="true"
               $("#imageAreaVcode").html("<img src='../styles/default/images/regform_check1.jpg'/>");
               $("#messageAreaVcode").html("");
            }else{
            message="The validation code entered is incorrect, please try again"
            var fontColor = "red"; 
             $("#imageAreaVcode").html("<img src='../styles/default/images/regform_check0.jpg'/>");
             $("#messageAreaVcode").html("<font color=" + fontColor + ">"+ message + " </font>");
             flag="false"
                       setMessageForSignup(message,flag,imageAreaVcode,messageAreaVcode);
            }  
         }
 },"json");

}

function  emailValidateForSignup()
{
 var message="" 
 var minLength=45; 
   $.post("emailValidate.action",{email : $("#email").val()},function (data)
   {      
        if(data.result=="success"){
            var empEmailId=$("#email").val();
            if(empEmailId.length>minLength){
            message="Email address should be within" +  minLength +" characters long.Try again."
             var fontColor = "red";                                      
             $("#imageArea2").html("<img src='../styles/default/images/regform_check0.jpg'/>");
             $("#messageArea2").html("<font color=" + fontColor + ">"+ message + " </font>");
             flag="false"
                       if(joinfreeValidate == 0)
                       joinfreeValidate = 2
                       setMessageForSignup(message,flag,imageArea2,messageArea2);
            }else{
                flag="true"
               $("#imageArea2").html("<img src='../styles/default/images/regform_check1.jpg'/>");
               $("#messageArea2").html("");
            }  
         }else
              {
                message="Email already exist please try again"  
                var fontColor = "red";                                      
                $("#imageArea2").html("<img src='../styles/default/images/regform_check0.jpg'/>");
                $("#messageArea2").html("<font color=" + fontColor + ">"+ message + " </font>");
                flag="false"
                       if(joinfreeValidate == 0)
                       joinfreeValidate = 2
                       setMessageForSignup(message,flag,imageArea2,messageArea2);
              }
    },"json");
}
function  emailValidate2()
{
 var message="" 
 var minLength=45; 
   $.post("emailValidate.action",{email : $("#reEnteredEmail").val()},function (data)
   {      
        if(data.result=="success"){
            var empEmailId=$("#reEnteredEmail").val();
            if(empEmailId.length>minLength){
            message="Email address should be within" +  minLength +" characters long.Try again."
             var fontColor = "red";                                      
             $("#imageArea222").html("<img src='../styles/default/images/regform_check0.jpg'/>");
             $("#messageArea222").html("<font color=" + fontColor + ">"+ message + " </font>");
             flag="false"
                       if(joinfreeValidate == 0)
                       joinfreeValidate = 2
                       setMessageForSignup(message,flag,imageArea2,messageArea2);
            }else{
                flag="true"
               $("#imageArea222").html("<img src='../styles/default/images/regform_check1.jpg'/>");
               $("#messageArea222").html("");
            }  
         }else
              {
                message="Email already exist please try again"  
                var fontColor = "red";                                      
                $("#imageArea222").html("<img src='../styles/default/images/regform_check0.jpg'/>");
                $("#messageArea222").html("<font color=" + fontColor + ">"+ message + " </font>");
                flag="false"
                       if(joinfreeValidate == 0)
                       joinfreeValidate = 2
                       setMessageForSignup(message,flag,imageArea2,messageArea2);
              }
    },"json");
}
function CheckEmailForSignup(txtID,imageArea,messageArea)
{        

         flag="true"         
         email = document.getElementById(txtID).value;
         var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
         
         if (filter.test(email))
         {
              emailValidateForSignup();
         }else if(email=="")
               {
                       message="Please enter your email id"
                       flag="false"
                       if(joinfreeValidate == 0)
                       joinfreeValidate = 2
                       setMessageForSignup(message,flag,imageArea,messageArea);
         
               }else 
                     {
                         
                       message="Not a valid Email address!"
                       flag="false"
                       if(joinfreeValidate == 0)
                       joinfreeValidate = 2
                       setMessageForSignup(message,flag,imageArea,messageArea);
                     }     
                  
}

function CheckReEnterEmail(txtID,imageArea,messageArea)
{        
        var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
		var reEnteredEmail=$("#reEnteredEmail").val();
		var userEmail=$("#email").val();
		flag="true" 
		
		if(reEnteredEmail==""){
			 message="Please enter your re-enter email id"
             flag="false"
             if(joinfreeValidate == 0)
             joinfreeValidate = 2
             setMessageForSignup(message,flag,imageArea,messageArea);
		
		}    
		
		 else if(userEmail!=reEnteredEmail){
		 	 message="email and re-enter email should be same"
             flag="false"
             if(joinfreeValidate == 0)
             joinfreeValidate = 2
             setMessageForSignup(message,flag,imageArea,messageArea);
		
		}
		else{
		
			if (filter.test(reEnteredEmail))
         {
              emailValidate2();
         }	
         else
           {
             message="Not a valid Email address!"
             flag="false"
             if(joinfreeValidate == 0)
             joinfreeValidate = 2
             setMessageForSignup(message,flag,imageArea,messageArea);
           }   
          }  
        
      
}


function validate(txtID,imageArea,messageArea) 
{
     
      flag  ="true"        
      var  msg   =""
      var  fName =""   
      var  lName =""
      
      var  txtElement = document.getElementById(txtID);  
 
      if (txtElement.value.length>20) 
      {
      
               msg="should have less than 20 characters"          
               flag="false"
               setMessageForSignup(msg,flag,imageArea,messageArea);
      
      }
      else if (txtElement.value==""){
              //  txtElement.focus();
                if(txtID=="firstName"){
                        msg="Please enter your"+" "+"first name"
                        flag="false" 
                        if(joinfreeValidate == 0)
                        joinfreeValidate = 1                           
                        setMessageForSignup(msg,flag,imageArea,messageArea);
                } 
                if(txtID=="lastName"){
                        msg ="Please enter your"+" "+"last name"
                        flag="false" 
                        if(joinfreeValidate == 0)
                        joinfreeValidate = 1                           
                        setMessageForSignup(msg,flag,imageArea,messageArea);
                }
         }else if(!isNaN(txtElement.value)){
                      msg="Only letters are allowed" 
                      flag="false"
                      if(joinfreeValidate == 0)
                     joinfreeValidate = 1
                      setMessageForSignup(msg,flag,imageArea,messageArea);
              }else
                   {
                      setMessageForSignup(msg,flag,imageArea,messageArea);
                   }
}


        

function setMessageForSignup(message,isValid,imageArea,messageArea)
{
           
        var imageArea = document.getElementById(imageArea);            
        var messageArea = document.getElementById(messageArea);            
        var fontColor = "red";
        
        var src="../styles/default/images/regform_check0.jpg"
            
        if (isValid == "true")
         {
            src="../styles/default/images/regform_check1.jpg"
            fontColor = "green";
            
         }
           imageArea.innerHTML = "<img src=" + src +" />";
           messageArea.innerHTML="<font color=" + fontColor + ">"+ message + " </font>";
           
}




function checkForm()
{
 
 validate('firstName','imageArea','messageArea');
 validate('lastName','imageArea1','messageArea1');
 CheckEmailForSignup('email','imageArea2','messageArea2');
 CheckReEnterEmail('reEnteredEmail','imageArea222','messageArea222')
 checkDate('dob','imageArea3','messageArea3');
 validatePwd('imageArea5','messageArea5');
 confirmPwd('imageArea555','messageArea555');
 validateEmpCity('empCity','imageArea6','messageArea6');
 validateEmpState('empState','imageArea7','messageArea7');
 validateEmpZipCode('empZipCode','imageArea8','messageArea8');
    checkVerificationCode();
    if(joinfreeValidate == 1)
     {
       
         document.getElementById('lastName').focus()
    joinfreeValidate =0;
            return false;
     }else if(joinfreeValidate == 2)
     {
    document.getElementById('email').focus()
    joinfreeValidate =0;
            return false;
     }
     else if(joinfreeValidate == 3)
      {
     
            document.getElementById('dob').focus()
    joinfreeValidate =0;
            return false;
     }else if(joinfreeValidate == 4)
      {
     
            document.getElementById('password').focus()
    joinfreeValidate =0;
            return false;
     
     }else if(joinfreeValidate == 5)
      {
      document.getElementById('empCity').focus()
    	joinfreeValidate =0;
            return false;
     
     } else if(joinfreeValidate == 6)
      {
      document.getElementById('empState').focus()
    	joinfreeValidate =0;
            return false;
     
     }else if(joinfreeValidate == 7)
      {
      document.getElementById('empZipCode').focus()
    	joinfreeValidate =0;
            return false;
     
     }
     
      else
      {
         joinfreeValidate = 0;
         return true;
      
     } 

}


function validatePwd(imageArea,messageArea)
{
    var invalid = " ";
    var minLength = 6; 
    var flag="true";
  
      var password = $("#password").val();
      
              if(password=="")
              {
                   
                    message="Please enter Password "
                    flag="false"
                    if(joinfreeValidate == 0)
                    joinfreeValidate = 4
                    setMessageForSignup(message,flag,imageArea,messageArea);
                    return false;
              }
              else
                    // check for minimum length
                    if (password.length < minLength)
                     {
                  
                         message="Passwords should be at least six characters" 
                         flag="false"
                         if(joinfreeValidate == 0)
                         joinfreeValidate = 4
                         setMessageForSignup(message,flag,imageArea,messageArea);
                         return false;
                     }
                     else
                     
                           // check for spaces
                           if (password.indexOf(invalid) > -1)
                            {
                        
                                    message="Sorry, spaces are not allowed."
                                    flag="false"
                                    if(joinfreeValidate == 0)
                                    joinfreeValidate = 4
                                    setMessageForSignup(message,flag,imageArea,messageArea);
                                    return false;
                            }
                            else {
                      
                                    message=""
                                    setMessageForSignup(message,flag,imageArea,messageArea);
                                    return true;
                                 }
}

function confirmPwd(imageArea,messageArea)
{

    var confirmPassword=$("#confirmPassword").val();
    var password=$("#password").val();
    var flag="true";
    var invalid = " ";
    var minLength = 6;
    
    if(confirmPassword=="")
              {
                    message="Please enter Confirm-Password "
                    flag="false"
                    if(joinfreeValidate == 0)
                    joinfreeValidate = 4
                    setMessageForSignup(message,flag,imageArea,messageArea);
                    return false;
              }
      else if (password.length < minLength)
                     {
                  
                         message="Confirm-Password should be at least six characters" 
                         flag="false"
                         if(joinfreeValidate == 0)
                         joinfreeValidate = 4
                         setMessageForSignup(message,flag,imageArea,messageArea);
                         return false;
                     }
       else if (password.indexOf(invalid) > -1)
              {
                  message="Sorry, spaces are not allowed."
                  flag="false"
                  if(joinfreeValidate == 0)
                  joinfreeValidate = 4
                  setMessageForSignup(message,flag,imageArea,messageArea);
               }
      else if(password!=confirmPassword){
		       message="Password and Confirm-Password should be same." 
		       flag="false"
		       if(joinfreeValidate == 0)
		       joinfreeValidate = 4
		       setMessageForSignup(message,flag,imageArea,messageArea);
		       return false;
    
           }
    else {
           message=""
           setMessageForSignup(message,flag,imageArea,messageArea);
           return true;
        }
 
}


function checkDateForSignup(txtID,imageArea,messageArea)
{
    var flag="true";
    var input = document.getElementById(txtID).value ;
    var msg="" 
       
         if(input.value == "")
       {
        msg = "Please enter date"
        flag = "false"; 
          if(joinfreeValidate == 0)
          joinfreeValidate = 3                    
          setMessageForSignup(msg,flag,imageArea,messageArea);      
       }
       else if(isDateForSignup(input,imageArea,messageArea)==false){
       		  if(joinfreeValidate == 0)
          	   joinfreeValidate = 3 
			   return false
       }
       else
               {        
              flag="true"; 
              msg=""
              setMessageForSignup(msg,flag,imageArea,messageArea); 
         
               }
}
    
function isDateForSignup(dtStr,imageArea,messageArea){

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
        setMessageForSignup(msg,flag,imageArea,messageArea);  
		return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		msg = "Please enter a valid month"
		if(joinfreeValidate == 0)
         joinfreeValidate = 3     
        flag = "false"; 
        setMessageForSignup(msg,flag,imageArea,messageArea); 
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		msg = "Please enter a valid day"
        flag = "false"; 
        setMessageForSignup(msg,flag,imageArea,messageArea);
        if(joinfreeValidate == 0)
          joinfreeValidate = 3     
		return false
	}
	if (strYear.length != 4 || year==0){
		msg = "Please enter a valid 4 digit year"
        flag = "false"; 
        setMessageForSignup(msg,flag,imageArea,messageArea);
        if(joinfreeValidate == 0)
         joinfreeValidate = 3     
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		msg = "Please enter a valid date"
        flag = "false"; 
        setMessageForSignup(msg,flag,imageArea,messageArea);
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

function validateEmpCity(txtID,imageArea,messageArea){
 var flag  ="true";
 var message=""        
 var empCity = document.getElementById("empCity").value;
 var minLength = 25; 
              if(empCity==""){
                    message="Please enter City "
                    flag="false"
                    if(joinfreeValidate == 0)
                    joinfreeValidate = 5
                    setMessageForSignup(message,flag,imageArea,messageArea);
                    return false;
              } else
                    // check for minimum length
                    if (empCity.length > minLength)
                     {
                       message="City should be  within" + minLength + " characters long. Try again."
                       flag="false"
                       if(joinfreeValidate == 0)
                       joinfreeValidate = 5
                       setMessageForSignup(message,flag,imageArea,messageArea);
                       return false;
                     }else if(trimFieldVal(empCity)==""){
                      message="Please enter City!"
                      flag="false"
                      if(joinfreeValidate == 0)
                      joinfreeValidate = 5
                      setMessageForSignup(message,flag,imageArea,messageArea);
                      return false;
                     }else {
                        message=""
                        setMessageForSignup(message,flag,imageArea,messageArea);
                        return true;
                       }
              
}

function validateEmpState(txtID,imageArea,messageArea){
 var flag  ="true";      
 var message="" 
 var empState = document.getElementById("empState").value;
       var minLength = 25; 
              if(empState=="")
              {
                    message="Please enter State"
                    flag="false"
                    if(joinfreeValidate == 0)
                    joinfreeValidate = 6
                    setMessageForSignup(message,flag,imageArea,messageArea);
                    return false;
              } else
                    // check for minimum length
                    if (empState.length > minLength){
                         message="State should be  within" + minLength + " characters long. Try again."
                         flag="false"
                         if(joinfreeValidate == 0)
                         joinfreeValidate = 6
                         setMessageForSignup(message,flag,imageArea,messageArea);
                         return false;
                     }else if(trimFieldVal(empState)==""){
                      message="Please enter State!"
                      flag="false"
                      if(joinfreeValidate == 0)
                      joinfreeValidate = 6
                      setMessageForSignup(message,flag,imageArea,messageArea);
                      return false;
                     }else {
                        message=""
                        setMessageForSignup(message,flag,imageArea,messageArea);
                        return true;
                       }
}

function validateEmpZipCode(txtID,imageArea,messageArea){
 var flag  ="true";    
 var message=""  
 var empZipCode = document.getElementById("empZipCode").value;
 var regExpZipCode = new RegExp(/(^\d{5}$)|(^\d{5}-\d{4}$)/);
        if(empZipCode==""){
          message="Please enter Postal code"
          flag="false"
          if(joinfreeValidate == 0)
          joinfreeValidate =7
          setMessageForSignup(message,flag,imageArea,messageArea);
          return flag;
         }else if(trimFieldVal(empZipCode)==""){
         message="Please enter Postal code"
         flag="false"
         if(joinfreeValidate == 0)
         joinfreeValidate = 7
         setMessageForSignup(message,flag,imageArea,messageArea);
         return false;
        }else if (!regExpZipCode.test(empZipCode)){
          message="Zip code must be 5 digits or 5 digits with a 4 digit suffix!"
          flag="false"
          if(joinfreeValidate == 0)
          joinfreeValidate =7
          setMessageForSignup(message,flag,imageArea,messageArea);
          return flag;
      } else {
	  flag="true"
      message=""
      setMessageForSignup(message,flag,imageArea,messageArea);
      return flag;
 }
}

function trimFieldVal(fieldVal){
var a = fieldVal.replace(/^\s+/, '');
return a.replace(/\s+$/, '')
}
/* End Of Employee Account validations*/