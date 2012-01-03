package com.mob.view.action.search;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.profile.Feedback;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.FeedbackService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class FeedbackForEmployeeFromSearchACtion extends ActionSupport {
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(FeedbackForEmployeeFromSearchACtion.class);

	private Employer feedbackProvider;
	
	private User profileOwner;
	
	private Profile profile;
	
	private Feedback feedback;
	
	private String feedbac;
	private String feedbacktype;
	
	
	private String error="error";
	
	private BaseService<Feedback> baseServiceFeedback;
	private BaseService<User> profileOwnerBaseService;
	private FeedbackService feedbackService;
	
	private int positiveSize;
	private int allProfilesFeedbackCount;
	

	public String leaveEmployeeFeedback(){
		LOGGER.info("Entered leaveEmployeeFeedback");
		feedbackProvider = (Employer) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		
		profileOwner=profileOwnerBaseService.findByPrimaryKey(profileOwner,profileOwner.getId());
				
		profile.setId(profile.getId());
		 try {
		    	
				feedback = new Feedback();
				feedback.setAssociatedProfile(profile);
				feedback.setFeedbackProvider(feedbackProvider);
				feedback.setFeedbackProviderName(feedbackProvider.getEmplrOrgName());
				feedback.setProfileOwnerId(profileOwner);
				feedback.setComment(feedbac);
				feedback.setFeedbackType(feedbacktype);
				baseServiceFeedback.create(feedback);
			} catch (RuntimeException e) {
				LOGGER.info("In side Catch Block");
				return error;
			}
			
			
			List positiveList = feedbackService.findListOfFeedbacks(feedback, profile.getId());
		    LOGGER.info("positiveList:---"+ positiveList.size());
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


	public String getFeedbacktype() {
		return feedbacktype;
	}


	public void setFeedbacktype(String feedbacktype) {
		this.feedbacktype = feedbacktype;
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


//	public int getNagativeSize() {
//		return nagativeSize;
//	}
//
//
//	public void setNagativeSize(int nagativeSize) {
//		this.nagativeSize = nagativeSize;
//	}


	public BaseService<User> getProfileOwnerBaseService() {
		return profileOwnerBaseService;
	}


	public void setProfileOwnerBaseService(BaseService<User> profileOwnerBaseService) {
		this.profileOwnerBaseService = profileOwnerBaseService;
	}



	public Employer getFeedbackProvider() {
		return feedbackProvider;
	}



	public void setFeedbackProvider(Employer feedbackProvider) {
		this.feedbackProvider = feedbackProvider;
	}


}
