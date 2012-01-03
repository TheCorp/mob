package com.mob.view.action.employee;

import java.sql.Date;
import com.mob.model.profile.Education;
import com.mob.model.profile.Profile;
import com.mob.model.profile.SkillsDetails;
import com.mob.model.profile.WorkExperience;
import com.mob.services.BaseService;
import com.opensymphony.xwork2.ActionSupport;

public class EdiEmployeeProfileDeatails extends ActionSupport{

	private static final long serialVersionUID = 1L;
	
	private Profile profile=new Profile();
	private WorkExperience workExperience;
	
	private BaseService<Profile> profileService;
	private BaseService<WorkExperience> workExperienceService;
	
	private Education education;
	private BaseService<Education> educationService;

	
	private long[] id;
	private String[] employerName;
	private String[] description;
	private Date[] workStart;
	private Date[] workEnd;
	private String[] newEmployerName;
	private String[] newDescription;
	private Date[] newWorkStart;
	private Date[] newWorkEnd;
	
	private String[] newSchoolName;
	private String[] newDegree;
	private Date[] newEducationStart;
	private Date[] newEducationEnd;
	private String[] newConcentration;
	private String[] newGpa;
	private String[] newHonors;
	
	private long[] education_id;
	private String[] schoolName;
	private String[] degree;
	private Date[] courseStart;
	private Date[] courseEnd;
	private String[] concentration;
	private String[] gpa;
	private String[] honors;
	
	private long[] delexperiencerow;
	private long[] deleteeducationrow;
	private long[] deltrainingrow;

	
	private SkillsDetails skillsDetails;
	private BaseService<SkillsDetails> skillsDetailsService;
	
	private long[] skillId;
	private String[] experience;
	private String[] notes;
	private String[] level;
	private String[] skillName;
	
	private long[] delskillrow;
	
	
	private String[]newSkillName;
	private String[] newExperience;
	private String[] newLevel;
	private String[] newNotes;
	private String name;
	
