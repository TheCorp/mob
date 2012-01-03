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

function setPercAnsweredTo(percentage)
{
	
	var pA = document.getElementById("percAnswered");														
	var total = pA.offsetWidth;							
	var newWidth = Math.floor((percentage/100)*total);							
	pA.getElementsByTagName("div")[0].style.width = newWidth+"px";							
	document.getElementById("percExpl").innerHTML = percentage+"% of questions answered.";
	
}
								

