/* Edit opportunity skills  */

$(document).ready(function(){
	$("#addbtn_opportunity").click(addEditedOpportunitySkills);
});

var Edit=0
var count=0
var idForEdit;
var oppSkillsStatus;

function loadEditOpportunitySkils(id){

	var category=$("#category"+id).val();
	var notes=$("#notes"+id).val();
    var skillNedded=$("#skillsNeeded"+id).val();
	var skilllevel =$("#level"+id).val();
	var noOfYears =$("#noOfYears"+id).val();
	
	$("#categoryId").val(category);
	$("#skillfromlist1").val(skillNedded);
	$("#skillfromlist2").val(skilllevel);
	$("#nofYears").val(noOfYears);
	$("#notesId").val(notes);
	
	idForEdit=id
	
	$("#addbtn_opportunity").unbind();
    $("#addbtn_opportunity").click(editOpportunitySkils); 	

}

function loadNewEditOpportunitySkils(id){

	var category=$("#categoryTbNew"+id).val();
    var skillName=$("#skillNameTbNew"+id).val();
    var noOfYears =$("#noOfYearTbNew"+id).val();
	var skilllevel =$("#skillLevelTbNew"+id).val();
	var notes =$("#notesTbNew"+id).val();
	
	$("#categoryId").val(category)
	$("#skillfromlist1").val(skillName)
	$("#nofYears").val(noOfYears)
	$("#skillfromlist2").val(skilllevel)
	$("#notesId").val(notes)
	
	idForEdit=id
	
	$("#addbtn_opportunity").unbind();
    $("#addbtn_opportunity").click(editNewOpportunitySkils); 

}

function editOpportunitySkils(){
	
	oppSkillsStatus=true;
	var category=$("#categoryId").val();
	var notes=$("#notesId").val();
	var skillNedded_from_tb=$("#skillfromlist1").val();
	var skilllevel_from_tb=$("#skillfromlist2").val();
	var noofyears_from_tb=$("#nofYears").val();
	
	validateCategory(category);
    validateSkilName(skillNedded_from_tb);
    validateExp(noofyears_from_tb);
    validateSkilLevel(skilllevel_from_tb);
    validateNotes(notes);	

    if(!oppSkillsStatus)
   		return oppSkillsStatus;
   
    $("#category"+idForEdit).val(category);
	$("#skillsNeeded"+idForEdit).val(skillNedded_from_tb)
	$("#level"+idForEdit).val(skilllevel_from_tb)
	$("#noOfYears"+idForEdit).val(noofyears_from_tb)
	$("#notes"+idForEdit).val(notes);
	
	$("#skillcategorydiv"+idForEdit).html(category)
	$("#skillnamediv"+idForEdit).html(skillNedded_from_tb)
	$("#skillleveldiv"+idForEdit).html(skilllevel_from_tb)
	$("#numyearsdiv"+idForEdit).html(noofyears_from_tb)
	$("#notesdiv"+idForEdit).html(notes)
	
	$("#categoryId").val("");
	$("#skillfromlist1").val(1);
	$("#skillfromlist2").val(1);
	$("#nofYears").val("");
	$("#notesId").val("");
	
	$("#addbtn_opportunity").unbind();
    $("#addbtn_opportunity").click(addEditedOpportunitySkills); 
}

