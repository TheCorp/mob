/* EmployerAccountValidation */
var joinfreeValidate = 0;

function checkEmprVerificationCode(){
 $.post("checkJcaptcha.action",{captchaId : $("#emprcaptchaId").val()},function (data){
 {      
        if(data.result=="success"){
            flag="true"
               $("#imageAreaEmprVcode").html("<img src='../styles/default/images/regform_check1.jpg'/>");
               $("#messageAreaEmprVcode").html("");
            }else{
            var fontColor = "red"; 
            message="The validation code entered is incorrect, please try again"
             $("#imageAreaEmprVcode").html("<img src='../styles/default/images/regform_check0.jpg'/>");
             $("#messageAreaEmprVcode").html("<font color=" + fontColor + ">"+ message + " </font>");
             flag="false"
                       setMessageForEmprAccountValidation(message,flag,imageAreaEmprVcode,messageAreaEmprVcode);
            }  
         }
 },"json");

}
function setMessageForEmprAccountValidation(message,isValid,imageArea,messageArea)
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


function validateEmployer(txtID,imageArea,messageArea) 
{
    
      var flag  ="true"        
      var  msg =""
      var  organizationName=""   
      var  lName =""
      
      var  txtElement = document.getElementById(txtID);  
 
      if (txtElement.value.length>20) 
      {
      
               msg="should be less than 20 characters"          
               flag="false"
               setMessageForEmprAccountValidation(msg,flag,imageArea,messageArea);
      
      }
      else if (txtElement.value=="")
           {
                //txtElement.focus();
                if(txtID=="organizationName")
                {
                        msg="Please enter Organization Name"
                        flag="false" 
                        if(joinfreeValidate == 0)
                        joinfreeValidate = 1                           
                        setMessageForEmprAccountValidation(msg,flag,imageArea,messageArea);
                } 
            }
         else if(!isNaN(txtElement.value))
              {
                      msg="Only letters are allowed" 
                      flag="false"
                      if(joinfreeValidate == 0)
                     joinfreeValidate = 1
                      setMessageForEmprAccountValidation(msg,flag,imageArea,messageArea);
              }else
                   {
                      setMessageForEmprAccountValidation(msg,flag,imageArea,messageArea);
                   }
                   
               
}


function checkEmprEmail(txtID,imageArea,messageArea)
{        
      //var  empremail=""   
         var flag="true"     
         var message=""   
        var empremail = document.getElementById(txtID).value;
        
         var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
         
         if (filter.test(empremail))
         {
              emprEmailValidate();
         }else if(empremail=="")
               {
                       message="Please enter email id"
                       flag="false"
                       if(joinfreeValidate == 0)
                       joinfreeValidate = 2
                       setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
         
               }else 
                     {
                         
                       message="Not a valid Email address!"
                       flag="false"
                       if(joinfreeValidate == 0)
                       joinfreeValidate = 2
                       setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                     }     
                  
}

function reEnterEmprEmail(txtID,imageArea,messageArea)
{        
      //var  empremail=""   
         var flag="true"     
         var message=""   
         var reEnteredEmail = $("#reEnterEmployeremail").val();
         var email=$("#emailId").val();
         var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
         
         
         if(reEnteredEmail==""){
			 message="Please enter your re-enter email id"
             flag="false"
             if(joinfreeValidate == 0)
             joinfreeValidate = 2
             setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
		
		}    
		 else if(email!=reEnteredEmail){
		 	 message="email and re-enter email should be same"
             flag="false"
             if(joinfreeValidate == 0)
             joinfreeValidate = 2
             setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
		
		}
		else{
		
			if (filter.test(reEnteredEmail))
         {
              emprEmailValidate2();
         }	
         else
           {
             message="Not a valid Email address!"
             flag="false"
             if(joinfreeValidate == 0)
             joinfreeValidate = 2
             setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
           }   
          }  
}

function  emprEmailValidate()
{
   var message=""  
   var minLength=45; 
  $.post("emailValidate.action",{email : $("#emailId").val()},function (data)
   {      
        if(data.result=="success"){
               var emprID=$("#emailId").val();
               if(emprID.length>minLength){
                message="Email address should be within"+  minLength +" characters long.Try again."
                var fontColor = "red";                                      
                $("#imageArea11").html("<img src='../styles/default/images/regform_check0.jpg'/>");
                $("#msgArea11").html("<font color=" + fontColor + ">"+ message + " </font>");
                flag="false"
                       if(joinfreeValidate == 0)
                       joinfreeValidate =2
                       setMessageForEmprAccountValidation(message,flag,imageArea11,imageArea11);
               }else{
	               flag="true"
	               $("#imageArea11").html("<img src='../styles/default/images/regform_check1.jpg'/>");
	               $("#msgArea11").html("");
               } 
         }else
              {
                message="Email already Exist please try again"  
                var fontColor = "red";                                      
                $("#imageArea11").html("<img src='../styles/default/images/regform_check0.jpg'/>");
                $("#msgArea11").html("<font color=" + fontColor + ">"+ message + " </font>");
                flag="false"
                       if(joinfreeValidate == 0)
                       joinfreeValidate =2
                       setMessageForEmprAccountValidation(message,flag,imageArea11,imageArea11);
              }
    },"json");
}

