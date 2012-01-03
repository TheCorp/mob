function getPersonalPrivacyGroups()
{
  
   $("#successId").hide();
   $("#list").hide();
   $("#editlist").show();
   $("#submit_btn_id").show();   
   $("#editImage").hide();
   
}
function getDesiredPrivacyGroups()
{
  $("#successId").hide();
  $("#desiredWorkList").hide();
  $("#desiredWorkEditList").show();
  $("#submit_btn_id").show();
  $("#desiredWorkEditImage").hide();
    
}

function getWorkExperiencePrivacyGroups()
{
   $("#successId").hide();
   $("#workExperienceList").hide();
   $("#workExperienceEditList").show();
   $("#submit_btn_id").show();
   $("#workExperienceEditImage").hide();
}
function getEducationPrivacyGroups()
{
   $("#successId").hide();
   $("#educationList").hide();
   $("#educationEditList").show();
   $("#submit_btn_id").show();
   $("#educationEditImage").hide();
}

function getProfilePicturePrivacyGroups()
{
    $("#successId").hide();
    $("#profilePictureList").hide();
    $("#profilePictureEditList").show();
    $("#submit_btn_id").show();
    $("#profilePictureEditImage").hide();
}
function getFriendPrivacyGroups()
{
   $("#successId").hide();
   $("#friendList").hide();
   $("#friendEditList").show();
   $("#submit_btn_id").show();
   $("#friendEditImage").hide();

}



 var  privacyselctedGrpValues= [];
 //Personal Information
function checkSelectedValue(){
    var  selectedPersonalPrivacyGroupIdVal=$('#selectedPersonalPrivacyGroupId').val();
	if(selectedPersonalPrivacyGroupIdVal.length>1){
      var selectedPersonalPrivacyGroupId = [];
      $('#selectedPersonalPrivacyGroupId option:selected').each(function(i, selected){
         selectedPersonalPrivacyGroupId[i] = $(selected).text();
         if(selectedPersonalPrivacyGroupId[i]=="Private"){
           $(selected).attr("selected",false);
            
          }
           if(selectedPersonalPrivacyGroupId[i]=="Public"){
           $(selected).attr("selected",false);
          }
          else{
         
          }
          
      });
    }  
}

//Desired Work
function checkSelectedDesiredPrivacyGroups(){
 var  selecteddesiredPrivacyGroupsIdVal=$('#selecteddesiredPrivacyGroupsId').val();
 if(selecteddesiredPrivacyGroupsIdVal.length>1){
      var selecteddesiredPrivacyGroupId = [];
      $('#selecteddesiredPrivacyGroupsId option:selected').each(function(i, selected){
         selecteddesiredPrivacyGroupId[i] = $(selected).text();
         if(selecteddesiredPrivacyGroupId[i]=="Private"){
           $(selected).attr("selected",false);
            
          }
         if(selecteddesiredPrivacyGroupId[i]=="Public"){
           $(selected).attr("selected",false);
          }
        else{
         
          }
      });
    }  
 
}

//Work Experience

function checkSelectedWorkExperiencePrivacyGroup(){
 var  selectedWorkExperiencePrivacyGroupId=$('#selectedWorkExperiencePrivacyGroupId').val();
 if(selectedWorkExperiencePrivacyGroupId.length>1){
      var selectedWorkExperiencePrivacyGroupId = [];
      $('#selectedWorkExperiencePrivacyGroupId option:selected').each(function(i, selected){
         selectedWorkExperiencePrivacyGroupId[i] = $(selected).text();
         if(selectedWorkExperiencePrivacyGroupId[i]=="Private"){
           $(selected).attr("selected",false);
            
          }
           if(selectedWorkExperiencePrivacyGroupId[i]=="Public"){
           $(selected).attr("selected",false);
          }
        else{
         
          }
      });
    }  
 
}


//Education Experience
function checkEducationExperiencePrivacyGroup(){
 var  selectedEducationExperiencePrivacyGroupId=$('#selectedEducationExperiencePrivacyGroupId').val();
 if(selectedEducationExperiencePrivacyGroupId.length>1){
      var selectedEducationPrivacyGroupId = [];
      $('#selectedEducationExperiencePrivacyGroupId option:selected').each(function(i, selected){
         selectedEducationPrivacyGroupId[i] = $(selected).text();
         if(selectedEducationPrivacyGroupId[i]=="Private"){
           $(selected).attr("selected",false);
            
          }
             if(selectedEducationPrivacyGroupId[i]=="Public"){
           $(selected).attr("selected",false);
          }
        else{
         
          }
      });
    }  
 
}


//Profile Picture
function checkProfilePicturePrivacyGroup(){
 var  selectedProfilePicturePrivacyGroupId=$('#selectedProfilePicturePrivacyGroupId').val();
 if(selectedProfilePicturePrivacyGroupId.length>1){
      var selectedProfilePicPrivacyGroupId = [];
      $('#selectedProfilePicturePrivacyGroupId option:selected').each(function(i, selected){
         selectedProfilePicPrivacyGroupId[i] = $(selected).text();
         if(selectedProfilePicPrivacyGroupId[i]=="Private"){
           $(selected).attr("selected",false);
            
          }
          if(selectedProfilePicPrivacyGroupId[i]=="Public"){
           $(selected).attr("selected",false);
          }
        else{
         
          }
      });
    }  
 
}





//Friend List
function checkFriendListPrivacyGroup(){
 var  selectedFriendListPrivacyGroupId=$('#selectedFriendListPrivacyGroupId').val();
 if(selectedFriendListPrivacyGroupId.length>1){
      var selectedFriendLstPrivacyGroupId = [];
      $('#selectedFriendListPrivacyGroupId option:selected').each(function(i, selected){
         selectedFriendLstPrivacyGroupId[i] = $(selected).text();
         if(selectedFriendLstPrivacyGroupId[i]=="Private"){
           $(selected).attr("selected",false);
            
          }
          if(selectedFriendLstPrivacyGroupId[i]=="Public"){
           $(selected).attr("selected",false);
          }else{
         
          }
      });
    }  
 
}
