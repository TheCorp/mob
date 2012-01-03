package com.mob.services.impl;

import java.util.List;
import com.mob.dao.FeedbackDao;
import com.mob.model.profile.Feedback;
import com.mob.services.FeedbackService;

public class FeedbackServiceImpl implements FeedbackService {

	
    private FeedbackDao feedbackDao;
    
	public FeedbackDao getFeedbackDao() {
		return feedbackDao;
	}
	public void setFeedbackDao(FeedbackDao feedbackDao) {
		this.feedbackDao = feedbackDao;
	}


	public List findListOfFeedbacks(Feedback f, long id) {
		return this.feedbackDao.findListOfFeedbacks(f, id);
	}
	public List findAllProfilesFeedback(Feedback f, long id) {
		return this.feedbackDao.findAllProfilesFeedback(f, id);
	}
	
	

	
}
