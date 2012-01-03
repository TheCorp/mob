package com.mob.view.action.employee;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.profile.Feedback;
import com.mob.model.profile.Profile;
import com.mob.services.FeedbackService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class ListOfEmployeeFeedbacksAction extends ActionSupport{
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ListOfEmployeeFeedbacksAction.class);

    private static final long serialVersionUID = 1L;
    
	private User user;
	private Feedback feedback;
	private Profile profile;
	
	private List listOfFeedbacks;
	private List allProfilesFeedback;
	
	private FeedbackService feedbackService;
	
	private int possitiveSize;
	private int allProfilesFeedbackCount;

	public String listFeedbacks(){
		LOGGER.info("Inside listFeedbacks" );
		user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		LOGGER.info("profile id:"+profile.getId());
		
		
		feedback=new Feedback();
		
		listOfFeedbacks=feedbackService.findListOfFeedbacks(feedback,profile.getId());
		
		LOGGER.info("list of feedbCks:"+listOfFeedbacks.size());
		
		List positiveListSize= feedbackService.findListOfFeedbacks(feedback, profile.getId());	   
	   	possitiveSize=positiveListSize.size();
	   	LOGGER.info("positive list of feedbCks:"+listOfFeedbacks.size());
		
		return "success";
	}
	
	public String listAllProfileFeedbacks(){
		
		user = (User)SecurityContextHolder.getContext().
		 getAuthentication().getPrincipal();		
		 allProfilesFeedback= feedbackService.findAllProfilesFeedback(feedback, user.getId());   
		 allProfilesFeedbackCount=allProfilesFeedback.size();
		 
		 
		return "success";
	}

	public int getAllProfilesFeedbackCount() {
		return allProfilesFeedbackCount;
	}

	public void setAllProfilesFeedbackCount(int allProfilesFeedbackCount) {
		this.allProfilesFeedbackCount = allProfilesFeedbackCount;
	}
	
	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public int getPossitiveSize() {
		return possitiveSize;
	}

	public void setPossitiveSize(int possitiveSize) {
		this.possitiveSize = possitiveSize;
	}

	public List getAllProfilesFeedback() {
		return allProfilesFeedback;
	}

	public void setAllProfilesFeedback(List allProfilesFeedback) {
		this.allProfilesFeedback = allProfilesFeedback;
	}

	
}
