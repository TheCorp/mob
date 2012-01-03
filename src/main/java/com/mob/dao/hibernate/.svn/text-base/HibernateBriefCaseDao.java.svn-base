package com.mob.dao.hibernate;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mob.dao.BriefCaseDao;
import com.mob.model.profile.BriefCase;
import com.mob.model.profile.Profile;
 
public class HibernateBriefCaseDao extends HibernateDaoSupport implements BriefCaseDao{

	public List<BriefCase> findBriefCase(long id) {
		String queryString = "from BriefCase b where b.briefCaseOwner.id=:id";
		return getHibernateTemplate().findByNamedParam(queryString,"id",id);
	}

	public BriefCase findBriefcaseForProfile(long id) {
		
		String queryString ="from BriefCase b where b.briefCaseOwner.id=:id";
		Query query = getSession().createQuery(queryString);
		query.setLong("id",id);
		BriefCase briefcase=(BriefCase)query.uniqueResult();
		System.out.println("count:--"+briefcase.getBriefcaseViewCount()); 
		return briefcase;
	}

	public BriefCase updateBriefcaseViewCount(long briefcaseProfileId) {
		System.out.println("in side hibernate briefcase");
		String queryString ="from BriefCase b where b.briefCaseOwner.id=:id";
		Query query = getSession().createQuery(queryString);
		query.setLong("id",briefcaseProfileId);
		BriefCase briefcase=(BriefCase)query.uniqueResult();
		return briefcase;
	}
	
}
