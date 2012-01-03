package com.mob.dao.hibernate;

import java.util.List;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import com.mob.dao.FeedbackDao;
import com.mob.model.profile.Feedback;

public class FeedbackHibernateDao 
extends HibernateDaoSupport implements FeedbackDao {


	public List findListOfFeedbacks(Feedback f, long id) {
		
		String queryString = "from Feedback f where f.associatedProfile.id= :id ";
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
	}

	public List findAllProfilesFeedback(Feedback f, long id) {
		
		String queryString = "from Feedback f where f.profileOwnerId.id= :id ";
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
	}
	
	
	
}
