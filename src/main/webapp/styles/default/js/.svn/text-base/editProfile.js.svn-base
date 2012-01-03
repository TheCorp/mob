/*  start of editProfile.js  */

function editProfile(){

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

$(document).ready(function() {

    //setPercAnsweredTo(33);
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
function trimFieldVal(fieldVal)
{
	var a = fieldVal.replace(/^\s+/, '');
	return a.replace(/\s+$/, '')
}
/*  End of editProfile.js  */

/* Start of Edit WorkExperience.js*/
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
   
  
		count=count+1;
	/* Adding new row to the workexperience table */
	var htmlText= "<div class='workExperienceRowDan' id='expdivnew"+count+"'>" +
					"<div class='workexperiencecol' id='employerdivnew"+count+"'>" + ename + "</b></div>" +
					"<div class='workexperiencecol' id='descriptiondivnew"+count+"'>" + desc + "</b></div>" +	     
					"<div class='workexperiencecol' id='workstartdivnew"+count+"'>" + ws   + "</b></div>" +
					"<div class='workexperiencecol' id='workstartdivnew"+count+"'>" + we     + "</b></div>" +
					//"<img class='workExperienceIcon' src='../styles/default/images/exp_entry-edit.gif' onclick='editNewExperience("+count+")'>" + 
					"<img class='workExperienceIcon' src='../styles/default/images/exp_entry-remove.gif' onclick='deleteNewWorkExperience("+count+")'>" + 
	
	/*"<div class='exp_entry' id='expdivnew"+count+"'><table border='0'>"+
				  "<tr><td class='where' id='employerdivnew"+count+"'>"+ename+"</td>"+
	              "<td class='what' id='descriptiondivnew"+count+"'>"+desc+"</td>"+
	              "<td class='when' id='workstartdivnew"+count+"'>"+ws+"</td>"+
	                "<td class='when1' id='workstartdivnew"+count+"'>"+ws;
	              htmlText+="</td>"+
	              "<td><div class='actions_editJob'><table  border='0'><tr>"+
		          "<td id='image_edit'onclick='loadForEditNewWorkExperience("+count+")'></td>"+
		          "<td id='image_cross' onclick='deleteNewWorkExperience("+count+")'></td></tr></table></div></td></tr></table>"*/
		          
	              "<input type='hidden' name='newEmployerName' value='"+ename+"' id='employernew"+count+"'/>"+
	              "<input type='hidden' name='newDescription' value='"+desc+"' id='descriptionnew"+count+"'/>"+
	              "<input type='hidden' name='newWorkStart' value='"+ws+"' id='workstartnew"+count+"'/>"+
	              "<input type='hidden' name='newWorkEnd' value='"+we+"' id='workendnew"+count+"'/></div>";
	
	
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
	//$("#workExperienceRowDan"+id).remove();
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

function setPercAnsweredTo(percentage)
{
	
	//var pA = document.getElementById("percAnswered");	
	var pA =  $("#percAnswered");													
	var total = pA.offsetWidth;							
	var newWidth = Math.floor((percentage/100)*total);							
	pA.getElementsByTagName("div")[0].style.width = newWidth+"px";							
	//document.getElementById("percExpl").innerHTML = percentage+"% of questions answered.";
	
}