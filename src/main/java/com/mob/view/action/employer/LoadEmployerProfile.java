package com.mob.view.action.employer;

import java.util.List;
import java.util.Map;
import org.acegisecurity.context.SecurityContextHolder;
import org.apache.struts2.interceptor.SessionAware;
import com.mob.model.User;
import com.mob.model.profile.EmployerProfile;
import com.mob.services.BaseService;
import com.mob.services.OpportunityService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class LoadEmployerProfile extends ActionSupport implements Preparable,SessionAware  {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(LoadEmployerProfile.class);
    private static final long serialVersionUID = 1L;
	private EmployerProfile profile;
	private User user;
	private Map session;
	private long employerProfileId;
	private BaseService<EmployerProfile> employerProfileService;
	private OpportunityService opportunityService;

	private List opportunityDetailsList;

	public String setUpForInsertOrUpdate() {
		LOGGER.info("inside setUpForInsertOrUpdate");
		LOGGER.info("before profile id" + profile.getCompanyName());
		profile = employerProfileService.findByPrimaryKey(profile, profile.getId());
		LOGGER.info("after(editing profile) id()"+profile.getId());
		return "success";
	}

	public String loadProfile() {
		try {
			LOGGER.info("inside loadProfile");
			user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal(); 
			profile = employerProfileService.findByPrimaryKey(profile, profile.getId());
			getSession().put("currentProfile",profile.getId());
			opportunityDetailsList=opportunityService.findListOpportunities(profile.getId());
			System.out.println("opportunityDetailsList size:"+opportunityDetailsList.size());
			LOGGER.info("after loading (view profile)findByPrimaryKey()");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
	}

	public BaseService<EmployerProfile> getEmployerProfileService() {
		return employerProfileService;
	}

	public void prepare() throws Exception {
		LOGGER.info("inside prepare");
		//user = (Employer) SecurityContextHolder.getContext()
		//.getAuthentication().getPrincipal(); 
		/*profile.setInboxOwnerProfile(user);
		profile = employerProfileService.findByPrimaryKey(profile, profile
				.getId());*/
		
	}

	public EmployerProfile getProfile() {
		return profile;
	}

	public void setProfile(EmployerProfile profile) {
		this.profile = profile;
	}

	public void setEmployerProfileService(
			BaseService<EmployerProfile> employerProfileService) {
		this.employerProfileService = employerProfileService;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	public long getEmployerProfileId() {
		return employerProfileId;
	}

	public void setEmployerProfileId(long employerProfileId) {
		this.employerProfileId = employerProfileId;
	}

	public void setOpportunityService(OpportunityService opportunityService) {
		this.opportunityService = opportunityService;
	}

	public void setOpportunityDetailsList(List opportunityDetailsList) {
		this.opportunityDetailsList = opportunityDetailsList;
	}

	public List getOpportunityDetailsList() {
		return opportunityDetailsList;
	}
}
