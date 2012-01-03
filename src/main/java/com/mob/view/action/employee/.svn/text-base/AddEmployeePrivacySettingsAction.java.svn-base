package com.mob.view.action.employee;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import com.mob.model.PrivacyGroup;
import com.mob.model.PrivateItems;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.PrivacyGroupService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class AddEmployeePrivacySettingsAction extends ActionSupport{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(AddEmployeePrivacySettingsAction.class);
    private static final long serialVersionUID = 1L;
	private PrivacyGroup privacyGroup;
	private PrivacyGroupService privacyGroupService;
	private BaseService<PrivacyGroup> privacyGroupBaseService;
	private BaseService<PrivateItems> privateItemsBaseService;
		
	private PrivateItems personalInfo;
	private PrivateItems desiredWork;
	private PrivateItems workExperience;
	private PrivateItems educationExperience;
	private PrivateItems profilePicture;
	private PrivateItems friendList;
	
	private List<Long> personalPrivacyGroups=new ArrayList<Long>();
	private List<Long> desiredPrivacyGroups=new ArrayList<Long>();
	private List<Long> workExperiencePrivacyGroups=new ArrayList<Long>();
	private List<Long> educationExperiencePrivacyGroups=new ArrayList<Long>();
	private List<Long> profilePicturePrivacyGroups=new ArrayList<Long>();
	private List<Long> friendListPrivacyGroups=new ArrayList<Long>();

    private Profile profile;
    
	public String addPrivacySettings(){
		
	    System.out.println("profileId:---"+profile.getId());	
	
		if(personalPrivacyGroups.size()!=0){
			privacyGroupService.addPrivacySettings(1, personalPrivacyGroups,profile.getId());		
		}
		if(desiredPrivacyGroups.size()!=0)
			privacyGroupService.addPrivacySettings(2, desiredPrivacyGroups,profile.getId());
		
		if(workExperiencePrivacyGroups.size()!=0)
			privacyGroupService.addPrivacySettings(3, workExperiencePrivacyGroups,profile.getId());
		
		if(educationExperiencePrivacyGroups.size()!=0)
			privacyGroupService.addPrivacySettings(4, educationExperiencePrivacyGroups,profile.getId());
		
		if(profilePicturePrivacyGroups.size()!=0)
			privacyGroupService.addPrivacySettings(5, profilePicturePrivacyGroups,profile.getId());
		
		if(friendListPrivacyGroups.size()!=0)
			privacyGroupService.addPrivacySettings(6, friendListPrivacyGroups,profile.getId());
		
		return "success";
	}


	public PrivacyGroup getPrivacyGroup() {
		return privacyGroup;
	}


	public void setPrivacyGroup(PrivacyGroup privacyGroup) {
		this.privacyGroup = privacyGroup;
	}

	public BaseService<PrivacyGroup> getPrivacyGroupBaseService() {
		return privacyGroupBaseService;
	}


	public void setPrivacyGroupBaseService(
			BaseService<PrivacyGroup> privacyGroupBaseService) {
		this.privacyGroupBaseService = privacyGroupBaseService;
	}


	public BaseService<PrivateItems> getPrivateItemsBaseService() {
		return privateItemsBaseService;
	}


	public void setPrivateItemsBaseService(
			BaseService<PrivateItems> privateItemsBaseService) {
		this.privateItemsBaseService = privateItemsBaseService;
	}

	


	public PrivateItems getPersonalInfo() {
		return personalInfo;
	}


	public void setPersonalInfo(PrivateItems personalInfo) {
		this.personalInfo = personalInfo;
	}


	public PrivateItems getDesiredWork() {
		return desiredWork;
	}


	public void setDesiredWork(PrivateItems desiredWork) {
		this.desiredWork = desiredWork;
	}


	public PrivateItems getWorkExperience() {
		return workExperience;
	}


	public void setWorkExperience(PrivateItems workExperience) {
		this.workExperience = workExperience;
	}


	public PrivateItems getEducationExperience() {
		return educationExperience;
	}


	public void setEducationExperience(PrivateItems educationExperience) {
		this.educationExperience = educationExperience;
	}


	public PrivateItems getProfilePicture() {
		return profilePicture;
	}


	public void setProfilePicture(PrivateItems profilePicture) {
		this.profilePicture = profilePicture;
	}


	public PrivateItems getFriendList() {
		return friendList;
	}


	public void setFriendList(PrivateItems friendList) {
		this.friendList = friendList;
	}


	public void setPrivacyGroupService(PrivacyGroupService privacyGroupService) {
		this.privacyGroupService = privacyGroupService;
	}


	public List<Long> getPersonalPrivacyGroups() {
		return personalPrivacyGroups;
	}


	public void setPersonalPrivacyGroups(List<Long> personalPrivacyGroups) {
		this.personalPrivacyGroups = personalPrivacyGroups;
	}


	public List<Long> getDesiredPrivacyGroups() {
		return desiredPrivacyGroups;
	}


	public void setDesiredPrivacyGroups(List<Long> desiredPrivacyGroups) {
		this.desiredPrivacyGroups = desiredPrivacyGroups;
	}


	public List<Long> getWorkExperiencePrivacyGroups() {
		return workExperiencePrivacyGroups;
	}


	public void setWorkExperiencePrivacyGroups(
			List<Long> workExperiencePrivacyGroups) {
		this.workExperiencePrivacyGroups = workExperiencePrivacyGroups;
	}


	public List<Long> getEducationExperiencePrivacyGroups() {
		return educationExperiencePrivacyGroups;
	}


	public void setEducationExperiencePrivacyGroups(
			List<Long> educationExperiencePrivacyGroups) {
		this.educationExperiencePrivacyGroups = educationExperiencePrivacyGroups;
	}


	public List<Long> getProfilePicturePrivacyGroups() {
		return profilePicturePrivacyGroups;
	}


	public void setProfilePicturePrivacyGroups(
			List<Long> profilePicturePrivacyGroups) {
		this.profilePicturePrivacyGroups = profilePicturePrivacyGroups;
	}


	public List<Long> getFriendListPrivacyGroups() {
		return friendListPrivacyGroups;
	}


	public void setFriendListPrivacyGroups(List<Long> friendListPrivacyGroups) {
		this.friendListPrivacyGroups = friendListPrivacyGroups;
	}


	public PrivacyGroupService getPrivacyGroupService() {
		return privacyGroupService;
	}


	public Profile getProfile() {
		return profile;
	}


	public void setProfile(Profile profile) {
		this.profile = profile;
	}




	
	

}
