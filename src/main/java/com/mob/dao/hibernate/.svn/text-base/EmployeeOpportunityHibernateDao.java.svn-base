package com.mob.dao.hibernate;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mob.dao.EmployeeOpportunityDao;
import com.mob.model.employer.Opportunity;

public class EmployeeOpportunityHibernateDao extends HibernateDaoSupport implements EmployeeOpportunityDao {
	
	public void bookMarkOpportunity(Opportunity opportunity) {
		
	getHibernateTemplate().update(opportunity);
	}
	
	public void applyForOpportunity(Opportunity opportunity) {
		
		getHibernateTemplate().update(opportunity);
		
	}

}
