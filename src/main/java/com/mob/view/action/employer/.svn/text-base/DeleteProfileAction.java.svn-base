package com.mob.view.action.employer;

import com.mob.model.profile.EmployerProfile;
import com.mob.services.BaseService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteProfileAction extends ActionSupport {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(DeleteProfileAction.class);

	private EmployerProfile profile;
	private BaseService<EmployerProfile> employerProfileService;
	
	public String deleteEmployerProfile() {
		LOGGER.info("deleteEmployerProfile");
		LOGGER.info("dle profile id"+profile.getId());
		
		//profile=employerProfileService.findByPrimaryKey(profile,profile.getId());
		employerProfileService.delete(profile);
		
		return "success";
	}


	public void setEmployerProfileService(
			BaseService<EmployerProfile> employerProfileService) {
		this.employerProfileService = employerProfileService;
	}

	public BaseService<EmployerProfile> getEmployerProfileService() {
		return employerProfileService;
	}


	public EmployerProfile getProfile() {
		return profile;
	}


	public void setProfile(EmployerProfile profile) {
		this.profile = profile;
	}

	

	

}
