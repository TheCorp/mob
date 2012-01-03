package com.mob.view.action.employee;

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
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class AddEmployeeProfileAction extends ActionSupport {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
            new MOBLogger(AddEmployeeProfileAction.class);
    private static final long serialVersionUID = 1L;

    private User user;
    private Profile profile;
    private WorkExperience workExperience;
    private SkillsDetails skillsDetails;
    private Training training;
    private Education education;
    private SkillsCategory skillSCategory;
    private Industry industry;
    private String industryName;
    private String[] indstryName;

    private BaseService<Profile> profileService;
    private BaseService<WorkExperience> workExperienceService;
    private BaseService<SkillsDetails> skillsDetailsService;
    private BaseService<Training> trainingService;
    private BaseService<Education> educationService;
    private BaseService<Industry> industryBaseService;
    private BaseService<SkillsCategory> skillsCategoryBaseService;
    private String[] experience;
    private String[] notes;
    private String[] level;
    private String[] skills;
    private String name;
    private String[] categoryName;
    private BaseService<PhysicalTraits> physicalTraitsService;
    private PhysicalTraits physicalTraits;


    public String create() {
        int industryVal = 0;
        LOGGER.info("Inside create");
        /*User user = (User)SecurityContextHolder.getContext().
              getAuthentication().getPrincipal();
              profile.setInboxOwnerProfile(user);*/
        profile = profileService.findByPrimaryKey(profile, profile.getId());
        industry = new Industry();
        /* if(industryName!=null||(!industryName.equalsIgnoreCase(""))){
        int industryId=Integer.parseInt(industryName);
        industry=industryBaseService.findByPrimaryKey(industry, industryId);
        profile.setIndustry(industry);
        }*/
        profileService.update(profile);


        try {
            profile = profileService.findByPrimaryKey(profile, profile.getId());
            physicalTraits.setProfileOwner(profile);
            physicalTraitsService.create(physicalTraits);
        } catch (Exception e) {
            // TODO: handle exception
        }
        /*For adding  Skills details into db */
        if (skills != null) {
            for (int i = 0; i < skills.length; i++) {
                skillsDetails = new SkillsDetails();
                if (categoryName != null) {
                    skillSCategory = new SkillsCategory();
                    //  industry=new Industry();
                    skillSCategory.setName(categoryName[i]);
                    //  industryVal=Integer.parseInt(indstryName[i]);
                    //   industry=industryBaseService.findByPrimaryKey(industry, industryVal);
                    // skillSCategory.setIndustry(industry);
                    skillsCategoryBaseService.create(skillSCategory);
                    System.out.println("skillSCategory" + skillSCategory.getId());
                    skillSCategory = skillsCategoryBaseService.findByPrimaryKey(skillSCategory, skillSCategory.getId());
                    skillsDetails.setCategory(skillSCategory);
                }
                skillsDetails.setLevel(level[i]);
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

    public BaseService<Profile> getProfileService() {
        return profileService;
    }

    public SkillsDetails getSkillsDetails() {
        return skillsDetails;
    }

    public void setSkillsDetails(SkillsDetails skillsDetails) {
        this.skillsDetails = skillsDetails;
    }


    public String[] getNotes() {
        return notes;
    }

    public void setNotes(String[] notes) {
        this.notes = notes;
    }

    public String[] getExperience() {
        return experience;
    }

    public void setExperience(String[] experience) {
        this.experience = experience;
    }

    public String[] getLevel() {
        return level;
    }

    public void setLevel(String[] level) {
        this.level = level;
    }

    public BaseService<SkillsDetails> getSkillsDetailsService() {
        return skillsDetailsService;
    }

    public void setSkillsDetailsService(
            BaseService<SkillsDetails> skillsDetailsService) {
        this.skillsDetailsService = skillsDetailsService;
    }

    public String[] getSkills() {
        return skills;
    }

    public void setSkills(String[] skills) {
        this.skills = skills;
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

    public String[] getIndstryName() {
        return indstryName;
    }

    public void setIndstryName(String[] indstryName) {
        this.indstryName = indstryName;
    }

    public String[] getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String[] categoryName) {
        this.categoryName = categoryName;
    }

    public SkillsCategory getSkillSCategory() {
        return skillSCategory;
    }

    public void setSkillSCategory(SkillsCategory skillSCategory) {
        this.skillSCategory = skillSCategory;
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

    public BaseService<SkillsCategory> getSkillsCategoryBaseService() {
        return skillsCategoryBaseService;
    }

    public void setSkillsCategoryBaseService(
            BaseService<SkillsCategory> skillsCategoryBaseService) {
        this.skillsCategoryBaseService = skillsCategoryBaseService;
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


}
