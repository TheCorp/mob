package com.mob.view.action.employee;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.profile.Education;
import com.mob.model.profile.Profile;
import com.mob.model.profile.WorkExperience;
import com.mob.services.ProfileService;
import com.mob.util.MOBLogger;

public class UpdateEmployeeProfileAction {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
            new MOBLogger(UpdateEmployeeProfileAction.class);

    private Profile profile;
    private Education education;
    private WorkExperience workExperience;
    private ProfileService profileService;
    private ProfileService educationService;
    private ProfileService workExperienceService;

    public String editEmployeeProfile() {
        try {
            LOGGER.info("Inside editEmployeeProfile");
            LOGGER.info("before update:" + profile.getId());
            profileService.updatePersonalDetails(profile);
            return "success";
        } catch (Exception e) {
            return "error";
        }
    }

    public String editEducationDetails() {
        LOGGER.info("Inside editEducationDetails");
        User user = (User) SecurityContextHolder.getContext().
                getAuthentication().getPrincipal();
        profile.setProfileOwner(user);
        education.setOwningProfile(profile);
        educationService.updateEducationDetails(education);
        return "success";
    }

    public String editExperienceDetails() {
        LOGGER.info("Inside editExperienceDetails");
        User user = (User) SecurityContextHolder.getContext().
                getAuthentication().getPrincipal();
        profile.setProfileOwner(user);
        //education.setOwningProfile(profile);
        //educationService.update(education);
        workExperience.setWorkExperienceProfile(profile);
        workExperienceService.updateWorkExperienceDetails(workExperience);


        return "success";
    }

    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    public ProfileService getProfileService() {
        return profileService;
    }

    public void setProfileService(ProfileService profileService) {
        this.profileService = profileService;
    }

    public Education getEducation() {
        return education;
    }

    public void setEducation(Education education) {
        this.education = education;
    }

    public ProfileService getEducationService() {
        return educationService;
    }

    public void setEducationService(ProfileService educationService) {
        this.educationService = educationService;
    }

    public WorkExperience getWorkExperience() {
        return workExperience;
    }

    public void setWorkExperience(WorkExperience workExperience) {
        this.workExperience = workExperience;
    }

    public ProfileService getWorkExperienceService() {
        return workExperienceService;
    }

    public void setWorkExperienceService(ProfileService workExperienceService) {
        this.workExperienceService = workExperienceService;
    }

}