	public String editEmployeeProfileDetails(){
		profile = profileService.findByPrimaryKey(profile,profile.getId());
		profileService.update(profile);
		if (employerName != null) {
			for (int i = 0; i < employerName.length; i++) {
				workExperience = new WorkExperience();
				this.workExperience.setId(id[i]);
				this.workExperience.setEmployerName(employerName[i]);
				this.workExperience.setDescription(description[i]);
				this.workExperience.setWorkStart(workStart[i]);
				this.workExperience.setWorkEnd(workEnd[i]);
				workExperience.setWorkExperienceProfile(profile);
				workExperienceService.update(workExperience);
			}
		}
		
		if (newEmployerName != null) {

			for (int i = 0; i < newEmployerName.length; i++) {
				workExperience = new WorkExperience();
				this.workExperience.setEmployerName(newEmployerName[i]);
				this.workExperience.setDescription(newDescription[i]);
				this.workExperience.setWorkStart(newWorkStart[i]);
				this.workExperience.setWorkEnd(newWorkEnd[i]);
				workExperience.setWorkExperienceProfile(profile);
				workExperienceService.create(workExperience);

			}
		}

		if (delexperiencerow != null) {
			for (int i = 0; i < delexperiencerow.length; i++) {
				workExperience = new WorkExperience();
				this.workExperience.setId(delexperiencerow[i]);
				workExperience.setWorkExperienceProfile(profile);
				workExperienceService.delete(workExperience);

			}
			delexperiencerow = null;
		}
	
		if (schoolName != null) {
			for (int i = 0; i < schoolName.length; i++) {
				education = new Education();
				this.education.setId(education_id[i]);
				this.education.setSchoolName(schoolName[i]);
				this.education.setDegree(degree[i]);
				this.education.setCourseStart(courseStart[i]);
				this.education.setCourseEnd(courseEnd[i]);
				this.education.setConcentration(concentration[i]);
				this.education.setGpa(gpa[i]);
				this.education.setHonors(honors[i]);
				
				education.setOwningProfile(profile);
				educationService.update(education);
				
			}
		}
		if (deleteeducationrow != null) {
			for (int i = 0; i < deleteeducationrow.length; i++) {
				education = new Education();
				this.education.setId(deleteeducationrow[i]);
				education.setOwningProfile(profile);
				educationService.delete(education);
			}

		}
		if (newSchoolName != null) {
			for (int i = 0; i < newSchoolName.length; i++) {
				education = new Education();
				this.education.setSchoolName(newSchoolName[i]);
				this.education.setDegree(newDegree[i]);
				this.education.setCourseStart(newEducationStart[i]);
				this.education.setCourseEnd(newEducationEnd[i]);
				this.education.setConcentration(newConcentration[i]);
				this.education.setGpa(newGpa[i]);
				this.education.setHonors(newHonors[i]);

				education.setOwningProfile(profile);
				educationService.create(education);

			}
		}
		

	    
	    /* Deleting Skills details from db*/
	   	if(delskillrow!=null){
	    	for(int i=0;i<delskillrow.length;i++){
	    	skillsDetails = new SkillsDetails();
	    	skillsDetails.setId(delskillrow[i]);
	    	skillsDetails.setProfileOwner(profile);
	    	skillsDetailsService.delete(skillsDetails);
	    	}
	     }
	   		
	   		
	   	/* Updating Skills details*/
	    if(skillName!=null){	
			for(int i=0;i<skillName.length;i++){				
				skillsDetails = new SkillsDetails();
				skillsDetails.setId(skillId[i]);
				skillsDetails.setLevel(level[i]);
				skillsDetails.setNotes(notes[i]);
				skillsDetails.setExperience(experience[i]);
				skillsDetails.setSkillName(skillName[i]);				
				skillsDetails.setProfileOwner(profile);
				skillsDetailsService.update(skillsDetails);					
			}
	  }
	    
	    if(newSkillName!=null){
	    	for(int j=0; j<newSkillName.length;j++){
	    		skillsDetails = new SkillsDetails();
	    		skillsDetails.setSkillName(newSkillName[j]);
	    		skillsDetails.setExperience(newExperience[j]);
	    		skillsDetails.setLevel(newLevel[j]);
	    		skillsDetails.setNotes(newNotes[j]);
	    		skillsDetails.setProfileOwner(profile);
	    		skillsDetailsService.create(skillsDetails);
	    	}
	    }
	   
		return "success";
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public WorkExperience getWorkExperience() {
		return workExperience;
	}

	public void setWorkExperience(WorkExperience workExperience) {
		this.workExperience = workExperience;
	}

	public BaseService<Profile> getProfileService() {
		return profileService;
	}

	public void setProfileService(BaseService<Profile> profileService) {
		this.profileService = profileService;
	}

	public BaseService<WorkExperience> getWorkExperienceService() {
		return workExperienceService;
	}

	public void setWorkExperienceService(
			BaseService<WorkExperience> workExperienceService) {
		this.workExperienceService = workExperienceService;
	}

	public long[] getId() {
		return id;
	}

	public void setId(long[] id) {
		this.id = id;
	}

	public String[] getEmployerName() {
		return employerName;
	}

	public void setEmployerName(String[] employerName) {
		this.employerName = employerName;
	}

	public String[] getDescription() {
		return description;
	}

	public void setDescription(String[] description) {
		this.description = description;
	}

	public Date[] getWorkStart() {
		return workStart;
	}

	public void setWorkStart(Date[] workStart) {
		this.workStart = workStart;
	}

	public Date[] getWorkEnd() {
		return workEnd;
	}

	public void setWorkEnd(Date[] workEnd) {
		this.workEnd = workEnd;
	}

	public String[] getNewEmployerName() {
		return newEmployerName;
	}

	public void setNewEmployerName(String[] newEmployerName) {
		this.newEmployerName = newEmployerName;
	}

	public String[] getNewDescription() {
		return newDescription;
	}

	public void setNewDescription(String[] newDescription) {
		this.newDescription = newDescription;
	}

	public Date[] getNewWorkStart() {
		return newWorkStart;
	}

	public void setNewWorkStart(Date[] newWorkStart) {
		this.newWorkStart = newWorkStart;
	}

	public Date[] getNewWorkEnd() {
		return newWorkEnd;
	}

	public void setNewWorkEnd(Date[] newWorkEnd) {
		this.newWorkEnd = newWorkEnd;
	}

	public long[] getDelexperiencerow() {
		return delexperiencerow;
	}

	public void setDelexperiencerow(long[] delexperiencerow) {
		this.delexperiencerow = delexperiencerow;
	}

	public long[] getDeleteeducationrow() {
		return deleteeducationrow;
	}

	public void setDeleteeducationrow(long[] deleteeducationrow) {
		this.deleteeducationrow = deleteeducationrow;
	}

	public long[] getDeltrainingrow() {
		return deltrainingrow;
	}

	public void setDeltrainingrow(long[] deltrainingrow) {
		this.deltrainingrow = deltrainingrow;
	}

	public Education getEducation() {
		return education;
	}

	public void setEducation(Education education) {
		this.education = education;
	}

	public BaseService<Education> getEducationService() {
		return educationService;
	}

	public void setEducationService(BaseService<Education> educationService) {
		this.educationService = educationService;
	}

	public String[] getNewSchoolName() {
		return newSchoolName;
	}

	public void setNewSchoolName(String[] newSchoolName) {
		this.newSchoolName = newSchoolName;
	}

	public String[] getNewDegree() {
		return newDegree;
	}

	public void setNewDegree(String[] newDegree) {
		this.newDegree = newDegree;
	}

	public Date[] getNewEducationStart() {
		return newEducationStart;
	}

	public void setNewEducationStart(Date[] newEducationStart) {
		this.newEducationStart = newEducationStart;
	}

	public Date[] getNewEducationEnd() {
		return newEducationEnd;
	}

	public void setNewEducationEnd(Date[] newEducationEnd) {
		this.newEducationEnd = newEducationEnd;
	}

	public String[] getNewConcentration() {
		return newConcentration;
	}

	public void setNewConcentration(String[] newConcentration) {
		this.newConcentration = newConcentration;
	}

	public String[] getNewGpa() {
		return newGpa;
	}

	public void setNewGpa(String[] newGpa) {
		this.newGpa = newGpa;
	}

	public String[] getNewHonors() {
		return newHonors;
	}

	public void setNewHonors(String[] newHonors) {
		this.newHonors = newHonors;
	}

	public long[] getEducation_id() {
		return education_id;
	}

	public void setEducation_id(long[] education_id) {
		this.education_id = education_id;
	}

	public String[] getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String[] schoolName) {
		this.schoolName = schoolName;
	}