function  emprEmailValidate2()
{
   var message=""  
   var minLength=45; 
  $.post("emailValidate.action",{email : $("#reEnterEmployeremail").val()},function (data)
   {      
        if(data.result=="success"){
               var emprID=$("#reEnterEmployeremail").val();
               if(emprID.length>minLength){
                message="Email address should be within"+  minLength +" characters long.Try again."
                var fontColor = "red";                                      
                $("#imageArea111").html("<img src='../styles/default/images/regform_check0.jpg'/>");
                $("#msgArea111").html("<font color=" + fontColor + ">"+ message + " </font>");
                flag="false"
                       if(joinfreeValidate == 0)
                       joinfreeValidate =2
                       setMessageForEmprAccountValidation(message,flag,imageArea111,imageArea111);
               }else{
	               flag="true"
	               $("#imageArea111").html("<img src='../styles/default/images/regform_check1.jpg'/>");
	               $("#msgArea111").html("");
               } 
         }else
              {
                message="Email already Exist please try again"  
                var fontColor = "red";                                      
                $("#imageArea111").html("<img src='../styles/default/images/regform_check0.jpg'/>");
                $("#msgArea111").html("<font color=" + fontColor + ">"+ message + " </font>");
                flag="false"
                       if(joinfreeValidate == 0)
                       joinfreeValidate =2
                       setMessageForEmprAccountValidation(message,flag,imageArea111,imageArea111);
              }
    },"json");
}

function validateEmprPwd(imageArea,messageArea)
{
    var invalid = " ";
    var minLength = 6; 
    var flag="true";
  
      var emplrpassword = document.getElementById("emplrpassword").value;
      
              if(emplrpassword=="")
              {
                    message="Please enter Password "
                    flag="false"
                    if(joinfreeValidate == 0)
                    joinfreeValidate = 3
                    setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                    return false;
              }
              else
                    // check for minimum length
                    if (emplrpassword.length < minLength)
                     {
                  
                         message="Passwords should be at least six characters"
                         flag="false"
                         if(joinfreeValidate == 0)
                         joinfreeValidate = 3
                         setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                         return false;
                     }
                     else
                     
                           // check for spaces
                           if (emplrpassword.indexOf(invalid) > -1)
                            {
                        
                                    message="Sorry, spaces are not allowed."
                                    flag="false"
                                    if(joinfreeValidate == 0)
                                    joinfreeValidate = 3
                                    setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                                    return false;
                            }
                            else {
                      
                                    message=""
                                    setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                                    return true;
                                 }
}




function confirmEmprPwd(imageArea,messageArea){
		var invalid = " ";
	    var minLength = 6; 
	    var flag="true";
        var emplrpassword = $("#emplrpassword").val();
        var confirmEmplrPassword=$("#confirmEmplrPassword").val();
              if(confirmEmplrPassword=="")
              {
                    message="Please enter Confirm Password "
                    flag="false"
                    if(joinfreeValidate == 0)
                    joinfreeValidate = 3
                    setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                    return false;
              }
              else
                    // check for minimum length
                    if (confirmEmplrPassword.length < minLength)
                     {
                  
                         message="Confirm Password should be at least six characters"
                         flag="false"
                         if(joinfreeValidate == 0)
                         joinfreeValidate = 3
                         setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                         return false;
                     }
                     else
                     
                           // check for spaces
                           if (confirmEmplrPassword.indexOf(invalid) > -1)
                            {
                        
                                    message="Sorry, spaces are not allowed."
                                    flag="false"
                                    if(joinfreeValidate == 0)
                                    joinfreeValidate = 3
                                   setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                                    return false;
                            }
                            else if(emplrpassword!=confirmEmplrPassword){
						       message="Password and Confirm-Password should be same." 
						       flag="false"
						       if(joinfreeValidate == 0)
						       joinfreeValidate = 3
						       setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
						       return false;
    
           }
                            
                            else {
                      
                                    message=""
                                    setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                                    return true;
                                 }
                                 
}
/*for Org Info */
function validateOrgInfo(txtID,imageArea,messageArea)
{
    var invalid = " ";
    var minLength = 250; 
    var flag="true";
    var orgInfo = document.getElementById("orgInfo").value;
      
              if(orgInfo==""){
                    message="Please enter Organization Info "
                    flag="false"
                    if(joinfreeValidate == 0)
                    joinfreeValidate = 4
                    setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                    return false;
              }
              else
                    // check for minimum length
                    if (orgInfo.length > minLength){
                         message="Oraganization Info should be  within" + minLength + " characters long. Try again."
                         flag="false"
                         if(joinfreeValidate == 0)
                         joinfreeValidate = 4
                         setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                         return false;
                     }else if(trimFieldVal(orgInfo)==""){
		               message="Please enter Organization Info"
		               flag="false"
		               if(joinfreeValidate == 0)
                       joinfreeValidate = 4
                       setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                       return false;
                     }else {
                            message=""
                            setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                            return true;
                            }
}//End of function validateOrgInfo(txtID,imageArea,messageArea)



