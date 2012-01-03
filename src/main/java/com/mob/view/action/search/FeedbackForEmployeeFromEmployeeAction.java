package com.mob.view.action.search;

import java.util.List;
import java.util.Map;

import org.acegisecurity.context.SecurityContextHolder;
import org.apache.struts2.interceptor.SessionAware;

import com.mob.model.User;
import com.mob.model.profile.Feedback;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.FeedbackService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class FeedbackForEmployeeFromEmployeeAction extends ActionSupport implements SessionAware {
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(FeedbackForEmployeeFromEmployeeAction.class);

    private static final long serialVersionUID = 1L;
    
	private User feedbackProvider;
	private User profileOwner;
	private Profile profile;
	private Feedback feedback;
	
	private String feedbac;
	
	
	private String error="error";
	
	private BaseService<Feedback> baseServiceFeedback;
	private BaseService<User> profileOwnerBaseService;
	
	private FeedbackService feedbackService;
	
	private int positiveSize;
	private int allProfilesFeedbackCount;
	private BaseService<Profile> profileBaseService;
	private Map session;
	private Long currentProfileId;


	public String leaveEmployeeFeedback(){
		LOGGER.info("Entered leaveEmployeeFeedback");
		feedbackProvider = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
	 			
		profileOwner=profileOwnerBaseService.findByPrimaryKey(profileOwner,profileOwner.getId());
		profile.setId(profile.getId());
		 try {
		    	
				feedback = new Feedback();
				feedback.setAssociatedProfile(profile);
				feedback.setFeedbackProvider(feedbackProvider);
				currentProfileId=(Long)getSession().get("currentProfile");
				if(currentProfileId!=null){
					profile=new Profile();					
					profile=profileBaseService.findByPrimaryKey(profile,currentProfileId);					
					feedback.setFeedbackProviderName(profile.getName());
					feedback.setProfileOwnerId(profileOwner);
					feedback.setComment(feedbac);
					baseServiceFeedback.create(feedback);
				}
			} catch (RuntimeException e) {
				LOGGER.info("In side Catch Block");
				return error;
			}
			
			List positiveList=feedbackService.findListOfFeedbacks(feedback, profile.getId());
			positiveSize=positiveList.size();
			
			List allProfilesFeedback= feedbackService.findAllProfilesFeedback(feedback,profileOwner.getId());   
			allProfilesFeedbackCount=allProfilesFeedback.size();
			
			
		return "success";
	}


	public int getAllProfilesFeedbackCount() {
		return allProfilesFeedbackCount;
	}



	public void setAllProfilesFeedbackCount(int allProfilesFeedbackCount) {
		this.allProfilesFeedbackCount = allProfilesFeedbackCount;
	}

	
	public User getProfileOwner() {
		return profileOwner;
	}


	public void setProfileOwner(User profileOwner) {
		this.profileOwner = profileOwner;
	}


	public Profile getProfile() {
		return profile;
	}


	public void setProfile(Profile profile) {
		this.profile = profile;
	}


	public Feedback getFeedback() {
		return feedback;
	}


	public void setFeedback(Feedback feedback) {
		this.feedback = feedback;
	}


	public String getFeedbac() {
		return feedbac;
	}


	public void setFeedbac(String feedbac) {
		this.feedbac = feedbac;
	}



	public String getError() {
		return error;
	}


	public void setError(String error) {
		this.error = error;
	}


	public BaseService<Feedback> getBaseServiceFeedback() {
		return baseServiceFeedback;
	}


	public void setBaseServiceFeedback(BaseService<Feedback> baseServiceFeedback) {
		this.baseServiceFeedback = baseServiceFeedback;
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




	public BaseService<User> getProfileOwnerBaseService() {
		return profileOwnerBaseService;
	}


	public void setProfileOwnerBaseService(BaseService<User> profileOwnerBaseService) {
		this.profileOwnerBaseService = profileOwnerBaseService;
	}



	public User getFeedbackProvider() {
		return feedbackProvider;
	}



	public void setFeedbackProvider(User feedbackProvider) {
		this.feedbackProvider = feedbackProvider;
	}


	public BaseService<Profile> getProfileBaseService() {
		return profileBaseService;
	}


	public void setProfileBaseService(BaseService<Profile> profileBaseService) {
		this.profileBaseService = profileBaseService;
	}


	public Map getSession() {
		return session;
	}


	public void setSession(Map session) {
		this.session = session;
	}


	public Long getCurrentProfileId() {
		return currentProfileId;
	}


	public void setCurrentProfileId(Long currentProfileId) {
		this.currentProfileId = currentProfileId;
	}



}
