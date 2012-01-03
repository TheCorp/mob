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
import com.opensymphony.xwork2.Preparable;

public class LoadPrivacyDetailsAction extends ActionSupport {
	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER = new MOBLogger(
			LoadPrivacyDetailsAction.class);
	private static final long serialVersionUID = 1L;

	private Profile profile;
	private PrivacyGroupService privacyGroupService;
	private BaseService<PrivateItems> privatItemBaseService;

	private PrivateItems personalInfo;
	private PrivateItems desiredWork;
	private PrivateItems workExperience;
	private PrivateItems educationExperience;
	private PrivateItems profilePicture;
	private PrivateItems friendList;

	private List privacyGroupList;
	private List selectedPrivacyGroupList;
	private List<Long> selectedPersonalPrivacyGroup = new ArrayList<Long>();
	private List<String> selectedPersonalPrivacyGroupNames = new ArrayList<String>();
	private List<Long> selectedDesiredWorkPrivacyGroup = new ArrayList<Long>();
	private List<String> selectedDesiredWorkPrivacyGroupNames = new ArrayList<String>();
	private List<Long> selectedWorkExperiencePrivacyGroup = new ArrayList<Long>();
	private List<String> selectedWorkExperiencePrivacyGroupNames = new ArrayList<String>();
	private List<Long> selectedEducationExperiencePrivacyGroup = new ArrayList<Long>();
	private List<String> selectedEducationExperiencePrivacyGroupNames = new ArrayList<String>();
	private List<Long> selectedProfilePicturePrivacyGroup = new ArrayList<Long>();
	private List<String> selectedProfilePicturePrivacyGroupNames = new ArrayList<String>();
	private List<Long> selectedFriendListPrivacyGroup = new ArrayList<Long>();
	private List<String> selectedFriendListPrivacyGroupNames = new ArrayList<String>();

	public List<String> getSelectedProfilePicturePrivacyGroupNames() {
		return selectedProfilePicturePrivacyGroupNames;
	}

	public void setSelectedProfilePicturePrivacyGroupNames(
			List<String> selectedProfilePicturePrivacyGroupNames) {
		this.selectedProfilePicturePrivacyGroupNames = selectedProfilePicturePrivacyGroupNames;
	}

	public List<String> getSelectedFriendListPrivacyGroupNames() {
		return selectedFriendListPrivacyGroupNames;
	}

	public void setSelectedFriendListPrivacyGroupNames(
			List<String> selectedFriendListPrivacyGroupNames) {
		this.selectedFriendListPrivacyGroupNames = selectedFriendListPrivacyGroupNames;
	}

	public String getPrivacyDetails() {
		LOGGER.info("Inside getPrivacyDetails");

		privacyGroupList = privacyGroupService
				.loadAllPrivacyGroupsOfUser(profile.getId());
      
		personalInfo = privacyGroupService.getPrivateItemWithPrivacyGroups(
				"Personal Information", profile.getId());
		if (personalInfo.getPrivacyGroup().size() != 0) {

			Iterator it = personalInfo.getPrivacyGroup().iterator();
			while (it.hasNext()) {
				PrivacyGroup p1 = new PrivacyGroup();
				p1 = (PrivacyGroup) it.next();
				System.out.println("p1.getName" +p1.getId() +"p1.getName" +p1.getName());
				selectedPersonalPrivacyGroup.add(p1.getId());
				selectedPersonalPrivacyGroupNames.add(p1.getName());

			}

		}

		desiredWork = privacyGroupService.getPrivateItemWithPrivacyGroups(
				"Desired Work", profile.getId());
		if (desiredWork.getPrivacyGroup().size() != 0) {

			Iterator it = desiredWork.getPrivacyGroup().iterator();
			while (it.hasNext()) {
				PrivacyGroup DesiredWorkPrivacyGroup = new PrivacyGroup();
			
				
				DesiredWorkPrivacyGroup = (PrivacyGroup) it.next();
				selectedDesiredWorkPrivacyGroup.add(DesiredWorkPrivacyGroup
						.getId());
				;
				selectedDesiredWorkPrivacyGroupNames
						.add(DesiredWorkPrivacyGroup.getName());
			}
		}

		workExperience = privacyGroupService.getPrivateItemWithPrivacyGroups(
				"Work Experience", profile.getId());
		if (workExperience.getPrivacyGroup().size() != 0) {

			Iterator it = workExperience.getPrivacyGroup().iterator();
			while (it.hasNext()) {

				PrivacyGroup workExperiencePrivacyGroup = new PrivacyGroup();
				workExperiencePrivacyGroup = (PrivacyGroup) it.next();
				selectedWorkExperiencePrivacyGroup
						.add(workExperiencePrivacyGroup.getId());
				selectedWorkExperiencePrivacyGroupNames
						.add(workExperiencePrivacyGroup.getName());
			}
		}

		educationExperience = privacyGroupService
				.getPrivateItemWithPrivacyGroups("Education Experience",
						profile.getId());
		if (educationExperience.getPrivacyGroup().size() != 0) {
			Iterator it = educationExperience.getPrivacyGroup().iterator();
			while (it.hasNext()) {
				PrivacyGroup educationPrivacyGroup = new PrivacyGroup();
				educationPrivacyGroup = (PrivacyGroup) it.next();

				selectedEducationExperiencePrivacyGroup
						.add(educationPrivacyGroup.getId());
				selectedEducationExperiencePrivacyGroupNames
						.add(educationPrivacyGroup.getName());
			}
		}
		profilePicture = privacyGroupService.getPrivateItemWithPrivacyGroups(
				"Profile Picture", profile.getId());
		if (profilePicture.getPrivacyGroup().size() != 0) {
			Iterator it = profilePicture.getPrivacyGroup().iterator();
			while (it.hasNext()) {
				PrivacyGroup profilePicturePrivacyGroup = new PrivacyGroup();
				profilePicturePrivacyGroup = (PrivacyGroup) it.next();
				selectedProfilePicturePrivacyGroup
						.add(profilePicturePrivacyGroup.getId());
				selectedProfilePicturePrivacyGroupNames
						.add(profilePicturePrivacyGroup.getName());
			}
		}

		friendList = privacyGroupService.getPrivateItemWithPrivacyGroups(
				"Friend List", profile.getId());
		if (friendList.getPrivacyGroup().size() != 0) {
			Iterator it = friendList.getPrivacyGroup().iterator();
			while (it.hasNext()) {
				PrivacyGroup friendPrivacyGroup = new PrivacyGroup();
				friendPrivacyGroup = (PrivacyGroup) it.next();
				selectedFriendListPrivacyGroup.add(friendPrivacyGroup.getId());
				selectedFriendListPrivacyGroupNames.add(friendPrivacyGroup
						.getName());
			}
		}

		return "success";
	}

