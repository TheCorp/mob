	function display(){
			var text=$("#myList").val()
			$("#empeecaptcha").html("");
			$("#emprcaptcha").html("");	
			
			
			
			if(text=="Employee")
			{
			
				$("#finish_button").click(finish);
				$("#joinfree_button").click(continueProfile);		    
			    $("#restofregform").show(); 
			    $("#restofregform1").show();
			    $("#restofregform3").hide();
			    
			    
			    $("#employeeAccount").show();
			    $("#employerAccount").hide();
			   $("#employeeHeader").show();
			   $("#employerHeader").hide();
			   sjcap('Employee');
			}
			else if(text=="Employer")
			{   
			
			
			   $("#regForm").attr("action","addEmployer.action");
			   $("#restofregform2").show();
			   $("#restofregform3").show();
			   $("#restofregform").hide();
			   $("#restofregform1").hide();
			    $("#employeeAccount").hide();
			    $("#employerAccount").show();
			    $("#employeeHeader").hide();
			   $("#employerHeader").show();
			   sjcap('Employer');
			}
			else
			{  
			   $("#restofregform").hide();
			   $("#restofregform1").hide();
			   $("#restofregform2").hide();		  
			   $("#restofregform3").hide();
			} 
			
	}
	
	function finish(){
	    $("#regForm").attr("action","finishAddEmployee.action");
	}
	
	function continueProfile(){
	    $("#regForm").attr("action","addEmployee.action");
	}
	
	
	/*
	ShowTooltip = function(e)
	{
	   
		var text = $(this).next('.yellowspeechbubble');
		if (text.attr('class') != 'yellowspeechbubble')
			return false;
	
		text.fadeIn()
			.css('top', 290)
			.css('left',190);
	
		return false;
	}
	HideTooltip1 = function(e)
	{
		var text = $(this).next('.yellowspeechbubble');
		if (text.attr('class') != 'yellowspeechbubble')
			return false;
		text.fadeOut();
	}
	
	SetupTooltips = function()
	{
		$('.show-tooltip')
			.each(function(){
				$(this)
					.after($('<span/>')
						.attr('class', 'yellowspeechbubble')
						.html($(this).attr('title')))
					.attr('title', '');
			})
			.hover(ShowTooltip, HideTooltip);
	}
	
	$(document).ready(function() {
		SetupTooltips();
	});
	*/
	
	/*  Employee Account Validation*/
	var joinfreeValidate = 0;
	
	var dtCh= "/";
	
	function checkVerificationCode(){
		
	 $.post("checkJcaptcha.action",{captchaId : $("#captchaId").val()},function (data){
	 {      
	 
	        if(data.result=="success"){
	            flag="true"
	               $("#imageAreaVcode").html("");
	               $("#messageAreaVcode").html("");
	            }else{
	            message="The validation code entered is incorrect, please try again"
	            var fontColor = "red"; 
	             $("#imageAreaVcode").html("");
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
	             $("#imageArea2").html("");
	             $("#messageArea2").html("<font color=" + fontColor + ">"+ message + " </font>");
	             flag="false"
	                       if(joinfreeValidate == 0)
	                       joinfreeValidate = 2
	                       setMessageForSignup(message,flag,imageArea2,messageArea2);
	            }else{
	                flag="true"
	               $("#imageArea2").html("");
	               $("#messageArea2").html("");
	            }  
	         }else
	              {
	                message="Email already exist please try again"  
	                var fontColor = "red";                                      
	                $("#imageArea2").html("");
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
	             $("#imageArea222").html("");
	             $("#messageArea222").html("<font color=" + fontColor + ">"+ message + " </font>");
	             flag="false"
	                       if(joinfreeValidate == 0)
	                       joinfreeValidate = 2
	                       setMessageForSignup(message,flag,imageArea2,messageArea2);
	            }else{
	                flag="true"
	               $("#imageArea222").html("");
	               $("#messageArea222").html("");
	            }  
	         }else
	              {
	                message="Email already exist please try again"  
	                var fontColor = "red";                                      
	                $("#imageArea222").html("");
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
	        
	        var src=""
	            
	        if (isValid == "true")
	         {
	            src="."
	            fontColor = "green";
	            
	         }
	           imageArea.innerHTML = "";
	           messageArea.innerHTML="<font color=" + fontColor + ">"+ message + " </font>";
	           
	}
	
	
	
	
	function checkForm()
	{
	
	 	var firstName=$("#firstName").val();

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
	 validatePhoneNumber('phoneNumberId','pnImageArea','pnMessageArea');
	 validateEmprUpLoadImage('uploadpicemp','imageAreaImage','messageAreaImage');
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
	     
	     }else if(joinfreeValidate == 8)
	     {
	         document.getElementById('phoneNumberId').focus()
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
	    
	    dateDob=[];
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
		dateDob=dtStr.split("/");
		if (pos1==-1){
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
		if(dateDob[1].length>2){
			msg = "Please enter a valid day"
	        flag = "false"; 
	        setMessageForSignup(msg,flag,imageArea,messageArea);
	        if(joinfreeValidate == 0)
	          joinfreeValidate = 3     
			return false
		}
		
		if(year!=2){
			if (strYear.length != 4){
				msg = "Please enter a valid 4 digit year"
		        flag = "false"; 
		        setMessageForSignup(msg,flag,imageArea,messageArea);
		        if(joinfreeValidate == 0)
		         joinfreeValidate = 3     
				return false
			}
		}
		/*if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
			msg = "Please enter a valid date"
	        flag = "false"; 
	        setMessageForSignup(msg,flag,imageArea,messageArea);
			return false
		}*/
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
	 //var empState = document.getElementById("empState").value;
	      var empState = $("#empState").val();
	    
	       var minLength = 25; 
	              if(empState=="1")
	              {
	                    message="Please select State"
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
	
	function validateEmpZipCode(txtID,imageArea,messageArea)
	{
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
	
	function validatePhoneNumber(txtID,imageArea,messageArea)
	{
	     var flag  ="true";    
	     var message=""  
	     var phoneNo=$("#phoneNumberId").val();
	    
	   
	     var phoneRESpace = /^\(\d\d\d\) \d\d\d-\d\d\d\d$/;
	     var phoneRE = /^\(\d\d\d\)\d\d\d-\d\d\d\d$/;
	     var re10digit= /^\d{3}-\d{3}-\d{4}$/; 
	     
		   if (phoneNo.match(phoneRE))
		   {
		      
	            message=""
	            setMessageForSignup(message,flag,imageArea,messageArea);
	            return flag;
		   }else if(phoneNo.match(re10digit))
		   {
		   
		       
	            message=""
	            setMessageForSignup(message,flag,imageArea,messageArea);
	            return flag;
		   }else if(phoneNo.match(phoneRESpace))
		   {
		        
	            message=""
	            setMessageForSignup(message,flag,imageArea,messageArea);
	            return flag;
		   }else if(phoneNo=="")
		   {
		       message="Please enter phone number"
	          flag="false"
	          if(joinfreeValidate == 0)
	          joinfreeValidate =8
	          setMessageForSignup(message,flag,imageArea,messageArea);
	          return flag;
		   }
		   else
		   {
		              
		      message="The phone number entered is invalid!"
	          flag="false"
	          if(joinfreeValidate == 0)
	          joinfreeValidate =8
	          setMessageForSignup(message,flag,imageArea,messageArea);
	          return flag;
		   }
	
	
	}
	
	function trimFieldVal(fieldVal){
	var a = fieldVal.replace(/^\s+/, '');
	return a.replace(/\s+$/, '')
	}
	/* End Of Employee Account validations*/
	/* EmployerAccountValidation */
	var joinfreeValidate = 0;
	
	function checkEmprVerificationCode(){

	 $.post("checkJcaptcha.action",{captchaId : $("#emprcaptcha").val()},function (data){
	 {      
	 alert(emprcaptchaId);
	        if(data.result=="success"){
	            flag="true"
	               $("#imageAreaEmprVcode").html("");
	               $("#messageAreaEmprVcode").html("");
	            }else{
	            var fontColor = "red"; 
	            message="The validation code entered is incorrect, please try again"
	             $("#imageAreaEmprVcode").html("");
	             $("#messageAreaEmprVcode").html("<font color=" + fontColor + ">"+ message + " </font>");
	             flag="false"
	                       setMessageForEmprAccountValidation(message,flag,imageAreaEmprVcode,messageAreaEmprVcode);
	            }  
	         }
	 },"json");
	
	}
	
function checkEmprVerificationCode1(){
       
	 $.post("checkJcaptcha.action",{captchaId : $("#emprcaptcha").val()},function (data){
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
	        var src=""
	            
	        if (isValid == "true")
	         {
	            src="."
	            fontColor = "green";
	            
	         }
	           imageArea.innerHTML = "";
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
	                $("#imageArea11").html("");
	                $("#msgArea11").html("<font color=" + fontColor + ">"+ message + " </font>");
	                flag="false"
	                       if(joinfreeValidate == 0)
	                       joinfreeValidate =2
	                       setMessageForEmprAccountValidation(message,flag,imageArea11,imageArea11);
	               }else{
		               flag="true"
		               $("#imageArea11").html("");
		               $("#msgArea11").html("");
	               } 
	         }else
	              {
	                message="Email already Exist please try again"  
	                var fontColor = "red";                                      
	                $("#imageArea11").html("");
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
	                $("#imageArea111").html("");
	                $("#msgArea111").html("<font color=" + fontColor + ">"+ message + " </font>");
	                flag="false"
	                       if(joinfreeValidate == 0)
	                       joinfreeValidate =2
	                       setMessageForEmprAccountValidation(message,flag,imageArea111,imageArea111);
	               }else{
		               flag="true"
		               $("#imageArea111").html("");
		               $("#msgArea111").html("");
	               } 
	         }else
	              {
	                message="Email already Exist please try again"  
	                var fontColor = "red";                                      
	                $("#imageArea111").html("");
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
	 alert("123");
	 validateEmployer('organizationName','imgArea','msgArea');
	 alert(organizationName);
	 checkEmprEmail('emailId','imageArea11','msgArea11');
	 alert
	 reEnterEmprEmail('reEnterEmployeremail','imageArea111','msgArea111');
	 CheckReEnterEmail('reEnteredEmail','imageArea222','messageArea222')
	 validateEmprPwd('imageArea22','msgArea22');
	 confirmEmprPwd('confirmimageArea22','confirmmsgArea22');
	 
	 alert("Check Employer Form123")
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
	     }
	     
	     else{
	     joinfreeValidate = 0;
	     return true;
	     }  
	     
	    // joinfreeValidate = 0;
	    // return true;
	      $("#employerRegForm").attr("action","addEmployer.action");
	}
	
	
	function trimFieldVal(fieldVal){
	var a = fieldVal.replace(/^\s+/, '');
	return a.replace(/\s+$/, '')
	}
	/* end of employer account*/   
	
	/* Start of jcap.js */
	
	var imgdir = "../styles/default/images/captcha_images/"; // identify directory where captcha images are located
	var jfldid = "uword"; // identify word field id name
	var jfldsz = 20; // identify word field size
	
	function sjcap(type,jfldcls){
		//imgdir = encodeURIComponent(imgdir);
		if (jfldcls == null){
		jfldcls = "";
		}
		
		
		anum = (Math.floor(Math.random()*191))+1;
		imgid = parseInt(anum);
		cword = 
		["60ee0bc62638fccf2d37ac27a634a9e9", "68e2d83709f317938b51e53f7552ed04", "f4c9385f1902f7334b00b9b4ecd164de",
		 "df491a4de50739fa9cffdbd4e3f4b4bb", "ef56b0b0ddb93c2885892c06be830c68", "fe4c0f30aa359c41d9f9a5f69c8c4192",
		 "cbf4e0b7971051760907c327e975f4e5", "ea9e801b0d806f2398bd0c7fe3f3f0cd", "609a8f6f218fdfe6f955e19f818ec050",
		 "cbf4e0b7971051760907c327e975f4e5", "8cb554127837a4002338c10a299289fb", "28f9b1cae5ae23caa8471696342f6f0c",
		 "74e04ddb55ce3825f65ebec374ef8f0d", "567904efe9e64d9faf3e41ef402cb568", "7edabf994b76a00cbc60c95af337db8f",
		 "639849f6b368019778991b32434354fc", "7edabf994b76a00cbc60c95af337db8f", "dd8fc45d87f91c6f9a9f43a3f355a94a",
		 "eb5c1399a871211c7e7ed732d15e3a8b", "8cb554127837a4002338c10a299289fb", "0b8263d341de01f741e4deadfb18f9eb",
		 "87fa4eaaf3698e1b1e2caadabbc8ca60", "327a6c4304ad5938eaf0efb6cc3e53dc", "841a2d689ad86bd1611447453c22c6fc",
		 "ceb20772e0c9d240c75eb26b0e37abee", "a3e2a6cbf4437e50816a60a64375490e", "bc8fba5b68a7babc05ec51771bf6be21",
		 "68934a3e9455fa72420237eb05902327", "c9fab33e9458412c527c3fe8a13ee37d", "2fc01ec765ec0cb3dcc559126de20b30",
		 "fcc790c72a86190de1b549d0ddc6f55c", "918b81db5e91d031548b963c93845e5b", "9dfc8dce7280fd49fc6e7bf0436ed325",
		 "ea82410c7a9991816b5eeeebe195e20a", "fb81c91eb92d6cb64aeb64c3f37ef2c4", "8d45c85b51b27a04ad7fdfc3f126f9f8",
		 "70dda5dfb8053dc6d1c492574bce9bfd", "b9b83bad6bd2b4f7c40109304cf580e1", "981c1e7b3795da18687613fbd66d4954",
		 "e170e3a15923188224c1c2bd1477d451", "fb81c91eb92d6cb64aeb64c3f37ef2c4", "cb15e32f389b7af9b285a63ca1044651",
		 "632a2406bbcbcd553eec45ac14b40a0a", "e7b95b49658278100801c88833a52522", "6d4db5ff0c117864a02827bad3c361b9",
		 "8b373710bcf876edd91f281e50ed58ab", "508c75c8507a2ae5223dfd2faeb98122", "97f014516561ef487ec368d6158eb3f4",
		 "23678db5efde9ab46bce8c23a6d91b50", "2d6b0cefb06fd579a62bf56f02b6c2b3", "f1bdf5ed1d7ad7ede4e3809bd35644b0",
		 "3ddaeb82fbba964fb3461d4e4f1342eb", "c9507f538a6e79c9bd6229981d6e05a3", "9e925e9341b490bfd3b4c4ca3b0c1ef2",
		 "125097a929a62998c06340ea9ef43d77", "a557264a7d6c783f6fb57fb7d0b9d6b0", "eba478647c77836e50de44b323564bdb",
		 "45fe7e5529d283851d93b74536e095a0", "56609ab6ba04048adc2cbfafbe745e10", "d938ad5cbe68bec494fbbf4463ad031d",
		 "9bbd993d9da7df60b3fd4a4ed721b082", "a6ab62e9da89b20d720c70602624bfc2", "51037a4a37730f52c8732586d3aaa316",
		 "7c4f29407893c334a6cb7a87bf045c0d", "3b7770f7743e8f01f0fd807f304a21d0", "29d233ae0b83eff6e5fbd67134b88717",
		 "8d45c85b51b27a04ad7fdfc3f126f9f8", "9aa91f81de7610b371dd0e6fe4168b01", "9f27410725ab8cc8854a2769c7a516b8",
		 "6ee6a213cb02554a63b1867143572e70", "918b81db5e91d031548b963c93845e5b", "3767b450824877f2b8f284f7a5625440",
		 "81513effdf5790b79549208838404407", "7aea2552dfe7eb84b9443b6fc9ba6e01", "d8735f7489c94f42f508d7eb1c249584",
		 "fde27e470207e146b29b8906826589cb", "2a2d595e6ed9a0b24f027f2b63b134d6", "99e0d947e01bbc0a507a1127dc2135b1",
		 "6758fcdc0da017540d11889c22bb5a6e", "ab1991b4286f7e79720fe0d4011789c8", "28f9b1cae5ae23caa8471696342f6f0c",
		 "f5b75010ea8a54b96f8fe7dafac65c18", "2570c919f5ef1d7091f0f66d54dac974", "ada15bd1a5ddf0b790ae1dcfd05a1e70",
		 "eb88d7636980738cd0522ea69e212905", "83ab982dd08483187289a75163dc50fe", "8ac20bf5803e6067a65165d9df51a8e7",
		 "7c4f29407893c334a6cb7a87bf045c0d", "67942503875c1ae74e4b5b80a0dade01", "d74fdde2944f475adc4a85e349d4ee7b",
		 "163ccb6353c3b5f4f03cda0f1c5225ba", "6b1628b016dff46e6fa35684be6acc96", "de1b2a7baf7850243db71c4abd4e5a39",
		 "5eda0ea98768e91b815fa6667e4f0178", "23ec24c5ca59000543cee1dfded0cbea", "ea9e801b0d806f2398bd0c7fe3f3f0cd",
		 "35393c24384b8862798716628f7bc6f4", "28b26be59c986170c572133aaace31c2", "c2bfd01762cfbe4e34cc97b9769b4238",
		 "22811dd94d65037ef86535740b98dec8", "acaa16770db76c1ffb9cee51c3cabfcf", "7516c3b35580b3490248629cff5e498c",
		 "b04ab37e571600800864f7a311e2a386", "7e25b972e192b01004b62346ee9975a5", "2764ca9d34e90313978d044f27ae433b",
		 "660cb6fe7437d4b40e4a04b706b93f70", "87a429872c7faee7e8bc9268d5bf548e", "31c13f47ad87dd7baa2d558a91e0fbb9",
		 "e6ec529ba185279aa0adcf93e645c7cd", "21a361d96e3e13f5f109748c2a9d2434", "85814ce7d88361ec8eb8e07294043bc3",
		 "a5fdad9de7faf3a0492812b9cb818d85", "0b8263d341de01f741e4deadfb18f9eb", "0cb47aeb6e5f9323f0969e628c4e59f5",
		 "23a58bf9274bedb19375e527a0744fa9", "7e25b972e192b01004b62346ee9975a5", "b9d27d6b3d1915aacd5226b9d702bdbb",
		 "6758fcdc0da017540d11889c22bb5a6e", "e2704f30f596dbe4e22d1d443b10e004", "da4f0053a5c13882268852ae2da2e466",
		 "1562eb3f6d9c5ac7e159c04a96ff4dfe", "a94aa000f9a94cc51775bd5eac97c926", "1e4483e833025ac10e6184e75cb2d19d",
		 "a957a3153eb7126b1c5f8b6aac35de53", "731b886d80d2ea138da54d30f43b2005", "a850c17cba5eb16b0d3d40a106333bd5",
		 "7516c3b35580b3490248629cff5e498c", "d508fe45cecaf653904a0e774084bb5c", "18ccf61d533b600bbf5a963359223fe4",
		 "f4d3b5a1116ded3facefb8353d0bd5ba", "28b26be59c986170c572133aaace31c2", "d5ca322453f2986b752e58b11af83d96",
		 "37b19816109a32106d109e83bbb3c97d", "0423fa423baf1ea8139f6662869faf2f", "8ab8a4dfab57b4618331ffc958ebb4ec",
		 "85814ce7d88361ec8eb8e07294043bc3", "273b9ae535de53399c86a9b83148a8ed", "4c9184f37cff01bcdc32dc486ec36961",
		 "8ee2027983915ec78acc45027d874316", "1cba77c39b4d0a81024a7aada3655a28", "de1b2a7baf7850243db71c4abd4e5a39",
		 "608f0b988db4a96066af7dd8870de96c", "06a224da9e61bee19ec9eef88b95f934", "df55340f75b5da454e1c189d56d7f31b",
		 "8c728e685ddde9f7fbbc452155e29639", "2570c919f5ef1d7091f0f66d54dac974", "dce7c4174ce9323904a934a486c41288",
		 "573ce5969e9884d49d4fab77b09a306a", "d5ca322453f2986b752e58b11af83d96", "eb88d7636980738cd0522ea69e212905",
		 "e7e94d9ef1edaf2c6c55e9966b551295", "762f8817ab6af0971fe330dbf46a359a", "d8a48e3f0e1322d53d401e3dcb3360db",
		 "c1940aeeb9693a02e28c52eb85ce261c", "d74fdde2944f475adc4a85e349d4ee7b", "b6a5d96a4e99b63723ab54ddb471baad",
		 "6b157916b43b09df5a22f658ccb92b64", "bec670e5a55424d840db8636ecc28828", "4a6cbcd66d270792b89f50771604d093",
		 "07202a7e6cbfbabe27abba87989f807e", "d60db28d94d538bbb249dcc7f2273ab1", "123402c04dcfb6625f688f771a5fc05d",
		 "cd69b4957f06cd818d7bf3d61980e291", "be1ab1632e4285edc3733b142935c60b", "2bda2998d9b0ee197da142a0447f6725",
		 "ba535ef5a9f7b8bc875812bb081286bb", "e9f40e1f1d1658681dad2dac4ae0971e", "eabe04e738cfb621f819e4e8f9489234",
		 "aa2d6e4f578eb0cfaba23beef76c2194", "126ac4b07f93bc4f7bed426f5e978c16", "f43dff9a0dc54f0643d0c6d7971635f0",
		 "ccaaac957ec37bde4c9993a26a064730", "2feaaf89c21770ea5c21196bc33848dd", "07cf4f8f5d8b76282917320715dda2ad",
		 "1ffd9e753c8054cc61456ac7fac1ac89", "6050ce63e4bce6764cb34cac51fb44d1", "327a6c4304ad5938eaf0efb6cc3e53dc",
		 "b82c91e2103d0a495c099f0a12f66363", "41d1de28e96dc1cde568d3b068fa17bb", "cad1c068cb62b0681fe4c33d1db1bad6",
		 "de1b2a7baf7850243db71c4abd4e5a39", "75e52a0ecfafeda17a34fc60111c1f0b", "fc7e987f23de5bd6562b7c0063cad659",
		 "126ac4b07f93bc4f7bed426f5e978c16", "fcc790c72a86190de1b549d0ddc6f55c", "72792fa10d4ca61295194377da0bcc05",
		 "821f03288846297c2cf43c34766a38f7", "faec47e96bfb066b7c4b8c502dc3f649", "78b6367af86e03f19809449e2c365ff5",
		 "015f28b9df1bdd36427dd976fb73b29d", "755f85c2723bb39381c7379a604160d8"];
			
		  var text = "<p><input type=\"text\" id=\"" + jfldid + "\" name=\"" + jfldid + "\" class=\"" + jfldcls + "\" size=\"" +  jfldsz + "\"><\/p>"+
				"<p><img src=\"" + imgdir + imgid + ".jpg\" width=\"200\" height=\"80\" alt=\"\"><\/p>";
		
		if(type=='Employee'){
		  $("#empeecaptcha").html(text);
		}else{
			$("#emprcaptcha").html(text);		
		}
	}
	
	function jcap(){
			var uword = hex_md5(document.getElementById(jfldid).value);
			var text=$("#myList").val();
			if(text=="Employee"){
			if (uword==cword[anum-1]) {
			$("#imageAreaVcode").html("");
			$("#messageAreaVcode").html("");
			return true;
		   }
		else{
			var message="ERROR: Enter the code as it is shown.";
			var fontColor="red";
			$("#imageAreaVcode").html("");
			$("#messageAreaVcode").html("<font color=" + fontColor + ">"+ message + " </font>");
			document.getElementById(jfldid).focus();
			return false;
		}
	  }else{
		 if (uword==cword[anum-1]) {
			 $("#imageAreaEmprVcode").html("");
			 $("#messageAreaEmprVcode").html("");
			return true;
			}
		else {
			var message="ERROR: Enter the code as it is shown.";
			var fontColor="red";
			$("#imageAreaEmprVcode").html("");
			$("#messageAreaEmprVcode").html("<font color=" + fontColor + ">"+ message + " </font>");
			document.getElementById(jfldid).focus();
			return false;
		 }
	  }
	}
	
	
	
	//  End of Jcap.js
	
	/* Start of md5.js */
	
	/*
	 * A JavaScript implementation of the RSA Data Security, Inc. MD5 Message
	 * Digest Algorithm, as defined in RFC 1321.
	 * Version 2.1 Copyright (C) Paul Johnston 1999 - 2002.
	 * Other contributors: Greg Holt, Andrew Kepert, Ydnar, Lostinet
	 * Distributed under the BSD License
	 * See http://pajhome.org.uk/crypt/md5 for more info.
	 */
	
	/*
	 * Configurable variables. You may need to tweak these to be compatible with
	 * the server-side, but the defaults work in most cases.
	 */
	var hexcase = 0;  /* hex output format. 0 - lowercase; 1 - uppercase        */
	var b64pad  = ""; /* base-64 pad character. "=" for strict RFC compliance   */
	var chrsz   = 8;  /* bits per input character. 8 - ASCII; 16 - Unicode      */
	
	/*
	 * These are the functions you'll usually want to call
	 * They take string arguments and return either hex or base-64 encoded strings
	 */
	function hex_md5(s){ return binl2hex(core_md5(str2binl(s), s.length * chrsz));}
	function b64_md5(s){ return binl2b64(core_md5(str2binl(s), s.length * chrsz));}
	function str_md5(s){ return binl2str(core_md5(str2binl(s), s.length * chrsz));}
	function hex_hmac_md5(key, data) { return binl2hex(core_hmac_md5(key, data)); }
	function b64_hmac_md5(key, data) { return binl2b64(core_hmac_md5(key, data)); }
	function str_hmac_md5(key, data) { return binl2str(core_hmac_md5(key, data)); }
	
	/*
	 * Perform a simple self-test to see if the VM is working
	 */
	function md5_vm_test()
	{
	  return hex_md5("abc") == "900150983cd24fb0d6963f7d28e17f72";
	}
	
	/*
	 * Calculate the MD5 of an array of little-endian words, and a bit length
	 */
	function core_md5(x, len)
	{
	  /* append padding */
	  x[len >> 5] |= 0x80 << ((len) % 32);
	  x[(((len + 64) >>> 9) << 4) + 14] = len;
	
	  var a =  1732584193;
	  var b = -271733879;
	  var c = -1732584194;
	  var d =  271733878;
	
	  for(var i = 0; i < x.length; i += 16)
	  {
	    var olda = a;
	    var oldb = b;
	    var oldc = c;
	    var oldd = d;
	
	    a = md5_ff(a, b, c, d, x[i+ 0], 7 , -680876936);
	    d = md5_ff(d, a, b, c, x[i+ 1], 12, -389564586);
	    c = md5_ff(c, d, a, b, x[i+ 2], 17,  606105819);
	    b = md5_ff(b, c, d, a, x[i+ 3], 22, -1044525330);
	    a = md5_ff(a, b, c, d, x[i+ 4], 7 , -176418897);
	    d = md5_ff(d, a, b, c, x[i+ 5], 12,  1200080426);
	    c = md5_ff(c, d, a, b, x[i+ 6], 17, -1473231341);
	    b = md5_ff(b, c, d, a, x[i+ 7], 22, -45705983);
	    a = md5_ff(a, b, c, d, x[i+ 8], 7 ,  1770035416);
	    d = md5_ff(d, a, b, c, x[i+ 9], 12, -1958414417);
	    c = md5_ff(c, d, a, b, x[i+10], 17, -42063);
	    b = md5_ff(b, c, d, a, x[i+11], 22, -1990404162);
	    a = md5_ff(a, b, c, d, x[i+12], 7 ,  1804603682);
	    d = md5_ff(d, a, b, c, x[i+13], 12, -40341101);
	    c = md5_ff(c, d, a, b, x[i+14], 17, -1502002290);
	    b = md5_ff(b, c, d, a, x[i+15], 22,  1236535329);
	
	    a = md5_gg(a, b, c, d, x[i+ 1], 5 , -165796510);
	    d = md5_gg(d, a, b, c, x[i+ 6], 9 , -1069501632);
	    c = md5_gg(c, d, a, b, x[i+11], 14,  643717713);
	    b = md5_gg(b, c, d, a, x[i+ 0], 20, -373897302);
	    a = md5_gg(a, b, c, d, x[i+ 5], 5 , -701558691);
	    d = md5_gg(d, a, b, c, x[i+10], 9 ,  38016083);
	    c = md5_gg(c, d, a, b, x[i+15], 14, -660478335);
	    b = md5_gg(b, c, d, a, x[i+ 4], 20, -405537848);
	    a = md5_gg(a, b, c, d, x[i+ 9], 5 ,  568446438);
	    d = md5_gg(d, a, b, c, x[i+14], 9 , -1019803690);
	    c = md5_gg(c, d, a, b, x[i+ 3], 14, -187363961);
	    b = md5_gg(b, c, d, a, x[i+ 8], 20,  1163531501);
	    a = md5_gg(a, b, c, d, x[i+13], 5 , -1444681467);
	    d = md5_gg(d, a, b, c, x[i+ 2], 9 , -51403784);
	    c = md5_gg(c, d, a, b, x[i+ 7], 14,  1735328473);
	    b = md5_gg(b, c, d, a, x[i+12], 20, -1926607734);
	
	    a = md5_hh(a, b, c, d, x[i+ 5], 4 , -378558);
	    d = md5_hh(d, a, b, c, x[i+ 8], 11, -2022574463);
	    c = md5_hh(c, d, a, b, x[i+11], 16,  1839030562);
	    b = md5_hh(b, c, d, a, x[i+14], 23, -35309556);
	    a = md5_hh(a, b, c, d, x[i+ 1], 4 , -1530992060);
	    d = md5_hh(d, a, b, c, x[i+ 4], 11,  1272893353);
	    c = md5_hh(c, d, a, b, x[i+ 7], 16, -155497632);
	    b = md5_hh(b, c, d, a, x[i+10], 23, -1094730640);
	    a = md5_hh(a, b, c, d, x[i+13], 4 ,  681279174);
	    d = md5_hh(d, a, b, c, x[i+ 0], 11, -358537222);
	    c = md5_hh(c, d, a, b, x[i+ 3], 16, -722521979);
	    b = md5_hh(b, c, d, a, x[i+ 6], 23,  76029189);
	    a = md5_hh(a, b, c, d, x[i+ 9], 4 , -640364487);
	    d = md5_hh(d, a, b, c, x[i+12], 11, -421815835);
	    c = md5_hh(c, d, a, b, x[i+15], 16,  530742520);
	    b = md5_hh(b, c, d, a, x[i+ 2], 23, -995338651);
	
	    a = md5_ii(a, b, c, d, x[i+ 0], 6 , -198630844);
	    d = md5_ii(d, a, b, c, x[i+ 7], 10,  1126891415);
	    c = md5_ii(c, d, a, b, x[i+14], 15, -1416354905);
	    b = md5_ii(b, c, d, a, x[i+ 5], 21, -57434055);
	    a = md5_ii(a, b, c, d, x[i+12], 6 ,  1700485571);
	    d = md5_ii(d, a, b, c, x[i+ 3], 10, -1894986606);
	    c = md5_ii(c, d, a, b, x[i+10], 15, -1051523);
	    b = md5_ii(b, c, d, a, x[i+ 1], 21, -2054922799);
	    a = md5_ii(a, b, c, d, x[i+ 8], 6 ,  1873313359);
	    d = md5_ii(d, a, b, c, x[i+15], 10, -30611744);
	    c = md5_ii(c, d, a, b, x[i+ 6], 15, -1560198380);
	    b = md5_ii(b, c, d, a, x[i+13], 21,  1309151649);
	    a = md5_ii(a, b, c, d, x[i+ 4], 6 , -145523070);
	    d = md5_ii(d, a, b, c, x[i+11], 10, -1120210379);
	    c = md5_ii(c, d, a, b, x[i+ 2], 15,  718787259);
	    b = md5_ii(b, c, d, a, x[i+ 9], 21, -343485551);
	
	    a = safe_add(a, olda);
	    b = safe_add(b, oldb);
	    c = safe_add(c, oldc);
	    d = safe_add(d, oldd);
	  }
	  return Array(a, b, c, d);
	
	}
	
	/*
	 * These functions implement the four basic operations the algorithm uses.
	 */
	function md5_cmn(q, a, b, x, s, t)
	{
	  return safe_add(bit_rol(safe_add(safe_add(a, q), safe_add(x, t)), s),b);
	}
	function md5_ff(a, b, c, d, x, s, t)
	{
	  return md5_cmn((b & c) | ((~b) & d), a, b, x, s, t);
	}
	function md5_gg(a, b, c, d, x, s, t)
	{
	  return md5_cmn((b & d) | (c & (~d)), a, b, x, s, t);
	}
	function md5_hh(a, b, c, d, x, s, t)
	{
	  return md5_cmn(b ^ c ^ d, a, b, x, s, t);
	}
	function md5_ii(a, b, c, d, x, s, t)
	{
	  return md5_cmn(c ^ (b | (~d)), a, b, x, s, t);
	}
	
	/*
	 * Calculate the HMAC-MD5, of a key and some data
	 */
	function core_hmac_md5(key, data)
	{
	  var bkey = str2binl(key);
	  if(bkey.length > 16) bkey = core_md5(bkey, key.length * chrsz);
	
	  var ipad = Array(16), opad = Array(16);
	  for(var i = 0; i < 16; i++)
	  {
	    ipad[i] = bkey[i] ^ 0x36363636;
	    opad[i] = bkey[i] ^ 0x5C5C5C5C;
	  }
	
	  var hash = core_md5(ipad.concat(str2binl(data)), 512 + data.length * chrsz);
	  return core_md5(opad.concat(hash), 512 + 128);
	}
	
	/*
	 * Add integers, wrapping at 2^32. This uses 16-bit operations internally
	 * to work around bugs in some JS interpreters.
	 */
	function safe_add(x, y)
	{
	  var lsw = (x & 0xFFFF) + (y & 0xFFFF);
	  var msw = (x >> 16) + (y >> 16) + (lsw >> 16);
	  return (msw << 16) | (lsw & 0xFFFF);
	}
	
	/*
	 * Bitwise rotate a 32-bit number to the left.
	 */
	function bit_rol(num, cnt)
	{
	  return (num << cnt) | (num >>> (32 - cnt));
	}
	
	/*
	 * Convert a string to an array of little-endian words
	 * If chrsz is ASCII, characters >255 have their hi-byte silently ignored.
	 */
	function str2binl(str)
	{
	  var bin = Array();
	  var mask = (1 << chrsz) - 1;
	  for(var i = 0; i < str.length * chrsz; i += chrsz)
	    bin[i>>5] |= (str.charCodeAt(i / chrsz) & mask) << (i%32);
	  return bin;
	}
	
	/*
	 * Convert an array of little-endian words to a string
	 */
	function binl2str(bin)
	{
	  var str = "";
	  var mask = (1 << chrsz) - 1;
	  for(var i = 0; i < bin.length * 32; i += chrsz)
	    str += String.fromCharCode((bin[i>>5] >>> (i % 32)) & mask);
	  return str;
	}
	
	/*
	 * Convert an array of little-endian words to a hex string.
	 */
	function binl2hex(binarray)
	{
	  var hex_tab = hexcase ? "0123456789ABCDEF" : "0123456789abcdef";
	  var str = "";
	  for(var i = 0; i < binarray.length * 4; i++)
	  {
	    str += hex_tab.charAt((binarray[i>>2] >> ((i%4)*8+4)) & 0xF) +
	           hex_tab.charAt((binarray[i>>2] >> ((i%4)*8  )) & 0xF);
	  }
	  return str;
	}
	
	/*
	 * Convert an array of little-endian words to a base-64 string
	 */
	function binl2b64(binarray)
	{
	  var tab = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
	  var str = "";
	  for(var i = 0; i < binarray.length * 4; i += 3)
	  {
	    var triplet = (((binarray[i   >> 2] >> 8 * ( i   %4)) & 0xFF) << 16)
	                | (((binarray[i+1 >> 2] >> 8 * ((i+1)%4)) & 0xFF) << 8 )
	                |  ((binarray[i+2 >> 2] >> 8 * ((i+2)%4)) & 0xFF);
	    for(var j = 0; j < 4; j++)
	    {
	      if(i * 8 + j * 6 > binarray.length * 32) str += b64pad;
	      else str += tab.charAt((triplet >> 6*(3-j)) & 0x3F);
	    }
	  }
	  return str;
	}
	
	function addEmployerURL() 
{
   
   
    var   name=  $("#name").val();
    var nameOfURL=$("#nameURL").val();
    var checkURL=nameOfURL.startsWith("http://www.");
	var checkURL2=nameOfURL.startsWith("www.");
	if(nameOfURL==""){
		$("#nameId").show();
		$("#nameId").html("<h5>Please enter name of URL.</h5>");
		return false;
	}else if((checkURL==false)&&(checkURL2==false)){
		$("#nameId").show();
		$("#nameId").html("<h5>Please  enter valid URL.</h5>");
		return false;
	}
	
	
}

function checkEmployerForm()
	{
	 alert("HIIIIIIII");
	   var   name=  $("#reEnteredEmail1").val();
	 validate('organizationName','imageArea','messageArea');
	
	// validate('lastName','imageArea1','messageArea1');
	 CheckEmailForSignup('emailId','imageArea2','messageArea2');
	  alert(name);
	 CheckReEnterEmail('reEnteredEmail1','imageArea222','messageArea222')
	// checkDate('dob','imageArea3','messageArea3');
	 validatePwd('imageArea5','messageArea5');
	 confirmPwd('imageArea555','messageArea555');
	 validateEmpCity('empCity','imageArea6','messageArea6');
	 validateEmpState('empState','imageArea7','messageArea7');
	 validateEmpZipCode('empZipCode','imageArea8','messageArea8');
	 validatePhoneNumber('phoneNumberId','pnImageArea','pnMessageArea');
	 validateEmprUpLoadImage('uploadpicemp','imageAreaImage','messageAreaImage');
	  alert("HI22222222222222");
	  //    checkEmprVerificationCode();
	 
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
	     
	     }else if(joinfreeValidate == 8)
	     {
	         document.getElementById('phoneNumberId').focus()
	    	joinfreeValidate =0;
	            return false;
	     }     
	      else
	      {
	         joinfreeValidate = 0;
	         return true;
	      
	     } 
	     alert("action");
	  $("#employerRegForm").attr("action","addEmployer.action");
	}
	
	function checkEmprForm2(){
	alert("HIIII");
	 validateEmployer('organizationNameId','imgArea','msgArea');
	 alert("ggg");
	 checkEmprEmail('emailId','imageArea11','msgArea11');
	  validatePhoneNumber('phoneNumberId','pnImageArea','pnMessageArea');
	// reEnterEmprEmail('reEnterEmployeremail','imageArea111','msgArea111');
	 validateEmprPwd('imageArea22','msgArea22');
	 confirmEmprPwd('confirmimageArea22','confirmmsgArea22');
	// validateOrgInfo('orgInfo','imageArea33','msgArea33');
	// validateCultureInfo('culture','imageArea44','msgArea44');
	// validateAdditionalInfo('additionalInfo','imageArea55','msgArea55');
// validateEmprAddress('address','imageArea66','msgArea66');
	// validateEmprCity('city','imageArea77','msgArea77');
	// validateEmprState('state','imageArea88','msgArea88');
	// validateEmprLocation('location','imageArea99','msgArea99');
	 //validateEmprUpLoadImage('uploadpic','imageAreaImage','messageAreaImage');
	
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
	
	/* End of md5.js */
