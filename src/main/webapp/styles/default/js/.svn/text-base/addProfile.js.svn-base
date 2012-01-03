/* start of addProfile validations*/
function addProfile()
{
    $("#picId").html("")
	var profilename=$("#profilename").val();
	var file = $("#uploadpic").val();
	
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
	}else if(file!="")
	{
	  
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
	else
	{
	   $("#profileNameId").hide();
	    $("#profileNameId1").hide();
	   return true;
	}
	 
  
  
	
 }
function checkSalaryType(salarytype1)
{

	
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

function trimFieldVal(fieldVal)
{
	var a = fieldVal.replace(/^\s+/, '');
	return a.replace(/\s+$/, '')
}

/* End of addProfile validations*/
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
		$("#validateWorkExp").html('<h5>Please enter a company name</h5>');
		return;	
	}
	 if(companyName.length>45)
	{   
		//alert('Please enter Company name');
		$("#validateWorkExp").html('<h5>Company name should have less than 45 characters</h5>');
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
	     var htmlText = 
	     "<div class='workExperienceRowDan' id='divTable"+count+"'>" +
	     "<div class='workexperiencecol' id='cmpCountdiv"+count+"'>" + companyName + "</b></div>" +
		 "<div class='workexperiencecol' id='descCountdiv"+count+"'>" + description + "</b></div>" +	     
		 "<div class='workexperiencecol' id='wsCountdiv"+count+"'>" + workStart   + "</b></div>" +
		 "<div class='workexperiencecol' id='exp_entry1_date1"+count+"'>" + workEnd     + "</b></div>" +
		 "<img class='workExperienceIcon' src='../styles/default/images/exp_entry-remove.gif' onclick='deleteExperience("+count+")'>" + 
		 
		 //These details are used for storing the data into database.
		 "<input type='hidden' id='cmpCount_tb"+count+"' name='employerName' value='"+companyName+"'/>"+ 
		 "<input type='hidden' id='descCount_tb"+count+"' name='description' value='" + description + "'/>"+
		 "<input type='hidden' id='wsCount_tb"+count+"' name='workStart' value='" + workStart + "'/>"+
		 "<input type='hidden' id='weCount_tb"+count+"' name='workEnd' value='" + workEnd + "'/></div>";
		 
		 //Appending the new row along with the old data		 
		 $("#currentWorkExp").append(htmlText);
		
		
	}
	else{	
	/* Editing for display purpose in table */ 
	  $("#cmpCountdiv"+Edit).html(companyName);
	  $("#descCountdiv"+Edit).html(description);
	  $("#wsCountdiv"+Edit).html(workStart);
	    $("#exp_entry1_date1"+Edit).html(workEnd);
	  
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
/* End of validation when user enters date manually */


function setPercAnsweredTo(percentage)
{
	
	var pA = document.getElementById("percAnswered");														
	var total = pA.offsetWidth;							
	var newWidth = Math.floor((percentage/100)*total);							
	pA.getElementsByTagName("div")[0].style.width = newWidth+"px";							
	document.getElementById("percExpl").innerHTML = percentage+"% of questions answered.";
	
}
function test(){
alert("Test")
}