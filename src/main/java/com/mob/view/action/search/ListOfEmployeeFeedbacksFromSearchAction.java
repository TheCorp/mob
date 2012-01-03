package com.mob.view.action.search;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.profile.Feedback;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.EmployerProfileService;
import com.mob.services.FeedbackService;
import com.mob.util.MOBLogger;

public class ListOfEmployeeFeedbacksFromSearchAction {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ListOfEmployeeFeedbacksFromSearchAction.class);

	private User feedbackOwner=new User();
	private Feedback feedback;
	private Profile profile=new Profile();
	
	private List listOfFeedbacks;
	private List allProfilesFeedback;
	
	private FeedbackService feedbackService;
	private BaseService<User> userBaseService;
	private BaseService<Profile> profileBaseService;
	
	private int possitiveSize;
	private int allProfilesFeedbackCount;
	private EmployerProfileService employerProfileService;

	public String listOfFeedbacks(){
		LOGGER.info("Entered listOfFeedbacks");	
		profile=employerProfileService.findProfileForEmployer(profile.getId());
	//profile=profileBaseService.findByPrimaryKey(profile,profile.getId());
	LOGGER.info("profile owner id:"+profile.getProfileOwner().getId());
	feedbackOwner=userBaseService.findByPrimaryKey(feedbackOwner,profile.getProfileOwner().getId());
	feedback=new Feedback();
	
	listOfFeedbacks=feedbackService.findListOfFeedbacks(feedback,profile.getId());
	
	LOGGER.info("list of feedbCks:"+listOfFeedbacks.size());
	
	List positiveListSize= feedbackService.findListOfFeedbacks(feedback, profile.getId()); 
   	possitiveSize=positiveListSize.size();
   	LOGGER.info("positive list of feedbCks:"+listOfFeedbacks.size());
	
	return "success";
	}

	public String listOfAllProfileFeedbacks(){
		
	 profile=profileBaseService.findByPrimaryKey(profile,profile.getId());	
	 feedbackOwner=userBaseService.findByPrimaryKey(feedbackOwner,profile.getProfileOwner().getId());
	 allProfilesFeedback= feedbackService.findAllProfilesFeedback(feedback, feedbackOwner.getId());   
	 allProfilesFeedbackCount=allProfilesFeedback.size();
	
	return "success";
	}

	public BaseService<User> getUserBaseService() {
		return userBaseService;
	}

	public void setUserBaseService(BaseService<User> userBaseService) {
		this.userBaseService = userBaseService;
	}
	
	public List getListOfFeedbacks() {
		return listOfFeedbacks;
	}

	public void setListOfFeedbacks(List listOfFeedbacks) {
		this.listOfFeedbacks = listOfFeedbacks;
	}

	public Feedback getFeedback() {
		return feedback;
	}

	public void setFeedback(Feedback feedback) {
		this.feedback = feedback;
	}

	public FeedbackService getFeedbackService() {
		return feedbackService;
	}

	public void setFeedbackService(FeedbackService feedbackService) {
		this.feedbackService = feedbackService;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public int getPossitiveSize() {
		return possitiveSize;
	}

	public void setPossitiveSize(int possitiveSize) {
		this.possitiveSize = possitiveSize;
	}


	public User getFeedbackOwner() {
		return feedbackOwner;
	}

	public void setFeedbackOwner(User feedbackOwner) {
		this.feedbackOwner = feedbackOwner;
	}

	
	public BaseService<Profile> getProfileBaseService() {
		return profileBaseService;
	}

	public void setProfileBaseService(BaseService<Profile> profileBaseService) {
		this.profileBaseService = profileBaseService;
	}

	public List getAllProfilesFeedback() {
		return allProfilesFeedback;
	}

	public void setAllProfilesFeedback(List allProfilesFeedback) {
		this.allProfilesFeedback = allProfilesFeedback;
	}

	public int getAllProfilesFeedbackCount() {
		return allProfilesFeedbackCount;
	}

	public void setAllProfilesFeedbackCount(int allProfilesFeedbackCount) {
		this.allProfilesFeedbackCount = allProfilesFeedbackCount;
	}

	public EmployerProfileService getEmployerProfileService() {
		return employerProfileService;
	}

	public void setEmployerProfileService(
			EmployerProfileService employerProfileService) {
		this.employerProfileService = employerProfileService;
	}

	
}
