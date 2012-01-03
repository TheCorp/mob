package com.mob.view.action.search;

import java.util.ArrayList;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Feedback;
import com.mob.services.BaseService;
import com.mob.services.FeedbackService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class ViewEmployerProfileFromSearch extends ActionSupport implements Preparable {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ViewEmployerProfileFromSearch.class);

	private EmployerProfile profile;
	private User  user;
	
	private Employer employer;
	
	private long employerid;
	private Feedback feedback;
	

	private BaseService<EmployerProfile> employerProfileService;
	private BaseService<Employer> employerBaseService;

	
     private FeedbackService feedbackService;	
	  private int positiveSize;

	private int allProfilesFeedbackCount;
	private List allProfilesFeedback;
	
	
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

	public String setUpForInsertOrUpdate() {
		
		LOGGER.info("inside setUpForInsertOrUpdate");
		LOGGER.info("before profile id" + profile.getCompanyName());
		profile = employerProfileService.findByPrimaryKey(profile, profile
				.getId());
		LOGGER.info("after(editing profile) id()"+profile.getId());
		return "success";
	}

	public String viewEmplrProfile() {
		try {
			
			profile = employerProfileService.findByPrimaryKey(profile,profile.getId());
			
			List positiveList = feedbackService.findListOfFeedbacks(feedback, profile.getId());
		    LOGGER.info("positiveList:---"+ positiveList.size());
		    positiveSize=positiveList.size();		  
		    allProfilesFeedback=new ArrayList();
		    allProfilesFeedback= feedbackService.findAllProfilesFeedback(feedback,profile.getEmployer().getId());   
			allProfilesFeedbackCount=allProfilesFeedback.size();		    
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
		
		user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal(); 
		/*profile.setInboxOwnerProfile(user);
		profile = employerProfileService.findByPrimaryKey(profile, profile
				.getId());*/
				
		LOGGER.info("inside prepare method of load profile:"+user.getId());
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Employer getEmployer() {
		return employer;
	}

	public void setEmployer(Employer employer) {
		this.employer = employer;
	}

	public BaseService<Employer> getEmployerBaseService() {
		return employerBaseService;
	}

	public void setEmployerBaseService(BaseService<Employer> employerBaseService) {
		this.employerBaseService = employerBaseService;
	}

	public long getEmployerid() {
		return employerid;
	}

	public void setEmployerid(long employerid) {
		this.employerid = employerid;
	}

	public FeedbackService getFeedbackService() {
		return feedbackService;
	}

	public void setFeedbackService(FeedbackService feedbackService) {
		this.feedbackService = feedbackService;
	}

	public int getPositiveSize() {
		return positiveSize;
	}

	public void setPositiveSize(int positiveSize) {
		this.positiveSize = positiveSize;
	}

	public Feedback getFeedback() {
		return feedback;
	}

	public void setFeedback(Feedback feedback) {
		this.feedback = feedback;
	}

	public int getAllProfilesFeedbackCount() {
		return allProfilesFeedbackCount;
	}

	public void setAllProfilesFeedbackCount(int allProfilesFeedbackCount) {
		this.allProfilesFeedbackCount = allProfilesFeedbackCount;
	}

	public List getAllProfilesFeedback() {
		return allProfilesFeedback;
	}

	public void setAllProfilesFeedback(List allProfilesFeedback) {
		this.allProfilesFeedback = allProfilesFeedback;
	}

	


}
