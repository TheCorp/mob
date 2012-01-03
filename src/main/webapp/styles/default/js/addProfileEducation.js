/* validations for addprofileEducation */
var count =0;
var Edit =0; 
var Delete =0;
var dtCh= "/";

function addEducationDetails1(){
  
   $("#validateEducationId").html("");
    var schoolName = $("#schoolName_txtbox").val();
	var degree = $("#degree_txtbox").val();
	var major = $("#major_txtbox").val();
	var minor = $("#minor_txtbox").val();
	var gpa =$("#gpa_txtbox").val();
	//var educationStart = $("#educationStart_txtbox").val();
	//var educationEnd = $("#educationEnd_txtbox").val();	
	var concentration =$("#concentration_txtbox").val();

	var honors = $("#honors_txtbox").val();
	var selectedValue =$("#sel").val()
	
	if(schoolName=="")
	{
		//alert('Please enter schoolName');
		$("#validateEducationId").html("Please enter schoolname");
		return;	
	}
	if(schoolName.length>45)
	{
	  $("#validateEducationId").html("Schoolname should have less than 45 characters");
		return;	
	}		
	if(degree=="")
	{
		//alert('Please enter Degree');
		$("#validateEducationId").html("Please enter degree");
		return;	
	}
	if(major=="")
	{
		//alert('Please enter Degree');
		$("#validateEducationId").html("Please enter major");
		return;	
	}
	
	if(degree.length>45)
	{
	  $("#validateEducationId").html("Degree should have less than 45 characters");
		return;	
	}
	if(educationStart=="")
	{	
		//alert('Please enter educationStart date');
		$("#validateEducationId").html("Please enter From date");
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
		$("#validateEducationId").html("Please enter To date");
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
	$("#validateEducationId").html("To date should be greater than From date");
	return false
	}
	
	
	if(concentration=="")
	{
		//alert('Please enter concentration');
		$("#validateEducationId").html("Please enter concentration");
		return;	
	}
	if(concentration.length>35)
	{
		//alert('Please enter concentration');
		$("#validateEducationId").html("Concentration should have less than 35 characters");
		return;	
	}
		
	if(selectedValue=="1")
	{
		//alert('Please select concentration level');
		$("#validateEducationId").html("Please select concentration level");
		return;	
	}
	if(gpa.length>45)
	{
	  $("#validateEducationId").html("Gpa should have less than 45 characters");
		return;	
	}
	if(honors.length>45)
	{
	    $("#validateEducationId").html("Honors should have less than 45 characters");
		return;	
	}	
	//to check wheter to add or to edit if edit=0 then add else Edit	    
    if(Edit == 0)
    {       
	     count = count+100;
	     //Html text genertation for displaying of the data dynamically on click of add.	
		 var htmlText= "<div class='signupEducationRow' id='divTable"+count+"'>"+
		 "<td class='sel_prof_row_addprofile spc_school' id='schoolNameCount"+count+"'>" + schoolName + "</td>" +
		 "<td class='sel_prof_row_addprofile spc_degree' id='degreeCount"+count+"'>" + degree + "</td>" +
		 "<td class='sel_prof_row_addprofile spc_dateattended' id='educationCount"+count+"'>" + educationStart + "-" + educationEnd +
		 "</td>" + "<td class='sel_prof_row_addprofile spc_degreename' id='concentrationCount"+count+"'>" + concentration +" (" +selectedValue+")"+ "</td>" +
		 "<td class='sel_prof_row_addprofile spc_gpa' id='gpaCount"+count+"'>" + gpa + "</td>" +
		 "<td class='sel_prof_row_addprofile spc_honors' id='honorsCount"+count+"'>" + honors + "</td>" +
		  "</tr></table></td><td><div class='sel_prof_col_new  spc_actions'>"+
		 "<table  border='0'><tr>"+
		 "<td id='image_edit'onclick='editEducationDetails("+count+")'></td><td id='image_cross' onclick=deleteEducationDetails1('"+count+"') ></td></tr>"+
		 "</table></div></td></tr></table>" +
		 //These details are used for storing the data into database.
		 "<input type='hidden' id='schoolNameCount1"+count+"' name='schoolName' value='"+schoolName+"'/>"+ 
		 "<input type='hidden' id='degreeCount1"+count+"' name='degree' value='" + degree + "'/>"+
		 "<input type='hidden' id='educationCount1"+count+"' name='educationStart' value='" + educationStart + "'/>"+
		 "<input type='hidden' id='educationCount2"+count+"' name='educationEnd' value='" + educationEnd + "'/>"+
		 "<input type='hidden' id='concentrationCount1"+count+"' name='concentration' value='" + concentration +" (" + selectedValue+")"+ "'/>"+
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
	  
	 $("#concentrationCount"+ Edit).html(concentration +" (" + selectedValue+")")  
	  
	 $("#gpaCount"+ Edit).html(gpa) 
	  
	 $("#honorsCount"+ Edit).html(honors) 
	  	   
	  /* Editing values for hidden feilds for stroing into database*/
	  
	  $("#schoolNameCount1"+ Edit).val(schoolName)
	  	 
	  $("#degreeCount1"+ Edit).val(degree)
	  	 
	  $("#educationCount1"+ Edit).val(educationStart)
	  
	  $("#educationCount2"+ Edit).val(educationEnd)
	  
	  $("#concentrationCount1"+ Edit).val(concentration+" (" + selectedValue+")")
	  
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
		$("#validateEducationId").html("The date format should be : mm/dd/yyyy");
        return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		//alert("Please enter a valid month")
		$("#validateEducationId").html("Please enter a valid month");
        
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		//alert("Please enter a valid day")
		$("#validateEducationId").html("Please enter a valid day");
        
		return false
	}
	if (strYear.length != 4 || year==0){
		//alert("Please enter a valid 4 digit year")
        $("#validateEducationId").html("Please enter a valid 4 digit year");
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
	//	alert("Please enter a valid date")
        $("#validateEducationId").html("Please enter a valid date");
        
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

/* start of addTrainingDetails.js*/
var count = 0;
var Delete = 0;


function addTrainingDetails1() {
    $("#traingId").hide();
    var trainingName = $("#training_textbox").val();
    alert(trainingName);
     
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


function setPercAnsweredTo(percentage)
{
	
	var pA = document.getElementById("percAnswered");														
	var total = pA.offsetWidth;							
	var newWidth = Math.floor((percentage/100)*total);							
	pA.getElementsByTagName("div")[0].style.width = newWidth+"px";							
	document.getElementById("percExpl").innerHTML = percentage+"% of questions answered.";
	
}

function addEducationDetails2(){
  
  
   $("#validateEducationId").html("");
    var schoolName = $("#schoolName_txtbox").val();
	var degree = $("#degree_txtbox").val();
	var major = $("#major_txtbox").val();
	var minor = $("#minor_txtbox").val();
	var gpa =$("#gpa_txtbox").val();
	var year =$("#year_txtbox").val();
	
	//var educationStart = $("#educationStart_txtbox").val();
	//var educationEnd = $("#educationEnd_txtbox").val();	
	//var concentration =$("#concentration_txtbox").val();

	//var honors = $("#honors_txtbox").val();
	//var selectedValue =$("#minor_txtbox").val()
	
	if(schoolName=="")
	{
		//alert('Please enter schoolName');
		$("#validateEducationId").html("Please enter schoolname");
		return;	
	}
	if(schoolName.length>45)
	{
	  $("#validateEducationId").html("Schoolname should have less than 45 characters");
		return;	
	}		
	if(degree=="")
	{
		$("#validateEducationId").html("Please enter degree");
		return;	
	}
	if(major=="")
	{
		$("#validateEducationId").html("Please enter major");
		return;	
	}
	
	if(degree.length>45)
	{
	  $("#validateEducationId").html("Degree should have less than 45 characters");
		return;	
	}
	
	
	
	
	
	if(gpa.length>45)
	{
	  $("#validateEducationId").html("Gpa should have less than 45 characters");
		return;	
	}
	
//	if(honors.length>45)
//	{
//	    $("#validateEducationId").html("Honors should have less than 45 characters");
	//	return;	
//	}	
	//to check wheter to add or to edit if edit=0 then add else Edit
	if(Edit == 0)
    {       
	     count = count+100;
	    //Html text genertation for displaying of the data dynamically on click of add.
	    var htmlText = 	"<div class='signupEducationRow' id='divTable" + count + "'>" +
	    					"<div class='collegeName' id='schoolNameCount" + count + "'>" + schoolName + "</div>" +
	    					"<div class='degreeType' id='degreeCount"+count+"'>" + degree + "</div>" + 
	    					"<div class='classYear' id='educationCount"+count+"'>" + year + "</div>" + 
	    					"<div class='major' id='concentrationCount"+count+"'>" + major + "</div>" + 
	    					"<div class='minor' id='minor"+count+"'>" + minor + "&nbsp;</div>" + 
	    					"<div class='GPA' id='gpaCount1"+count+"'>" + gpa + "</div>" +  
	    			   		"<div class='buttons'>" +
	    			   			//"<img class='workExperienceIcon' src='../styles/default/images/exp_entry-edit.gif'>" +
								"<img class='workExperienceIcon' src='../styles/default/images/exp_entry-remove.gif' onclick=deleteEducationDetails1('"+count+"')>" +
							"</div>"+
							 //These details are used for storing the data into database.
			 				"<input type='hidden' id='schoolNameCount1"+count+"' name='schoolName' value='"+schoolName+"'/>"+ 
			 				"<input type='hidden' id='degreeCount1"+count+"' name='degree' value='" + degree + "'/>"+
			 				"<input type='hidden' id='educationCount1"+count+"' name='year' value='" + year + "'/>"+
			  				"<input type='hidden' id='concentrationCount1"+count+"' name='major' value='" + major + "'/>"+
			   				"<input type='hidden' id='minor"+count+"' name='minor' value='" + minor + "'/>"+
							"<input type='hidden' id='gpaCount1"+count+"' name='gpa' value='" + gpa + "'/>"+
						"</div>";
		
		
		 //Appending the new row along with the old data		 
		
		 $("#your_education").append(htmlText)
		 
		 Edit=0;
	}
	else{	
	
	
	/* Editing for display purpose in table*/ 
	 $("#schoolNameCount"+ Edit).html(schoolName)
	  
	 $("#degreeCount"+ Edit).html(degree)
	  
     $("#educationCount"+ Edit).html(year)	  	 
	  
	 $("#concentrationCount"+ Edit).html(major +" (" + +")")
	   
	 $("#minor"+ Edit).html(minor)
	  
	 $("#gpaCount"+ Edit).html(gpa) 
	  
	// $("#honorsCount"+ Edit).html(honors) 
	  	   
	  /* Editing values for hidden feilds for stroing into database*/
	  
	  $("#schoolNameCount1"+ Edit).val(schoolName)
	  	 
	  $("#degreeCount1"+ Edit).val(degree)
	  	 
	  $("#educationCount1"+ Edit).val(year)
	  
	    $("#concentrationCount1"+ Edit).val(major)
	    
	      $("#minor"+ Edit).val(minor)
	  
	  //$("#educationCount2"+ Edit).val(educationEnd)
	  
	//  $("#concentrationCount1"+ Edit).val(major+" (" + selectedValue+")")
	  
	  $("#gpaCount1"+ Edit).val(gpa)
	 
	  
	 // $("#honorsCount1"+ Edit).val(honors)
	  
	 // $("#concenLevelCount1"+ Edit).val(selectedValue)
	   
	  Edit = 0	 
	}
      $("#schoolName_txtbox").val("");
      $("#degree_txtbox").val("");
      $("#year_txtbox").val("");
      $("#major_txtbox").val("");
      $("#minor_txtbox").val("");
      
     //$("#educationEnd_txtbox").val("");
     // $("#concentration_txtbox").val("");
      $("#gpa_txtbox").val("");
    //  $("#honors_txtbox").val("");
     // $("#sel").val("1");
      
}


								

