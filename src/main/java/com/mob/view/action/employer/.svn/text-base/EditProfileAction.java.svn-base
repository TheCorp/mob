package com.mob.view.action.employer;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.EmployeeProfileService;
import com.mob.util.MOBLogger;

public class EditProfileAction {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EditProfileAction.class);

	private EmployerProfile profile=new EmployerProfile();
	private List profilelist;
	private BaseService<EmployerProfile> employerProfileService;
	
	private String name;
	private String biography;
	private String others;
	
	private EmployeeProfileService employeeProfileService;
    private Profile newDefaultProfile;
    private BaseService<Profile> profileService;


	public String edit() {
		LOGGER.info("edit");
		/*Employer user = (Employer) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		profile.setInboxOwnerProfile(user);
		LOGGER.info("befor profile name "+profile.getName());
		LOGGER.info("befor profile biography "+biography);*/
		
		profile=employerProfileService.findByPrimaryKey(profile,profile.getId());
		
		LOGGER.info("profile id:"+profile.getId());
		LOGGER.info("after profile name "+profile.getName());
		this.profile.setName(name);
		this.profile.setBiography(biography);
		this.profile.setOthers(others);
		employerProfileService.update(profile);
		return "success";
	}
	
    public String setAsDefaultProfile()
    {   
    	//Setting old default profile status as empty
    	User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	Profile profile=employeeProfileService.getDefaultProfileForUser(user.getId());
        profile.setStatus("notdefault");
        profileService.update(profile);
    	
    	//Changing "newDefaultProfile" as default profile
    	newDefaultProfile = profileService.findByPrimaryKey(newDefaultProfile, newDefaultProfile.getId());
    	newDefaultProfile.setStatus("default");
        profileService.update(newDefaultProfile);
    	return "success";
    }	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public EmployerProfile getProfile() {
		return profile;
	}


	public void setProfile(EmployerProfile profile) {
		this.profile = profile;
	}


	public List getProfilelist() {
		return profilelist;
	}


	public void setProfilelist(List profilelist) {
		this.profilelist = profilelist;
	}


	public BaseService<EmployerProfile> getEmployerProfileService() {
		return employerProfileService;
	}


	public void setEmployerProfileService(
			BaseService<EmployerProfile> employerProfileService) {
		this.employerProfileService = employerProfileService;
	}

	public String getBiography() {
		return biography;
	}

	public void setBiography(String biography) {
		this.biography = biography;
	}

	public String getOthers() {
		return others;
	}

	public void setOthers(String others) {
		this.others = others;
	}

	public void setEmployeeProfileService(
			EmployeeProfileService employeeProfileService) {
		this.employeeProfileService = employeeProfileService;
	}

	public void setNewDefaultProfile(Profile newDefaultProfile) {
		this.newDefaultProfile = newDefaultProfile;
	}

	public void setProfileService(BaseService<Profile> profileService) {
		this.profileService = profileService;
	}

	

	
}
