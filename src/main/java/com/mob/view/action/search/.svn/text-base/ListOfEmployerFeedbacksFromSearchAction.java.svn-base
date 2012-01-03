package com.mob.view.action.search;

import java.util.List;

import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Feedback;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.FeedbackService;
import com.mob.util.MOBLogger;

public class ListOfEmployerFeedbacksFromSearchAction {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ListOfEmployerFeedbacksFromSearchAction.class);

	private Employer feedbackOwner=new Employer();
	private Feedback feedback;
	private EmployerProfile profile=new EmployerProfile();
	
	private List listOfFeedbacks;
	
	private FeedbackService feedbackService;
	private BaseService<Employer> userBaseService;
	private BaseService<EmployerProfile> profileBaseService;
	
	private int possitiveSize;
	

	public String listOfFeedbacks(){
		LOGGER.info("Entered listOfFeedbacks");	
	profile=profileBaseService.findByPrimaryKey(profile,profile.getId());
	LOGGER.info("profile owner id:"+profile.getEmployer().getId());
	feedbackOwner=userBaseService.findByPrimaryKey(feedbackOwner,profile.getEmployer().getId());
	feedback=new Feedback();
	
	listOfFeedbacks=feedbackService.findListOfFeedbacks(feedback,profile.getId());
	
	LOGGER.info("list of feedbCks:"+listOfFeedbacks.size());
	
	List positiveListSize= feedbackService.findListOfFeedbacks(feedback, profile.getId()); 
   	possitiveSize=positiveListSize.size();
   	LOGGER.info("positive list of feedbCks:"+listOfFeedbacks.size());
	
	return "success";
	}


	public Employer getFeedbackOwner() {
		return feedbackOwner;
	}


	public void setFeedbackOwner(Employer feedbackOwner) {
		this.feedbackOwner = feedbackOwner;
	}


	public Feedback getFeedback() {
		return feedback;
	}


	public void setFeedback(Feedback feedback) {
		this.feedback = feedback;
	}


	public EmployerProfile getProfile() {
		return profile;
	}


	public void setProfile(EmployerProfile profile) {
		this.profile = profile;
	}


	public List getListOfFeedbacks() {
		return listOfFeedbacks;
	}


	public void setListOfFeedbacks(List listOfFeedbacks) {
		this.listOfFeedbacks = listOfFeedbacks;
	}


	public FeedbackService getFeedbackService() {
		return feedbackService;
	}


	public void setFeedbackService(FeedbackService feedbackService) {
		this.feedbackService = feedbackService;
	}


	public BaseService<Employer> getUserBaseService() {
		return userBaseService;
	}


	public void setUserBaseService(BaseService<Employer> userBaseService) {
		this.userBaseService = userBaseService;
	}


	public BaseService<EmployerProfile> getProfileBaseService() {
		return profileBaseService;
	}


	public void setProfileBaseService(
			BaseService<EmployerProfile> profileBaseService) {
		this.profileBaseService = profileBaseService;
	}


	public int getPossitiveSize() {
		return possitiveSize;
	}


	public void setPossitiveSize(int possitiveSize) {
		this.possitiveSize = possitiveSize;
	}

	
	
}
