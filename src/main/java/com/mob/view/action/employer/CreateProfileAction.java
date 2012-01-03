package com.mob.view.action.employer;

import java.sql.Date;
import java.util.List;
import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.PrivacyGroup;
import com.mob.model.employer.Employer;
import com.mob.model.profile.EmployerProfile;
import com.mob.services.BaseService;
import com.mob.services.EmployerProfileService;
import com.mob.services.PrivacyGroupService;
import com.mob.services.PrivacyGroupNames;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

//@Validations
public class CreateProfileAction extends ActionSupport implements Preparable{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(CreateProfileAction.class);
    private static final long serialVersionUID = 1L;

	private EmployerProfile profile;
	private Employer user;

	private BaseService<EmployerProfile> employerProfileBaseService;
	private EmployerProfileService employerProfileService;
	
	private Date privacyGroupCreatedDate;
    private PrivacyGroup privacyGroup;
    private BaseService<PrivacyGroup> privacyGroupBaseService;
    private PrivacyGroupService privacyGroupService;


	public String create() {
		LOGGER.info("Inside create ");
		
		user = (Employer) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		List profilesList=employerProfileService.findUserProfile(user.getId());
		
		if(profilesList.size()==0){
			profile.setStatus("default");
		}else{
			profile.setStatus("notdefault");
		}
		
		profile.setEmployer(user);
		employerProfileBaseService.create(profile);
		
		//Setting Employer picture as Employer Profile picture
		if(user.getPicture() != null && user.getPicture().length()>0){
            profile.setPicture(user.getPicture());
            employerProfileBaseService.update(profile);
        }
		
		privacyGroupCreatedDate = new Date(System.currentTimeMillis());

        privacyGroup = new PrivacyGroup();
        privacyGroup.setName(PrivacyGroupNames.Public.toString());
        privacyGroup.setProfile(profile);
        privacyGroup.setCreatedDate(privacyGroupCreatedDate);
        privacyGroupBaseService.create(privacyGroup);

        privacyGroup = new PrivacyGroup();
        privacyGroup.setName(PrivacyGroupNames.Contact.toString());
        privacyGroup.setProfile(profile);
        privacyGroup.setCreatedDate(privacyGroupCreatedDate);
        privacyGroupBaseService.create(privacyGroup);
        privacyGroupService.addDefaultPrivacySettings(privacyGroup.getId());        
       
        
        privacyGroup = new PrivacyGroup();
        privacyGroup.setName(PrivacyGroupNames.Employee.toString());
        privacyGroup.setProfile(profile);
        privacyGroup.setCreatedDate(privacyGroupCreatedDate);
        privacyGroupBaseService.create(privacyGroup);
        
        privacyGroup = new PrivacyGroup();
        privacyGroup.setName(PrivacyGroupNames.Manager.toString());
        privacyGroup.setProfile(profile);
        privacyGroup.setCreatedDate(privacyGroupCreatedDate);
        privacyGroupBaseService.create(privacyGroup);
        
        
        privacyGroup = new PrivacyGroup();
        privacyGroup.setName(PrivacyGroupNames.Executive.toString());
        privacyGroup.setProfile(profile);
        privacyGroup.setCreatedDate(privacyGroupCreatedDate);
        privacyGroupBaseService.create(privacyGroup);
        
        privacyGroup = new PrivacyGroup();
        privacyGroup.setName(PrivacyGroupNames.Potential_Employee.toString());
        privacyGroup.setProfile(profile);
        privacyGroup.setCreatedDate(privacyGroupCreatedDate);
        privacyGroupBaseService.create(privacyGroup);
        
        privacyGroup = new PrivacyGroup();
        privacyGroup.setName(PrivacyGroupNames.Trusted_Potential_Employee.toString());
        privacyGroup.setProfile(profile);
        privacyGroup.setCreatedDate(privacyGroupCreatedDate);
        privacyGroupBaseService.create(privacyGroup);
		
        return "success";
	}

	public void prepare() throws Exception {
		user = (Employer) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal(); 
		LOGGER.info("user id in profile prepare()"+user.getId());
	}
	

	public void setPrivacyGroupCreatedDate(Date privacyGroupCreatedDate) {
		this.privacyGroupCreatedDate = privacyGroupCreatedDate;
	}

	public void setPrivacyGroup(PrivacyGroup privacyGroup) {
		this.privacyGroup = privacyGroup;
	}

	public void setPrivacyGroupBaseService(
			BaseService<PrivacyGroup> privacyGroupBaseService) {
		this.privacyGroupBaseService = privacyGroupBaseService;
	}
	
	public Employer getUser() {
		return user;
	}

	public void setUser(Employer user) {
		this.user = user;
	}

	
	public EmployerProfile getProfile() {
		return profile;
	}

	public void setProfile(EmployerProfile profile) {
		this.profile = profile;
	}

	public BaseService<EmployerProfile> getEmployerProfileBaseService() {
		return employerProfileBaseService;
	}

	public void setEmployerProfileBaseService(
			BaseService<EmployerProfile> employerProfileBaseService) {
		this.employerProfileBaseService = employerProfileBaseService;
	}

	public EmployerProfileService getEmployerProfileService() {
		return employerProfileService;
	}

	public void setEmployerProfileService(
			EmployerProfileService employerProfileService) {
		this.employerProfileService = employerProfileService;
	}

	public void setPrivacyGroupService(PrivacyGroupService privacyGroupService) {
		this.privacyGroupService = privacyGroupService;
	}

}
