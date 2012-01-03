package com.mob.view.action.employee;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.profile.Feedback;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.FeedbackService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class FeedbackForEmployeeAction extends ActionSupport{
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(FeedbackForEmployeeAction.class);

    private static final long serialVersionUID = 1L;
    
	private Profile profile;
	private Feedback feedback;
	private User user;
	
	private BaseService<Feedback> baseServiceFeedback;
	private FeedbackService feedbackService;
	
	private String feedbac;
	private String feedbacktype;
	private String error="error";
	private long profileId;
	private int positiveSize;
	
	//private int nagativeSize;
	
	public String storeEmployeeFeedback(){
		
		LOGGER.info("********StoreEmployeefeedback method**********");
		User user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		
		profile = new Profile();
		profile.setId(profileId);	    
	    try {
	    	
			feedback = new Feedback();
			feedback.setAssociatedProfile(profile);
			feedback.setFeedbackProvider(user);
			feedback.setProfileOwnerId(user);
			feedback.setComment(feedbac);
			feedback.setFeedbackType(feedbacktype);
			
			feedback.setFeedbackProviderName(user.getFirstName());
			baseServiceFeedback.create(feedback);
		} catch (RuntimeException e) {
			
			LOGGER.info("In side Catch Block");
			return error;
		}
	    List positiveList = feedbackService.findListOfFeedbacks(feedback, profile.getId());
	    LOGGER.info("positiveList:---"+ positiveList.size());
	    positiveSize=positiveList.size();
	    
	   /* List nagativeList = feedbackService.findNagtiveFeedbacks(feedback, profile.getId(),"Negative");
	    LOGGER.info("positiveList:---"+ nagativeList.size());
	    nagativeSize=nagativeList.size();*/
		return "success";
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}	

	public BaseService<Feedback> getBaseServiceFeedback() {
		return baseServiceFeedback;
	}

	public void setBaseServiceFeedback(BaseService<Feedback> baseServiceFeedback) {
		this.baseServiceFeedback = baseServiceFeedback;
	}

	public long getProfileId() {
		return profileId;
	}

	public void setProfileId(long profileId) {
		this.profileId = profileId;
	}

	public String getError() {
		return error;
	}

	public void setError(String error) {
		this.error = error;
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

	public int getPositiveSize() {
		return positiveSize;
	}

	public void setPositiveSize(int positiveSize) {
		this.positiveSize = positiveSize;
	}

	public FeedbackService getFeedbackService() {
		return feedbackService;
	}

	public void setFeedbackService(FeedbackService feedbackService) {
		this.feedbackService = feedbackService;
	}

	

}
