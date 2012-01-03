package com.mob.dao.hibernate;

import com.mob.dao.BaseDao;
import com.mob.dao.OpportunityDao;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Profile;
import com.mob.model.profile.WorkExperience;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import java.util.List;

public class OpportunityHibernateDao extends HibernateDaoSupport implements OpportunityDao {
	
	private BaseDao<User> userDao;
	private BaseDao<Opportunity> opportunityBaseDao;
    private BaseDao<EmployerProfile> employerProfileBaseDao;

    public void setEmployerProfileBaseDao(BaseDao<EmployerProfile> employerProfileBaseDao) {
        this.employerProfileBaseDao = employerProfileBaseDao;
    }

    public void setOpportunityBaseDao(BaseDao<Opportunity> opportunityBaseDao) {
        this.opportunityBaseDao = opportunityBaseDao;
    }

    public void setUserDao(BaseDao<User> userDao) {
        this.userDao = userDao;
    }

    public List findListOpportunities(long id) {
		
		String queryString = "from Opportunity o where o.profileOwner.id= :id ";
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
	}

	public List findOpportunitySkillsList(long id) {
		
		String queryString = "from OpportunitySkills oppSkill where oppSkill.opprtunityOwner.id= :id ";		
		return getHibernateTemplate().findByNamedParam(queryString,"id",id);
	}

	public List findInterestedEmployeeProfiles(long id) {
		
		String queryString = "from Profile p join fetch p.interestOpportunityOwner o where o.id=:id";
		
		return getHibernateTemplate().findByNamedParam(queryString,"id",id);
	}

	public List findEmployeeWorkExperience(WorkExperience e, long id) {
		
		String queryString = "from WorkExperience w where w.workExperienceProfile.id= :id ";		
		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
		
	}
	
	public List findBookMarkerEmployeeProfiles(long id) {
		
		String queryString = "from Profile p join fetch p.bookMarkOpportunityOwner o where o.id=:id";
		
		return getHibernateTemplate().findByNamedParam(queryString,"id",id);
	}

	public List findListEmpPropiles(long id) {
		// TODO Auto-generated method stub
     String queryString = "from Profile p  where p.profileOwner.id=:id";
	 return getHibernateTemplate().findByNamedParam(queryString,"id",id);
	}

	
    public List findAppliedEmployeeProfiles(long id) {
		
		String queryString = "from Opportunity o join fetch o.interestedEmployeeProfileOwner pw where pw.id=:id";
		
		return getHibernateTemplate().findByNamedParam(queryString,"id",id);
	}
    
     public List findMarkAsFavoriteList(long id) {
		
		String queryString = "from Opportunity o join fetch o.bookMarkEmployeeProfileOwner bw where bw.id=:id";
		
		return getHibernateTemplate().findByNamedParam(queryString,"id",id);
	}
     
     
     public List findOpportunityOwner(long id) {
 		
 		String queryString = "from Opportunity o where o.profileOwner.id= :id ";
 		return getHibernateTemplate().findByNamedParam(queryString, "id", id);
 	}

	public Employer getEmployerForOpportunity(long opportunityId) {
		
		 EmployerProfile profile=new EmployerProfile();
	   	 User user = new Employer();
	   	 Opportunity opportunity=new Opportunity();
	   	
	   	 opportunity=opportunityBaseDao.findByPrimaryKey(opportunity,opportunityId);
	   	 profile=employerProfileBaseDao.findByPrimaryKey(profile,opportunity.getProfileOwner().getId());
	   	 user=userDao.findByPrimaryKey(user,profile.getEmployer().getId());
		 return (Employer)user;
	}

    public List<Opportunity> findOpportunitiesCreatedByEmployer(Employer employer) {
        String hql = "from Opportunity o where o.profileOwner.employer like ?";
        return getHibernateTemplate().find(hql,employer);  //To change body of implemented methods use File | Settings | File Templates.
    }

    public int findCountOfApplicationsForOpportunity(Opportunity opp) {
        String hql = "select count(interest) from Opportunity o join o.interestedEmployeeProfileOwner interest " +
                "where o.id like ?";
        List<Long> counts = getHibernateTemplate().find(hql,opp.getId());
        if(counts != null && !counts.isEmpty()){
            return counts.get(0).intValue();
        }
        return 0;  //To change body of implemented methods use File | Settings | File Templates.
    }

    public int findCountOfFavoriteForOpportunity(Opportunity opp) {
        String hql = "select count(bm) from Opportunity o join o.bookMarkEmployeeProfileOwner bm " +
                "where o.id like ?";
        List<Long> counts = getHibernateTemplate().find(hql,opp.getId());
        if(counts != null && !counts.isEmpty()){
            return counts.get(0).intValue();
        }
        return 0;  //To change body of implemented methods use File | Settings | File Templates.
    }

    public boolean findIfProfileAppliedForOpportunityByEmployerProfile(long employeeProfile, EmployerProfile oppOwnerProfile) {
        String hql = "select p from Profile p join p.interestOpportunityOwner po where po.profileOwner like ? and p.id like ?";
        List<Profile> profiles = getHibernateTemplate().find(hql, new Object[]{oppOwnerProfile,employeeProfile});
        if(profiles != null && !profiles.isEmpty()){
            return true;
        }else{
            return false;
        }
    }


}
