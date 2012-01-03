/*  opportunity    */
var dtCh= "/";
var opportunityStatus;


function WorkHours()
{
  			//var text=$("#workhoursId").val()
  			var text = $("#workhoursId").val();
  			
			if(text=="Other")
			{
			   $("#workhours_textbox").show();
			}
			else
			{  
			   $("#workhours_textbox").hide();
			} 
}
function oppDateValidation()
{
	opportunityStatus=true;
	var startDate = $("#startDate").val();
	 
	validateJobName();
	validatePosition();
	validateEducationText();
	validateBenefitsId();
	validateDescription();
	if(startDate!=""){
	    if(isDate(startDate)==false)
			opportunityStatus=false;
	}else
		$("#startDateWarnId").html("");  
	 
	return opportunityStatus; 
}

function validateJobName(){
	var jodNameId=$("#jodNameId").val();   
	if(jodNameId==""){	
		opportunityStatus=false;
	    $("#oppId").html("Please enter job name");
	}else if(jodNameId.length>45){	
		opportunityStatus=false;
	    $("#oppId").html("Should have less than 45 characters");
	}else{
	 	$("#oppId").html("");
	}
}
function validatePosition(){
 
  var positionTextId=$("#PositionTextId").val();
  
  if(positionTextId==""){	
		opportunityStatus=false;
	    $("#PositionId").html("Please enter position title");
  }else if(positionTextId.length>45){
	   opportunityStatus=false;
	   $("#PositionId").html("Should have less than 45 characters");
  }else{
       $("#PositionId").html("");
  }
  
}
function validateEducationText(){
 
  var educationText=$("#educationText").val();
  if(educationText!="" && educationText.length>45){
  	opportunityStatus=false;
  	$("#requirementsId").html("Should have less than 45 characters");
  }else{
    $("#requirementsId").html("");
  }
}

function validateBenefitsId(){
 
  var benefitsText=$("#benefitsText").val();
  if(benefitsText.length>1000){
   opportunityStatus=false;
   $("#benefitsId").html("Should have less than 1000 characters");
  }else{
    $("#benefitsId").html("");
  }
  
}
function validateDescription(){

	var descriptionId=$("#descId").val();
	if(descriptionId==""){
		opportunityStatus=false;
       $("#oppId1").html("Please enter description");
    }else if(descriptionId.length>45){
		opportunityStatus=false;
	    $("#oppId1").html("Should have less than 45 characters");
	}else{
      $("#oppId1").html("");
    }
}

/* Added for validating skills in Add and Edit opportunity pages*/
function validateCategory(category){
	
	if(category==""){
		oppSkillsStatus=false;
		$("#categoryWarn").html("Please enter category");
	}else if(category!="" && category.length>=45){
		oppSkillsStatus=false;
		$("#categoryWarn").html("Should have less than 45 characters");
	}else{
		$("#categoryWarn").html("");
	}
}

function validateSkilName(skilName){
	if(skilName==1){
		oppSkillsStatus=false;
		$("#skillsWarn").html("Please select skill name");
	}else{
		$("#skillsWarn").html("");
	}
}

function validateExp(nofYears){
	
	if(nofYears==""){
		oppSkillsStatus=false;
		$("#expWarn").html("Please enter years of experience");
	}else if(isNaN(nofYears)){
		oppSkillsStatus=false;
		$("#expWarn").html("Please enter numeric values");
	}else if(nofYears.length>4){
		oppSkillsStatus=false;
		$("#expWarn").html("Please enter valid number");
	}else{
		$("#expWarn").html("");
	}
}

function validateSkilLevel(skilLevel){
	if(skilLevel==1){
		oppSkillsStatus=false;
		$("#skilLevelWarn").html("Please select skill level");
	}else{
		$("#skilLevelWarn").html("");
	}
}

function validateNotes(notes){

	if(notes!="" && notes.length>=100){
		oppSkillsStatus=false;
		$("#notesWarn").html("Should have less than 100 characters");
	}else{
		$("#notesWarn").html("");
	}
}
/* End of validating skills in Add and Edit opportunity pages*/

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
		$("#startDateWarnId").html("The date format should be : mm/dd/yyyy for StartDate field");
        return false
	}
	if (strMonth.length<1 || month<1 || month>12){
		$("#startDateWarnId").html("Please enter a valid month for StartDate field")
		return false
	}
	if (strDay.length<1 || day<1 || day>31 || (month==2 && day>daysInFebruary(year)) || day > daysInMonth[month]){
		$("#startDateWarnId").html("Please enter a valid day for StartDate field")
		return false
	}
	if (strYear.length != 4 || year==0){
		$("#startDateWarnId").html("Please enter a valid 4 digit year for StartDate field")
		return false
	}
	if (dtStr.indexOf(dtCh,pos2+1)!=-1 || isInteger(stripCharsInBag(dtStr, dtCh))==false){
		$("#startDateWarnId").html("Please enter a valid date for StartDate field")
		return false
	}
	$("#startDateWarnId").html("");
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



var contactNames = "";
var acfb2;
$(document).ready(function() {
    $("#build_acfb").hide();
    $("#textId").show();
    acfb2 = acfbuild('.city3', 'employerOpportunityskills.action');
	//$("#contactnameId").html(acfb2.getData());
    function acfbuild(cls, url) {
        var ix = $("input" + cls);
        ix.addClass('acfb-input').wrap('<ul class="' + cls.replace(/\./, '') + ' acfb-holder1"></ul>');
        return $("ul" + cls).autoCompletefb({urlLookup:url});
    }

    
});

function sendEmprMsgToContacts()
{
 contactNames = acfb2.getData();
 var profileListId=$("#profileListId").val();
 if(profileListId==""){
	    $("#fromAddressId").show();
	    $("#fromAddressId").html("Plase select from address")
    }else if (contactNames == "") {
         $("#messageId").show(); 
    } else {
    
         $("#messageId").hide();
         $("#fromAddressId").hide();
         $("#composeMessageForm").submit();
    }
}

