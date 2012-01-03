package com.mob.view.action.employee;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteEmployeeAction extends ActionSupport {

	
	private Profile profile;

	private BaseService<Profile> profileService;
	 
	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public void setProfileService(BaseService<Profile> profileService) {
		this.profileService = profileService;
	}

	public String delete() {

		User user = (User)SecurityContextHolder.getContext().
		getAuthentication().getPrincipal();
	profile.setProfileOwner(user);
	profileService.delete(profile);
	return "success";
		
	
	}
}


