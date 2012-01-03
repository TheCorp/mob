/*contactInformation */

function contactInfo(name,contcatOwnerID,isEmployer){
	if(isEmployer=="false"){
	 	var htmlText= "<div class='bc_git_tl'>"+
			  "<span id='active_contact-flname'>"+name+"</span></div>"+
			  "<div class='bc_git_bl'><span id='active_contact-viewbrieflink'>"+
			  "<a href='#' id='brief_view' onclick='viewBriefcaseofContactOwner("+contcatOwnerID+")'>View Briefcase</a></span> <span id='active_contact-viewproflink'>"+
			  "<a href='#' id='profile_view' onclick='viewProfileofContactOwner("+contcatOwnerID+")'>View Profile</a></span></div>"
			  $("#bcc_info_tab1").html(htmlText)
			  $("#bcc_info_tab").show();	
		
		}
		
	else{
		var htmlText= "<div class='bc_git_tl'>"+
			  "<span id='active_contact-flname_empr'>"+name+"</span></div>"+
			  "<div class='bc_git_bl'><span id='active_contact-viewbrieflink_empr'>"+
			  "<a href='#' id='brief_view' onclick='viewBriefcaseofContactOwner("+contcatOwnerID+")'>View Briefcase</a></span> <span id='active_contact-viewproflink_empr'>"+
			  "<a href='#' id='profile_view_empr' onclick='viewEmployerProfileofContactOwner("+contcatOwnerID+")'>View Profile</a></span></div>"
			  $("#bcc_info_tab1_employer").html(htmlText)
			  $("#bcc_info_tab").show();
			  

		}
	  
}

function viewBriefcaseofContactOwner(contcatOwnerID){

	document.getElementById("brief_view").href= "viewBriefcaseFromSearch.action?employeeProfileId="+contcatOwnerID;

}

function viewProfileofContactOwner(contcatOwnerID){

	document.getElementById("profile_view").href= "viewEmployeeProfileFromSearchEmployee.action?employeeProfileId="+contcatOwnerID;

}
function viewEmployerProfileofContactOwner(contcatOwnerID){
	
	document.getElementById("profile_view_empr").href= "viewingEmployerProfileFromSearch.action?employerProfile.id="+contcatOwnerID;
	
}
/* End of contactInformation */