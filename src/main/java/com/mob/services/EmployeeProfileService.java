package com.mob.services;

import java.sql.Date;
import java.util.List;

import com.mob.model.profile.Education;
import com.mob.model.profile.Industry;
import com.mob.model.profile.PhysicalTraits;
import com.mob.model.profile.Profile;
import com.mob.model.profile.SkillsDetails;
import com.mob.model.profile.Training;
import com.mob.model.profile.WorkExperience;

public interface EmployeeProfileService {
	
	public List findByUserProfiles(Profile t, long id);
	public List findExperienceList(WorkExperience t,long id);
	public List findEducationList(Education t,long id); 
	public List findTrainingList(Training t,long id);
	public List findUserSkillsList(SkillsDetails t,long id);
	public List findUserPhysicalTraits(PhysicalTraits t,long id);
	
	public Profile viewProfileCount(Profile p,long id);
	public void delete(Profile profile);
	public List getCategories(long id);
	public List getSkillsList(long id);
	
	public Industry getIndustryForCategories(String industryName);
    public void modifyProfileEducationDetails(Profile profile,long[] education_id,
                      String[] schoolName,String[] degree,
                      java.sql.Date[] courseStart, java.sql.Date[] courseEnd, String[] concentration, String[] gpa, String[] honors,
                      long[] deleteeducationrow,
                      String[] newSchoolName, String[] newDegree,
                      java.sql.Date[] newEducationStart, java.sql.Date[] newEducationEnd, String[] newConcentration,
                      long[] year,String[] major,String[] minor,
                      String[] newGpa, String[] newHonors,
                      String[] newTrainingName, long[] deltrainingrow,
                      String picturePath, String pictureName
                                              ) ;
    public Profile getDefaultProfileForUser(long id);
    public PhysicalTraits getphysicalTraitsForUser(long id);
    
	public void modifyProfileDetails(Profile profile, String days1,
			String jobcategory1, String worktimeframe1, String range1,
			String salarytype1, String profileName, long[] id, String[] employerName,
			String[] description, Date[] workStart, Date[] workEnd,
			String[] newEmployerName, String[] newDescription,
			Date[] newWorkStart, Date[] newWorkEnd, long[] delexperiencerow,
			String string, String uploadFileName,String uploadContentType,String personalStatement);
	
	public void savePhysicalTraits(PhysicalTraits physicalTraits);
	public List findSkillListBySearchKey(String skillName);
	
    
}
