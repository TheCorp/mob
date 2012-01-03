package com.mob.services.impl;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import com.mob.dao.BaseDao;
import com.mob.dao.SearchDao;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.model.group.Group;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Profile;
import com.mob.model.profile.WorkExperience;
import com.mob.services.SearchService;
import com.mob.util.MOBLogger;

public class SearchServiceImpl implements SearchService{
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(SearchServiceImpl.class);

	private SearchDao searchDao;
	private BaseDao<Opportunity> baseDao;
	private BaseDao<Profile> profileBaseDao;
	private BaseDao<EmployerProfile> employerProfileBaseDao;

	
	public SearchDao getSearchDao() {
		return searchDao;
	}

	public void setSearchDao(SearchDao searchDao) {
		this.searchDao = searchDao;
	}

	public BaseDao<Opportunity> getBaseDao() {
		return baseDao;
	}

	public void setBaseDao(BaseDao<Opportunity> baseDao) {
		this.baseDao = baseDao;
	}
	

	public List findOpportunities(String position,String location,String skills,String additionalKeyword, String additionalSkillNames) {
		
		return this.searchDao.findOpportunities(position, location, skills,additionalKeyword,additionalSkillNames);
	}
	
	@Transactional (propagation=Propagation.REQUIRED,
			readOnly=false)
	public Opportunity loadForViewOpportunity(Opportunity opportunity, long id) {
		LOGGER.info("Inside loadForViewOpportunity");
		long viewOppCount=0;
		Opportunity existingOpportunity=new Opportunity();
		existingOpportunity=baseDao.findByPrimaryKey(existingOpportunity,id);
		viewOppCount=existingOpportunity.getViewOppCount();
		viewOppCount=viewOppCount+1;
		existingOpportunity.setViewOppCount(viewOppCount);
		baseDao.update(existingOpportunity);
		
		return this.baseDao.findByPrimaryKey(opportunity, id);
	}
	
	public List<Opportunity> findOpportunitySkills(long id) {
		return this.searchDao.findOpportunitySkills(id);
	}

	public List findByAllProfiles() {
		return this.searchDao.findByAllProfiles();
	}

	public List findListOfEmployees(String ProfileName,String location) {
		return this.searchDao.findListOfEmployees(ProfileName,location);
	}
	
	
	

	public List findListOfEmployers(String employerName, String employerLocation) {
		return this.searchDao.findListOfEmployers(employerName, employerLocation);
	}

	public List findListOfEmployerProfiles(EmployerProfile employerProfile,long id) {
		
		return this.searchDao.findListOfEmployerProfiles(employerProfile,id);
		
	}

	public List findListOfEmployeeProfiles(Profile employeeProfile, long id) {
		
		return this.searchDao.findListOfEmployeeProfiles(employeeProfile,id);
	}
	public List findEmployeeWorkExperience(WorkExperience experience,long id) {
		
		return this.searchDao.findEmployeeWorkExperience(experience, id);
	}
	public List findListContacts(long id) {
        Profile profile = new Profile();
        profile.setId(id);
        return searchDao.findContactsForProfile(profile);
	}
	@Transactional (propagation=Propagation.REQUIRED,readOnly=false)
	public Profile findEmployeeProfileForView(Profile employeeProfile,long employeeProfileId) {
		LOGGER.info("Inside findEmployeeProfileForView");
		long count=0;
		Profile existingProfile = new Profile();
		existingProfile = profileBaseDao.findByPrimaryKey(existingProfile,employeeProfileId);
		LOGGER.info("existingProfile"+existingProfile.getViewCount());	
		count = existingProfile.getViewCount();
		count =count+1;
		existingProfile.setViewCount(count);
		profileBaseDao.update(existingProfile);
		return this.profileBaseDao.findByPrimaryKey(employeeProfile,employeeProfileId);
	}
	public BaseDao<Profile> getProfileBaseDao() {
		return profileBaseDao;
	}
	public void setProfileBaseDao(BaseDao<Profile> profileBaseDao) {
		this.profileBaseDao = profileBaseDao;
	}
	@Transactional (propagation=Propagation.REQUIRED,readOnly=false)
	public EmployerProfile findEmployerProfileForView(EmployerProfile employerProfile, long employerProfileId) {
		LOGGER.info("Inside findEmployerProfileForView");
		long count=0;
		EmployerProfile existingProfile = new EmployerProfile();
		
		existingProfile = employerProfileBaseDao.findByPrimaryKey(existingProfile,employerProfileId);
		LOGGER.info("existingProfile"+existingProfile.getViewCount());	
		count = existingProfile.getViewCount();
		count =count+1;
		existingProfile.setViewCount(count);
		employerProfileBaseDao.update(existingProfile);
		return this.employerProfileBaseDao.findByPrimaryKey(employerProfile,employerProfileId);
	}

	public BaseDao<EmployerProfile> getEmployerProfileBaseDao() {
		return employerProfileBaseDao;
	}

	public void setEmployerProfileBaseDao(
			BaseDao<EmployerProfile> employerProfileBaseDao) {
		this.employerProfileBaseDao = employerProfileBaseDao;
	}

	public List<EmployerProfile> findAllEmployer(String name) {
		// TODO Auto-generated method stub
		return searchDao.findAllEmployer(name);
	}
	@Transactional (propagation=Propagation.REQUIRED,readOnly=false)
	public List<Employer> findAllEmployerList(String name) {
		// TODO Auto-generated method stub
		return searchDao.findAllEmployerList(name);
	}
	/*public List<User> findAllEmployees(String name) {
		// TODO Auto-generated method stub
		return searchDao.findAllEmployees(name);
	}
	*/
	
	public List<Profile> findAllEmployeeProfilesFromSearch(String name){
		return searchDao.findAllEmployeeProfilesFromSearch(name);
	}	
	public List<Opportunity> findAllOpportunities(String search) {
		// TODO Auto-generated method stub
		return searchDao.findAllOpportunities(search);
	}

	public List<Opportunity> findEmployerOpportunities(long id) {
		// TODO Auto-generated method stub
		return searchDao.findEmployerOpportunities(id);
	}

	public List<Group> findAllGroupsFromSearch(String name,User user) {
	return searchDao.findAllGroupsFromSearch(name,user);

	}

}
