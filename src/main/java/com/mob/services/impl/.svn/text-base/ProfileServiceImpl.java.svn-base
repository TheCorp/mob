package com.mob.services.impl;

import java.util.ArrayList;
import java.util.List;

import com.mob.dao.ProfileDao;
import com.mob.model.employer.Employer;
import com.mob.model.profile.Education;
import com.mob.model.profile.Profile;
import com.mob.model.profile.WorkExperience;
import com.mob.services.NewsManager;
import com.mob.services.ProfileService;
import com.mob.util.MOBLogger;

public class ProfileServiceImpl implements ProfileService {
    private static final MOBLogger LOGGER =
              new MOBLogger(ProfileServiceImpl.class);



    private ProfileDao profileDao;
    private NewsManager newsManager;

    public void setNewsManager(NewsManager newsManager) {
        this.newsManager = newsManager;
    }

    public void updatePersonalDetails(Profile profile) {

		this.profileDao.updateEmployeePersonalDetails(profile);

	}

	public Profile findByProfilePrimaryKey(Profile profile, long id) {
		// TODO Auto-generated method stub
		return profileDao.findByProfilePrimaryKey(profile, id);
	}

	public ProfileDao getProfileDao() {
		return profileDao;
	}

	public void setProfileDao(ProfileDao profileDao) {
		this.profileDao = profileDao;
	}

	public void delete(Profile profile) {
		profileDao.delete(profile);
	}

	public void updateEducationDetails(Education education) {
		profileDao.updateEducationDetails(education);

	}

	public void updateWorkExperienceDetails(WorkExperience workExperience) {
		profileDao.updateWorkExperienceDetails(workExperience);

	}

	public void deleteEducationDetails(Education education, long id) {
		profileDao.deleteEducationDetails(education, id);
	}

	public void deleteWorkExperience(WorkExperience experience, long id) {
		profileDao.deleteWorkExperience(experience, id);

	}

    public Profile getInterestedEmployeeProfileDetails(Employer viewer, long employeeProfileId) {
        Profile profile = profileDao.findProfileWithExperienceDetails(employeeProfileId);
        
        if(this.newsManager != null){
            LOGGER.info("Profile viewed by employer");
            this.newsManager.employerViewedEmployeeProfile(viewer.getId(), new long[]{employeeProfileId});
        }else{
            LOGGER.info("No news manager configured");
        }
        return profile;
    }
    public List<String> listStates(){
    	List<String> states =new ArrayList<String>();
	    states.add("AL");
	    states.add("AK");
	    states.add("AZ");
	    states.add("AR");
	    
	    states.add("CA");
	    states.add("CO");
	    states.add("CT");
	    states.add("DE");
	    states.add("FL");
	    
	    states.add("GA");
	    states.add("HI");
	    states.add("ID");
	    states.add("IL");
	    states.add("IN");
	    
	    states.add("IA");
	    states.add("KS");
	    states.add("KY");
	    states.add("LA");
	    
	    states.add("ME");
	    states.add("MD");
	    states.add("MA");
	    states.add("MI");
	    states.add("MN");
	    states.add("MS");
	    states.add("MO");
	    states.add("MT");
	    states.add("NE");
	    states.add("NV");
	  
	  
	    states.add("NH");
	    states.add("MD");
	    
	    states.add("NM");
	    states.add("NY");
	    states.add("NC");
	    states.add("ND");
	    states.add("OH");
	    states.add("OK");
	    states.add("OR");
	    states.add("PA");
	    states.add("RI");
	    states.add("SC");
	    states.add("SD");
	    states.add("TN");
	    states.add("TX");
	    states.add("UT");
	    states.add("VT");
	    states.add("VA");
	    states.add("WA");
	    states.add("WV");
	    states.add("WI");
	    states.add("WY");
	    
	    return states;
    }

}
