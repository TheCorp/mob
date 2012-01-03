package com.mob.view.action.employer;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.employer.Employer;
import com.mob.model.profile.EmployerProfile;
import com.mob.services.BaseService;
import com.mob.services.EmployerProfileService;
import com.mob.services.EmployerService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class ListProfileAction extends ActionSupport {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ListProfileAction.class);


	private EmployerProfile profile;
	private List<EmployerProfile> profilelist;
	private EmployerProfileService employerProfileService;
	private Employer employer;
	private EmployerService employerAccountService;
	private List nonDefaultEmployerProfiles=new ArrayList();
	private BaseService<Employer> baseService;

	public String view() {
		LOGGER.info("Inside view");
		profile=new EmployerProfile();
		
		employer= (Employer) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		
		profile.setEmployer(employer);
		profilelist = employerProfileService.findUserProfile(profile.getEmployer().getId());
		if(profilelist.size()!=0){
			Iterator it=profilelist.iterator();
			while(it.hasNext()){
				EmployerProfile nonDefaultProfile=(EmployerProfile)it.next();
				if(!nonDefaultProfile.getStatus().equals("default")){
					nonDefaultEmployerProfiles.add(nonDefaultProfile);
				}
			  }
			}
		employer=baseService.findByPrimaryKey(employer, employer.getId());
		System.out.println(""+employer.getCulture());
		return "success";
	}
	

	public EmployerProfile getProfile() {
		return profile;
	}

	public void setProfile(EmployerProfile profile) {
		this.profile = profile;
	}

	

	public EmployerService getEmployerAccountService() {
		return employerAccountService;
	}

	public void setEmployerAccountService(EmployerService employerAccountService) {
		this.employerAccountService = employerAccountService;
	}

	

	public Employer getEmployer() {
		return employer;
	}

	public void setEmployer(Employer employer) {
		this.employer = employer;
	}

	public void setProfilelist(List<EmployerProfile> profilelist) {
		this.profilelist = profilelist;
	}

	public List<EmployerProfile> getProfilelist() {
		return profilelist;
	}


	public EmployerProfileService getEmployerProfileService() {
		return employerProfileService;
	}


	public void setEmployerProfileService(
			EmployerProfileService employerProfileService) {
		this.employerProfileService = employerProfileService;
	}


	public List getNonDefaultEmployerProfiles() {
		return nonDefaultEmployerProfiles;
	}


	public void setNonDefaultEmployerProfiles(List nonDefaultEmployerProfiles) {
		this.nonDefaultEmployerProfiles = nonDefaultEmployerProfiles;
	}


	public BaseService<Employer> getBaseService() {
		return baseService;
	}


	public void setBaseService(BaseService<Employer> baseService) {
		this.baseService = baseService;
	}

}
