var count=0;

function addSkillsCriteria(){
	count=count+1;
	var skillName=$("#skillsid").val();
	
	 var htmlText="<div class='skill_entry' id='skillTable'><table border='0'><tr>"+
			 "<td class='where' id='skillCount'>" + skillName+ "</td></tr></table>"+
			 "<input type='hidden' id='skillid1"+count+"' name='skillName' value='"+skillName+"'/></div>";
				 
	 $("#skillsdiv").append(htmlText)
		 
	 $("#skillsid").val("");
 }
 
 function addSkills()
 {
    var skill = $("#skillsid").val();
    var blankSkill = $("#skills_to_add_list").html();
  
  if(blankSkill==""){
   document.getElementById("skills_to_add_list").innerHTML+= ''+skill;
   
  }
  else{
  document.getElementById('skills_to_add_list').innerHTML+=','+skill;
  }
  
  var skillNames=$("#skills_to_add_list").html();
  $("#searchList").val(skillNames);
 $("#skillsid").val("");
}
  
 function addAdditionalSkills()
 {
    var skill = $("#additionalSkillsId").val();
    
    var blankSkill = $("#additionalSkills_to_add_list").html();
  
  if(blankSkill==""){
   document.getElementById("additionalSkills_to_add_list").innerHTML+= ''+skill;
   
  }
  else{
  document.getElementById('additionalSkills_to_add_list').innerHTML+=','+skill;
  }
  
  var skillNames=$("#additionalSkills_to_add_list").html();
 
  $("#searchSkillsList").val(skillNames);
 $("#additionalSkillsId").val("");
} 
 