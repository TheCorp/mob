$(document).ready(function()
{
    setPercAnsweredTo(53);
	$("#add_btn_education").click(addEducationDetails);
	
});



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
    $("#concentrationdiv"+idForEdit).html(concentration+" ("  +selectedValue+")")
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
    $("#concentrationnew"+idForEdit).val(concentration+" (" +selectedValue+")")
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

function addEducationDetails_old()
{
        alert("HIIIIIIIII");
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
	
	$("#deleducationdiv").append(htmlText)
	
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
function deleteTraining(id)
{
		
			var htmlText="<div class='deltrainingdiv' id='del"+id+"'><input type='hidden' name='deltrainingrow' id='delrowid"+id+"' value='"+id+"' /></div>";
			$("#deltrainingdiv").append(htmlText) 
		
		    $("#trainingdivdiv"+id).remove();
		  
			$("#training_textbox").val("")
		     
}

 function deleteNewTraining(id){

     $("#trainingdivdiv"+id).remove();
		  
 	 $("#training_textbox").val("");
     
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
function setPercAnsweredTo(percentage)
{
	
	var pA = document.getElementById("percAnswered");														
	var total = pA.offsetWidth;							
	var newWidth = Math.floor((percentage/100)*total);							
	pA.getElementsByTagName("div")[0].style.width = newWidth+"px";							
	document.getElementById("percExpl").innerHTML = percentage+"% of questions answered.";
	
}
function addEducationDetails()
{
       
        $("#validateEducationId").html("");
         var schoolName =$("#schoolName_txtbox").val()
 		 var degree =$("#degree_txtbox").val()
 		 var year =$("#year_txtbox").val()
      	 var major =$("#major_txtbox").val()
      	 var minor =$("#minor_txtbox").val()
         var gpa =$("#gpa_txtbox").val()

	
   
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
     if(year==""){
	     $("#validateEducationId").html("<h5>Please enter From date</h5>");
	     return;
     }
     
    
     
     if(major==""){
	       $("#validateEducationId").html("<h5>Please enter major</h5>");
	     return;
     }
     
     if(gpa.length>45){
	      $("#validateEducationId").html("<h5>Gpa should have less than 45 characters</h5>");
	     return;
     }
     
	     count = count+1;
	    //Html text genertation for displaying of the data dynamically on click of add.
	    var htmlText = 	"<div class='signupEducationRow' id='educationdivnew" + count + "'>" +
	    					"<div class='collegeName' id='schoolNamedivnew" + count + "'>" + schoolName + "</div>" +
	    					"<div class='degreeType' id='degreedivnew"+count+"'>" + degree + "</div>" + 
	    					"<div class='classYear' id='courseStartdivnew"+count+"'>" + year + "</div>" + 
	    					"<div class='major' id='major"+count+"'>" + major + "</div>" + 
	    					"<div class='minor' id='minor"+count+"'>" + minor + "&nbsp;</div>" + 
	    					"<div class='GPA' id='gpadivnew"+count+"'>" + gpa + "&nbsp;</div>" +  
	    			   		"<div class='buttons'>" +
	    			   			//"<img class='workExperienceIcon' src='../styles/default/images/exp_entry-edit.gif'>" +
								"<img class='workExperienceIcon' src='../styles/default/images/exp_entry-remove.gif' onclick=deleteNewEducationDetails('"+count+"')>" +
							"</div>"+
							 //These details are used for storing the data into database.
			 				"<input type='hidden' id='schoolNamenew"+count+"' name='newSchoolName' value='"+schoolName+"'/>"+ 
			 				"<input type='hidden' id='degreenew"+count+"' name='newDegree' value='" + degree + "'/>"+
			 				"<input type='hidden' id='courseStartnew"+count+"' name='year' value='" + year + "'/>"+
			  				"<input type='hidden' id='majorNew"+count+"' name='major' value='" + major + "'/>"+
			   				"<input type='hidden' id='minornew"+count+"' name='minor' value='" + minor + "'/>"+
							"<input type='hidden' id='gpanew"+count+"' name='newGpa' value='" + gpa + "'/>"+
						"</div>";
		
		
		 //Appending the new row along with the old data		 
		
		 $("#your_education").append(htmlText)
		 $("#schoolName_txtbox").val("")
	     $("#degree_txtbox").val("")
	     $("#year_txtbox").val("")
	     $("#major_txtbox").val("")
	     $("#minor_txtbox").val("")
	     $("#gpa_txtbox").val("")       
	  
 }
