package com.mob.dao.hibernate;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.mob.dao.EmployeeProfileDao;

import com.mob.model.User;
import com.mob.model.profile.Education;
import com.mob.model.profile.Industry;
import com.mob.model.profile.PhysicalTraits;
import com.mob.model.profile.Profile;
import com.mob.model.profile.SkillsDetails;
import com.mob.model.profile.Training;
import com.mob.model.profile.WorkExperience;

public class EmployeeProfileHibernateDao extends HibernateDaoSupport implements EmployeeProfileDao{

	public List<Profile> findByUserProfiles(Profile t, long id) {
		
		String queryString = "from Profile p where p.profileOwner.id= :id and p.flagdelete=false";
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
	}

	public List<Education> findEducationList(Education t, long id) {
		
		String queryString = "from Education e where e.owningProfile.id= :id ";
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
	}

	public List<WorkExperience> findExperienceList(WorkExperience t, long id) {
		
		String queryString = "from WorkExperience w where w.workExperienceProfile.id= :id ";		
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
	}

	public List<Training> findTrainingList(Training t, long id) {
		
		String queryString = "from Training t where t.trainingProfile.id= :id ";		
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
	}

	public List findUserSkillsList(SkillsDetails t, long id) {
		
		String queryString = "from SkillsDetails s where s.profileOwner.id= :id ";		
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
	}

	public List findUserPhysicalTraits(PhysicalTraits t, long id) {
		String queryString = "from PhysicalTraits p where p.profileOwner.id= :id ";		
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
	}

	public Profile viewProfileCount(Profile p, long id) {
		
		 return	(Profile)getHibernateTemplate().get(p.getClass(),id);
	}

	public void updateProfile(Profile p) {
		getHibernateTemplate().update(p);
		
	}

	public void delete(Profile profile) {
		getHibernateTemplate().delete(profile);		
	}

	public List getIndustryList(Industry i, long id) {
		// TODO Auto-generated method stub
		return null;
	}

	public List getCategories(long id) {
		// TODO Auto-generated method stub
		String queryString = "from SkillsCategory s where s.industry.id like :id ";
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
	}

	public List getSkillsList(long id) {
		String queryString ="from Skills s where s.category.id like :id";
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
	}

	public Industry getIndustryForCategories(String industryName) {
		// TODO Auto-generated method stub
		return null;
	}

	public Profile getDefaultProfileForUser(long id) {
		//there is no default profile id concept now
		String queryString ="from Profile p where p.status like 'default' and p.profileOwner.id like :id";
		Query query = getSession().createQuery(queryString);
		query.setLong("id",id);
		Profile profile=(Profile)query.uniqueResult();
		return profile;
	}


	public void savePhysicalTraits(PhysicalTraits physicalTraits) {
		// TODO Auto-generated method stub
		
	}


	public PhysicalTraits getphysicalTraitsForUser(long id) {
		
		String queryString ="from PhysicalTraits p where p.profileOwner.id like :id";
		Query query = getSession().createQuery(queryString);
		query.setLong("id",id);
		PhysicalTraits physicalTraits=(PhysicalTraits)query.uniqueResult();
		return physicalTraits;
	}

	
	public List findSkillListBySearchKey(String skillsName) {
		 SessionFactory sessionFactory = getHibernateTemplate().getSessionFactory();
	     Session session = sessionFactory.openSession();
	     Query query = session.createQuery("from SkillsNeeded s where s.skillname like :name");
	     query.setString("name", "%" + skillsName + "%");
	     List result = query.list();
	     session.close();
		 return result;
	}

	

	

}
