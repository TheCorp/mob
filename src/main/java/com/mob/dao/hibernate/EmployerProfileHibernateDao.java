package com.mob.dao.hibernate;

import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mob.dao.EmployerProfileDao;
import com.mob.model.employer.Employer;
import com.mob.model.profile.BriefCase;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Profile;

public class EmployerProfileHibernateDao extends HibernateDaoSupport implements
		EmployerProfileDao {

	public List findUserProfile(long id) {

		String queryString = "from EmployerProfile p where p.employer.id= :id and p.flagdelete=false";
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
	}

	public Employer loadEmployerAccInfo(long id) {

		String queryString = "from Employer p where p.id= :id";
		Query query = getSession().createQuery(queryString);
		query.setLong("id", id);
		Employer employer = (Employer) query.uniqueResult();

		return employer;

	}

	public List findemplrProfile(long id) {
		String queryString = "from Employer e where e.id= :id";
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
	}

/*
	public EmployerProfile findEmployerProfile(long id) {
		// TODO Auto-generated method stub
		return null;
	}*/


	public EmployerProfile findEmployerProfile(long id) {
		String queryString = "from EmployerProfile e where e.employer.id= :id ";
		Query query = getSession().createQuery(queryString);
		query.setLong("id", id);
		EmployerProfile employerProfile = (EmployerProfile) query.uniqueResult();
      	return employerProfile;
	}
	
	public Profile findProfileForEmployer(long id) {
		String queryString = "from EmployerProfile e where e.employer.id= :id ";
		Query query = getSession().createQuery(queryString);
		query.setLong("id", id);
		Profile profile = (Profile) query.uniqueResult();
      	return profile;
	}
	
}