	public String[] getDegree() {
		return degree;
	}

	public void setDegree(String[] degree) {
		this.degree = degree;
	}

	public Date[] getCourseStart() {
		return courseStart;
	}

	public void setCourseStart(Date[] courseStart) {
		this.courseStart = courseStart;
	}

	public Date[] getCourseEnd() {
		return courseEnd;
	}

	public void setCourseEnd(Date[] courseEnd) {
		this.courseEnd = courseEnd;
	}

	public String[] getConcentration() {
		return concentration;
	}

	public void setConcentration(String[] concentration) {
		this.concentration = concentration;
	}

	public String[] getGpa() {
		return gpa;
	}

	public void setGpa(String[] gpa) {
		this.gpa = gpa;
	}

	public String[] getHonors() {
		return honors;
	}

	public void setHonors(String[] honors) {
		this.honors = honors;
	}

	public SkillsDetails getSkillsDetails() {
		return skillsDetails;
	}

	public void setSkillsDetails(SkillsDetails skillsDetails) {
		this.skillsDetails = skillsDetails;
	}

	public BaseService<SkillsDetails> getSkillsDetailsService() {
		return skillsDetailsService;
	}

	public void setSkillsDetailsService(
			BaseService<SkillsDetails> skillsDetailsService) {
		this.skillsDetailsService = skillsDetailsService;
	}

	public long[] getSkillId() {
		return skillId;
	}

	public void setSkillId(long[] skillId) {
		this.skillId = skillId;
	}

	public String[] getExperience() {
		return experience;
	}

	public void setExperience(String[] experience) {
		this.experience = experience;
	}

	public String[] getNotes() {
		return notes;
	}

	public void setNotes(String[] notes) {
		this.notes = notes;
	}

	public String[] getLevel() {
		return level;
	}

	public void setLevel(String[] level) {
		this.level = level;
	}

	public String[] getSkillName() {
		return skillName;
	}

	public void setSkillName(String[] skillName) {
		this.skillName = skillName;
	}

	public long[] getDelskillrow() {
		return delskillrow;
	}

	public void setDelskillrow(long[] delskillrow) {
		this.delskillrow = delskillrow;
	}

	public String[] getNewSkillName() {
		return newSkillName;
	}

	public void setNewSkillName(String[] newSkillName) {
		this.newSkillName = newSkillName;
	}

	public String[] getNewExperience() {
		return newExperience;
	}

	public void setNewExperience(String[] newExperience) {
		this.newExperience = newExperience;
	}

	public String[] getNewLevel() {
		return newLevel;
	}

	public void setNewLevel(String[] newLevel) {
		this.newLevel = newLevel;
	}

	public String[] getNewNotes() {
		return newNotes;
	}

	public void setNewNotes(String[] newNotes) {
		this.newNotes = newNotes;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
