package com.mob.services;

import java.util.List;

import com.mob.model.employer.Employer;
import com.mob.model.profile.Education;
import com.mob.model.profile.Profile;
import com.mob.model.profile.WorkExperience;

public interface ProfileService {
	public void updatePersonalDetails(Profile profile);
	public void updateEducationDetails(Education education);
	public void updateWorkExperienceDetails(WorkExperience workExperience);
	public Profile findByProfilePrimaryKey(Profile profile,long id );
	public void delete(Profile profile);
	public void deleteEducationDetails(Education education,long id);
	public void deleteWorkExperience(WorkExperience experience,long id);
    public Profile getInterestedEmployeeProfileDetails(Employer viewer, long employeeId);
    public List<String> listStates();
}