/*For validating culture Info*/
function validateCultureInfo(txtID,imageArea,messageArea){
 	var invalid = " ";
    var minLength = 100; 
    var flag="true";
    var culture = document.getElementById("culture").value;
              if(culture==""){
                    message="Please enter Culture Info "
                    flag="false"
                    if(joinfreeValidate == 0)
                    joinfreeValidate = 5
                    setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                    return false;
              }else
                    // check for minimum length
                    if (culture.length > minLength){
                         message="Culture Info should be within" + minLength + " characters long. Try again."
                         flag="false"
                         if(joinfreeValidate == 0)
                         joinfreeValidate = 5
                         setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                         return false;
                     }else if(trimFieldVal(culture)==""){
		               message="Please enter Culture Info "
		               flag="false"
		               if(joinfreeValidate == 0)
                       joinfreeValidate = 5
                       setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                       return false;
                     }else {
                            message=""
                            setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                            return true;
                            }

}//End of validating culture Info

/* For validating Additional Info*/
function validateAdditionalInfo(txtID,imageArea,messageArea){
	var invalid = " ";
    var minLength = 100; 
    var flag="true";
    var additionalInfo = document.getElementById("additionalInfo").value;
      
              if(additionalInfo==""){
                    message="Please enter Additional Info "
                    flag="false"
                    if(joinfreeValidate == 0)
                    joinfreeValidate = 6
                    setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                    return false;
              }else
                    // check for minimum length
                    if (additionalInfo.length > minLength){
                         message="Additional Info should be within" + minLength + " characters long. Try again."
                         flag="false"
                         if(joinfreeValidate == 0)
                         joinfreeValidate = 6
                         setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                         return false;
                     }else if(trimFieldVal(additionalInfo)==""){
		               message="Please enter Additional Info"
		               flag="false"
		               joinfreeValidate = 6
                       setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                       return false;
                     }else {
                      message=""
                      setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                      return true;
                    }

}//End of function validateAdditionalInfo(txtID,imageArea,messageArea)

/* Method for validating Address */
function  validateEmprAddress(txtID,imageArea,messageArea){
    var invalid = " ";
    var minLength = 40; 
    var flag="true";
    var emprAddress = document.getElementById("address").value;
      
              if(emprAddress==""){
               message="Please enter Address "
               flag="false"
               if(joinfreeValidate == 0)
               joinfreeValidate = 7
               setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
               return false;
               // check for minimum length
              }else if (emprAddress.length > minLength){
                message="Address  should be within" + minLength + " characters long. Try again."
                flag="false"
                if(joinfreeValidate == 0)
                joinfreeValidate = 7
                setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                return false;
              }else if(trimFieldVal(emprAddress)==""){
               message="Please enter Address"
               flag="false"
               if(joinfreeValidate == 0)
               joinfreeValidate = 7
               setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
               return false;
              }else {
               message=""
               setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
               return true;
             }

}//End of function  validateEmprAddress(txtID,imageArea,messageArea)

/* Method for validating Employer City*/
function validateEmprCity(txtID,imageArea,messageArea){
	var invalid = " ";
	var minLength = 25; 
	var flag="true";
	var emprCity = document.getElementById("city").value;
      
              if(emprCity==""){
                    message="Please enter City "
                    flag="false"
                    if(joinfreeValidate == 0)
                    joinfreeValidate = 8
                    setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                    return false;
                    // check for minimum length
              }else if (emprCity.length > minLength){
                         message="City should be within" + minLength + " characters long. Try again."
                         flag="false"
                         if(joinfreeValidate == 0)
                         joinfreeValidate = 8
                         setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                         return false;
                          // check for only spaces allowed in  
                     }else if(trimFieldVal(emprCity)==""){
                      message="Please enter City"
                      flag="false"
                      if(joinfreeValidate == 0)
                      joinfreeValidate = 8
                      setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                      return false;
                     }else {
                            message=""
                            setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
                            return true;
                    }


}//End of  validateEmprCity(txtID,imageArea,messageArea)
/* Method for validating Employer State*/
function validateEmprState(txtID,imageArea,messageArea){
var invalid = " ";
var minLength = 25; 
var flag="true";
var emprState = document.getElementById("state").value;
	    if(emprState==""){
	     message="Please enter State "
	     flag="false"
	     if(joinfreeValidate == 0)
	     joinfreeValidate = 9
	     setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
	     return false;
	      // check for minimum length
	    }else  if (emprState.length > minLength){
	     message="State should be within" + minLength + " characters long. Try again."
	     flag="false"
	     if(joinfreeValidate == 0)
	     joinfreeValidate = 9
	     setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
	     return false;
	    }else if(trimFieldVal(emprState)==""){
          message="Please enter State"
          flag="false"
          if(joinfreeValidate == 0)
	      joinfreeValidate = 9
	      setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
	      return false;
	    }else {
	      message=""
	      setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
	      return true;
	    }


}//End of method function validateEmprState(txtID,imageArea,messageArea)

