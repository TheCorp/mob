/*  opportunity skills   */

var count =0;
var Edit =0; 
var Delete =0;

var oppSkillsStatus;
function addOpportunitySkills(){

	oppSkillsStatus=true;
	
    var skilName = $("#skillfromlist1").val();
	var skilLevel= $("#skillfromlist2").val();
	var nofYears = $("#nofYears").val();	
    var category = $("#categoryId").val();	
	var notes = $("#notesId").val();	

    if(Edit == 0)
    {
	   validateCategory(category);
	   validateSkilName(skilName);
	   validateExp(nofYears);
	   validateSkilLevel(skilLevel);
	   validateNotes(notes);	

	   if(!oppSkillsStatus)
	   		return oppSkillsStatus;
	   		
		count=count+1
	 	var htmlText="<div class='sel_prof_row_skill' id='divTable"+count+"'><table border='0'><tr><td><table  border='0'><tr>"+
	    "<td class='sel_prof_col spc_category1'id='categoryDisp"+count+"'>" + category + 
		"<td class='sel_prof_col spc_skillname1'id='skillNameDisp"+count+"'>" + skilName+ "</td>" +
		"<td class='sel_prof_col spc_numyears1'id='noOfYearDisp"+count+"'>" + nofYears + 
    	"<td class='sel_prof_col spc_skilllevel1'id='skillLevelDisp"+count+"'>" + skilLevel + "</td>" +
	    "<td class='sel_prof_col spc_notes1'id='notesDisp"+count+"'>" + notes + 
    	"</td>" + "</tr></table></td><td><div class='sel_prof_col spc_actions_new'>"+
		"<table  border='0'><tr>"+
		"<td id='image_edit'onclick='editOpportunitySkills("+count+")'></td>"+
		"<td id='image_cross'onclick='deleteOpportunitySkills("+count+")'></td></tr>"+
		"</table></div></td></tr></table>" +
		"<input type='hidden' id='categoryTb"+count+"' name='skillscategory' value='" + category + "'/>"+ 
		"<input type='hidden' id='skillNameTb"+count+"' name='skillName' value='"+skilName+"'/>"+ 
		"<input type='hidden' id='noOfYearTb"+count+"' name='nofYears' value='" + nofYears + "'/>"+
		"<input type='hidden' id='skillLevelTb"+count+"' name='skillLevel' value='" + skilLevel + "'/>"+
		"<input type='hidden' id='notesTb"+count+"' name='notes' value='" + notes + "'/>"; 
		  
	 	$("#opportunity_list").append(htmlText)
	 
    }
    else{

	  /* Editing for display purpose in table */ 
	  $("#categoryDisp"+Edit).html(category);
	  $("#skillNameDisp"+Edit).html(skilName);
	  $("#skillLevelDisp"+Edit).html(skilLevel);
	  $("#noOfYearDisp"+Edit).html(nofYears);
	  $("#notesDisp"+Edit).html(notes);
	    	   
	  /* Editing values for hidden feilds for stroing into database */
	  $("#skillNameTb"+Edit).val(skilName);
	  $("#skillLevelTb"+Edit).val(skilLevel);
	  $("#noOfYearTb"+Edit).val(nofYears);
	  $("#categoryTb"+Edit).val(category);
	  $("#notesTb"+Edit).val(notes);
	  
	  Edit = 0	 
	}
	
    $("#skillfromlist1").val("1");
    $("#skillfromlist2").val("1");
	$("#nofYears").val("");
	$("#categoryId").val("");
	$("#notesId").val("");
}

function editOpportunitySkills(count){

 	Edit = count;
	var skillName =$("#skillNameTb"+count).val();
    var skillLevel =$("#skillLevelTb"+count).val();
	var noOfYear =$("#noOfYearTb"+count).val();
	var categoryId =$("#categoryTb"+count).val();
	var notesId =$("#notesTb"+count).val();

	 //Restoring the fetched data into text boxes
     $("#skillfromlist1").val(skillName);
     $("#skillfromlist2").val(skillLevel);
     $("#categoryId").val(categoryId);
     $("#nofYears").val(noOfYear);
     $("#notesId").val(notesId);
}

function deleteOpportunitySkills(delID){
   
    $("#divTable"+delID).remove();
    
	//if your deleting the same row which is about to get edited. 
	if(delID == Edit){ 
 		Edit = 0;
 		$("#skillfromlist1").val("1");
     	$("#skillfromlist2").val("1");
     	$("#nofYears").val("");
     	$("#categoryId").val("");
     	$("#notesId").val("");
 	}
}
/* End opportunity skills */