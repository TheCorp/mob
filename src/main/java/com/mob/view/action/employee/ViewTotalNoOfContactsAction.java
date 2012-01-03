package com.mob.view.action.employee;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.services.ContactEmployeeService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class ViewTotalNoOfContactsAction extends ActionSupport {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ViewTotalNoOfContactsAction.class);
	private static final long serialVersionUID = 1L;

	//private BaseService<Profile> employeeProfileService;
	private ContactEmployeeService contactEmployeeService;

	private Profile profile;

	public String view() {
		LOGGER.info("Inside view" );

		User user = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		profile.setProfileOwner(user);
		List listContacts = contactEmployeeService.findContacts(profile.getProfileOwner().getId());
		profile.setNoOfContacts(listContacts.size());		
		return "success";
	}

	

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}



	public ContactEmployeeService getContactEmployeeService() {
		return contactEmployeeService;
	}



	public void setContactEmployeeService(
			ContactEmployeeService contactEmployeeService) {
		this.contactEmployeeService = contactEmployeeService;
	}

}
