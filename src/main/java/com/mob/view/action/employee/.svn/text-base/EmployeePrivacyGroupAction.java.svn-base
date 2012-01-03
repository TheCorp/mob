package com.mob.view.action.employee;

import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import com.mob.model.PrivacyGroup;
import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.PrivacyGroupService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class EmployeePrivacyGroupAction extends ActionSupport {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EmployeePrivacyGroupAction.class);

	private static final long serialVersionUID = 1L;
	private PrivacyGroup privacyGroup;
	private Profile profile;
	
	private BaseService<PrivacyGroup> privacyGroupBaseService;
	private BaseService<Profile> profileBaseService;
	private PrivacyGroupService privacyGroupService;
	
	private String groupName;
	private Date privacyGroupCreatedDate;
	
	private List privacyGroupDetailsList=new ArrayList();
	
	public String addNewPrivacyGroup(){
		LOGGER.info("Inside addNewPrivacyGroup" );

		privacyGroupCreatedDate = new Date(System.currentTimeMillis());
	
		privacyGroup =new PrivacyGroup();
		privacyGroup.setName(groupName);
		privacyGroup.setProfile(profile);
		privacyGroup.setCreatedDate(privacyGroupCreatedDate);
		privacyGroupBaseService.create(privacyGroup);
		
		return "success";
	}

	
	
	public String  getPrivacyGroupsList() {
		LOGGER.info("Inside getPrivacyGroupsList" );
		
		privacyGroupDetailsList=privacyGroupService.getPrivacyGroups(profile.getId());
		LOGGER.info("privacyGroupDetailsList"+privacyGroupDetailsList.size());
		return "success";
	}

	
	public PrivacyGroup getPrivacyGroup() {
		return privacyGroup;
	}

	public void setPrivacyGroup(PrivacyGroup privacyGroup) {
		this.privacyGroup = privacyGroup;
	}

	public String getGroupName() {
		return groupName;
	}

	public BaseService<PrivacyGroup> getPrivacyGroupBaseService() {
		return privacyGroupBaseService;
	}


	public void setPrivacyGroupBaseService(
			BaseService<PrivacyGroup> privacyGroupBaseService) {
		this.privacyGroupBaseService = privacyGroupBaseService;
	}

	public PrivacyGroupService getPrivacyGroupService() {
		return privacyGroupService;
	}

	public void setPrivacyGroupService(PrivacyGroupService privacyGroupService) {
		this.privacyGroupService = privacyGroupService;
	}

	public List getPrivacyGroupDetailsList() {
		return privacyGroupDetailsList;
	}

	public void setPrivacyGroupDetailsList(List privacyGroupDetailsList) {
		this.privacyGroupDetailsList = privacyGroupDetailsList;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public Date getPrivacyGroupCreatedDate() {
		return privacyGroupCreatedDate;
	}

	public void setPrivacyGroupCreatedDate(Date privacyGroupCreatedDate) {
		this.privacyGroupCreatedDate = privacyGroupCreatedDate;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public BaseService<Profile> getProfileBaseService() {
		return profileBaseService;
	}

	public void setProfileBaseService(BaseService<Profile> profileBaseService) {
		this.profileBaseService = profileBaseService;
	}

}
