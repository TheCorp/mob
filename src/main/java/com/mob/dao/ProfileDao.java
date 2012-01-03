package com.mob.dao;

import com.mob.model.User;
import com.mob.model.profile.Education;
import com.mob.model.profile.Profile;
import com.mob.model.profile.WorkExperience;


public interface ProfileDao {
	
	public void updateEmployeePersonalDetails(Profile profile);
	public void updateEducationDetails(Education education);
	public void updateWorkExperienceDetails(WorkExperience workExperience);
	public Profile findByProfilePrimaryKey(Profile profile, long id);
	public void delete(Profile profile);
    public User findProfileOwner(Profile profile);
    //added on Aug 26-08-08 for deleting education details
	public void deleteEducationDetails(Education education,long id);
	public void deleteWorkExperience(WorkExperience experience,long id);
    public Profile findProfileWithExperienceDetails(long profileId);
}
