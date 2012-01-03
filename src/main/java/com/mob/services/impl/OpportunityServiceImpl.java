package com.mob.services.impl;

import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.mob.dao.BaseDao;
import com.mob.dao.OpportunityDao;
import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.model.profile.Profile;
import com.mob.model.profile.WorkExperience;
import com.mob.model.profile.EmployerProfile;
import com.mob.services.OpportunityService;
import com.mob.util.MOBLogger;

public class OpportunityServiceImpl implements OpportunityService {
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(OpportunityServiceImpl.class);

	private OpportunityDao opportunityDao;	
	private BaseDao<Profile> profileBaseDao;

	public BaseDao<Profile> getProfileBaseDao() {
		return profileBaseDao;
	}

	public void setProfileBaseDao(BaseDao<Profile> profileBaseDao) {
		this.profileBaseDao = profileBaseDao;
	}

	public OpportunityDao getOpportunityDao() {
		return opportunityDao;
	}

	public void setOpportunityDao(OpportunityDao opportunityDao) {
		this.opportunityDao = opportunityDao;
	}

	@Transactional (propagation=Propagation.REQUIRED,readOnly=false)
	public List findListOpportunities(long id) {
		return  opportunityDao.findListOpportunities(id);
	}
	
	@Transactional (propagation=Propagation.REQUIRED,readOnly=false)
	public List findOpportunitySkillsList(long id) {
		return opportunityDao.findOpportunitySkillsList(id);
	}
	public List findInterestedEmployeeProfiles(long id) {
		return this.opportunityDao.findInterestedEmployeeProfiles(id);
	}

    @Transactional (propagation=Propagation.REQUIRED,readOnly=false)
	public Profile findEmployeeProfileForView(Profile p,long id) {
		LOGGER.info("Inside findEmployeeProfileForView");
		long count=0;
		Profile existingProfile = new Profile();
		existingProfile = profileBaseDao.findByPrimaryKey(existingProfile,id);
		LOGGER.info("existingProfile"+existingProfile.getViewCount());	
		count = existingProfile.getViewCount();
		count =count+1;
		existingProfile.setViewCount(count);
		profileBaseDao.update(existingProfile);
		
		return profileBaseDao.findByPrimaryKey(p, id);
	}

	public List findEmployeeWorkExperience(WorkExperience e, long id) {
		
		return this.opportunityDao.findEmployeeWorkExperience(e, id);
	}

	public List findBookMarkerEmployeeProfiles(long id) {
		
		return this.opportunityDao.findBookMarkerEmployeeProfiles(id);
	}

	public List findListEmpPropiles(long id) {
		// TODO Auto-generated method stub
		return this.opportunityDao.findListEmpPropiles(id);
	}
  
	public List findAppliedEmployeeProfiles(long id) {
		// TODO Auto-generated method stub
		return this.opportunityDao.findAppliedEmployeeProfiles(id);
	}

	public List findMarkAsFavoriteList(long id) {
		// TODO Auto-generated method stub
		return this.opportunityDao.findMarkAsFavoriteList(id);
	}
	@Transactional (propagation=Propagation.REQUIRED,readOnly=false)
	public Employer getEmployerForOpportunity(long opportunityId) {
		// TODO Auto-generated method stub
		return this.opportunityDao.getEmployerForOpportunity(opportunityId);
	}

    public List<Opportunity> findAllOpportunitiesForEmployer(Employer employer) {
        return this.opportunityDao.findOpportunitiesCreatedByEmployer(employer);
    }

    public int[] getInterestsAndApplicationCountForOpportunity(Opportunity opportunity) {
        int interests = this.opportunityDao.findCountOfApplicationsForOpportunity(opportunity);
        int bookmarks = this.opportunityDao.findCountOfFavoriteForOpportunity(opportunity);
        int[] counts = new int[2];
        counts[0] = interests;
        counts[1] = bookmarks;
        return counts;
    }

    public boolean hasProfileAppliedForOpportunityByEmployerProfile(long employeeProfileId,
                                                                    EmployerProfile oppOwnerProfile) {
        return this.opportunityDao.findIfProfileAppliedForOpportunityByEmployerProfile(employeeProfileId,oppOwnerProfile);  //To change body of implemented methods use File | Settings | File Templates.
    }
}