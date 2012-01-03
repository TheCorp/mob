package com.mob.services.impl;

import com.mob.dao.BaseDao;
import com.mob.dao.EmployeeOpportunityDao;
import com.mob.dao.ProfileDao;
import com.mob.model.employer.Opportunity;
import com.mob.model.profile.Profile;
import com.mob.services.EmployeeOpportunityService;
import com.mob.services.MessagingService;
import com.mob.services.NewsManager;
import com.mob.util.MOBLogger;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import javax.mail.MessagingException;

public class EmployeeOpportunityServiceImpl implements
		EmployeeOpportunityService {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EmployeeOpportunityServiceImpl.class);

	private EmployeeOpportunityDao empDao;
	private BaseDao<Opportunity> opportunityBaseDao;
	private BaseDao<Profile> profileBaseDao;
    private NewsManager newsManager;
    private ProfileDao profileDao;
    private MessagingService messagingService;

    public void setMessagingService(MessagingService messagingService) {
        this.messagingService = messagingService;
    }

    public void setProfileDao(ProfileDao profileDao) {
        this.profileDao = profileDao;
    }

    public void setNewsManager(NewsManager newsManager) {
        this.newsManager = newsManager;
    }

    @Transactional (propagation=Propagation.REQUIRED,
			readOnly=false)
	public void applyForOpportunity(long interestedEmployeeProfileId,long opportunityId) {
		LOGGER.info("Inside applyForOpportunity" );
		
		Profile employeeProfile=new Profile();
		Opportunity opportunity=new Opportunity();
		
        employeeProfile=profileBaseDao.findByPrimaryKey(employeeProfile,interestedEmployeeProfileId);
		opportunity=opportunityBaseDao.findByPrimaryKey(opportunity,opportunityId);
		
		opportunity.getInterestedEmployeeProfileOwner().add(employeeProfile);
		
		long interestCount=0;
		Opportunity existingOpportunity=new Opportunity();
		existingOpportunity=opportunityBaseDao.findByPrimaryKey(existingOpportunity,opportunity.getId());
		interestCount=existingOpportunity.getInterestCount();
		
		this.empDao.applyForOpportunity(opportunity);
		
		interestCount=interestCount+1;
		opportunity.setInterestCount(interestCount);
		opportunityBaseDao.update(opportunity);
        if(newsManager != null){
            newsManager.employeeAppliedForOpportunity(employeeProfile.getId(),
                opportunity.getId());
        }
        Profile opportunityOwnerProfile = opportunity.getProfileOwner();
        String message = employeeProfile.getName() + " has shown interest in the opportunity " + opportunity.getTitle();
        try {
            this.messagingService.sendMessage(employeeProfile,opportunityOwnerProfile,"Interest in opportunity",
                    message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }
		
	@Transactional (propagation=Propagation.REQUIRED,
			readOnly=false)
	public void bookMarkOpportunity(long bookmarkedEmployeeid,long opportunityId) {
		LOGGER.info("Inside bookMarkOpportunity" );
		
		Profile employeeProfile=new Profile();
		Opportunity opportunity=new Opportunity();
		
		employeeProfile=profileBaseDao.findByPrimaryKey(employeeProfile,bookmarkedEmployeeid);
		opportunity=opportunityBaseDao.findByPrimaryKey(opportunity,opportunityId);
		
		opportunity.getBookMarkEmployeeProfileOwner().add(employeeProfile);	
		
		long bookMarkCount=0;
		Opportunity existingOpportunity=new Opportunity();
		existingOpportunity=opportunityBaseDao.findByPrimaryKey(existingOpportunity,opportunity.getId());
		bookMarkCount=existingOpportunity.getBookMarkCount();
		 
		this.empDao.bookMarkOpportunity(opportunity);
		
		bookMarkCount=bookMarkCount+1;
		opportunity.setBookMarkCount(bookMarkCount);
		opportunityBaseDao.update(opportunity);
        if(newsManager != null){
            newsManager.employeeMarkedOpportunityAsFavorite(employeeProfile.getId(),
                opportunity.getId());
        }
        Profile opportunityOwnerProfile = opportunity.getProfileOwner();
        String message = employeeProfile.getName() + " has marked the opportunity " + opportunity.getTitle() + " as a favorite.";
        try {
            this.messagingService.sendMessage(employeeProfile,opportunityOwnerProfile,"Opportunity marked as favorite",
                    message);
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }


    }
	
	public EmployeeOpportunityDao getEmpDao() {
		return empDao;
	}

	public void setEmpDao(EmployeeOpportunityDao empDao) {
		this.empDao = empDao;
	}



	public BaseDao<Opportunity> getOpportunityBaseDao() {
		return opportunityBaseDao;
	}


	public void setOpportunityBaseDao(BaseDao<Opportunity> opportunityBaseDao) {
		this.opportunityBaseDao = opportunityBaseDao;
	}


	public BaseDao<Profile> getProfileBaseDao() {
		return profileBaseDao;
	}


	public void setProfileBaseDao(BaseDao<Profile> profileBaseDao) {
		this.profileBaseDao = profileBaseDao;
	}
}