	public PrivacyGroupService getPrivacyGroupService() {
		return privacyGroupService;
	}

	public void setPrivacyGroupService(PrivacyGroupService privacyGroupService) {
		this.privacyGroupService = privacyGroupService;
	}

	public List getPrivacyGroupList() {
		return privacyGroupList;
	}

	public void setPrivacyGroupList(List privacyGroupList) {
		this.privacyGroupList = privacyGroupList;
	}

	public BaseService<PrivateItems> getPrivatItemBaseService() {
		return privatItemBaseService;
	}

	public void setPrivatItemBaseService(
			BaseService<PrivateItems> privatItemBaseService) {
		this.privatItemBaseService = privatItemBaseService;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public List<Long> getSelectedPersonalPrivacyGroup() {
		return selectedPersonalPrivacyGroup;
	}

	public void setSelectedPersonalPrivacyGroup(
			List<Long> selectedPersonalPrivacyGroup) {
		this.selectedPersonalPrivacyGroup = selectedPersonalPrivacyGroup;
	}

	public List<Long> getSelectedDesiredWorkPrivacyGroup() {
		return selectedDesiredWorkPrivacyGroup;
	}

	public void setSelectedDesiredWorkPrivacyGroup(
			List<Long> selectedDesiredWorkPrivacyGroup) {
		this.selectedDesiredWorkPrivacyGroup = selectedDesiredWorkPrivacyGroup;
	}

	public List<Long> getSelectedWorkExperiencePrivacyGroup() {
		return selectedWorkExperiencePrivacyGroup;
	}

	public void setSelectedWorkExperiencePrivacyGroup(
			List<Long> selectedWorkExperiencePrivacyGroup) {
		this.selectedWorkExperiencePrivacyGroup = selectedWorkExperiencePrivacyGroup;
	}

	public List<Long> getSelectedEducationExperiencePrivacyGroup() {
		return selectedEducationExperiencePrivacyGroup;
	}

	public void setSelectedEducationExperiencePrivacyGroup(
			List<Long> selectedEducationExperiencePrivacyGroup) {
		this.selectedEducationExperiencePrivacyGroup = selectedEducationExperiencePrivacyGroup;
	}

	public List<Long> getSelectedProfilePicturePrivacyGroup() {
		return selectedProfilePicturePrivacyGroup;
	}

	public void setSelectedProfilePicturePrivacyGroup(
			List<Long> selectedProfilePicturePrivacyGroup) {
		this.selectedProfilePicturePrivacyGroup = selectedProfilePicturePrivacyGroup;
	}

	public List<Long> getSelectedFriendListPrivacyGroup() {
		return selectedFriendListPrivacyGroup;
	}

	public void setSelectedFriendListPrivacyGroup(
			List<Long> selectedFriendListPrivacyGroup) {
		this.selectedFriendListPrivacyGroup = selectedFriendListPrivacyGroup;
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

	public List getSelectedPrivacyGroupList() {
		return selectedPrivacyGroupList;
	}

	public void setSelectedPrivacyGroupList(List selectedPrivacyGroupList) {
		this.selectedPrivacyGroupList = selectedPrivacyGroupList;
	}

	public List<String> getSelectedPersonalPrivacyGroupNames() {
		return selectedPersonalPrivacyGroupNames;
	}

	public void setSelectedPersonalPrivacyGroupNames(
			List<String> selectedPersonalPrivacyGroupNames) {
		this.selectedPersonalPrivacyGroupNames = selectedPersonalPrivacyGroupNames;
	}

	public List<String> getSelectedDesiredWorkPrivacyGroupNames() {
		return selectedDesiredWorkPrivacyGroupNames;
	}

	public void setSelectedDesiredWorkPrivacyGroupNames(
			List<String> selectedDesiredWorkPrivacyGroupNames) {
		this.selectedDesiredWorkPrivacyGroupNames = selectedDesiredWorkPrivacyGroupNames;
	}

	public List<String> getSelectedWorkExperiencePrivacyGroupNames() {
		return selectedWorkExperiencePrivacyGroupNames;
	}

	public void setSelectedWorkExperiencePrivacyGroupNames(
			List<String> selectedWorkExperiencePrivacyGroupNames) {
		this.selectedWorkExperiencePrivacyGroupNames = selectedWorkExperiencePrivacyGroupNames;
	}

	public List<String> getSelectedEducationExperiencePrivacyGroupNames() {
		return selectedEducationExperiencePrivacyGroupNames;
	}

	public void setSelectedEducationExperiencePrivacyGroupNames(
			List<String> selectedEducationExperiencePrivacyGroupNames) {
		this.selectedEducationExperiencePrivacyGroupNames = selectedEducationExperiencePrivacyGroupNames;
	}

}
