package com.mob.view.action.employee;

import com.mob.model.User;
import com.mob.model.profile.Education;
import com.mob.model.profile.Profile;
import com.mob.model.profile.SkillsDetails;
import com.mob.model.profile.Training;
import com.mob.model.profile.WorkExperience;
import com.mob.services.BaseService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;


public class EmployeeProfileAccountAction extends ActionSupport{

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EmployeeProfileAccountAction.class);

	private Profile profile;
	private BaseService<Profile> profileService;
	private User user;
	
	private WorkExperience workExperience;
	private BaseService<WorkExperience> workExperienceService;
	
	private Education education;
	private BaseService<Education> educationService;
	
	
	private SkillsDetails skillsDetails;
	private BaseService<SkillsDetails> skillsDetailsService;
	
	private Training training;
	private BaseService<Training> trainingService;
	
	private String[] experience;
	private String[] notes;
	private String[] level;
	private String[] skills;
	

	public String create(){
		LOGGER.info("Inside create" );
	    profile.setProfileOwner(user);
	   // profileService.create(profile);	
	   
	 
		if(skills!=null){
			for(int i=0;i<skills.length;i++){
				skillsDetails = new SkillsDetails();
				skillsDetails.setLevel(level[i]);
				LOGGER.info("level:"+level[i]);
				skillsDetails.setNotes(notes[i]);
				skillsDetails.setExperience(experience[i]);
				skillsDetails.setSkillName(skills[i]);
				
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


	public BaseService<Profile> getProfileService() {
		return profileService;
	}


	public void setProfileService(BaseService<Profile> profileService) {
		this.profileService = profileService;
	}


	public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}


	public WorkExperience getWorkExperience() {
		return workExperience;
	}


	public void setWorkExperience(WorkExperience workExperience) {
		this.workExperience = workExperience;
	}


	public BaseService<WorkExperience> getWorkExperienceService() {
		return workExperienceService;
	}


	public void setWorkExperienceService(
			BaseService<WorkExperience> workExperienceService) {
		this.workExperienceService = workExperienceService;
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


	public String[] getSkills() {
		return skills;
	}


	public void setSkills(String[] skills) {
		this.skills = skills;
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


	public Training getTraining() {
		return training;
	}


	public void setTraining(Training training) {
		this.training = training;
	}


	public BaseService<Training> getTrainingService() {
		return trainingService;
	}


	public void setTrainingService(BaseService<Training> trainingService) {
		this.trainingService = trainingService;
	}


	
	
		
}
