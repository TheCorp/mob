package com.mob.services;

import java.util.List;

import com.mob.model.profile.Feedback;

public interface FeedbackService {
		
	public List findListOfFeedbacks(Feedback f,long id);
	public List findAllProfilesFeedback(Feedback f,long id);

}
