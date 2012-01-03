function display(){
		var text=$("#myList").val()
		$("#empeecaptcha").html("");
		$("#emprcaptcha").html("");	
		if(text=="Employee")
		{
		   $("#toolTipId").hide();
		   $("#regForm").attr("action","addEmployee.action");
		   $("#restofregform").show(); 
		    $("#restofregform1").show();
		    $("#restofregform2").hide();
		   $("#restofregform3").hide();
		   sjcap('Employee');
		   
		}
		else if(text=="Employer")
		{   
		   $("#toolTipId").hide();
		   $("#regForm").attr("action","addEmployer.action");
		   $("#restofregform2").show();
		   $("#restofregform3").show();
		   $("#restofregform").hide();
		   $("#restofregform1").hide();
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
ShowTooltip = function(e)
{
     $("#toolTipId").show();
	var text = $(this).next('.yellowspeechbubble');
	if (text.attr('class') != 'yellowspeechbubble')
		return false;

	text.fadeIn()
		.css('top', 290)
		.css('left',190);

	return false;
}
HideTooltip = function(e)
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

/* start of addTrainingDetails.js*/
var count = 0;
var Delete = 0;


function addTrainingDetails1() {

    $("#traingId").hide();
    var trainingName = $("#training_textbox").val();
     
    if (trainingName.length>45)
    {
        $("#traingId").show();
        return;

    } 
    if (trainingName == "")
    {
        return;

    }
    else
    {


        count = count + 1;
	     //Html text genertation for displaying of the data dynamically on click of add.	
        var htmlText = "<div class='add_training_row' id='divTable" + count + "'><table border='0'><tr><td><table  border='0'> <tr>" +
                       "<td class='atc_name'id='trainingNameCount" + count + "'>" + trainingName + "</td>" +
                       "</tr></table></td><td><div class='atc_actions'>" +
                       "<table  border='0'><tr>" +
                       "<td id='image_cross1' onclick=deleteTrainingDetails('" + count + "') ></td></tr>" +
                       "</table></div></td></tr></table>" +
        //These details are used for storing the data into database.
                       "<input type='hidden' id='trainingNameCount1" + count + "' name='trainingName' value='" + trainingName + "'/></div>";
		 //Appending the new row along with the old data		 

        $("#add_training_row_id").append(htmlText)

    }


    $("#training_textbox").val("");

}


function deleteTrainingDetails(delID) {

    $("#divTable" + delID).remove();
}

/* End of addTrainingDetails.js*/

function setPercAnsweredTo(percentage)
{

    var pA = document.getElementById("percAnswered");
    var total = pA.offsetWidth;
    var newWidth = Math.floor((percentage / 100) * total);
    pA.getElementsByTagName("div")[0].style.width = newWidth + "px";
    document.getElementById("percExpl").innerHTML = percentage + "% of questions answered.";

}

function setTrainingVal1() {
   
     
     $("#picId").html("")
     $("#training_textbox").val("");
      
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
           $("#picId").html('');	     
           return true;
         }
        else
        {
           /* alert("Please only upload files that end in types:  "
                    + (extArray.join("  ")) + "\nPlease select a new "
                    + "file to upload and submit again."); */
            
        $("#picId").html('<h5>Please upload .jpg or .gif files');      
        return false;            
               
       }
 }
   

function checkPhoneNumber() {

    var phoneNo = $("#phoneNumberId").val();
    var phoneRE = /^\(\d\d\d\) \d\d\d-\d\d\d\d$/;
    if (phoneNo.match(phoneRE) || !isNaN(phoneNo)) {
        return true;
    } else {
        alert("The phone number entered is invalid!");
        return false;
    }
}
/*  Start of  WorkExperence.js*/
var count =0;
var Edit =0; 
var Delete =0;
var dtCh= "/";

function addExperience1(){
   
    $("#validateWorkExp").html("");
	var companyName = $("#companyname_txtbox").val();
	var description = $("#description_txtbox").val();
	var workStart = $("#workStart_txtbox").val();
	var workEnd = $("#workEnd_txtbox").val();	

	if(companyName=="")
	{
		//alert('Please enter Company name');
		$("#validateWorkExp").html('<h5>Please enter companyname</h5>');
		return;	
	}
	 if(companyName.length>45)
	{   
		//alert('Please enter Company name');
		$("#validateWorkExp").html('<h5>Companyname should have less than 45 characters</h5>');
		return;	
	}
	
				
	if(description=="")
	{
		//alert('Please enter Title/Position');
		$("#validateWorkExp").html('<h5>Please enter title/position</h5>');
		return;	
	}
	 if(description.length>45)
	{    
		//alert('Please enter Company name');
		$("#validateWorkExp").html('<h5>Title/Position should have less than 45 characters</h5>');
		return;	
	}	
	 if(workStart=="")
	 { 
	 // alert('Please enter workStart date');
	 $("#validateWorkExp").html('<h5>Please enter From date</h5>');
	  return false; 
	 }
 
	 else{
	 	  if(isDate(workStart)==false){
		     workStart.focus()
			 return false
		   }
	 }

	if(workEnd!="")
	{
	 	  if(isDate(workEnd)==false)
	 	  {
		     workEnd.focus()
			 return false
		   }
    }

	var start=new Date(workStart);
	var end=new Date(workEnd);
	if (start>=end){
	//alert ("WorkEnd Date should be greater than WorkStart Date");
	$("#validateWorkExp").html('<h5>To date should be greater than From date</h5>');
	return false
	}
	
	
	//to check whether to add or to edit if edit=0 then add else Edit	    
    if(Edit == 0)
    {       
	     count = count+1;
	     //Html text genertation for displaying of the data dynamically on click of add.	
		 var htmlText= "<div class='exp_entry' id='divTable"+count+"'><table border='0'><tr><td><table  border='0'> <tr>"+
		 "<td class='where' id='cmpCountdiv"+count+"'>" + companyName+ "</td>" +
		 "<td class='what' id='descCountdiv"+count+"'>" + description + "</td>" +
		 "<td class='when' id='wsCountdiv"+count+"'>" + workStart 
		 if(workEnd!="")
		 {
		  
		 
		  htmlText+="-\n"+workEnd;
		 }
		 
		 htmlText+="</td>" + "</tr></table></td><td><div class='actions'>"+
		 
		 "<table  border='0'><tr>"+
		 "<td id='image_edit'onclick='editExperience1("+count+")'></td><td id='image_cross' onclick=deleteExperience('"+count+"') ></td></tr>"+
		 "</table></div></td></tr></table>" +
		 //These details are used for storing the data into database.
		 "<input type='hidden' id='cmpCount_tb"+count+"' name='employerName' value='"+companyName+"'/>"+ 
		 "<input type='hidden' id='descCount_tb"+count+"' name='description' value='" + description + "'/>"+
		 "<input type='hidden' id='wsCount_tb"+count+"' name='workStart' value='" + workStart + "'/>"+
		 "<input type='hidden' id='weCount_tb"+count+"' name='workEnd' value='" + workEnd + "'/></div>";
		 
		 //Appending the new row along with the old data		 
		 $("#currentWorkExp").append(htmlText)
		
		
	}
	else{	
	/* Editing for display purpose in table */ 
	  $("#cmpCountdiv"+Edit).html(companyName);
	  $("#descCountdiv"+Edit).html(description);
	  $("#wsCountdiv"+Edit).html(workStart +"-"+ workEnd);
	  
	  /* Editing values for hidden feilds for stroing into database */
	  
	  $("#cmpCount_tb"+ Edit).val(companyName);
	  $("#descCount_tb"+ Edit).val(description);
	  $("#wsCount_tb"+ Edit).val(workStart);
	  $("#weCount_tb"+ Edit).val(workEnd);
	  
	  Edit = 0	 
	}
      $("#companyname_txtbox").val("");
      $("#description_txtbox").val("");
      $("#workStart_txtbox").val("");
      $("#workEnd_txtbox").val("");
       $("#validateWorkExp").html('');
}


function editExperience1(count){

	//Set edit value with the row number this will be used to fetch the table data of that row
	 Edit = count;
	 
	 var companyName =$("#cmpCount_tb"+count).val();	
	 var description = $("#descCount_tb"+count).val();
	 var workStart =$("#wsCount_tb"+count).val();
	 var workEnd =$("#weCount_tb"+count).val();
	
	 
	 //Restoring the fetched data into text boxes
     $("#companyname_txtbox").val(companyName);
     $("#description_txtbox").val(description);
     $("#workStart_txtbox").val(workStart);
     $("#workEnd_txtbox").val(workEnd);
   
}

function deleteExperience(delID){

		//if your deleting the same row which is about to get edited. 
		if(delID == Edit)
		{ 
	 		Edit = 0;
	 		 $("#companyname_txtbox").val("");
      		 $("#description_txtbox").val("");
      		 $("#workStart_txtbox").val("");
      		 $("#workEnd_txtbox").val("");
	 	}
		 
	 $("#divTable"+delID).remove();   
	 
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
		//alert("The date format should be : mm/dd/yyyy")
		 $("#validateWorkExp").html('<h5>The date format should be : mm/dd/yyyy</h5>');
        return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		//alert("Please enter a valid month")
		 $("#validateWorkExp").html('<h5>Please enter a valid month</h5>');
        
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		//alert("Please enter a valid day")
		 $("#validateWorkExp").html('<h5>Please enter a valid day</h5>');
        
		return false
	}
	
	if (strYear.length != 4 || year==0){
		//alert("Please enter a valid 4 digit year")
		 $("#validateWorkExp").html('<h5>Please enter a valid 4 digit year</h5>');
        
		return false
	}
	
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		//alert("Please enter a valid date")
        $("#validateWorkExp").html('<h5>Please enter a valid date</h5>');
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
/* End of workExperience.js */

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

/* Start of addAnotherCategoryAfterLogin.js */
function pop_up_category(e,pop_up_id,location){

	var indusry_txt_box=$("#industry").val();
	
	if(indusry_txt_box=="")
	{
	   hide_addcategory_pop_up();
	   var industriesList=[]; 
	 
	 $.post("getAllIndustries.action",{},function(data)
	 {
	 	for(var i=0;i<data.names.length;i++){
			var myString=data.names[i];
			myArray = myString.split(",");
				for(var j=0;j<myArray.length;j++){
				industriesList.push(myArray[j]);
				}
		}
		 var htmlText ='<div id="category_popup_id" class="popup1-content"><div class="pu_row"><div class="pu_col right" style="width: 200px;">'+ 
		 			   '<span id="categoryDetails"><span style="display:none;margin-top: 30px;color: red" id="commonId">'+		               
		               '</span><h5>Industry<br><select id="industryId_tb" name="industryId" ><option value="1">Please Select</option> '
                  for(var i=0;i<industriesList.length-1;i++)
                  {
				     htmlText += '<option value='+industriesList[i]+'>' + industriesList[i+1] + '</option>\n';
				     i=i+1;
	              }
	                 htmlText += '</select></h5>'+
	                 '<h5>Category Name:<br><input type="text" id="addCatogory_tb" name="addCatogory"/></h5><br>'+
	                 '<a href="#" onclick="return hide_addcategory_pop_up();">'+
	                 '<img src="../styles/default/images/grn_no_btn-up.png" alt="No" /></a>'+
	                 '<a class="second_a" href="#" onclick="addAnotherCatorory1();">'+
					 '<img src="../styles/default/images/grn_yes_btn-up.png" alt="Yes"/></a></span><span style="display:none" id="progress1">'+
	                 '<img src="../styles/default/images/pleasewait.gif"/>'+
	                 '</span>'+
	              	 '<span style="display:none" id="success1"><h6>Category added successfully.<a href="#" onclick="return hide_addcategory_pop_up();">Close</a></h6></span>'+
	                 '<span style="display:none" id="failure1"><h4>Sorry, unable to add the Industry.<a href="#" onclick="return hide_addcategory_pop_up();">Close</a></h6></span>'+ 
	                 '</div></div></div>'
					 
					$("#addCatogories").append(htmlText)
					
		 },"json");
		 pop_up_category1(e,pop_up_id,location);
		 }
		 
		 else
		 {
		 hide_addcategory_pop_up();
		 var industryId=0
			 /* industriesnames array getting from getIndustry() from getSkillsDetailsAfterLogin.jsp*/
			 for(var k=0;k<industriesnames.length;k++){
				  if(indusry_txt_box==industriesnames[k]){
				  industryId=industriesids[k];
				  }
			  }
			 var htmlText ='<div id="category_popup_id" class="popup1-content"><div class="pu_row"><div class="pu_col right" style="width: 200px;">'+ 
	                       '<span id="categoryDetails"><span style="display:none;margin-top: 30px;color: red" id="commonId1"></span>'+
	                       '<h5>Category Name:<br><input type="text" id="addCatogory_tb" name="addCatogory"/></h5><br>'+
	                 	   '<a href="#" onclick="return hide_addcategory_pop_up();">'+
	                 	   '<img src="../styles/default/images/grn_no_btn-up.png" alt="No" /></a>'+
	                 	   '<a class="second_a" href="#" onclick="addAnotherCatorory2('+industryId+');">'+
					  	   '<img src="../styles/default/images/grn_yes_btn-up.png" alt="Yes"/></a></span>'+
					   	   '<span style="display:none" id="progress1"><img src="../styles/default/images/pleasewait.gif"/></span>'+
					       '<span style="display:none" id="success1"><h6>Category added successfully.<a href="#" onclick="return hide_addcategory_pop_up();">Close</a></h6></span>'+
					       '<span style="display:none" id="failure1"><h4>Sorry, unable to add the Industry.<a href="#" onclick="return hide_addcategory_pop_up();">Close</a></h6></span>'+
					       '</div></div></div>'
					$("#addCatogories").append(htmlText)
		 pop_up_category1(e,pop_up_id,location);
		 }
}


function addAnotherCatorory1()
	{
	 
	var industryId=$("#industryId_tb").val();
	var name=$("#addCatogory_tb").val();
	
		if(industryId=="1")
		{
		  //alert("Please select industry")
		  var htmlText="<h5>Please Select Industry</h5>";
		  $("#commonId").html(htmlText);
		  $("#commonId").show();
		  return false;
		}
		else
		{
		  $("#commonId").hide();
		  $("#progress1").show();
		}
		if(name=="")
		{
		  //alert("Please enter category")
		  $("#progress1").hide();
		   var htmlText="<h5>Please Select Category</h5>";
		  $("#commonId").html(htmlText);
		  $("#commonId").show();
		  return false;
		}
		else
		{
		 $("#commonId").hide();
		  $("#progress1").show();  
		}
		
		    
	        $.post("addCatogory.action",{'categoryname':name,'industryId':industryId},function (data)
	        		{
			            if(data.result =="success")
			            {
			               
			               $("#categoryDetails").hide();
			               $("#progress1").hide();
			               $("#success1").show();
			               $("#ajbx_category").hide();
			               $("#skillscategory").val("");
			               
			               // $("#addCatogories").hide();
			              
			            }
			            else
			            {
			            $("#categoryDetails").hide();
			            $("#progress1").hide();
			            $("#failure1").show();
			            $("#ajbx_category").hide();
			            $("#skillscategory").val("");
			            }                           
       
            },"json");
            
     //  hide_addcategory_pop_up();
	}
	
function addAnotherCatorory2(industryId)
{
	 
	 
	 
	var name=$("#addCatogory_tb").val();
	
		if(name=="")
		{
		 // alert("Please enter category")
		  var htmlText="<h5>Please Select Category</h5>";
		  $("#commonId1").html(htmlText);
		  $("#commonId1").show();
		   return false;
		}
		else
		{
		 $("#commonId1").hide();
		 $("#progress1").show();
		}
		    
	        $.post("addCatogory.action",{'categoryname':name,'industryId':industryId},function (data)
	        		{
			            if(data.result =="success")
			            {
			               $("#categoryDetails").hide();
			               $("#progress1").hide();
			               $("#success1").show();
			              //$("#addCatogories").hide();
			              
			              $("#skillscategory").val("");
			              $("#ajbx_category").hide();
			            }
			            else
			            {
			           $("#categoryDetails").hide();
			            $("#progress1").hide();
			            $("#failure1").show();
			            $("#ajbx_category").hide();
			            $("#skillscategory").val("");
			            }                           
       
            },"json");
            
      // hide_addcategory_pop_up();
	}
	
function hide_addcategory_pop_up()
{
    $("#progress1").hide();
	$("#success1").hide();	
	$("#categoryDetails").show();
	$("#addCatogories").hide();
	$("#category_popup_id").remove();
	return false;
}

function pop_up_category1(e,pop_up_id,location)
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
	
/* End of addAnotherCategoryAfterLogin.js */	
	
/*Start of addAnotherIndustryAfterLogin.js */	
var defaultInputTextColor = "#000000";
var contactId=0;
var categoryDivId;

function addAnotherIndustry()
	{
	   
	      
	      var name=$("#addIndustry").val();
	     
	      if(name==""){
		 //alert("Please enter industry")
		 $("#industryNameId").show();
		  return false;
		  }
		  else
		  {
		     $("#industryNameId").hide();
		     $("#progress").show();
		  }
	      
	        $.post("addIndusty.action",{'industry.name' :name},function (data)
            {      
			            if(data.result =="success")
			            {
			                            
			               $("#industryDetails").hide()
			                $("#progress").hide();
			               $("#success").show();
	                       $("#industry").val("")
			              $("#ajbx_industry").hide();
			            }
			            else
			            {
			             $("#industryDetails").hide()
			             $("#progress").hide();			                
			             $("#failure").show();
			            // $("#industry").val("");
			            }                           
       
            },"json");
            
          // hide_pop_up_Industry();
	
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


function pop_up_industry(e,pop_up_id,location)
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
	
function hide_pop_up_Industry()
{
	$("#progress").hide();
	$("#success").hide();	
	$("#industryDetails").show();	
	$("#confirm_delete1").hide();
	$("#addIndustry").val("");
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
/*End of addAnotherIndustryAfterLogin.js */		


/* Start of addAnotherSkillsAfterLogin.js*/	
function pop_up_skill(e,pop_up_id,location)
	{
	 var category_txt_box=$("#skillscategory").val();
	
		if(category_txt_box==""){
		hide_pop_up_skills();
		categoriesList=[];
		$.post("getAllCategories.action",{},function(data)
		{
		
		for(var i=0;i<data.names.length;i++)
		{
		var myString=data.names[i];
		myArray = myString.split(",");
			for(var j=0;j<myArray.length;j++)
			{
			categoriesList.push(myArray[j]);
			}
		}
	    var htmlText ='<div id="skill_popup_id" class="popup1-content"><div class="pu_row"><div class="pu_col right" style="width: 200px;">'+ 
		 			   '<span id="skillsDetails">'+
		 			   '<span style="display:none;margin-top: 30px;color: red" id="commonId"></span>'+
		 			   '<h5>Category<br><select id="categoryId" name="categoryId"><option value="1">Please Select</option> '
                  for(var i=0;i<categoriesList.length-1;i++)
                   {
				     htmlText += '<option value='+categoriesList[i]+'>' + categoriesList[i+1] + '</option>\n';
				     i=i+1;
	               }
	                 htmlText += '</select></h5>'+
	                 '<h5>Skill Name:<br><input type="text" id="skillName" name="skillName"/></h5><br>'+
	                 '<a href="#" onclick="return hide_pop_up_skills();">'+
	                 '<img src="../styles/default/images/grn_no_btn-up.png" alt="No" /></a>'+
	                 '<a class="second_a" href="#" onclick="addAnotherSkill1();">'+
					 '<img src="../styles/default/images/grn_yes_btn-up.png" alt="Yes"/></a></span>'+
					 '<span style="display:none" id="skillProgress"><img src="../styles/default/images/pleasewait.gif"/></span>'+
					 '<span style="display:none" id="skillSuccess"><h6>skill added successfully.<a href="#" onclick="return hide_pop_up_skills();">Close</a></h6></span>'+
					 '<span style="display:none" id="skillFailure"><h4>Sorry, unable to add the Skill.<a href="#" onclick="return hide_pop_up_skills();">Close</a></h6></span>'+
					 '</div></div></div>'
					 
					$("#addSkills").append(htmlText)
	    },"json");
	    
	    pop_up_skill1(e,pop_up_id,location);
	    }
	    else{
		    hide_pop_up_skills();
		    var categoryId=0
			 /* categorieNames array getting from getCategory() from getSkillsDetailsAfterLogin.jsp*/
			 for(var k=0;k<categorieNames.length;k++){
				  if(category_txt_box==categorieNames[k]){
				  categoryId=categorieIds[k];
				  }
			  }
			
		    var htmlText ='<div id="skill_popup_id" class="popup1-content"><div class="pu_row"><div class="pu_col right" style="width: 200px;">'+ 
			 			 '<span id="skillsDetails">'+
			 			 '<span style="display:none;margin-top: 30px;color: red" id="commonId"></span>'+
			 			 '<h5>Skill Name:<br><input type="text" id="skillName" name="skillName"/></h5><br>'+
		                 '<a href="#" onclick="return hide_pop_up_skills();">'+
		                 '<img src="../styles/default/images/grn_no_btn-up.png" alt="No" /></a>'+
		                 '<a class="second_a" href="#" onclick="addAnotherSkill2('+categoryId+');">'+
						 '<img src="../styles/default/images/grn_yes_btn-up.png" alt="Yes"/></a></span>'+
						 '<span style="display:none" id="skillProgress"><img src="../styles/default/images/pleasewait.gif"/></span>'+
					 '<span style="display:none" id="skillSuccess"><h6>skill added successfully.<a href="#" onclick="return hide_pop_up_skills();">Close</a></h6></span>'+
					 '<span style="display:none" id="skillFailure"><h4>Sorry, unable to add the Skill.<a href="#" onclick="return hide_pop_up_skills();">Close</a></h6></span>'+					 
					 '</div></div></div>'
					 
				$("#addSkills").append(htmlText)
		    pop_up_skill1(e,pop_up_id,location);
	    
	    }
	   
	}
	
	
function addAnotherSkill1()
	{
	  
      var skillName=$("#skillName").val();
      var categoryId= $("#categoryId").val();
      
       if(categoryId=="1")
		{
		 // alert("Please select category")
		  var htmlText="<h5>Please Select Category</h5>";
		  $("#commonId").html(htmlText);
		  $("#commonId").show();
		  return false;
		}
		else
		{
		   $("#commonId").hide();
		   $("#skillProgress").show();
		}
		
      if(skillName=="")
		{
		 // alert("Please enter skill name")
		 $("#skillProgress").hide();
		  var htmlText="<h5>Please Enter Skill Name</h5>";
		  $("#commonId").html(htmlText);
		  $("#commonId").show();
		  return false;
		}
		else
		{
		  $("#commonId").hide();
		   $("#skillProgress").show();
		}
	    
	   
		
       $.post("addSkill.action",{skillName:skillName,categoryId:categoryId},function (data)
          {      
           if(data.result =="success")
           {
           
             $("#skillsDetails").hide();
			 $("#skillProgress").hide();
			 $("#skillSuccess").show();       
             $("#skills").val("");
             $("#ajbx_skills").hide();
             //$("#addSkills").hide();
           }
           else
           {
            $("#skillsDetails").hide();
			 $("#skillProgress").hide();
			 $("#skillFailure").show();    
             $("#skills").val("");
           }                           
     
          },"json");
            
       //  hide_pop_up_skills();
	
	}
	
function addAnotherSkill2(categoryId)
{
	 
      var skillName=$("#skillName").val();
     
     if(skillName=="")
		{
		  //alert("Please enter skill name")
		   var htmlText="<h5>Please Enter Skill Name</h5>";
		  $("#commonId").html(htmlText);
		  $("#commonId").show();
		  return false;
		}
		else
		{
		 $("#commonId").hide();
		 $("#skillProgress").show();
		}
	    
	   
		
       $.post("addSkill.action",{skillName:skillName,categoryId:categoryId},function (data)
          {      
           if(data.result =="success")
           {
           
             $("#skillsDetails").hide();
			 $("#skillProgress").hide();
			 $("#skillSuccess").show();    
             //$("#addSkills").hide();             
             $("#skills").val("");
             $("#ajbx_skills").hide();
           }
           else
           {
              $("#skillsDetails").hide();
			 $("#skillProgress").hide();
			 $("#skillFailure").show();    
             $("#skills").val("");
           }                           
     
          },"json");
            
        // hide_pop_up_skills();
	
	}
function hide_pop_up_skills()
	{
	     $("#skillProgress").hide();
	     $("#skillSuccess").hide();	
	     $("#skillsDetails").show();
		 $("#addSkills").hide();
		 $("#skill_popup_id").remove();
		return false;
	}	


	
function pop_up_skill1(e,pop_up_id,location)
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
/* End of addAnotherSkillsAfterLogin.js*/	

/*
$(document).ready(function() {
 addItemSetup();
});



function addItemSetup()
 {
 setup_custom_select("pgroup_edit",["Friend","Colleague","Partner","Associate","Superior","Contact"]);
 setup_custom_select("category_edit",["TV Show","Audio Recording","Document","Other"]);
 setup_custom_tinput("title_edit");
 $("#additem").click(addItem);
 }

*/
 function addItem(){

  /* example3 */
  var tname=$("#nameid").val()
  
   $.ajaxFileUpload
		(
			{
				url:'addItem.action', 
				secureuri:false,
				fileElementId:'fileloc',
				dataType: 'json',				
				data: {'name':'tname'},
				onSuccess : function(file){
           $('<li></li>').appendTo($('#testid .test')).text(file);
          }
   });
  
}


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
		 
		 $.post("../employee/newPrivacyGroup.action",{'groupName':groupName,'profile.id':$("#profileId").val()},function(data)
	     {
	        if(data.result=="success")
	        {
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
	
function addProfile(){
	var profilename=$("#profilename").val();
	if(profilename==""){
	//alert("Please enter Name of your Profile")
	$("#profileNameId").show();
	return false;
	}else if(profilename.length > 45)
	{
	  $("#profileNameId").hide();
	  $("#profileNameId1").show();
	  return false;
	}else if(trimFieldVal(profilename)=="")
	{
	  $("#profileNameId1").hide();
	  $("#profileNameId").show();
	   return false;
	}
	else
	{
	   $("#profileNameId").hide();
	    $("#profileNameId1").hide();
	   return true;
	}
}

function checkSalaryType(salarytype1){

	
	if(salarytype1=="Hourly"){
	
	  $("#yearlyrange_txbox").val("")
		
	  $("#yearlydiv").hide()
	  
	  $("#hourlydiv").show()
	 
	}
	
	if(salarytype1=="Annually"){
	
	$("#hourlyrange").val("")
	 
	$("#hourlydiv").hide()
	
	$("#yearlydiv").show()
	
	
	}
}
function OnChange(dropdown){

	$("#yearlyrange_txbox").val(dropdown)

}
/* start of addProfile.js */
var count =0;
var Edit =0; 
var Delete =0;

function addSkills1(){
		$("#skillsId").html("");
		var skillName = $("#skills").val();
		var years_experience= $("#experience").val();
		var skill_level= $("#skill_level").val();
		var notes= $("#notes").val();
		
		if(skillName=="")
		{
			//alert('Please select Skills');
			$("#skillsId").html("<h5>Please select skills</h5>");
			return;	
		}	
		if(years_experience=="")
		{
			//alert('Please enter years of experience');
			$("#skillsId").html("<h5>Please enter years of experience</h5>");
			return;	
		}
		if(years_experience.length>45)
		{
			//alert('Please enter years of experience');
			$("#skillsId").html("<h5>Should have less than 45 characters</h5>");
			return;	
		}		
				
		if(skill_level=="1")
		{	
			//alert('Please select skill level');
			$("#skillsId").html("<h5>Please select skill level</h5>");
			return;	
		}	
		if(notes.length>45)
		{	
			//alert('Please select skill level');
			$("#skillsId").html("<h5>Should have less than 45 characters</h5>");
			return;	
		}		
		
		if(Edit==0){
		
			count = count+1
			
			var htmlText= "<div class='sel_prof_row' id='divTable"+count+"'><table border='0'><tr><td><table  border='0'> <tr>"+
				 "<td class='sel_prof_col spc_industry' id='skillCount"+count+"'>" + skillName + "</td>" +
				 "<td class='sel_prof_col spc_years' id='yearsCount"+count+"'>" + years_experience + "</td>" +
				 "<td class='sel_prof_col spc_skill' id='levelCount"+count+"'>" + skill_level + "</td>" +
				 "<td class='sel_prof_col spc_info' id='notesCount"+count+"'>" + notes +
				 "</td>" + "</tr></table></td><td><div class='sel_prof_col spc_actions'>"+
				 "<table  border='0'><tr>"+
				 "<td></td><td></td><td></td><td id='image_edit'onclick='editSkills("+count+")'></td><td id='image_cross' onclick=deleteSkills1('"+count+"') ></td></tr>"+
				 "</table></div></td></tr></table>" +
				 //These details are used for storing the data into database.
				 "<input type='hidden' id='skills1"+count+"' name='skills' value='"+skillName+"'/>"+ 
				 "<input type='hidden' id='experience1"+count+"' name='experience' value='" + years_experience + "'/>"+
				 "<input type='hidden' id='skillevel1"+count+"' name='level' value='" + skill_level + "'/>"+
				 "<input type='hidden' id='notes1"+count+"' name='notes' value='" + notes + "'/></div>";
				$("#sel_prof_row").append(htmlText) 
		}
		
		else{	
				/* Editing for display purpose in table*/ 
				  $("#skillCount"+ Edit).html(skillName);	 
				  $("#yearsCount"+ Edit).html(years_experience); 
				  $("#levelCount"+ Edit).html(skill_level); 
				  $("#notesCount"+ Edit).html(notes);  
				  
				  
				  /* Editing values for hidden feilds for stroing into database */
				  
				  $("#skills1"+ Edit).val(skillName);	 
				  $("#experience1"+ Edit).val(years_experience); 
				  $("#skillevel1"+ Edit).val(skill_level); 
				  $("#notes1"+ Edit).val(notes);  
				   
				  Edit = 0	 
	}
	  
	  $("#skills").val("");
      $("#experience").val("");
      $("#skill_level").val("1");
      $("#notes").val("");
      //$("#industry").val("");
      $("#skillscategory").val("");
      
      
}

function editSkills(count){

	 Edit = count;
	 
	var skillName=$("#skillCount"+ Edit).html(skillName);	 
	var years_experience=$("#yearsCount"+ Edit).html(years_experience); 
	var skill_level=$("#levelCount"+ Edit).html(skill_level); 
	var notes=$("#notesCount"+ Edit).html(notes);  

	 //Restoring the fetched data into text boxes
	  $("#skills").val(skillName);
      $("#experience").val(years_experience);
      $("#skill_level").val(skill_level);
      $("#notes").val(notes);
     
}

function deleteSkills1(delID){

		//if your deleting the same row which is about to get edited. 
		if(delID == Edit)
		{ 
	 		Edit = 0;
	 		$("#skills").val("");
		    $("#experience").val("");
		    $("#skill_level").val("1");
		    $("#notes").val("");
		    
	 	}
	 
	 $("#divTable"+delID).remove();    
	 
}


/* Edit Profile Education   */						
var Edit=0
var count=0
var dtCh= "/";
var idForEdit;


function loadEditEducationDetails(id){
 $("#validateEducationId").html("");
	  var schoolName =$("#schoolName"+id).val();
	  var degree =$("#degree"+id).val();
	  var courseStart =$("#courseStart"+id).val();
	  var courseEnd = $("#courseEnd"+id).val();
	  var concentration =$("#concentration"+id).val().split("(")[0];
	  var gpa = $("#gpa"+id).val();
	  var honors =$("#honors"+id).val();
	 
	  var concentrationlevel =$("#concentration"+id).val().split("(")[1].substring(0,5);

	  $("#schoolName_txtbox").val(schoolName)
	  $("#degree_txtbox").val(degree)
	  $("#educationStart_txtbox").val(courseStart)
	  $("#educationEnd_txtbox").val(courseEnd)
	  $("#concentration_txtbox").val(concentration)
	  $("#gpa_txtbox").val(gpa)       
	  $("#honors_txtbox").val(honors)
	  $("#sel").val(concentrationlevel)
	  
	  $("#add_btn_education").unbind();
	  idForEdit=id;
	  $("#add_btn_education").click(editEducationDetails1);
	  
      

}
function loadNewEditEducationDetails(id)
{
 $("#validateEducationId").html("");
	  var schoolName =$("#schoolNamenew"+id).val();
	  var degree =$("#degreenew"+id).val();
	  var courseStart =$("#courseStartnew"+id).val();
	  var courseEnd =$("#courseEndnew"+id).val();
	  var concentration =$("#concentrationnew"+id).val().split("(")[0];
	  var gpa =$("#gpanew"+id).val();
	  var honors =$("#honorsnew"+id).val();
	 
	  var concentrationlevel =$("#concentrationnew"+id).val().split("(")[1].substring(0,5);
      $("#schoolName_txtbox").val(schoolName)
	  $("#degree_txtbox").val(degree)
	  $("#educationStart_txtbox").val(courseStart)
	  $("#educationEnd_txtbox").val(courseEnd)
	  $("#concentration_txtbox").val(concentration)
	  $("#gpa_txtbox").val(gpa)       
	  $("#honors_txtbox").val(honors)
	  $("#sel").val(concentrationlevel)
	  
	  $("#add_btn_education").unbind();
	  idForEdit=id;
	  $("#add_btn_education").click(editNewEducationDetails);
	 

}

function editEducationDetails1(){
 $("#validateEducationId").html("");
         var schoolName =$("#schoolName_txtbox").val()
 		 var degree =$("#degree_txtbox").val()
  		 var courseStart =$("#educationStart_txtbox").val()
     	 var courseEnd = $("#educationEnd_txtbox").val()
      	 var concentration =$("#concentration_txtbox").val()
         var gpa =$("#gpa_txtbox").val()
         var honors =$("#honors_txtbox").val()
         
	     var selectedValue =$("#sel").val()
	     if(schoolName==""){
	         $("#validateEducationId").html("<h5>Please enter schoolname</h5>");
	         return;
         }
         if(schoolName.length>45){
	         $("#validateEducationId").html("<h5>Schoolname should have less than 45 characters</h5>");
	         return;
         }
      if(degree==""){
	   $("#validateEducationId").html("<h5>Please enter degree</h5>");
	     return;
     }
     if(degree.length>45){
	         $("#validateEducationId").html("<h5>Degree should have less than 45 characters</h5>");
	         return;
         }
     if(courseStart==""){
	    $("#validateEducationId").html("<h5>Please enter From date</h5>");
	     return;
     }
     else{
	 	  if(isDate(courseStart)==false){
		     courseStart.focus()
			 return false
		   }
	 }
     if(courseEnd==""){
	 $("#validateEducationId").html("<h5>Please enter To date</h5>");
	     return;
     }
     else{
	 	  if(isDate(courseEnd)==false){
		     courseEnd.focus()
			 return false
		   }
	 }
	 
	var start=new Date(courseStart);
	var end=new Date(courseEnd);
	if (start>=end){
	$("#validateEducationId").html("<h5>To date should be greater than From date</h5>");
	return false
	}
	
	 /*
	 if (courseStart>courseEnd){
	alert ("Education Started Date should not be greater than Education Ended Date");
	return false
	}
	
	if (courseStart==courseEnd){
	alert ("Education Started Date should not be same as Education Ended Date");
	return false
	}
	
	*/
     if(concentration=="")
     {
	    $("#validateEducationId").html("<h5>Please select concentration</h5>");
	     return;
     }
     if(concentration.length>35)
     {
	    $("#validateEducationId").html("<h5>Concentration should have less than 35 characters</h5>");
	    return;
     }
     if(gpa.length>45)
     {
	    $("#validateEducationId").html("<h5>Gpa should have less than 45 characters</h5>");
	    return;
     }
     if(honors.length>45)
     {
	    $("#validateEducationId").html("<h5>Honors should have less than 45 characters</h5>");
	     return;
     }   
	 
	$("#schoolName"+idForEdit).val(schoolName)
	$("#degree"+idForEdit).val(degree)
    $("#courseStart"+idForEdit).val(courseStart)
    $("#courseEnd"+idForEdit).val(courseEnd)
    $("#concentration"+idForEdit).val(concentration+" (" +selectedValue+")")
    $("#gpa"+idForEdit).val(gpa)
    $("#honors"+idForEdit).val(honors)
 
    $("#schoolNamediv"+idForEdit).html(schoolName)
    $("#degreediv"+idForEdit).html(degree)
    $("#courseStartdiv"+idForEdit).html(courseStart+"-"+courseEnd)   
    $("#concentrationdiv"+idForEdit).html(concentration+" ( "+selectedValue+")")
    $("#gpadiv"+idForEdit).html(gpa)
    $("#honorsdiv"+idForEdit).html(honors)
    
    
     $("#schoolName_txtbox").val("")
     $("#degree_txtbox").val("")
     $("#educationStart_txtbox").val("")
     $("#educationEnd_txtbox").val("")
     $("#concentration_txtbox").val("")
     $("#gpa_txtbox").val("")       
     $("#honors_txtbox").val("")
     $("#sel").val("1")
     $("#add_btn_education").unbind(); 
     $("#add_btn_education").click(addEducationDetails);   
	     
	     

}

function editNewEducationDetails(){

        $("#validateEducationId").html("");
         var schoolName =$("#schoolName_txtbox").val()
 		 var degree =$("#degree_txtbox").val()
  		 var courseStart =$("#educationStart_txtbox").val()
     	 var courseEnd = $("#educationEnd_txtbox").val()
      	 var concentration =$("#concentration_txtbox").val()
         var gpa =$("#gpa_txtbox").val()
         var honors =$("#honors_txtbox").val()
         
         var d = document.getElementById('sel');
	     var selectedValue =d.options[d.selectedIndex].value;
	     
	     if(schoolName=="")
	     {
	       $("#validateEducationId").html("<h5>Please enter schoolname</h5>");
	       return;
         }
         if(schoolName.length>45)
     {
	    $("#validateEducationId").html("<h5>Schoolname should have less than 45 characters</h5>");
	     return;
     }   
      if(degree==""){
	    $("#validateEducationId").html("<h5>Please enter degree</h5>");
	     return;
     }
     if(degree.length>45)
     {
	    $("#validateEducationId").html("<h5>Degree should have less than 45 characters</h5>");
	     return;
     }   
     if(courseStart==""){
	      $("#validateEducationId").html("<h5>Please enter From date</h5>");
	     return;
     }
     else{
	 	  if(isDate(courseStart)==false){
		     courseStart.focus()
			 return false
		   }
	 }
     if(courseEnd==""){
	     $("#validateEducationId").html("<h5>Please enter To date</h5>");
	     return;
     }
     else{
	 	  if(isDate(courseEnd)==false){
		     courseEnd.focus()
			 return false
		   }
	 }
	 
	 
	var start=new Date(courseStart);
	var end=new Date(courseEnd);
	if (start>=end){
	$("#validateEducationId").html("<h5>To date should be greater than From date</h5>");
	return false
	}
	 
	 /*
	 if (courseStart>courseEnd){
	alert ("Education Started Date should not be greater than Education Ended Date");
	return false
	}
	
	if (courseStart==courseEnd){
	alert ("Education Started Date should not be same as Education Ended Date");
	return false
	}
	*/
     if(concentration==""){
	      $("#validateEducationId").html("<h5>Please select concentration</h5>");
	     return;
     }
      if(concentration.length>35)
     {
	    $("#validateEducationId").html("<h5>Concentration should have less than 35 characters</h5>");
	    return;
     }
     if(gpa.length>45)
     {
	    $("#validateEducationId").html("<h5>Gpa should have less than 45 characters</h5>");
	    return;
     }
     if(honors.length>45)
     {
	    $("#validateEducationId").html("<h5>Honors should have less than 45 characters</h5>");
	     return;
     }   
	     
	 
	$("#schoolNamenew"+idForEdit).val(schoolName)
	$("#degreenew"+idForEdit).val(degree)
    $("#courseStartnew"+idForEdit).val(courseStart)
    $("#courseEndnew"+idForEdit).val(courseEnd)
    $("#concentrationnew"+idForEdit).val(concentration+" ( "+selectedValue+")")
    $("#gpanew"+idForEdit).val(gpa)
    $("#honorsnew"+idForEdit).val(honors)
 
    $("#schoolNamedivnew"+idForEdit).html(schoolName)
    $("#degreedivnew"+idForEdit).html(degree)
    $("#courseStartdivnew"+idForEdit).html(courseStart+"-"+courseEnd)   
    $("#concentrationdivnew"+idForEdit).html(concentration+" (" +selectedValue+")")
    $("#gpadivnew"+idForEdit).html(gpa)
    $("#honorsdivnew"+idForEdit).html(honors)
    
    
     $("#schoolName_txtbox").val("")
     $("#degree_txtbox").val("")
     $("#educationStart_txtbox").val("")
     $("#educationEnd_txtbox").val("")
     $("#concentration_txtbox").val("")
     $("#gpa_txtbox").val("")       
     $("#honors_txtbox").val("")
     $("#sel").val("1")
     $("#add_btn_education").unbind(); 
     $("#add_btn_education").click(addEducationDetails);  
	     
	     

}

function addEducationDetails()
{
        
        $("#validateEducationId").html("");
         var schoolName =$("#schoolName_txtbox").val()
 		 var degree =$("#degree_txtbox").val()
  		 var courseStart =$("#educationStart_txtbox").val()
     	 var courseEnd = $("#educationEnd_txtbox").val()
      	 var concentration =$("#concentration_txtbox").val()
         var gpa =$("#gpa_txtbox").val()
         var honors =$("#honors_txtbox").val()
         
         var d = document.getElementById('sel');
	     var selectedValue =d.options[d.selectedIndex].value;
	
   
    if(schoolName==""){
	      $("#validateEducationId").html("<h5>Please enter schoolname</h5>");
	     return;
     }
     if(schoolName.length>45){
	      $("#validateEducationId").html("<h5>Schoolname should have less than 45 characters</h5>");
	     return;
     }
     if(degree==""){
	      $("#validateEducationId").html("<h5>Please enter degree</h5>");
	     return;
     }
     if(degree.length>45){
	      $("#validateEducationId").html("<h5>Degree should have less than 45 characters</h5>");
	     return;
     }
     if(courseStart==""){
	     $("#validateEducationId").html("<h5>Please enter From date</h5>");
	     return;
     }
      else{
	 	  if(isDate(courseStart)==false){
		     courseStart.focus()
			 return false
		   }
	 }
     if(courseEnd==""){
	      $("#validateEducationId").html("<h5>Please enter To date</h5>");
	     return;
     }
      else{
	 	  if(isDate(courseStart)==false){
		     courseStart.focus()
			 return false
		   }
	 }
     if(concentration==""){
	       $("#validateEducationId").html("<h5>Please select concentration</h5>");
	     return;
     }
     if(concentration.length>35){
	      $("#validateEducationId").html("<h5>Concentration should have less than 35 characters</h5>");
	     return;
     }
     if(gpa.length>45){
	      $("#validateEducationId").html("<h5>Gpa should have less than 45 characters</h5>");
	     return;
     }
     if(honors.length>45){
	      $("#validateEducationId").html("<h5>Honors should have less than 45 characters</h5>");
	     return;
     }
     
    var start=new Date(courseStart);
	var end=new Date(courseEnd);
	if (start>=end){
	$("#validateEducationId").html("<h5>To date should be greater than From date</h5>");
	return false
	}
	
	     count = count+101;
	     //Html text genertation for displaying of the data dynamically on click of add.	
		 var htmlText= "<div class='sel_prof_row' id='educationdivnew"+count+"'><table border='0'><tr><td><table  border='0'><tr>"+
		 "<td class='sel_prof_col spc_school' id='schoolNamedivnew"+count+"'>" + schoolName + "</td>" +
		 "<td class='sel_prof_col spc_degree' id='degreedivnew"+count+"'>" + degree + "</td>" +
		 "<td class='sel_prof_col spc_dateattended' id='courseStartdivnew"+count+"'>" + courseStart + "-" + courseEnd +
		 "</td>" + "<td class='sel_prof_col spc_degreename' id='concentrationdivnew"+count+"'>" + concentration+" (" +selectedValue+")"+ "</td>" +
		 "<td class='sel_prof_col spc_gpa' id='gpadivnew"+count+"'>" + gpa + "</td>" +
		 "<td class='sel_prof_col spc_honors' id='honorsdivnew"+count+"'>" + honors + "</td>" +
		  "</tr></table></td><td><div class='sel_prof_col spc_actions'>"+
		 "<table  border='0'><tr>"+
		 "<td id='image_edit'onclick='loadNewEditEducationDetails("+count+")'></td><td id='image_cross' onclick=deleteNewEducationDetails('"+count+"') ></td></tr>"+
		 "</table></div></td></tr></table>" +
		 //These details are used for storing the data into database.
		 "<input type='hidden' id='schoolNamenew"+count+"' name='newSchoolName' value='"+schoolName+"'/>"+ 
		 "<input type='hidden' id='degreenew"+count+"' name='newDegree' value='" + degree + "'/>"+
		 "<input type='hidden' id='courseStartnew"+count+"' name='newEducationStart' value='" + courseStart + "'/>"+
		 "<input type='hidden' id='courseEndnew"+count+"' name='newEducationEnd' value='" + courseEnd + "'/>"+
		 "<input type='hidden' id='concentrationnew"+count+"' name='newConcentration' value='" + concentration +" (" +selectedValue+")"+ "'/>"+
    	 "<input type='hidden' id='gpanew"+count+"' name='newGpa' value='" + gpa + "'/>"+
		 "<input type='hidden' id='honorsnew"+count+"' name='newHonors' value='" + honors + "'/></div>";
		 //Appending the new row along with the old data		 
		 $("#your_education").append(htmlText)
		 
		 $("#schoolName_txtbox").val("")
	     $("#degree_txtbox").val("")
	     $("#educationStart_txtbox").val("")
	     $("#educationEnd_txtbox").val("")
	     $("#concentration_txtbox").val("")
	     $("#gpa_txtbox").val("")       
	     $("#honors_txtbox").val("")
	     $("#sel").val("1")
           
    
 
  
 }
function deleteEducationDetails(id)
{
    $("#validateEducationId").html("");
   /*Added for storing deleted rowid into a textfield */
	var htmlText="<div class='deleducationdiv' id='del"+id+"'><input type='hidden' name='deleteeducationrow' id='delrowid"+id+"' value='"+id+"' /></div>";
	
	$("#deleducationdiv").html(htmlText)
	
	/*Added for deleting existing rows from db  */	
 	 $("#educationdiv"+id).remove();
    
     
	 $("#schoolName_txtbox").val("")
     $("#degree_txtbox").val("")
     $("#educationStart_txtbox").val("")
     $("#educationEnd_txtbox").val("")
     $("#concentration_txtbox").val("")
     $("#gpa_txtbox").val("")       
     $("#honors_txtbox").val("")
     $("#sel").val("1")
     
     $("#add_btn_education").unbind(); 
     $("#add_btn_education").click(addEducationDetails);  

}

function deleteNewEducationDetails(id)
{
      $("#validateEducationId").html("");
     /*Added for deleting new rows from div tag*/		
     $("#educationdivnew"+id).remove();
  
	 $("#schoolName_txtbox").val("")
     $("#degree_txtbox").val("")
     $("#educationStart_txtbox").val("")
     $("#educationEnd_txtbox").val("")
     $("#concentration_txtbox").val("")
     $("#gpa_txtbox").val("")       
     $("#honors_txtbox").val("")
     $("#sel").val("1")
     
     $("#add_btn_education").unbind(); 
     $("#add_btn_education").click(addEducationDetails);  

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
		$("#validateEducationId").html("<h5>The date format should be : mm/dd/yyyy</h5>");
        return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		$("#validateEducationId").html("<h5>Please enter a valid month</h5>");
        
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		$("#validateEducationId").html("<h5>Please enter a valid day</h5>");
        
		return false
	}
	if (strYear.length != 4 || year==0){
		//alert("Please enter a valid 4 digit year")
		 $("#validateEducationId").html("<h5>Please enter a valid 4 digit year</h5>");
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		 $("#validateEducationId").html("<h5>Please enter a valid date</h5>");
        
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
 
/* End of Edit Prfile Education Validations  */	 

/* Start of edit EmployeeAccount.js */ 
var joinfreeValidate = 0;
var dtCh= "/";

function checkEditForm()
{
  var password =$("#oldPasswordId").val();
	validateEditAccount('firstName','imageArea','messageArea');
	validateEditAccount('lastName','imageArea1','messageArea1');
	CheckEditAccountEmail('email','imageArea2','messageArea2');
	checkDate('dob','imageArea3','messageArea3');
	
	 if(password!=""){
	validateEditAccountPwd('imageArea5','messageArea5');
	validateNewPwd('imageArea6','messageArea6');
	validateVerifyNewPwd('imageArea7','messageArea7');
     }
	if(joinfreeValidate == 1)
     {
      document.getElementById('lastName').focus()
       joinfreeValidate =0;
       return false;
     }
     else if(joinfreeValidate == 2)
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
     }
     else if(joinfreeValidate == 4)
      {
       document.getElementById('oldPasswordId').focus()
      joinfreeValidate =0;
      return false;
     
     }
     else if(joinfreeValidate == 5)
      {
       document.getElementById('newPasswordId').focus()
      joinfreeValidate =0;
      return false;
     
     } 
     else if(joinfreeValidate == 6)
      {
       document.getElementById('verifyNewPasswordId').focus()
      joinfreeValidate =0;
      return false;
     }
     else
      {
      joinfreeValidate = 0;
     // editEmployeeAccount();
      return true;
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
            
         }
           imageArea.innerHTML = "<img src=" + src +" />";
           messageArea.innerHTML="<font color=" + fontColor + ">"+ message + " </font>";
           
}
/*
function setMessage1(message,isValid)
{
         
        var imageArea=$("#imageArea7");
		var messageArea=$("#messageArea7");
		
       
        var fontColor = "red";
        
        var src="../styles/default/images/mobc_redx.gif"
            
        if (isValid == "true")
         {
            src="../styles/default/images/grncheck-onwhite.jpg"
            fontColor = "green";
            
         }
           imageArea.html("<img src=" + src +" />");
           messageArea.html("<font color=" + fontColor + ">"+ message + " </font>");
           
}
function setMessage2(message,isValid)
{
          
        var imageArea=$("#imageArea5");
		var messageArea=$("#messageArea5");
        var fontColor = "red";
        var src="../styles/default/images/mobc_redx.gif"
            
        if (isValid == "true")
         {
            src="../styles/default/images/grncheck-onwhite.jpg"
            fontColor = "green";
            
         }
           imageArea.html("<img src=" + src +" />");
           messageArea.html("<font color=" + fontColor + ">"+ message + " </font>");
           
}
*/
function CheckEditAccountEmail(txtID,imageArea,messageArea)
{        
         flag="true"         
         email = document.getElementById(txtID).value;
         var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
         
         if (filter.test(email))
         {
              emailValidate();
             
         }else if(email=="")
               {
                       message="Please enter your email id"
                       flag="false"
                       if(joinfreeValidate == 0)
                       joinfreeValidate = 2
                       setMessage(message,flag,imageArea,messageArea);
         
               }else 
                     {
                         
                       message="Not a valid email address!"
                       flag="false"
                       if(joinfreeValidate == 0)
                       joinfreeValidate = 2
                       setMessage(message,flag,imageArea,messageArea);
                     }     
                  
}
function  emailValidate()
{
 var message="" 
 var minLength=45; 
   $.post("emailValidateForEditAccount.action",{email : $("#email").val()},function (data)
   {      
        if(data.result=="success"){
        
            var empEmailId=$("#email").val();
            
            if(empEmailId.length>minLength){
            
             message="Email address should be within" +  minLength +" characters long.Try again."
             var fontColor = "red";                                      
             $("#imageArea2").html("<img src='../styles/default/images/mobc_redx.gif'/>");
             $("#messageArea2").html("<font color=" + fontColor + ">"+ message + " </font>");
             flag="false"
                       if(joinfreeValidate == 0)
                       joinfreeValidate = 2
                      // setMessage(message,flag,imageArea2,messageArea2);
            }else{
                flag="true"
               $("#imageArea2").html("<img src='../styles/default/images/grncheck-onwhite.jpg'/>");
               $("#messageArea2").html("");
            }  
         }else
              {
                message="Email already Exist please try again"  
                var fontColor = "red";                                      
                $("#imageArea2").html("<img src='../styles/default/images/mobc_redx.gif'/>");
                $("#messageArea2").html("<font color=" + fontColor + ">"+ message + " </font>");
                flag="false"
                       if(joinfreeValidate == 0){
                       joinfreeValidate = 2
                       }
                      // setMessage(message,flag,imageArea2,messageArea2);
              }
    },"json");
}

function validateEditAccountPwd(imageArea,messageArea)
{
    var invalid = " ";
    var minLength = 6; 
    var flag="true";
    var password =$("#oldPasswordId").val();
      
              if(password=="")
              {
                   
                    message="Please enter Password "
                    flag="false"
                    if(joinfreeValidate == 0)
                    joinfreeValidate = 4
                    setMessage(message,flag,imageArea,messageArea);
                    return false;
              }
              else
                    // check for minimum length
                    if (password.length < minLength)
                     {
                  
                         message="Your password must be at least " + minLength + " characters long. Try again."
                         flag="false"
                         if(joinfreeValidate == 0)
                         joinfreeValidate = 4
                         setMessage(message,flag,imageArea,messageArea);
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
                                    setMessage(message,flag,imageArea,messageArea);
                                    return false;
                            }
                            else 
                            
                            {
                            
                            $.post("checkExistingPassword.action",{'oldPassword':password},function (data)
								 {     
								 if(data.result=="error")
							          {
							          	message="you have entered wrong Old password "
								        flag="false"
								        if(joinfreeValidate == 0)
								        joinfreeValidate = 4
								       // setMessage2(message,flag);
								        setMessage(message,flag,imageArea,messageArea);
								        return false;
								          }
								 else{
								 	message=""
                                    setMessage(message,flag,imageArea,messageArea);
                                    return true;
								 }
							    	
							 	},"json"); 
								
								}
                          
}
function validateNewPwd(imageArea,messageArea)
{
    var invalid = " ";
    var minLength = 6; 
    var flag="true";
  
      var password =$("#newPasswordId").val();
    
      
              if(password=="")
              {
                   
                    message="Please enter Password "
                    flag="false"
                    if(joinfreeValidate == 0)
                    joinfreeValidate = 5
                    setMessage(message,flag,imageArea,messageArea);
                    return false;
              }
              else
                    // check for minimum length
                    if (password.length < minLength)
                     {
                  
                         message="Your password must be at least " + minLength + " characters long. Try again."
                         flag="false"
                         if(joinfreeValidate == 0)
                         joinfreeValidate = 5
                         setMessage(message,flag,imageArea,messageArea);
                         return false;
                     }
                     else
                     
                           // check for spaces
                           if (password.indexOf(invalid) > -1)
                            {
                        
                                    message="Sorry, spaces are not allowed."
                                    flag="false"
                                    if(joinfreeValidate == 0)
                                    joinfreeValidate = 5
                                    setMessage(message,flag,imageArea,messageArea);
                                    return false;
                            }
                            else {
                      
                                    message=""
                                    setMessage(message,flag,imageArea,messageArea);
                                    return true;
                                 }
}
function validateVerifyNewPwd(imageArea,messageArea)
{
    var invalid = " ";
    var minLength = 6; 
    var flag="true";
    
    var newPassword=$("#newPasswordId").val();
	var verifyNewPassword=$("#verifyNewPasswordId").val();
    
  
      var password =$("#verifyNewPasswordId").val();
      
              if(password=="")
              {
                   
                    message="Please enter Password "
                    flag="false"
                    if(joinfreeValidate == 0)
                    joinfreeValidate = 6
                    setMessage(message,flag,imageArea,messageArea);
                    return false;
              }
              else
                    // check for minimum length
                    if (password.length < minLength)
                     {
                  
                         message="Your password must be at least " + minLength + " characters long. Try again."
                         flag="false"
                         if(joinfreeValidate == 0)
                         joinfreeValidate = 6
                         setMessage(message,flag,imageArea,messageArea);
                         return false;
                     }
                     else
                     
                           // check for spaces
                           if (password.indexOf(invalid) > -1)
                            {
                        
                                    message="Sorry, spaces are not allowed."
                                    flag="false"
                                    if(joinfreeValidate == 0)
                                    joinfreeValidate = 6
                                    setMessage(message,flag,imageArea,messageArea);
                                    return false;
                            }
                            
                            else if(newPassword!=verifyNewPassword){

									message="you have entered wrong verify password "
							        flag="false"
							        if(joinfreeValidate == 0)
							        joinfreeValidate = 6
							        setMessage(message,flag,imageArea,messageArea);
							        return false;
								
								}
                            
                            
                            else {
                      
                                    message=""
                                    setMessage(message,flag,imageArea,messageArea);
                                  //   document.editAccountFormName.submit();
                                    return true;
                                 }
}
function validateEditAccount(txtID,imageArea,messageArea) 
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
               setMessage(msg,flag,imageArea,messageArea);
      
      }
      else if (txtElement.value==""){
              //  txtElement.focus();
             // alert("empty")
                if(txtID=="firstName"){
                // alert("first name empty")
                        msg="Please enter your"+" "+"first name"
                        flag="false" 
                        if(joinfreeValidate == 0)
                        joinfreeValidate = 1                           
                        setMessage(msg,flag,imageArea,messageArea);
                } 
                if(txtID=="lastName"){
                        msg ="Please enter your"+" "+"last name"
                        flag="false" 
                        if(joinfreeValidate == 0)
                        joinfreeValidate = 1                           
                        setMessage(msg,flag,imageArea,messageArea);
                }
		         }else if(!isNaN(txtElement.value)){
		                      msg="Only letters are allowed" 
		                      flag="false"
		                      if(joinfreeValidate == 0)
		                     joinfreeValidate = 1
		                      setMessage(msg,flag,imageArea,messageArea);
	              }else
	                   {
	                      setMessage(msg,flag,imageArea,messageArea);
	                   }
}



function checkDate(txtID,imageArea,messageArea)
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
          setMessage(msg,flag,imageArea,messageArea);      
       }
       else if(isDate(input,imageArea,messageArea)==false){
       		  if(joinfreeValidate == 0)
          	   joinfreeValidate = 3 
			   return false
       }
       else
               {        
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

/* End of edit EmployeeAccount.js */ 

/*  start of editProfile.js  */

function editProfile(){

	var profilename=$("#profilename").val();
	if(profilename==""){
	//alert("Please enter Name of your Profile")
	$("#profileNameId").show();
	return false;
	}else if(profilename.length > 45)
	{
	  $("#profileNameId").hide();
	  $("#profileNameId1").show();
	  return false;
	}else if(trimFieldVal(profilename)=="")
	{
	  $("#profileNameId1").hide();
	  $("#profileNameId").show();
	   return false;
	}
	else
	{
	   $("#profileNameId").hide();
	    $("#profileNameId1").hide();
	   return true;
	}

}

$(document).ready(function() {

	var salarytypeelem=$("#yearlytype").val();
	
	var salarytype = "Annually";
	
	if(salarytypeelem != null){
	
		salarytype = salarytypeelem;
	}
	if(salarytype=="Hourly"){
	
		var range=$("#hiddenrange").val()
		
		
		$("#hiddenrangehourly").val(range)
		
		hourlyrangevalue=$("#hiddenrangehourly").val();
		
	    $("#hourlyrange").val(hourlyrangevalue)
		  
		$("#yearlydiv").hide()
		
		$("#hourlydiv").show()
	}
	else{
		var range=$("#hiddenrange").val()
		
		$("#hiddenrangeyearly").val(range)
		
		yearlyrangevalue=$("#hiddenrangeyearly").val();
	 	
	 	$("#range1id").val(yearlyrangevalue)
		
		$("#yearlydiv").show();
		
		$("#hourlydiv").hide()
	
	
	}
 	$("#add_btn").click(addExperience);
	
	
});

function checkSalaryType(salarytype1){
	
	
	if(salarytype1=="Hourly"){
	
	$("#range1id").val("")
	
	hourlyrangevalue=$("#hiddenrangehourly").val();
	
	$("#hourlyrange").val(hourlyrangevalue)
	
	$("#yearlydiv").hide()
	  
	$("#hourlydiv").show()
	
	}
	
	if(salarytype1=="Annually"){
	
	$("#hourlyrange").val("")
	
	yearlyrangevalue=$("#hiddenrangeyearly").val();
	
	$("#range1id").val(yearlyrangevalue)
	
	$("#hourlydiv").hide()
	
	$("#yearlydiv").show()
	
	
	}
}

function OnChange(dropdown){

	$("#yearlyrange_txbox").val(dropdown)

}
/*  End of editProfile.js  */

/* Start of editskills.js */

$(document).ready(function(){
	$("#add_btn_education").click(addEducationDetails);
});


var count=0
var Edit=0
var idForEdit;


$(document).ready(function(){
	$("#addbtn_skills").click(addSkills);
});


function loadEditSkills(id){
$("#editskillsId").html("");

    var skillName=$("#skillname"+id).val()
	var experience=$("#experience"+id).val()
	var level=$("#level"+id).val()
	var notes=$("#notes"+id).val()
	
	/* Fetching data for Edit functionality */
  	$("#skills").val(skillName)
    $("#experience").val(experience)
    $("#skill_level").val(level)
    $("#notes").val(notes)
  
 
    $("#addbtn_skills").unbind();
    idForEdit=id
    $("#addbtn_skills").click(editskills);
    
}

function loadNewEditSkills(id){
$("#editskillsId").html("");
    var skillName=$("#skillnamenew"+id).val()
	var experience=$("#experiencenew"+id).val()
	var level=$("#levelnew"+id).val()
	var notes=$("#notesnew"+id).val()
	 
  	 /* Fetching data for Edit functionality */
  	 
  	$("#skills").val(skillName)
    $("#experience").val(experience)
    $("#skill_level").val(level)
    $("#notes").val(notes)
    
    $("#addbtn_skills").unbind();
    idForEdit=id
    $("#addbtn_skills").click(editNewskills);
}
function editskills(){

     $("#editskillsId").html(""); 
			    
	var skillname_tb=$("#skills").val()
	var experience_tb=$("#experience").val()
	var level_tb=$("#skill_level").val()
	var notes_tb=$("#notes").val()

		if(skillname_tb=="1")
		{
			//alert('Please select Skills');
			$("#editskillsId").html("<h5>Please select skills</h5>"); 
			return;	
		}	
		if(experience_tb=="")
		{
			//alert('Please enter years of experience');
			$("#editskillsId").html("<h5>Please enter years of experience</h5>");
			return;	
		}
		if(experience_tb.length>45)
		{
			//alert('Please enter years of experience');
			$("#editskillsId").html("<h5>Should have less than 45 characters</h5>");
			return;	
		}	
		if(notes_tb.length>45)
		{
			//alert('Please enter years of experience');
			$("#editskillsId").html("<h5>Should have less than 45 characters</h5>");
			return;	
		}			
				
		if(level_tb=="1")
		{	
			//alert('Please select skill level');
			$("#editskillsId").html("<h5>Please select skill level</h5>");
			return;	
		}	
		
		
		
		$("#skillname"+idForEdit).val(skillname_tb)
		$("#experience"+idForEdit).val(experience_tb)
		$("#level"+idForEdit).val(level_tb)
		$("#notes"+idForEdit).val(notes_tb)
		
		$("#skillname_div"+idForEdit).html(skillname_tb)
		$("#experience_div"+idForEdit).html(experience_tb)
		$("#level_div"+idForEdit).html(level_tb)
		$("#notes_div"+idForEdit).html(notes_tb)

		$("#skills").val("")
	    $("#experience").val("")
	    $("#skill_level").val("1")
	    $("#notes").val("")
	    //$("#industry").val("");
        $("#skillscategory").val("");
	    
	    $("#addbtn_skills").unbind();
        $("#addbtn_skills").click(addSkills);

}

function editNewskills(){

	$("#editskillsId").html(""); 
	var skillname_tb=$("#skills").val()
	var experience_tb=$("#experience").val()
	var level_tb=$("#skill_level").val()
	var notes_tb=$("#notes").val()

		if(skillname_tb=="1")
		{
			$("#editskillsId").html("<h5>Please select skills</h5>"); 
			return;	
		}	
		if(experience_tb=="")
		{
			$("#editskillsId").html("<h5>Please enter years of experience</h5>");
			return;	
		}
		if(experience_tb.length>45)
		{
			$("#editskillsId").html("<h5>Should have less than 45 characters</h5>");
			return;	
		}	
		if(notes_tb.length>45)
		{
			$("#editskillsId").html("<h5>Should have less than 45 characters</h5>");
			return;	
		}			
				
		if(level_tb=="1")
		{	
				$("#editskillsId").html("<h5>Please select skill level</h5>");
			return;	
		}	
		
		
		
		$("#skillnamenew"+idForEdit).val(skillname_tb)
		$("#experiencenew"+idForEdit).val(experience_tb)
		$("#levelnew"+idForEdit).val(level_tb)
		$("#notesnew"+idForEdit).val(notes_tb)
		
		$("#skillname_divnew"+idForEdit).html(skillname_tb)
		$("#experience_divnew"+idForEdit).html(experience_tb)
		$("#level_divnew"+idForEdit).html(level_tb)
		$("#notes_divnew"+idForEdit).html(notes_tb)

		$("#skills").val("")
	    $("#experience").val("")
	    $("#skill_level").val("1")
	    $("#notes").val("")
	    //$("#industry").val("");
        $("#skillscategory").val("");
	    
	    $("#addbtn_skills").unbind();
        $("#addbtn_skills").click(addSkills);

}
function addSkills(){
$("#editskillsId").html(""); 
	
	var skillname_tb=$("#skills").val()
	var experience_tb=$("#experience").val()
	var level_tb=$("#skill_level").val()
	var notes_tb=$("#notes").val()
	
	  
		if(skillname_tb=="1")
		{
			$("#editskillsId").html("<h5>Please select skills</h5>"); 
			return;	
		}	
		if(experience_tb=="")
		{
			$("#editskillsId").html("<h5>Please enter years of experience</h5>");
			return;	
		}
		if(experience_tb.length>45)
		{
			$("#editskillsId").html("<h5>Should have less than 45 characters</h5>");
			return;	
		}
		if(notes_tb.length>45)
		{
			$("#editskillsId").html("<h5>Should have less than 45 characters</h5>");
			return;	
		}				
				
		if(level_tb=="1")
		{	
		$("#editskillsId").html("<h5>Please select skill level</h5>");
			return;	
		}	
		
	  count=count+1
	  var htmlText= "<div class='sel_prof_row' id='skillsdivnew"+count+"'><table border='0'><tr><td><table  border='0'> <tr>"+
				 "<td align='left' class='sel_prof_col spc_industry' id='skillname_divnew"+count+"'>" + skillname_tb + "</td>" +
				 "<td class='sel_prof_col spc_years' id='experience_divnew"+count+"'>" + experience_tb + "</td>" +
				 "<td class='sel_prof_col spc_skill' id='level_divnew"+count+"'>" + level_tb + "</td>" +
				 "<td class='sel_prof_col spc_info' id='notes_divnew"+count+"'>" + notes_tb +
				 "</td>" + "</tr></table></td><td><div class='sel_prof_col spc_actions'>"+
				 "<table  border='0'><tr>"+
				 "<td id='image_edit'onclick='loadNewEditSkills("+count+")'></td><td id='image_cross' onclick=deleteNewSkills('"+count+"') ></td></tr>"+
				 "</table></div></td></tr></table>" +
				 //These details are used for storing the data into database.
				 "<input type='hidden' id='skillnamenew"+count+"' name='newSkillName' value='"+skillname_tb+"'/>"+ 
				 "<input type='hidden' id='experiencenew"+count+"' name='newExperience' value='" +experience_tb+ "'/>"+
				 "<input type='hidden' id='levelnew"+count+"' name='newLevel' value='" +level_tb+ "'/>"+
				 "<input type='hidden' id='notesnew"+count+"' name='newNotes' value='" +notes_tb+ "'/></div>";

				 
				$("#sel_prof_row").append(htmlText) 
				
				$("#skills").val("")
			    $("#experience").val("")
			    $("#skill_level").val("1")
			    $("#notes").val("")
			   // $("#industry").val("");
                $("#skillscategory").val("");
     
				
    }

function deleteSkills(id){
$("#editskillsId").html("");

   /*Added for storing deleted rowid into a textfield */
	var htmlText="<div class='deleteskills' id='del"+id+"'><input type='hidden' name='delskillrow' id='delrowid"+id+"' value='"+id+"' /></div>";
	$("#deleteskills").append(htmlText) 
	
	/*Added for deleting existing rows from db  */			
	$("#skillsdiv"+id).remove();
	
	$("#skills").val("")
    $("#experience").val("")
    $("#skill_level").val("1")
    $("#notes").val("")
    //$("#industry").val("");
    $("#skillscategory").val("");
	
	
	$("#addbtn_skills").unbind();
    $("#addbtn_skills").click(addSkills);
}
function deleteNewSkills(id){
	$("#editskillsId").html("");
	/*Added for deleting new rows from div tag*/
	$("#skillsdivnew"+id).remove();
	
	$("#skills").val("")
    $("#experience").val("")
    $("#skill_level").val("1")
    $("#notes").val("")
    //$("#industry").val("");
    $("#skillscategory").val("");
	
	$("#addbtn_skills").unbind();
    $("#addbtn_skills").click(addSkills);
	
}
/* End of editskills.js */

/* Start of editTraining.js */
count=0


function addTrainingDetails(){
		 
		  $("#traingId").hide();       
         var trainingName =$("#training_textbox").val()
         if(trainingName.length>45)
         {
             $("#traingId").show();
              return;
         }  
         
         if(trainingName==""){
	     return;
     	 }
         count = count+101;
	     //Html text genertation for displaying of the data dynamically on click of add.	
		  count = count+1;
	     //Html text genertation for displaying of the data dynamically on click of add.	
		 var htmlText= "<div class='add_training_row' id='trainingdivdiv"+count+"'><table border='0'><tr><td><table  border='0'> <tr>"+
		 "<td class='atc_name'id='trainingNameCount"+count+"'>" + trainingName+ "</td>" +		 
		  "</tr></table></td><td><div class='atc_actions'>"+
		 "<table  border='0'><tr>"+
		 "<td id='image_cross1' onclick=deleteNewTraining('"+count+"') ></td></tr>"+
		 "</table></div></td></tr></table>" +
		 //These details are used for storing the data into database.
		  "<input type='hidden' id='trainingNameCount1"+count+"' name='newTrainingName' value='" + trainingName + "'/></div>";
		 //Appending the new row along with the old data		 
		 $("#additional_training").append(htmlText)
		 
		  $("#training_textbox").val("")

}
	function deleteTraining(id){
		
			var htmlText="<div class='deltrainingdiv' id='del"+id+"'><input type='hidden' name='deltrainingrow' id='delrowid"+id+"' value='"+id+"' /></div>";
			$("#deltrainingdiv").append(htmlText) 
		
		    $("#trainingdivdiv"+id).remove();
		  
			$("#training_textbox").val("")
		     
		}

 function deleteNewTraining(id){

     $("#trainingdivdiv"+id).remove();
		  
 	 $("#training_textbox").val("")
     
}

function  setTrainingVal(){
	$("#training_textbox").val("");
 		if( checkPhoneNumber()==true){
 		return true;
 		}
 		else{
 		return false;
 		}
 		
 	

}

function checkPhoneNumber() {
 
	var phoneNo=$("#phoneNumberId").val();
    var phoneRE = /^\(\d\d\d\) \d\d\d-\d\d\d\d$/;
	   if (phoneNo.match(phoneRE) || !isNaN(phoneNo)) {
	   return true;
	   } else {
	   alert("The phone number entered is invalid!");
	   return false;
	  }
}
/* End of editTraining.js */

/* Start of editWorkExperience.js*/
var Edit=0
var count=0

var dtCh= "/";
var idForEdit;
function loadForEditWorkExperience(id){

    $("#validateWorkExp").html(""); 
	/* Fetching data for Edit functionality */
	var employerName=$("#employer"+id).val();
	var description=$("#description"+id).val();
	var workStart=$("#workstart"+id).val();
	var workEnd=$("#workend"+id).val();
	 
  	
    $("#companyname_txtbox").val(employerName);
    $("#description_txtbox").val(description);
    $("#workStart_txtbox").val(workStart);
    $("#workEnd_txtbox").val(workEnd);
    
    $("#add_btn").unbind();	
    idForEdit = id;
    $("#add_btn").click(editExperience);  	 
}

function loadForEditNewWorkExperience(id){

	
	var employerName=$("#employernew"+id).val();
	var description=$("#descriptionnew"+id).val();
	var workStart=$("#workstartnew"+id).val();
	var workEnd=$("#workendnew"+id).val();
	 
  	 /* Fetching data for Edit functionality */
    $("#companyname_txtbox").val(employerName);
    $("#description_txtbox").val(description);
    $("#workStart_txtbox").val(workStart);
    $("#workEnd_txtbox").val(workEnd);
    idForEdit = id;
    $("#add_btn").unbind();
    $("#add_btn").click(editNewExperience);
 	 
}

function editExperience(){
  $("#validateWorkExp").html(""); 
	var ename=$("#companyname_txtbox").val()
	var desc=$("#description_txtbox").val()
	var ws=$("#workStart_txtbox").val()
	var we=$("#workEnd_txtbox").val()
   if(ename==""){
   //alert("Please enter Company Name")
   $("#validateWorkExp").html('<h5>Please enter companyname</h5>')
   return;
   }
   if(ename.length>45)
	{   
		//alert('Please enter Company name');
		$("#validateWorkExp").html('<h5>Companyname should have less than 45 characters</h5>');
		return;	
	}
   
   if(desc==""){
  $("#validateWorkExp").html('<h5>Please enter title/position</h5>');
   return;
   }
   if(desc.length>45)
	{   
		//alert('Please enter Company name');
		$("#validateWorkExp").html('<h5>Title/Position should have less than 45 characters</h5>');
		return;	
	}
   if(ws==""){
   $("#validateWorkExp").html('<h5>Please enter From date</h5>');
   return;
   }
    else{
	 	  if(isDate1(ws)==false){
		     ws.focus()
			 return false
		   }
	 }
  
	 
	 if(we!="")
	{
	 	  if(isDate1(we)==false)
	 	  {
		     we.focus()
			 return false
		   }
    }
	 
	 
	var start=new Date(ws);
	var end=new Date(we);
	if (start>=end){
	$("#validateWorkExp").html('<h5>To date should be greater than From date</h5>');
	return false
	}
	
	$("#employer"+idForEdit).val(ename);
	$("#description"+idForEdit).val(desc);
	$("#workstart"+idForEdit).val(ws);
	$("#workend"+idForEdit).val(we);
	
	$("#employerdiv"+idForEdit).html(ename);
	$("#descriptiondiv"+idForEdit).html(desc);
	if(we!="")
	{
	$("#workstartdiv"+idForEdit).html(ws+"-"+we);
	}
	else
	{
	$("#workstartdiv"+idForEdit).html(ws);
	}
	$("#companyname_txtbox").val("")
	$("#description_txtbox").val("")
	$("#workStart_txtbox").val("")
	$("#workEnd_txtbox").val("")
	$("#add_btn").unbind();
    $("#add_btn").click(addExperience);
	  
}

function editNewExperience(){
 $("#validateWorkExp").html(""); 
	var ename=$("#companyname_txtbox").val()
	var desc=$("#description_txtbox").val()
	var ws=$("#workStart_txtbox").val()
	var we=$("#workEnd_txtbox").val()
 if(ename==""){
 $("#validateWorkExp").html('<h5>Please enter companyname</h5>')
   return;
   }
    if(ename.length>45)
	{   
		//alert('Please enter Company name');
		$("#validateWorkExp").html('<h5>Companyname should have less than 45 characters</h5>');
		return;	
	}
   if(desc==""){
    $("#validateWorkExp").html('<h5>Please enter title/position</h5>');
   return;
   }
   if(desc.length>45)
	{   
		//alert('Please enter Company name');
		$("#validateWorkExp").html('<h5>Title/Position should have less than 45 characters</h5>');
		return;	
	}
   if(ws==""){
   $("#validateWorkExp").html('<h5>Please enter From date</h5>');
   return;
   }
    else{
	 	  if(isDate1(ws)==false){
		     ws.focus()
			 return false
		   }
	 }
   if(we!="")
	{
	 	  if(isDate1(we)==false)
	 	  {
		     we.focus()
			 return false
		   }
    }
	 
	var start=new Date(ws);
	var end=new Date(we);
	if (start>=end){
$("#validateWorkExp").html('<h5>To date should be greater than From date</h5>');
	return false
	}
	
	$("#employernew"+idForEdit).val(ename);
	$("#descriptionnew"+idForEdit).val(desc);
	$("#workstartnew"+idForEdit).val(ws);
	$("#workendnew"+idForEdit).val(we);
	
	$("#employerdivnew"+idForEdit).html(ename);
	$("#descriptiondivnew"+idForEdit).html(desc);
	if(we!="")
	{
	$("#workstartdivnew"+idForEdit).html(ws+"-"+we);
	}
	else
	{
	$("#workstartdivnew"+idForEdit).html(ws);
	}	
	$("#companyname_txtbox").val("")
	$("#description_txtbox").val("")
	$("#workStart_txtbox").val("")
	$("#workEnd_txtbox").val("")
 	$("#add_btn").unbind();
    $("#add_btn").click(addExperience);
	  
}

function addExperience(){


/* id for getting current workexperience rowid */
    $("#validateWorkExp").html(""); 
   
	var ename=$("#companyname_txtbox").val()
	var desc=$("#description_txtbox").val()
	var ws=$("#workStart_txtbox").val()
	var we=$("#workEnd_txtbox").val()

   if(ename==""){
    $("#validateWorkExp").html('<h5>Please enter companyname</h5>')
   return;
   }
    if(ename.length>45)
	{   
		//alert('Please enter Company name');
		$("#validateWorkExp").html('<h5>Companyname should have less than 45 characters</h5>');
		return;	
	}
	
   if(desc==""){
   $("#validateWorkExp").html('<h5>Please enter title/position</h5>');
   return;
   }
    if(desc.length>45)
	{    
		//alert('Please enter Company name');
		$("#validateWorkExp").html('<h5>Title/Position should have less than 45 characters</h5>');
		return;	
	}
   if(ws==""){
   $("#validateWorkExp").html('<h5>Please enter From date</h5>');
   return;
   }
   else
   {
       if(isDate1(ws)==false)
	 	  {
		     ws.focus()
			 return false
		   }
   }
    if(we!="")
	{
	  
	 	  if(isDate1(we)==false)
	 	  {
		     we.focus()
			 return false
		   }
    }
   
    var start=new Date(ws);
	var end=new Date(we);
	if (start>=end){
	$("#validateWorkExp").html('<h5>To date should be greater than From date</h5>');
	return false
	}
   
  
		count=count+19
	/* Adding new row to the workexperience table */
	var htmlText= "<div class='exp_entry' id='expdivnew"+count+"'><table border='0'>"+
				  "<tr><td class='where' id='employerdivnew"+count+"'>"+ename+"</td>"+
	              "<td class='what' id='descriptiondivnew"+count+"'>"+desc+"</td>"+
	              "<td class='when' id='workstartdivnew"+count+"'>"+ws
	              if(we!="")
		          {	  
		 
		             htmlText+="-\n"+we;
		          }
	             htmlText+="</td>"+
	              "<td><div class='actions'><table  border='0'><tr>"+
		          "<td id='image_edit'onclick='loadForEditNewWorkExperience("+count+")'></td>"+
		          "<td id='image_cross' onclick='deleteNewWorkExperience("+count+")'></td></tr></table></div></td></tr></table>"+
	              "<input type='hidden' name='newEmployerName' value='"+ename+"' id='employernew"+count+"'/>"+
	              "<input type='hidden' name='newDescription' value='"+desc+"' id='descriptionnew"+count+"'/>"+
	              "<input type='hidden' name='newWorkStart' value='"+ws+"' id='workstartnew"+count+"'/>"+
	              "<input type='hidden' name='newWorkEnd' value='"+we+"' id='workendnew"+count+"'/></div>"
	
	
				$("#currentWorkExp").append(htmlText) 
				$("#companyname_txtbox").val("")
				$("#description_txtbox").val("")
				$("#workStart_txtbox").val("")
				$("#workEnd_txtbox").val("")
				 $("#validateWorkExp").html("");
	  
}

function deleteWorkExperience(id){
	$("#validateWorkExp").html(""); 
	
	/*Added for storing deleted rowid into a textfield */
	var htmlText="<div class='deldiv' id='del"+id+"'><input type='hidden' name='delexperiencerow' id='delrowid"+id+"' value='"+id+"' /></div>";
	$("#deldiv").append(htmlText) 
				
	/*Added for deleting existing rows from db  */			
	$("#expdiv"+id).remove(); 
	
    $("#companyname_txtbox").val("")
    $("#description_txtbox").val("")
    $("#workStart_txtbox").val("")
    $("#workEnd_txtbox").val("")
    
    $("#add_btn").unbind();
    $("#add_btn").click(addExperience);
	
}

function deleteNewWorkExperience(id){
	$("#validateWorkExp").html(""); 
	/*Added for deleting new rows from div tag*/				
	$("#expdivnew"+id).remove();
	
	$("#companyname_txtbox").val("")
    $("#description_txtbox").val("")
    $("#workStart_txtbox").val("")
    $("#workEnd_txtbox").val("")
    
    $("#add_btn").unbind();
    $("#add_btn").click(addExperience);
	
}
/* Added for checking validation when user enters date manually */		
function isDate1(dtStr){
	
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
		 $("#validateWorkExp").html('<h5>The date format should be : mm/dd/yyyy</h5>');
        return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		 $("#validateWorkExp").html('<h5>Please enter a valid month</h5>');
        
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
	 $("#validateWorkExp").html('<h5>Please enter a valid day</h5>');
        
		return false
	}
	if (strYear.length != 4 || year==0){
		 $("#validateWorkExp").html('<h5>Please enter a valid 4 digit year</h5>');
        
		return false
	}
	
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		$("#validateWorkExp").html('<h5>Please enter a valid date</h5>');        
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

/* End  of editWorkExperience.js*/


/* validations for addprofileEducation */
var count =0;
var Edit =0; 
var Delete =0;
var dtCh= "/";

function addEducationDetails1(){
  
  
   $("#validateEducationId").html("");
    var schoolName = $("#schoolName_txtbox").val();
	var degree = $("#degree_txtbox").val();
	var educationStart = $("#educationStart_txtbox").val();
	var educationEnd = $("#educationEnd_txtbox").val();	
	var concentration =$("#concentration_txtbox").val();
	var gpa =$("#gpa_txtbox").val();
	var honors = $("#honors_txtbox").val();
	var selectedValue =$("#sel").val()
	
	if(schoolName=="")
	{
		//alert('Please enter schoolName');
		$("#validateEducationId").html("<h5>Please enter schoolname</h5>");
		return;	
	}
	if(schoolName.length>45)
	{
	  $("#validateEducationId").html("<h5>Schoolname should have less than 45 characters</h5>");
		return;	
	}		
	if(degree=="")
	{
		//alert('Please enter Degree');
		$("#validateEducationId").html("<h5>Please enter degree</h5>");
		return;	
	}
	if(degree.length>45)
	{
	  $("#validateEducationId").html("<h5>Degree should have less than 45 characters</h5>");
		return;	
	}
	if(educationStart=="")
	{	
		//alert('Please enter educationStart date');
		$("#validateEducationId").html("<h5>Please enter From date</h5>");
		return;	
	}	
	else{
	 	  if(isDate(educationStart)==false){
		     educationStart.focus()
			 return false
		   }
	 }
	if(educationEnd=="")
	{
		//alert('Please enter educationEnd date');
		$("#validateEducationId").html("<h5>Please enter To date</h5>");
		return;	
	}	
	else{
	 	  if(isDate(educationEnd)==false){
		     educationEnd.focus()
			 return false
		   }
	 }
	 
	var start=new Date(educationStart);
	var end=new Date(educationEnd);
	if (start>=end){
	//alert ("Education Ended Date should be greater than Education Started Date");
	$("#validateEducationId").html("<h5>To date should be greater than From date</h5>");
	return false
	}
	
	
	if(concentration=="")
	{
		//alert('Please enter concentration');
		$("#validateEducationId").html("<h5>Please enter concentration</h5>");
		return;	
	}
	if(concentration.length>35)
	{
		//alert('Please enter concentration');
		$("#validateEducationId").html("<h5>Concentration should have less than 35 characters</h5>");
		return;	
	}
		
	if(selectedValue=="1")
	{
		//alert('Please select concentration level');
		$("#validateEducationId").html("<h5>Please select concentration level</h5>");
		return;	
	}
	if(gpa.length>45)
	{
	  $("#validateEducationId").html("<h5>Gpa should have less than 45 characters</h5>");
		return;	
	}
	if(honors.length>45)
	{
	    $("#validateEducationId").html("<h5>Honors should have less than 45 characters</h5>");
		return;	
	}	
	//to check wheter to add or to edit if edit=0 then add else Edit	    
    if(Edit == 0)
    {       
	     count = count+100;
	     //Html text genertation for displaying of the data dynamically on click of add.	
		 var htmlText= "<div class='sel_prof_row' id='divTable"+count+"'><table border='0'><tr><td><table  border='0'><tr>"+
		 "<td class='sel_prof_col spc_school' id='schoolNameCount"+count+"'>" + schoolName + "</td>" +
		 "<td class='sel_prof_col spc_degree' id='degreeCount"+count+"'>" + degree + "</td>" +
		 "<td class='sel_prof_col spc_dateattended' id='educationCount"+count+"'>" + educationStart + "-" + educationEnd +
		 "</td>" + "<td class='sel_prof_col spc_degreename' id='concentrationCount"+count+"'>" + concentration +"("+selectedValue+")"+ "</td>" +
		 "<td class='sel_prof_col spc_gpa' id='gpaCount"+count+"'>" + gpa + "</td>" +
		 "<td class='sel_prof_col spc_honors' id='honorsCount"+count+"'>" + honors + "</td>" +
		  "</tr></table></td><td><div class='sel_prof_col spc_actions'>"+
		 "<table  border='0'><tr>"+
		 "<td id='image_edit'onclick='editEducationDetails("+count+")'></td><td id='image_cross' onclick=deleteEducationDetails1('"+count+"') ></td></tr>"+
		 "</table></div></td></tr></table>" +
		 //These details are used for storing the data into database.
		 "<input type='hidden' id='schoolNameCount1"+count+"' name='schoolName' value='"+schoolName+"'/>"+ 
		 "<input type='hidden' id='degreeCount1"+count+"' name='degree' value='" + degree + "'/>"+
		 "<input type='hidden' id='educationCount1"+count+"' name='educationStart' value='" + educationStart + "'/>"+
		 "<input type='hidden' id='educationCount2"+count+"' name='educationEnd' value='" + educationEnd + "'/>"+
		 "<input type='hidden' id='concentrationCount1"+count+"' name='concentration' value='" + concentration +"("+selectedValue+")"+ "'/>"+
    	 "<input type='hidden' id='concenLevelCount1"+count+"' name='concenlevel' value='" + selectedValue+ "'/>"+
    	 "<input type='hidden' id='gpaCount1"+count+"' name='gpa' value='" + gpa + "'/>"+
		 "<input type='hidden' id='honorsCount1"+count+"' name='honors' value='" + honors + "'/></div>";
		 //Appending the new row along with the old data		 
		 $("#your_education").append(htmlText)
		 
		 Edit=0;
	}
	else{	
	
	
	/* Editing for display purpose in table*/ 
	 $("#schoolNameCount"+ Edit).html(schoolName)
	  
	 $("#degreeCount"+ Edit).html(degree)
	  
     $("#educationCount"+ Edit).html(educationStart +"-"+ educationEnd)	  	 
	  
	 $("#concentrationCount"+ Edit).html(concentration +"("+ selectedValue+")")  
	  
	 $("#gpaCount"+ Edit).html(gpa) 
	  
	 $("#honorsCount"+ Edit).html(honors) 
	  	   
	  /* Editing values for hidden feilds for stroing into database*/
	  
	  $("#schoolNameCount1"+ Edit).val(schoolName)
	  	 
	  $("#degreeCount1"+ Edit).val(degree)
	  	 
	  $("#educationCount1"+ Edit).val(educationStart)
	  
	  $("#educationCount2"+ Edit).val(educationEnd)
	  
	  $("#concentrationCount1"+ Edit).val(concentration+"("+ selectedValue+")")
	  
	  $("#gpaCount1"+ Edit).val(gpa)
	  
	  $("#honorsCount1"+ Edit).val(honors)
	  
	  $("#concenLevelCount1"+ Edit).val(selectedValue)
	   
	  Edit = 0	 
	}
      $("#schoolName_txtbox").val("");
      $("#degree_txtbox").val("");
      $("#educationStart_txtbox").val("");
      $("#educationEnd_txtbox").val("");
      $("#concentration_txtbox").val("");
      $("#gpa_txtbox").val("");
      $("#honors_txtbox").val("");
      $("#sel").val("1");
      
}

function editEducationDetails(count){

     Edit = count;
	 
	 
	 var schoolName = $("#schoolNameCount1"+ Edit).val()
	  	 
	 var degree = $("#degreeCount1"+ Edit).val()
	  	 
	 var educationStart = $("#educationCount1"+ Edit).val()
	  
	 var educationEnd = $("#educationCount2"+ Edit).val()
	  
	 var concentration = $("#concentrationCount1"+ Edit).val().split("(")[0];
	  
	 var gpa = $("#gpaCount1"+ Edit).val()
	  
	 var honors = $("#honorsCount1"+ Edit).val()
	  
	 var conLevel= $("#concenLevelCount1"+ Edit).val()
	 	  
	
	 
	 //Restoring the fetched data into text boxes
     $("#schoolName_txtbox").val(schoolName);
     $("#degree_txtbox").val(degree);
     $("#educationStart_txtbox").val(educationStart);
     $("#educationEnd_txtbox").val(educationEnd);
     $("#concentration_txtbox").val(concentration);
     $("#gpa_txtbox").val(gpa);
     $("#honors_txtbox").val(honors);
     $("#sel").val(conLevel);
     
  
   
}

function deleteEducationDetails1(delID){

		
	 $("#divTable"+delID).remove();
	 
	 $("#schoolName_txtbox").val("");
	 $("#degree_txtbox").val("");
	 $("#educationStart_txtbox").val("");
	 $("#educationEnd_txtbox").val("");
	 $("#concentration_txtbox").val("");
	 $("#gpa_txtbox").val("");
	 $("#honors_txtbox").val("");
	 $("#sel").val("1");
	  Edit = 0;
	 
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
		//alert("The date format should be : mm/dd/yyyy")
		$("#validateEducationId").html("<h5>The date format should be : mm/dd/yyyy</h5>");
        return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		//alert("Please enter a valid month")
		$("#validateEducationId").html("<h5>Please enter a valid month</h5>");
        
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		//alert("Please enter a valid day")
		$("#validateEducationId").html("<h5>Please enter a valid day</h5>");
        
		return false
	}
	if (strYear.length != 4 || year==0){
		//alert("Please enter a valid 4 digit year")
        $("#validateEducationId").html("<h5>Please enter a valid 4 digit year</h5>");
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
	//	alert("Please enter a valid date")
        $("#validateEducationId").html("<h5>Please enter a valid date</h5>");
        
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

/* End of addprofileEducation  */

/* Start of employeeBriefcase.js */
	
var defaultInputTextColor = "#000000";
var contactId=0;

/* Add Briefcase Item */
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

function addBriefcaseDocument()
{
  
    $("#nameId").hide();
    $("#nameId1").hide();
    $("#privacyId").hide();
	$("#fileId").hide();
    $("#validDocumentId").hide();
    
 	var nameOfItem=$("#nameid").val();
 	
	if(nameOfItem=="")
	{
	    //alert("Please enter Name of Item");
	    $("#nameId").show();
	    return false;
	} 
	if(nameOfItem.length>45)
	{  
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




function addBriefcasePhoto()
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
    if(nameOfItem.length>45)
	{  
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


function addBriefcaseAudioVedio() 
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
	return false;
	}
    if(nameOfItem.length>45)
	{  
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
	extArray =  new Array(".ra",".ram",".dss",".msv",".dvf",".mp4",".m4a",".gsm",".dct",".vox",".aac",".Xvid",".aac",".aif",".iff",".mp3",".mpa",".ra",".wav",".wma",".3g2",".3gp",".asf",".asx",".avi",".flv",".mov",".mpg",".rm",".swf",".vob",".wmv");
	
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
function validateAudioOrVideo()
{
   $("#nameId").hide();
   $("#nameId1").hide();
      var nameOfItem=$("#nameid").val();
    if(nameOfItem.length>45)
	{  
	   $("#nameId").hide();
	    $("#nameId1").show();
	    return false;
	}      
  if(nameOfItem=="")
  {     $("#nameId1").hide();
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
      $("#nameId1").hide();
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



function audioOrVideo(){

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
/* End of Add Briefcase Item */


/* Edit Briefcase Item */
function ediBreifcaseListItems(id){

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
		$.post("getPrivacySettingList.action",{},function (data)
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

function editBriefcaseDetails(id)
{
    var  itemName = $("#txtname"+id).val();
    if(itemName.length>45)
    {
       bc_pop_up1('event',"confirm_delete2",["center",300]);
       $("#success").hide();
        $("#failure").hide();
       $("#validateTitleName").show();
      return false;
    }
    var  itemPrivacySetting = $("#selprivacySetting"+id).val(); 
   
   $.post("editBriefcaseItems.action",{'item.id' :id,'name':itemName,'privacySetting':itemPrivacySetting},function (data)
   {      
          
            if(data.result =="success")
            {
             
				$("#name1"+id).hide();
				$("#name"+id).show();
				$("#name"+id).html(data.name);
				
				$("#category1"+id).hide();
				$("#category"+id).show();
				//$("#category"+id).html(data.category);
				
				$("#privacySetting"+id).show();
				$("#privacySetting"+id).html(data.privacySetting);
				$("#privacySetting1"+id).hide();
				
				$("#actionId"+id).show();
				$("#actionId1"+id).hide();
			 //alert("updated Data sucessfully");
			    
			    
			    bc_pop_up1('event',"confirm_delete2",["center",300]);
			    $("#validateTitleName").hide();
			     $("#success").show();
            }else{
            //alert("Not updated Data sucessfully");
             bc_pop_up1('event',"confirm_delete2",["center",300]);
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

var defaultInputTextColor = "#000000";
var contactId=0;

function inputOnFocus(what)
	{
	if (!what.alreadyClicked)
		{
		what.value = "";
		what.style.color = defaultInputTextColor;
		what.alreadyClicked = true;
		}
	}

/* End of Edit Briefcase Item */


/* Delete Briefcase Item */
function deleteBriefcaseDocument()
{
 
 document.getElementById("delete").href= "deleteBriefcaseDocument.action?item.id="+contactId;
  
}	

function deleteBriefcasePhoto(){

	document.getElementById("delete").href= "deleteBriefcasePhoto.action?item.id="+contactId;
}


function deleteBriefcaseAudioOrVideo(){

	document.getElementById("delete").href= "deleteBriefcaseAudioOrVideo.action?item.id="+contactId;
}
/* End of Delete Briefcase Item */



/* Added for Briefcase pop_up's */
function bc_pop_up(e,pop_up_id,location)
	{
	  hide_pop_up("confirm_delete2");
	 $("#nameId").hide();
     $("#privacyId").hide();
	 $("#fileId").hide();
	  $("#validDocumentId").hide();
	 hide_pop_up("confirm_delete");
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



function pop_upForDeleteBriefcase(e,id,name,spanid,pop_up_id,location)
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
/* End of employeeBriefcase.js */	

/* Start of employeeContacts.js */	
var defaultInputTextColor = "#000000";
var contactId=0;

/* Added for Edit contacts */

function editContactList(id,associatedProfileId){
    
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
			
			
			$.post("getContactTypeList.action",{'associatedProfileId':associatedProfileId},function (data)
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
function updateContacts(id,profileID){
 
	var nickName=$("#nickNames"+id).val();
	var contactType=$("#contTypeIDs"+id).val();
	
		 $.post("editEmployerContactsItems.action",{'contact.id' :id,'contact.nickName':nickName,'contact.contactType':contactType,'associatedProfileId':profileID},function (data)
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
				bc_pop_up1('event',"confirm_delete2",["center",300])
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

/* End of employeeContacts.js*/	

var defaultInputTextColor = "#000000";

function inputOnFocus(what)
	{
	if (!what.alreadyClicked)
		{
		what.value = "";
		what.style.color = defaultInputTextColor;
		what.alreadyClicked = true;
		}
	}

/* PopUp1
location can be an x,y,rel coordinate array
where x and y are either a pixel coordinate or "center"
where rel is either "absolute" "relative" or "mouse"
examples:
pop_up(event,"my_popup",[200,300])
pop_up(event,"my_popup",["center",300])
pop_up(event,"my_popup",[-400,-200,"mouse"])
pop_up(event,"my_popup",[20,20,"negoffset_mouse"]) --> positions the box's lower right hand corner 20px up and left from the mouse
*/
function pop_up(e,pop_up_id,location)
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

function addItemToOpportunityList(parentFormID)
	{
	var tform = document.getElementById(parentFormID);
	var addToList = function(entry)
		{
		var getListLength = function()
			{
			var list = document.getElementById("opportunity_list");
			var divs = list.getElementsByTagName("div");
			var rows = new Array();
			for (var i=0;i<divs.length;i++)
				{
				if (checkClass(divs[i],"sel_prof_row")) rows.push(divs[i]);
				}
			return rows.length;
			}
		var list = document.getElementById("opportunity_list");
		var row = document.createElement("div");
		row.className = "sel_prof_row";
		var colClasses = ["spc_skillname","spc_numyears"];
		for (var i=0;i<colClasses.length&&i<entry.length;i++)
			{
			var col = document.createElement("div");
			col.className = "sel_prof_col "+colClasses[i];
			col.innerHTML = entry[i];
			row.appendChild(col);
			}
		var col = document.createElement("div");
		col.className = "sel_prof_col spc_actions";
		var a = document.createElement("a");
		a.innerHTML = '<img src="images/exp_entry-edit.gif" alt="Edit" />';
		a.href = "#";
		//a.onclick = function(){} //edit function
		col.appendChild(a);
		col.innerHTML = col.innerHTML + "&nbsp;&nbsp;";
		a = document.createElement("a");
		a.innerHTML = '<img src="images/mobc_redx.gif" alt="Remove" />';
		a.href = "#";
		a.parentEntry = row;
		a.parentEntry.index = getListLength();
		a.onclick = function()
			{
			removeItemFromOpportunityList(this.parentEntry.index);
			updateOpportunityListIndexes();
			}
		col.appendChild(a);
		row.appendChild(col);
		list.appendChild(row);
		}
	var j_name = tform.job_name.value || false;
	var num_y = tform.num_years.value || false;
	if (j_name && num_y) addToList([j_name,num_y+" years"]);
	return false;
	}

function updateOpportunityListIndexes()
	{
	var list = document.getElementById("opportunity_list");
	var divs = list.getElementsByTagName("div");
	var rows = new Array();
	for (var i=0;i<divs.length;i++)
		{
		if (checkClass(divs[i],"sel_prof_row")) rows.push(divs[i]);
		}
	for (var i=0;i<rows.length;i++) rows[i].index = i;
	}

function removeItemFromOpportunityList(index)
	{
	var list = document.getElementById("opportunity_list");
	var divs = list.getElementsByTagName("div");
	var rows = new Array();
	for (var i=0;i<divs.length;i++)
		{
		if (checkClass(divs[i],"sel_prof_row")) rows.push(divs[i]);
		}
	if (index < rows.length && list.removeChild) list.removeChild(rows[index]);
	return false;
	}
	
	
function storeEmployeeFeedback(divid)
{

       
        document.getElementById("spanid").innerText=250;
        var d = document.getElementById('feedbackid');
	    var feedbacktype =d.options[d.selectedIndex].value;
	   
	    var feedbac = document.getElementById("textareaId").value
	   
	   
	    var id = document.getElementById("profileid").value
	   
	     $.post("feedbackForEmployee.action",{'feedbacktype':feedbacktype,'feedbac':feedbac,'profileId':id},function (data)
            {      
                         
                         
			            if(data.result =="success")
			            {
			              
			              alert("Feedback added successfully");
			              var positive = data.positive;			             
			              document.getElementById("positiveid").innerText=positive;
			              var  nagative = data.nagative;			              
			              document.getElementById("negativeid").innerText=nagative;
			            
			              
			            }
			            else
			            {
			            alert("Feedback cannot be more than 250 charaters");
			            }                           
       
            },"json");
           hiding_pop_up(divid);
	    
}	
	
	function hiding_pop_up(pop_up_id)
	{
	    
	    document.getElementById("spanid").innerText=250;
	    document.getElementById("textareaId").value="";
	    document.getElementById(pop_up_id).style.display = "none";
	return false;
	}	


/* Start of getSkillsDetailsAfterLogin.js*/	
	
 var industriesList=[];
 var industriesids=[];
 var industriesnames=[];
 
 var categoriesList=[];
 var categorieIds=[];
 var categorieNames=[];
 
function getIndustry(){
  
  industriesList=[];
  industriesids=[];
  industriesnames=[];
  
	  $("#spbbl_industry").hide();
	  $.post("industry.action",{},function (data)  
	   { 
	  
	   for(var i=0;i<data.names.length;i++){
		var myString=data.names[i];
		myArray = myString.split(",");
			for(var j=0;j<myArray.length;j++){
			industriesList.push(myArray[j]);
			}
		}
	   
	    for(var i=0;i<industriesList.length-1;i++)
          {
          industriesids.push(industriesList[i]);
          industriesnames.push(industriesList[i+1]);
          i=i+1;
          }
	     new AutoSuggest(document.getElementById('industry'),industriesnames,'ajbx_industry');
	    
	    },"json");
}

function getCategory(){
	
	$("#spbbl_category").hide();
	var industryId=0
	var industryName =$("#industry").val();
	
	if(industryName=="")
	{
     var names=[];	 
	 new AutoSuggest(document.getElementById('skillscategory'),names,'ajbx_category');
	 }
	 
	else
	{ 
	
	for(var k=0;k<industriesnames.length;k++){
	  if(industryName==industriesnames[k]){
	  industryId=industriesids[k];
	  }
	}
   categoriesList=[];
   categorieIds=[];
   categorieNames=[];
	
	$.post("skillsCategory.action",{'industryId':industryId},function(data)
	{
	 
	 for(var i=0;i<data.names.length;i++){
		var myString=data.names[i];
		myCategories= myString.split(",");
			for(var j=0;j<myCategories.length;j++){
			categoriesList.push(myCategories[j]);
			}
		}
	   
	    for(var i=0;i<categoriesList.length-1;i++)
          {
          categorieIds.push(categoriesList[i]);
          categorieNames.push(categoriesList[i+1]);
          i=i+1;
          }
	 
	 new AutoSuggest(document.getElementById('skillscategory'),categorieNames,'ajbx_category');
	 
	 },"json");
	 
	 }
}

function getSkills(){
	
	var categoryId=0
	var categoryName=$("#skillscategory").val();
	if(categoryName=="")
	{
	  var names=[];	
	  new AutoSuggest(document.getElementById('skills'),names,'ajbx_skills');
	}
	else
	{
		for(var k=0;k<categorieNames.length;k++)
		{
		  if(categoryName==categorieNames[k]){
		  categoryId=categorieIds[k];
		  }
		}
	
		$.post("skills.action",{'categoryId':categoryId},function(data){
		
		 new AutoSuggest(document.getElementById('skills'),data.names,'ajbx_skills');
		 },"json");
	 }
 }
/* End of getSkillsDetailsAfterLogin.js*/ 


/* delete employee sent email messages  */

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

/*End of  delete employee sent email messages */

/*delete Employee Received email message  */

var listRecdMsgs=[];
var listEmpUnreadmsgs=[];

function selctMsgOption(){
	var optionId=$("#optionId").val();
	if(optionId==""){
	 alert("Please select option!")
	}
	 if(optionId=="delete"){
	 deleteEmplRecdMsgs();
	 $("#optionId").val("");
	}
	 if(optionId=="unread"){
	  markAsUnRead();
	 var selObj = document.getElementById("optionId");
	 selObj.options[0].selected = "";
	 $("#optionId").val("");
  }
}
function deleteEmplRecdMsgs(){
var count=0;
var	chkCnt=$("input:checkbox");
	for (i=0;i<chkCnt.length;++ i)
	  {
	  if (chkCnt[i].checked)
	    {
	    listRecdMsgs.push(chkCnt[i].value);
	    count++;
	    }
	  }
	 if(count!=0){
			var  return_val=confirm("Are you sure you want to delete these records?");
			 if(return_val==true){
			 document.inboxForm.action="deleteEmplRecdMsgsAction.action?ids="+listRecdMsgs;
			 document.inboxForm.submit();
			 }else{
			 // alert("Records not deleted!")
			  document.inboxForm.action="myInbox.action";
			  document.inboxForm.submit();
			 }
	
	 }else{
        var selObj = document.getElementById("optionId");
	    selObj.options[0].selected = "";
	    alert("Please select message to delete!");
	
	 }
}

function  markAsUnRead(){
var chkProid=$("#chkProid").val();
var cntVar=0;
var msgList="";
var idArray="";
var msgid=$("#msgesDivId").val();

var chkTotalCnt=$("input:checkbox");
for (j=0;j<chkTotalCnt.length;++ j){
	  if (chkTotalCnt[j].checked)
	    {
	    listEmpUnreadmsgs.push(chkTotalCnt[j].value);
	    cntVar++;
	    }
     }
      if(cntVar!=0){
     document.inboxForm.action="markAsEmplRecdMsgsAction.action?ids="+listEmpUnreadmsgs;
	 document.inboxForm.submit();
     msgList=listEmpUnreadmsgs +","; 
     msgList=msgList.substring(0, msgList.length-1)
     
     idArray=msgList.split(",");
     
      for(k=0;k<idArray.length;++k){
      $("#unreadDivId"+idArray[k]).show();
      $("#msgesDivId"+idArray[k]).hide();
   
      chkTotalCnt=""
      }
    
   }else{
    /* var selObj = document.getElementById("optionId");
	selObj.options[0].selected = ""; */
	
    alert("Please select message to  unread!");
    var selObj = document.getElementById("optionId");
	selObj.options[0].selected = "";
   
   } 
}
function deleteRecdReadMsgs(){
var inboxId=$("#inBoxId").val();
document.getElementById("deleteReadMsgs").href= "deleteEmplRecdReadMsgsAction.action?inBoxid="+inboxId;
}

/* End of delete Employee Received email message */

/* add user as contact from search */
var defaultInputTextColor = "#000000";
var contactOwnerId=0;

function getPrivacyGroups(){
	 var associatedProfileId=$("#associatedProfileId").val();
	 if(associatedProfileId!=""){
	 $("#selectProfile").hide();
	 $("#selectPrivacyGrp").hide();
	 }
	 $.post("getPrivacyGroupForContactByProfileId.action",{'profile.id':associatedProfileId},function (data)
			{
				$("#selContactId").remove();
				var htmlText ='<select id="selContactId" onchange="chkSelectedPrivacyGrp();"><option value="">Please Select</option> '
		 			    for(var i=0;i<data.names.length;i++)
                        {
				          htmlText += '<option value='+data.names[i]+'>' + data.names[i] + '</option>\n';
	                    }
	                   htmlText += '</select>'
				       $("#contactTypeDiv").html(htmlText);
			},"json");

}

function createContact(divid){
	var contactType=$("#selContactId").val()
	var contactOwnerId=$("#employeeProfileId").val()
	var associatedProfileId=$("#associatedProfileId").val();
	if(associatedProfileId==""){
	   $("#selectProfile").show();
	   $("#selectPrivacyGrp").hide();
	}else if(contactType==""){
      $("#selectPrivacyGrp").show();
      $("#selectProfile").hide();
    }
	else{
	$("#progress").show();
	$("#selContact").hide();
	 $("#contactExist").hide();
  $.post("contactValidateAction.action",{contactOwnerId : contactOwnerId,associatedProfileId:associatedProfileId},function (data)
   {  
        if(data.result=="success")
	     {  
	      $.post("addEmployeeContactFromEmployeeSearch.action",
			{'contactType':contactType,'contactOwner.id':contactOwnerId,
			'associatedProfileId':associatedProfileId},function (data)
			{
	                if(data.result=="success")
	                {
	                	$("#contact_details").hide();	
	                	$("#progress").hide();	
	                    $("#success").show();
	                    $("#contactExist").hide();
	                }
	                else
	                {
	                	$("#contact_details").hide();	
	                	$("#progress").hide();
	                	$("#failure").show();
	                	$("#contactExist").hide();
	                }        
			},"json");
	      
	      
	     }else{
	     $("#contact_details").hide();
	     $("#progress").hide();
	     $("#success").hide();
	     $("#contactExist").show();
         }
},"json");
}
}

function chkSelectedPrivacyGrp(){
var contactType=$("#selContactId").val()
if(contactType!=""){
 $("#selectPrivacyGrp").hide();
  $("#selectProfile").hide();
 }
}

function hide_pop_up(pop_up_id)
	{
	$("#progress").hide();
	$("#success").hide();
	$("#failure").hide();
	$("#selContact").show();
	$("#contactExist").hide();
	$("#selectPrivacyGrp").hide();
	$("#selectProfile").hide();
	var firstValue = document.getElementById("selContactId").options[0].value;
	document.getElementById("selContactId").value=firstValue
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

function pop_up_add_contact(e,profileId,pop_up_id,location)
{	
	hide_pop_up(pop_up_id);
	$("#contact_details").show();	
	$("#employeeProfileId").val(profileId);
	$("#associatedProfileId").val("");
	$("#selContactId").val("");
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

/* End of add user as contacts from search*/

/* sendMessageToContactsFromSearch*/
var defaultInputTextColor = "#000000";
var contactOwnerId=0;


function sendMessageToContacts(divid){
	$("#msgProgress").show();
	$("#selMsgContact").hide();
	var profileName=$("#profileNameId").val()
	var contactProfileId=$("#contactProfileId").val()
	var associatedProfileMsgId=$("#associatedProfileMsgId").val();
	var subject=$("#subjectId").val();
	var message=$("#messageId").val();
	
			$.post("sendMessageToContactFromEmployeeSearch.action",
			{'contactProfileId':contactProfileId,'associatedProfileMsgId':associatedProfileMsgId,
			'subject':subject,'message':message},function (data)
			{
			 
	                if(data.result=="success")
	                {
	                	$("#contact_msg_details").hide();	
	                	$("#msgProgress").hide();	
	                    $("#msgSuccess").show();
	                }
	                else
	                {
	                	$("#contact_msg_details").hide();	
	                	$("#msgProgress").hide();
	                	$("#msgFailure").show();
	                }        
			},"json");
	
}

function hide_pop_up1(pop_up_id)
	{
	$("#msgProgress").hide();
	$("#msgSuccess").hide();
	$("#msgFailure").hide();
	$("#selMsgContact").show();
	//var firstValue = document.getElementById("associatedProfileMsgId").options[0].value;
	//document.getElementById("associatedProfileMsgId").value=firstValue
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

function pop_up_send_message(e,profileId,profilename,pop_up_id,location)
{	
	hide_pop_up1(pop_up_id);
	$("#contact_msg_details").show();	
	$("#contactProfileId").val(profileId);
	$("#profileNameId").val(profilename);
	$("#associatedProfileMsgId").val("");
	$("#subjectId").val("");
	$("#messageId").val("");
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

/* End of sendMessageToContactsFromSearch*/

/*  leavefeedback For Employee from Employee   */
var defaultInputTextColor = "#000000";

function pop_up_feedback(e,pop_up_id,location)
	{
	$("#feedback_details").show();
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


	
function storeEmployeeFeedback(divid)
{
       
       // document.getElementById("spanid").innerText=250;        
	   // var feedbac = document.getElementById("textareaId").value     
	    //var id = document.getElementById("profileid").value    
	   // var profileownerid = document.getElementById("profileownerid").value
	   
	   	$("#feedbackProgress").show();
		$("#selFeedback").hide();
	   
	    $("#spanid").html("250")
	    
	    var feedbac = $("#textareaId").val();
	    var id = $("#profileid").val();
	    var profileownerid = $("#profileownerid").val();
	    
	     $.post("feedbackForEmployeeFromEmployee.action",{'feedbac':feedbac,'profile.id':id,'profileOwner.id':profileownerid},function (data)
            {      
			            if(data.result=="success")
			            {
			              $("#feedback_details").hide();
			              $("#feedbackProgress").hide();	
	                  	  $("#feedbackSuccess").show();
			              var positive = data.positive;			             
			              $("#positiveid").html(positive);
			              
			              var allProfileFeedbacks = data.allProfileFeedbacks;			             
			              $("#allfeedbacksid").html(allProfileFeedbacks);
			            }
			            else
			            {
			            $("#feedback_details").hide();
			            $("#feedbackProgress").hide();
	                	$("#feedbackFailure").show();
			            }                           
       
            },"json");
}	
	
function hiding_pop_up(pop_up_id)
	{
	    $("#feedbackProgress").hide();
		$("#feedbackSuccess").hide();
		$("#feedbackFailure").hide();
		$("#selFeedback").show();
	    document.getElementById("spanid").innerText=250;
	    document.getElementById("textareaId").value="";
	    document.getElementById(pop_up_id).style.display = "none";
	return false;
	}	
/* End of leavefeedbackForEmployee from Employee   */	


/*  adduser as contact from view profile   */
var defaultInputTextColor = "#000000";

function getPrivacyGroups(){
	 var associatedProfileId=$("#associatedProfileId").val();
	 $.post("getPrivacyGroupForContactByProfileId.action",{'profile.id':associatedProfileId},function (data)
				{
					$("#selContactId").remove();
					var htmlText ='<select id="selContactId"><option value="1">Please Select</option> '
		 			    for(var i=0;i<data.names.length;i++)
                        {
				          htmlText += '<option value='+data.names[i]+'>' + data.names[i] + '</option>\n';
	                    }
	                   htmlText += '</select>'
				       $("#contactTypeDiv").html(htmlText);
							                 
			},"json");
}


function createContact(divid){
		$("#progress").show();
		$("#selContact").hide();
		 $("#contactExist").hide();
		var contactType=$("#selContactId").val();
		var contactOwnerId=$("#employeeProfileId").val();
		var associatedProfileId=$("#associatedProfileId").val();
		$.post("contactValidateAction.action",{contactOwnerId : contactOwnerId,associatedProfileId:associatedProfileId},function (data)
         {  
        if(data.result=="success")
	     { 

			$.post("addEmployeeContactFromEmployeeSearch.action",{'contactType':contactType,'contactOwner.id':contactOwnerId,'associatedProfileId':associatedProfileId},function (data)
			{
	                if(data.result=="success")
	                {
	                	$("#contact_details").hide();	
	                  	$("#progress").hide();	
	                  	 $("#contactExist").hide();
	                  	$("#success").show();
	                }
	                else
	                {
	                	$("#contact_details").hide();	
	                	$("#progress").hide();
	                	 $("#contactExist").hide();
	                	$("#failure").show();
	                	
	                }        
			},"json");
	
	  }else{
	     $("#contact_details").hide();
	     $("#progress").hide();
	     $("#success").hide();
	     $("#contactExist").show();
         }
},"json");
			
}

function hide_pop_up(pop_up_id)
	{
	$("#progress").hide();
	$("#success").hide();
	$("#failure").hide();
	$("#selContact").show();
	 $("#contactExist").hide();
	var firstValue = document.getElementById("selContactId").options[0].value;
	document.getElementById("selContactId").value=firstValue
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

function pop_up(e,pop_up_id,location)
	{
	$("#contact_details").show();	
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
/* End of adduser as contact from view profile   */

/*contactInformation */

function contactInfo(name,contcatOwnerID,isEmployer){
	if(isEmployer=="false"){
	 	var htmlText= "<div class='bc_git_tl'>"+
			  "<span id='active_contact-flname'>"+name+"</span></div>"+
			  "<div class='bc_git_bl'><span id='active_contact-viewbrieflink'>"+
			  "<a href='#' id='brief_view' onclick='viewBriefcaseofContactOwner("+contcatOwnerID+")'>View Briefcase</a></span> <span id='active_contact-viewproflink'>"+
			  "<a href='#' id='profile_view' onclick='viewProfileofContactOwner("+contcatOwnerID+")'>View Profile</a></span></div>"
			  $("#bcc_info_tab1").html(htmlText)
			  $("#bcc_info_tab").show();	
		
		}
		
	else{
		var htmlText= "<div class='bc_git_tl'>"+
			  "<span id='active_contact-flname_empr'>"+name+"</span></div>"+
			  "<div class='bc_git_bl'><span id='active_contact-viewbrieflink_empr'>"+
			  "<a href='#' id='brief_view' onclick='viewBriefcaseofContactOwner("+contcatOwnerID+")'>View Briefcase</a></span> <span id='active_contact-viewproflink_empr'>"+
			  "<a href='#' id='profile_view_empr' onclick='viewEmployerProfileofContactOwner("+contcatOwnerID+")'>View Profile</a></span></div>"
			  $("#bcc_info_tab1_employer").html(htmlText)
			  $("#bcc_info_tab").show();
			  

		}
	  
}

function viewBriefcaseofContactOwner(contcatOwnerID){

	document.getElementById("brief_view").href= "viewBriefcaseFromSearch.action?employeeProfileId="+contcatOwnerID;

}

function viewProfileofContactOwner(contcatOwnerID){

	document.getElementById("profile_view").href= "viewEmployeeProfileFromSearchEmployee.action?employeeProfileId="+contcatOwnerID;

}
function viewEmployerProfileofContactOwner(contcatOwnerID){
	
	document.getElementById("profile_view_empr").href= "viewingEmployerProfileFromSearch.action?employerProfile.id="+contcatOwnerID;
	
}
/* End of contactInformation */

/*  Applay For Position From Search */ 

var defaultInputTextColor = "#000000";
var opportunityid;

function applyForPosition_pop_up(e,id,pop_up_id,location)
	{
	$("#profilesDiv").show();
	$("#applyforopportunity").show();	
	$("#interestedEmployeeid").val("");
	opportunityid=id;
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
			if (!isNaN(location[0])) x += mxy[0];
			if (!isNaN(location[1])) y += mxy[1];
			}
		else if (location[2] == "negoffset_mouse")
			{
			var mxy = getMouseXY(e);
			if (!isNaN(location[0])) x = mxy[0] - whe[0] - x;
			if (!isNaN(location[1])) y = mxy[1] - whe[1] - y;			
			}
		p.style.position = rel;
		p.style.left = Math.round(x)+"px";
		p.style.top = Math.round(y)+"px";
		}
	p.style.visibility = "visible";
	return false;
	}
	
 function applyforopportunity(divId)
 {
   var interestedemployeeid=$("#interestedEmployeeid").val();
   if(interestedemployeeid==""){
   $("#selectProfile_apply_job").show();
   }else{
     $("#progress").show();
	 $("#applyforopportunity").hide();
	 $.post("../search/applyForOpportunity.action",{opportunityid:opportunityid,interestedEmployee:interestedemployeeid},function(data)
	 {
	 if(data.result=="success"){
	   		//alert("Your application has been sent successfully");
	   		$("#profilesDiv").hide();	
           	$("#progress").hide();	
           	$("#success").show();
	   		}else{
	   		//alert("failure");
           	$("#profilesDiv").hide();	
           	$("#progress").hide();
           	$("#failure").show();	   		
	   		}
	 },"json");
  }
}	

function applyPosition_hide_pop_up(pop_up_id)
	{
	$("#progress").hide();
	$("#success").hide();
	$("#failure").hide();
	document.getElementById(pop_up_id).style.display = "none";
	return false;
	}
function chkSelectedProfile(){
 var interestedemployeeid=$("#interestedEmployeeid").val();
   if(interestedemployeeid!=""){
   $("#selectProfile_apply_job").hide();
  }
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

function getWidthHeightOfDocument()
	{
	var w = 0;
	var h = 0;
	if (window.clientWidth && window.clientHeight)
		{
		w = window.clientWidth;
		h = window.clientHeight;
		}
	else
		{
		var b = document.getElementsByTagName("body")[0];
		if (b.clientWidth && b.clientHeight)
			{
			w = b.clientWidth;
			h = b.clientHeight;			
			}
		}
	return [w,h];	
	}

function getWidthHeightOfWindow()
	{
	var w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth || 0;
	var h = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight || 0;
	return [w,h];	
	}

function getScrollHeight()
	{
	return window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;
	}

function getCenterOfScreen()
	{
	var scrollHeight = getScrollHeight();
	var wh_window = getWidthHeightOfWindow();
	var x = wh_window[0]/2;
	var y = wh_window[1]/2+scrollHeight;
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
/* End of Applay For Position From Search */ 


/* mark as Favorite From Search  */
var defaultInputTextColor = "#000000";
var opportunityid;

function markasFavorite_pop_up(e,id,pop_up_id,location)
	{
	$("#profilesDivForMarkasFavorite").show();
	$("#markAsFavorite").show();
	$("#bookmarkedEmployeeid").val("");
	opportunityid=id;
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
			if (!isNaN(location[0])) x += mxy[0];
			if (!isNaN(location[1])) y += mxy[1];
			}
		else if (location[2] == "negoffset_mouse")
			{
			var mxy = getMouseXY(e);
			if (!isNaN(location[0])) x = mxy[0] - whe[0] - x;
			if (!isNaN(location[1])) y = mxy[1] - whe[1] - y;			
			}
		p.style.position = rel;
		p.style.left = Math.round(x)+"px";
		p.style.top = Math.round(y)+"px";
		}
	p.style.visibility = "visible";
	return false;
	}
	
 function markasFavorite(divId)
 {
    var bookmarkedEmployeeid=$("#bookmarkedEmployeeid").val();
    if(bookmarkedEmployeeid==""){
	 $("#selectProfile_mark_favorite").show();
     }else{
     $("#favorite_progress").show();
	 $("#markAsFavorite").hide();
	 $.post("../search/bookMarkeOpportunity.action",{opportunityId:opportunityid,bookmarkedEmployeeid:bookmarkedEmployeeid},function(data)
	 {
	 if(data.result=="success"){
	   			//alert("Marked the opportunity as your favorite");
	   		$("#profilesDivForMarkasFavorite").hide();	
           	$("#favorite_progress").hide();	
           	$("#favorite_success").show();
	   		}else{
	   		//alert("failure");
	   		$("#profilesDivForMarkasFavorite").hide();	
           	$("#favorite_progress").hide();
           	$("#favorite_failure").show();	
	   		}
	 },"json");
	}
}	

function markasfavorite_hide_pop_up(pop_up_id)
	{
	$("#favorite_progress").hide();
	$("#favorite_success").hide();
	$("#favorite_failure").hide();
	$("#selectProfile_mark_favorite").hide();
	document.getElementById(pop_up_id).style.display = "none";
	return false;
	}
function chkSelectedList(){
 var bookmarkedEmployeeid=$("#bookmarkedEmployeeid").val();
    if(bookmarkedEmployeeid!=""){
	 $("#selectProfile_mark_favorite").hide();
     }
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

function getWidthHeightOfDocument()
	{
	var w = 0;
	var h = 0;
	if (window.clientWidth && window.clientHeight)
		{
		w = window.clientWidth;
		h = window.clientHeight;
		}
	else
		{
		var b = document.getElementsByTagName("body")[0];
		if (b.clientWidth && b.clientHeight)
			{
			w = b.clientWidth;
			h = b.clientHeight;			
			}
		}
	return [w,h];	
	}

function getWidthHeightOfWindow()
	{
	var w = window.innerWidth || document.documentElement.clientWidth || document.body.clientWidth || 0;
	var h = window.innerHeight || document.documentElement.clientHeight || document.body.clientHeight || 0;
	return [w,h];	
	}

function getScrollHeight()
	{
	return window.pageYOffset || document.documentElement.scrollTop || document.body.scrollTop || 0;
	}

function getCenterOfScreen()
	{
	var scrollHeight = getScrollHeight();
	var wh_window = getWidthHeightOfWindow();
	var x = wh_window[0]/2;
	var y = wh_window[1]/2+scrollHeight;
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

/* End of mark as Favorite From Search  */


/* view Employer Opportunities from search  */
function viewOpportunity(id)
{
document.getElementById("viewOppId"+id).href= "viewOpportunityFromSearch.action?opportunityid="+id;
}
/*End of view Employer Opportunities from search  */

/*set default profile as another profile   */

function getProfilesList(){
	$("#defaultProfileForm").attr("action","loadEmployeeProfilesList.action");
	$("#defaultProfileForm").submit();
}
function deleteOldDefaultProfile(){
	$("#defaultProfileForm").submit();
}
function setAsDefaultProfile(divid){
$("#pleaseSelectId").hide();
		var newDefaultProfileId=$("#newDefaultProfileId").val();
		if(newDefaultProfileId==1){
		$("#pleaseSelectId").show();
		}else{
		$("#progress").show();
		$("#selContact").hide();
			$.post("setAsDefaultProfile.action",{'newDefaultProfile.id':newDefaultProfileId},function (data)
			{
	                if(data.result=="success")
	                {
	                	$("#contact_details").hide();	
	                  	$("#progress").hide();
	                  	$("#changeprofile").hide();	
	                  	$("#success").show();
	                  	$("#pleaseSelectId").show();
	                }
	                else
	                {
	                	$("#contact_details").hide();	
	                	$("#changeprofile").hide();	
	                	$("#progress").hide();
	                	$("#failure").show();
	                	$("#pleaseSelectId").show();
	                }        
			},"json");
		
	}	
}

function hide_pop_up(pop_up_id)
	{
	$("#progress").hide();
	$("#success").hide();
	$("#failure").hide();
	$("#selContact").show();
	$("#changeprofile").hide();	
	$("#pleaseSelectId").hide();
	//var firstValue = document.getElementById("selContactId").options[0].value;
	//document.getElementById("selContactId").value=firstValue
	document.getElementById(pop_up_id).style.display = "none";
	return false;
	}

function chkSelProfile(){
var newDefaultProfileId=$("#newDefaultProfileId").val();
if(newDefaultProfileId!=1){
$("#pleaseSelectId").hide();

}
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
/* End of set default profile as another profile  */

/* send emp replay message to contacts    */

function sendReadMsgReply(){
 var inboxSendId=$("#inboxSendId").val();
 document.getElementById("composeReadMsgs").href= "composeReplyMsg.action?inboxReadId="+inboxSendId;
}


var contactNames="";
var acfb2;
var acfb3;
var acfb;
var  allContactIds=[];
			$(document).ready(function() {
			     $("#build_acfb").hide();
					$("#textId").show();
					 acfb = $("ul.first").autoCompletefb({urlLookup:'contactListAction.action'});
					acfb2 = acfbuild('.city3','contactListAction.action');
					$('.btn2').show();
					
				function acfbuild(cls,url){
					var ix = $("input"+cls);
					 ix.addClass('acfb-input').wrap('<ul class="'+cls.replace(/\./,'')+' acfb-holder"></ul>');
					return $("ul"+cls).autoCompletefb({urlLookup:url});
				}
				
			});
			
			function replyMsgToContacts()
			{
				var inBoxId=$("#inBoxId").val();
				contactNames=acfb.getData();
				if(contactNames==""){
				$("#messageId").show();
				}else{
				 $("#messageId").hide();
				var inboxProfileId=$("#inboxProfileId").val();
				var associatedProfileId=$("#associatedProfileId").val();
                $("#inBoxId1").val(inBoxId);
                $("#profileId").val(inboxProfileId);
                $("#associatedProfileid").val(associatedProfileId);
                $("#composeMessageForm").submit();
	            }
		   }
/* End of send replay message to contacts  */		


/*  search contact for skype  */

var contactNames = new Array();
var contactSkypeIds = new Array();
function searchContacts() {
    var searchValue = $("#searchId").val();
    $.post("getEmployeeContactsForSkype.action", {'name':searchValue}, function (data)
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
                htmlText += "<tr><td> <span onclick=selectContact(" + i + ")><img src='../styles/default/images/mobc_placeholder_thumb.jpg' width='44' height='44' /></span></td>" +
                            "<td class='bc_tbl_shad'><div class='ER_hard_value'><div class='ER_hard_value'>" + name +
                            "</div></div></td><td><img src='http://mystatus.skype.com/smallicon/" + skype + "'/></td></tr>";
            }
        }
        htmlText += "</table></div>";

        $("#bcb_controw-right2").append(htmlText);

    }, "json");

}

function selectContact(index){
    $("#selfrnd").css("display","none");
    $("#selectedfrnd").css("display","");

    $("#selectedname").html(contactNames[index]);
    $("#skypelink").attr("href","skype:" + contactSkypeIds[index] + "?call");
}
/* End of Search contact for skype   */   