function editNewOpportunitySkils(){
		
	oppSkillsStatus=true;
	var skillNedded_from_tb=$("#skillfromlist1").val()
	var skilllevel_from_tb=$("#skillfromlist2").val()
	var noofyears_from_tb=$("#nofYears").val()
	var category=$("#categoryId").val(category)
	var notes=$("#notesId").val(notes)
	
    validateCategory(category);
    validateSkilName(skillNedded_from_tb);
    validateExp(noofyears_from_tb);
    validateSkilLevel(skilllevel_from_tb);
    validateNotes(notes);	

    if(!oppSkillsStatus)
   		return oppSkillsStatus;
   		
	$("#categoryTbNew"+idForEdit).val(category);
	$("#skillNameTbNew"+idForEdit).val(skillNedded_from_tb);
	$("#skillLevelTbNew"+idForEdit).val(skilllevel_from_tb);
	$("#noOfYearTbNew"+idForEdit).val(noofyears_from_tb);
	$("#notesTbNew"+idForEdit).val(notes);

	$("#categorydivNew"+idForEdit).html(category)
	$("#skillnamedivNew"+idForEdit).html(skillNedded_from_tb)
	$("#numyearsdivNew"+idForEdit).html(noofyears_from_tb)
	$("#skillleveldivNew"+idForEdit).html(skilllevel_from_tb)
	$("#notesdivNew"+idForEdit).html(notes)
	
	$("#categoryId").val("");
	$("#skillfromlist1").val(1);
	$("#skillfromlist2").val(1);
	$("#nofYears").val("");
	$("#notesId").val("");
	
	$("#addbtn_opportunity").unbind();
    $("#addbtn_opportunity").click(addEditedOpportunitySkills); 

}
function addEditedOpportunitySkills(){

	oppSkillsStatus=true;
	var category=$("#categoryId").val()
	var skilName=$("#skillfromlist1").val()
	var skilLevel=$("#skillfromlist2").val()
	var nofYears=$("#nofYears").val()
	var notes=$("#notesId").val()
		
   validateCategory(category);
   validateSkilName(skilName);
   validateExp(nofYears);
   validateSkilLevel(skilLevel);
   validateNotes(notes);	

   if(!oppSkillsStatus)
   		return oppSkillsStatus;
   		
	count=count+6
	var htmlText="<div class='sel_prof_row_skill' id='sel_prof_row"+count+"'><table border='0'><tr><td><table  border='0'><tr>"+
	    "<td class='sel_prof_col spc_category1'id='categorydivNew"+count+"'>" + category + 
		"<td class='sel_prof_col spc_skillname1'id='skillnamedivNew"+count+"'>" + skilName+ "</td>" +
		"<td class='sel_prof_col spc_numyears1'id='numyearsdivNew"+count+"'>" + nofYears + 
    	"<td class='sel_prof_col spc_skilllevel1'id='skillleveldivNew"+count+"'>" + skilLevel + "</td>" +
	    "<td class='sel_prof_col spc_notes1'id='notesdivNew"+count+"'>" + notes + 
    	"</td>" + "</tr></table></td><td><div class='sel_prof_col spc_actions_new'>"+
		"<table  border='0'><tr>"+
		"<td id='image_edit'onclick='loadNewEditOpportunitySkils("+count+")'></td>"+
		"<td id='image_cross'onclick='deleteNewOpportunitySkills("+count+")'></td></tr>"+
		"</table></div></td></tr></table>" +
		"<input type='hidden' id='categoryTbNew"+count+"' name='newCategory' value='" + category + "'/>"+ 
		"<input type='hidden' id='skillNameTbNew"+count+"' name='newSkillsNeeded' value='"+skilName+"'/>"+ 
		"<input type='hidden' id='noOfYearTbNew"+count+"' name='newNoOfYears' value='" + nofYears + "'/>"+
		"<input type='hidden' id='skillLevelTbNew"+count+"' name='newLevel' value='" + skilLevel + "'/>"+
		"<input type='hidden' id='notesTbNew"+count+"' name='newnotes' value='" + notes + "'/>"; 
	
	/*var htmlText="<div class='sel_prof_row' id='sel_prof_row"+count+"'><table border='0'>"+
				 "<tr><td class='sel_prof_col spc_skillname' id='skillnamedivnew"+count+"'>"+skillNedded_from_tb+"</td>"+
		         "<td class='sel_prof_col spc_skilllevel' id='skillleveldivnew"+count+"'>"+skilllevel_from_tb+"</td>"+
		         "<td class='sel_prof_col spc_numyears' id='numyearsdivnew"+count+"'>"+noofyears_from_tb+ "</td>"+
		         "<td><div class='sel_prof_col spc_actions'><table  border='0'><tr>"+
			     "<td id='image_edit'onclick='loadNewEditOpportunitySkils("+count+")'></td>"+
			     "<td id='image_cross' onclick='deleteNewOpportunitySkills("+count+")'></td></tr></table></div></td></tr></table>"+
		         "<input type='hidden' name='newSkillsNeeded' value='"+skillNedded_from_tb+"' id='skillsNeedednew"+count+"'/>"+
		         "<input type='hidden' name='newLevel' value='"+skilllevel_from_tb+"' id='levelnew"+count+"'/>"+
		         "<input type='hidden' name='newNoOfYears' value='"+noofyears_from_tb+"' id='noOfYearsnew"+count+"'/></div>"
		   */           
	$("#opportunity_list").append(htmlText);
		              
	$("#categoryId").val("");
	$("#skillfromlist1").val("1");
	$("#skillfromlist2").val("1");
	$("#nofYears").val("");
	$("#notesId").val("");
}



function deleteNewOpportunitySkills(id){
	
	$("#sel_prof_row"+id).remove();
	$("#skillfromlist1").val(1);
	$("#skillfromlist2").val(1);
	$("#nofYears").val("");
	
}

function deleteOpportunitySkills(id){
	
	/*Added for storing deleted rowid into a textfield */
	var htmlText="<div class='deldiv' id='del"+id+"'>"+
				 "<input type='hidden' name='deloppSkillsrow' id='delrowid"+id+"' value='"+id+"'/></div>";
	$("#deloppodiv").append(htmlText)
	
	/*Added for deleting existing rows from db  */
	$("#oppskillsdiv"+id).remove();
	
	$("#skillfromlist1").val(1);
	$("#skillfromlist2").val(1);
	$("#nofYears").val("");

}
/* End of edit oppprtunity Skills  */