/*Method for validating location field */
function  validateEmprLocation(txtID,imageArea,messageArea){
	var flag="true";
	var regExpZipCode = new RegExp(/(^\d{5}$)|(^\d{5}-\d{4}$)/);
	var emprLocation = document.getElementById("location").value;
	   if(emprLocation==""){
	    message="Please enter Location "
	    flag="false"
	    if(joinfreeValidate == 0)
	    joinfreeValidate = 10
	    setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
	    return false;
	   }else  if (!regExpZipCode.test(emprLocation)){
		message="Zip code must be 5 digits or 5 digits with a 4 digit suffix!"
		flag="false"
	    if(joinfreeValidate == 0)
	    joinfreeValidate = 10
	    setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
	    return false;
	    }else {
	     message=""
	     setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
	     return true;
	  }
}
//End of function  validateEmprLocation(txtID,imageArea,messageArea)

function validateEmprUpLoadImage(txtID,imageArea,messageArea)
{

    var flag="true";
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
          message="";
	      setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
          return true;
         }
        else
        {
           /* alert("Please only upload files that end in types:  "
                    + (extArray.join("  ")) + "\nPlease select a new "
                    + "file to upload and submit again."); */
                    
        message="Please only upload files that end in types:  "+ (extArray.join("  ")) 
        flag="false"
	    if(joinfreeValidate == 0)
	    joinfreeValidate = 11
	    setMessageForEmprAccountValidation(message,flag,imageArea,messageArea);
	    return false;       
       }

}

function checkEmprForm(){
 validateEmployer('organizationName','imgArea','msgArea');
 checkEmprEmail('emailId','imageArea11','msgArea11');
 reEnterEmprEmail('reEnterEmployeremail','imageArea111','msgArea111');
 validateEmprPwd('imageArea22','msgArea22');
 confirmEmprPwd('confirmimageArea22','confirmmsgArea22');
 validateOrgInfo('orgInfo','imageArea33','msgArea33');
 validateCultureInfo('culture','imageArea44','msgArea44');
 validateAdditionalInfo('additionalInfo','imageArea55','msgArea55');
 validateEmprAddress('address','imageArea66','msgArea66');
 validateEmprCity('city','imageArea77','msgArea77');
 validateEmprState('state','imageArea88','msgArea88');
 validateEmprLocation('location','imageArea99','msgArea99');
 validateEmprUpLoadImage('uploadpic','imageAreaImage','messageAreaImage');
  checkEmprVerificationCode();
 
    if(joinfreeValidate == 1){
       document.getElementById('emailId').focus()
       joinfreeValidate =0;
       return false;
     }else if(joinfreeValidate == 2){
      document.getElementById('emplrpassword').focus()
	  joinfreeValidate =0;
      return false;
     }else if(joinfreeValidate == 3){
     document.getElementById('orgInfo').focus()
     joinfreeValidate =0;
     return false;
     }else if(joinfreeValidate == 4){
     document.getElementById('culture').focus()
     joinfreeValidate =0;
     return false;
     }else if(joinfreeValidate == 5){     
     document.getElementById('additionalInfo').focus()
     joinfreeValidate =0;
     return false;
     }else if(joinfreeValidate == 6){
     document.getElementById('address').focus()
     joinfreeValidate =0;
     return false;
     }else if(joinfreeValidate == 7){
      document.getElementById('city').focus()
      joinfreeValidate =0;
      return false;
     }else if(joinfreeValidate == 8){
      document.getElementById('state').focus()
 	  joinfreeValidate =0;
      return false;
     }else if(joinfreeValidate == 9){
      document.getElementById('location').focus()
      joinfreeValidate =0;
      return false;
     }else if(joinfreeValidate == 11)
     { 
        joinfreeValidate =0;
         return false;
     }else{
     joinfreeValidate = 0;
     return true;
     } 
}


function trimFieldVal(fieldVal){
var a = fieldVal.replace(/^\s+/, '');
return a.replace(/\s+$/, '')
}
/* end of employer account*/   