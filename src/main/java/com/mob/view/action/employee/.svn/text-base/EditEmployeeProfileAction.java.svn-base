package com.mob.view.action.employee;

import com.mob.dto.ProfileSession;
import com.mob.model.User;
import com.mob.model.profile.Education;
import com.mob.model.profile.Industry;
import com.mob.model.profile.PhysicalTraits;
import com.mob.model.profile.Profile;
import com.mob.model.profile.SkillsCategory;
import com.mob.model.profile.SkillsDetails;
import com.mob.model.profile.Training;
import com.mob.model.profile.WorkExperience;
import com.mob.services.BaseService;
import com.mob.services.EmployeeProfileService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class EditEmployeeProfileAction 
	extends ActionSupport{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EditEmployeeProfileAction.class);

	private Profile profile;
	private ProfileSession profileSession;
	private Education education;
	private WorkExperience workExperience;
	private Training training;
	
	private BaseService<Profile> profileService;
	private BaseService<Education> educationService;
	private BaseService<Training> trainingService;
	private BaseService<WorkExperience> workExperienceService;
	
	
	private SkillsDetails skillsDetails;
	private BaseService<SkillsDetails> skillsDetailsService;
	private BaseService<Industry> industryBaseService;
	private BaseService<SkillsCategory> skillsCategoryBaseService;
	private BaseService<PhysicalTraits> physicalTraitsService;
    private PhysicalTraits physicalTraits;
	
	private long[] id;
	private String[] experience;
	private String[] notes;
	private String[] level;
	private String[] skillName;
	
	private long[] delskillrow;
	
	
	private String[]newSkillName;
	private String[] newExperience;
	private String[] newLevel;
	private String[] newNotes;
	private String[] newCategoryName;
	private String[] categoryName;
	private String name;
	
	private String height;
	private String measurements;
	private int weight;
	private int shoesize;
	private String build;
	private String haircolor;
	private String eyecolor;
	private String ethnicity;
	private String others;
	private String additionalnotes;
	
	private String industryName;
	 private EmployeeProfileService employeeProfileService;
	
	private Industry industry;
	private  SkillsCategory category;
	private int categoryId;
	
	
	private User user;
	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public void setProfileService(BaseService<Profile> profileService) {
		this.profileService = profileService;
	}
	public String updateProfile(){
		LOGGER.info("Inside updateProfile");
		industry= new Industry();
		
		/*user = (User)SecurityContextHolder.getContext().
		getAuthentication().getPrincipal();*/
		
		profile = profileService.findByPrimaryKey(profile,profile.getId());
	/*	if(industry!=null||!(industryName.equalsIgnoreCase(""))){
			int industryId=Integer.parseInt(industryName);
			industry=industryBaseService.findByPrimaryKey(industry, industryId);
			if(industry!=null){
			profile.setIndustry(industry);
			profileService.update(profile);
			}
		}*/
	    
	    /* Deleting Skills details from db*/
		try {
		   	//physicalTraits=new PhysicalTraits();
		      physicalTraits = employeeProfileService.getphysicalTraitsForUser(profile.getId());
		      physicalTraits.setProfileOwner(profile);
		      physicalTraits.setHeight(height);
              physicalTraits.setMeasurements(measurements);
			  physicalTraits.setWeight(weight);
			  physicalTraits.setShoesize(shoesize);
			  physicalTraits.setBuild(build);
			  physicalTraits.setEyecolor(eyecolor);
			  physicalTraits.setEthnicity(ethnicity);
			  physicalTraits.setOthers(others);
			  physicalTraits.setAdditionalnotes(additionalnotes);
			
		  	   physicalTraitsService.update(physicalTraits);
		} catch (Exception e) {
			e.printStackTrace();
		}
	 
	   	if(delskillrow!=null){
	   		System.out.println("delskillrow");
	    	LOGGER.info("skills delete-------------");
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
				category=new SkillsCategory();
	    	
		    	if(categoryId!=0){
		    	//	int industryId=Integer.parseInt(industryName);
	    			//industry=industryBaseService.findByPrimaryKey(industry, industryId);
	    		//	category.setIndustry(industry);
		    		category.setName(categoryName[0]);
		    		category=skillsCategoryBaseService.findByPrimaryKey(category, categoryId);
		    		skillsCategoryBaseService.update(category);
		    	}
		    	
				skillsDetails.setId(id[i]);
				skillsDetails.setLevel(level[i]);
				skillsDetails.setNotes(notes[i]);
				skillsDetails.setExperience(experience[i]);
				skillsDetails.setSkillName(skillName[i]);				
				skillsDetails.setProfileOwner(profile);
				skillsDetails.setCategory(category);
				skillsDetailsService.update(skillsDetails);					
			}
	  }
	    
	    if(newSkillName!=null){
	    	System.out.println("newSkillName");
	    	for(int j=0; j<newSkillName.length;j++){
	    		skillsDetails = new SkillsDetails();
	    		category=new SkillsCategory();
	    		/*if(industry!=null||!(industryName.equalsIgnoreCase(""))){
	    			int industryId=Integer.parseInt(industryName);
	    			industry=industryBaseService.findByPrimaryKey(industry, industryId);
	    			category.setIndustry(industry);
	    		}
	    		*/
		    	category.setName(newCategoryName[0]);
		    	skillsCategoryBaseService.create(category);
		    	if(category!=null){
		    		category=skillsCategoryBaseService.findByPrimaryKey(category, category.getId());
		    	}
	    		skillsDetails.setSkillName(newSkillName[j]);
	    		skillsDetails.setExperience(newExperience[j]);
	    		skillsDetails.setLevel(newLevel[j]);
	    		skillsDetails.setNotes(newNotes[j]);
	    		skillsDetails.setProfileOwner(profile);
	    		skillsDetails.setCategory(category);
	    		skillsDetailsService.create(skillsDetails);
	    	}
	    }
	    
	    
	   
		return "success";
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

	public Training getTraining() {
		return training;
	}

	public void setTraining(Training training) {
		this.training = training;
	}

	public BaseService<Profile> getProfileService() {
		return profileService;
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

	

	public long[] getId() {
		return id;
	}

	public void setId(long[] id) {
		this.id = id;
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

	public BaseService<Training> getTrainingService() {
		return trainingService;
	}

	public void setTrainingService(BaseService<Training> trainingService) {
		this.trainingService = trainingService;
	}

	public ProfileSession getProfileSession() {
		return profileSession;
	}

	public void setProfileSession(ProfileSession profileSession) {
		this.profileSession = profileSession;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIndustryName() {
		return industryName;
	}

	public void setIndustryName(String industryName) {
		this.industryName = industryName;
	}

	public Industry getIndustry() {
		return industry;
	}

	public void setIndustry(Industry industry) {
		this.industry = industry;
	}

	public BaseService<Industry> getIndustryBaseService() {
		return industryBaseService;
	}

	public void setIndustryBaseService(BaseService<Industry> industryBaseService) {
		this.industryBaseService = industryBaseService;
	}

	public String[] getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String[] categoryName) {
		this.categoryName = categoryName;
	}

	public String[] getNewCategoryName() {
		return newCategoryName;
	}

	public void setNewCategoryName(String[] newCategoryName) {
		this.newCategoryName = newCategoryName;
	}

	public SkillsCategory getCategory() {
		return category;
	}

	public void setCategory(SkillsCategory category) {
		this.category = category;
	}

	public BaseService<SkillsCategory> getSkillsCategoryBaseService() {
		return skillsCategoryBaseService;
	}

	public void setSkillsCategoryBaseService(
			BaseService<SkillsCategory> skillsCategoryBaseService) {
		this.skillsCategoryBaseService = skillsCategoryBaseService;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public BaseService<PhysicalTraits> getPhysicalTraitsService() {
		return physicalTraitsService;
	}

	public void setPhysicalTraitsService(
			BaseService<PhysicalTraits> physicalTraitsService) {
		this.physicalTraitsService = physicalTraitsService;
	}

	public PhysicalTraits getPhysicalTraits() {
		return physicalTraits;
	}

	public void setPhysicalTraits(PhysicalTraits physicalTraits) {
		this.physicalTraits = physicalTraits;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getMeasurements() {
		return measurements;
	}

	public void setMeasurements(String measurements) {
		this.measurements = measurements;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getShoesize() {
		return shoesize;
	}

	public void setShoesize(int shoesize) {
		this.shoesize = shoesize;
	}

	public String getBuild() {
		return build;
	}

	public void setBuild(String build) {
		this.build = build;
	}

	public String getHaircolor() {
		return haircolor;
	}

	public void setHaircolor(String haircolor) {
		this.haircolor = haircolor;
	}

	public String getEyecolor() {
		return eyecolor;
	}

	public void setEyecolor(String eyecolor) {
		this.eyecolor = eyecolor;
	}

	public String getEthnicity() {
		return ethnicity;
	}

	public void setEthnicity(String ethnicity) {
		this.ethnicity = ethnicity;
	}

	public String getOthers() {
		return others;
	}

	public void setOthers(String others) {
		this.others = others;
	}

	public String getAdditionalnotes() {
		return additionalnotes;
	}

	public void setAdditionalnotes(String additionalnotes) {
		this.additionalnotes = additionalnotes;
	}

	public EmployeeProfileService getEmployeeProfileService() {
		return employeeProfileService;
	}

	public void setEmployeeProfileService(
			EmployeeProfileService employeeProfileService) {
		this.employeeProfileService = employeeProfileService;
	}

	


	
}
