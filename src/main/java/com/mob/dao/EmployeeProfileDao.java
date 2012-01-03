package com.mob.dao;

import java.util.List;

import com.mob.model.profile.Education;
import com.mob.model.profile.Industry;
import com.mob.model.profile.PhysicalTraits;
import com.mob.model.profile.Profile;
import com.mob.model.profile.SkillsDetails;
import com.mob.model.profile.Training;
import com.mob.model.profile.WorkExperience;

public interface EmployeeProfileDao {
	
	public List findByUserProfiles(Profile t, long id);
	public List findExperienceList(WorkExperience t,long id);
	public List findEducationList(Education t,long id); 
	public List findTrainingList(Training t,long id); 
	public List findUserSkillsList(SkillsDetails t,long id);
	public List findUserPhysicalTraits(PhysicalTraits t,long id);
	
	public Profile viewProfileCount(Profile p,long id);
	public void updateProfile(Profile p);
	public void delete(Profile profile);
	public List getCategories(long id);
	public List getSkillsList(long id);
	
	public Industry getIndustryForCategories(String industryName);
	public Profile getDefaultProfileForUser(long id);
	public PhysicalTraits getphysicalTraitsForUser(long id);
	public void savePhysicalTraits(PhysicalTraits physicalTraits);
	public List findSkillListBySearchKey(String skillsName); 
	
}
