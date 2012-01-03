package com.mob.view.action.group;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.acegisecurity.context.SecurityContextHolder;
import org.hibernate.classic.Session;

import com.mob.group.service.GroupService;
import com.mob.model.Contact;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.group.Topics;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.ContactEmployeeService;
import com.mob.services.ProfileService;
import com.mob.services.SearchService;
import com.opensymphony.xwork2.ActionSupport;

public class LoadGroupAction extends ActionSupport {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private ContactEmployeeService contactEmployeeService;
	private ProfileService profileService;
	private SearchService searchService;
	private GroupService groupService;
	private List<Contact> contactsList;
	private List<Profile> profilList;
	private List<Group> groupsList;
	private List<Group>  groupListProfiles;
	private User  user;
	private Profile profile;
    private BaseService<Group> groupBaseService;
	private Group  group;
	
	private List  groupUsersProfileList;
	private Profile groupUsersprofile;
	
	private Profile groupInvitationProfile;
	private List  groupInvitationProfiles;
	
	public String loadContacts() {
		 user = (User)SecurityContextHolder.getContext().
        getAuthentication().getPrincipal();
		profile=new Profile();
		profile=profileService.findByProfilePrimaryKey(profile, user.getId());
		System.out.println("loadGroups" +user.getFirstName());
		contactsList = contactEmployeeService.findContacts(user.getId());
		System.out.println("listContacts" +contactsList.size());
		return "success";
	}
	
	public String loadGroupsForTopics(){
		groupInvitationProfiles=new ArrayList();
		groupUsersProfileList= new ArrayList();
		Group  existGroupForInvitation =  new Group();
		Group  existGroupForUsers = new Group();
		//groupListProfiles=groupService.findGroupJoinedProfiles(group.getId());
		existGroupForInvitation= groupBaseService.findByPrimaryKey(existGroupForInvitation, group.getId());
		if(existGroupForInvitation.getGroupInvitationProfiles().size()!=0){
			Iterator<Profile> it = existGroupForInvitation.getGroupInvitationProfiles().iterator();
			while (it.hasNext()) {
				// Get element
				groupInvitationProfile = it.next();
				System.out.println("profile" +groupInvitationProfile.getId());
				groupInvitationProfiles.add(groupInvitationProfile);
			}
		}
		
		//System.out.println("groupInvitationProfileList" +groupInvitationProfileList.size());
		
		
		existGroupForUsers=groupBaseService.findByPrimaryKey(existGroupForUsers, group.getId());
		if(existGroupForUsers.getGroupUsersProfiles().size()!=0){
			Iterator<Profile> it = existGroupForUsers.getGroupUsersProfiles().iterator();
			while (it.hasNext()) {
				// Get element
				groupUsersprofile = it.next();
				System.out.println("profile" +groupUsersprofile.getId());
				groupUsersProfileList.add(groupUsersprofile);
			}
		}
		return "success";

	}
	
	public String loadProfileListForGroup(){
		user = (User)SecurityContextHolder.getContext().
	    getAuthentication().getPrincipal();
		profilList = searchService.findListOfEmployeeProfiles(profile,user.getId());
		
		
		System.out.println("profilList.size()" +profilList.size());
		return "success";
	}
 
//	public String loadGroups(){
//		user = (User)SecurityContextHolder.getContext().
//	    getAuthentication().getPrincipal();
//		groupsList = groupService.findListOfGroups(user.getId());
//		
//		groupInvitationProfiles=new ArrayList();
//		groupUsersProfileList= new ArrayList();
//		Group  existGroupForInvitation =  new Group();
//		Group  existGroupForUsers = new Group();
//		//groupListProfiles=groupService.findGroupJoinedProfiles(group.getId());
//		existGroupForInvitation= groupBaseService.findByPrimaryKey(existGroupForInvitation, group.getId());
//		if(existGroupForInvitation.getGroupInvitationProfiles().size()!=0){
//			Iterator<Profile> it = existGroupForInvitation.getGroupInvitationProfiles().iterator();
//			while (it.hasNext()) {
//				// Get element
//				groupInvitationProfile = it.next();
//				System.out.println("profile" +groupInvitationProfile.getId());
//				groupInvitationProfiles.add(groupInvitationProfile);
//			}
//		}
//		
//		//System.out.println("groupInvitationProfileList" +groupInvitationProfileList.size());
//		
//		
//		existGroupForUsers=groupBaseService.findByPrimaryKey(existGroupForUsers, group.getId());
//		if(existGroupForUsers.getGroupUsersProfiles().size()!=0){
//			Iterator<Profile> it = existGroupForUsers.getGroupUsersProfiles().iterator();
//			while (it.hasNext()) {
//				// Get element
//				groupUsersprofile = it.next();
//				System.out.println("profile" +groupUsersprofile.getId());
//				groupUsersProfileList.add(groupUsersprofile);
//			}
//		}
//		System.out.println("profilList.size()" +groupsList.size());
//		return "success";
//		
//	}
	 
	public ContactEmployeeService getContactEmployeeService() {
		return contactEmployeeService;
	}

	public void setContactEmployeeService(
			ContactEmployeeService contactEmployeeService) {
		this.contactEmployeeService = contactEmployeeService;
	}

	public List<Contact> getContactsList() {
		return contactsList;
	}

	public void setContactsList(List<Contact> contactsList) {
		this.contactsList = contactsList;
	}

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

	public ProfileService getProfileService() {
		return profileService;
	}

	public void setProfileService(ProfileService profileService) {
		this.profileService = profileService;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	public List<Profile> getProfilList() {
		return profilList;
	}

	public void setProfilList(List<Profile> profilList) {
		this.profilList = profilList;
	}

	public List<Group> getGroupsList() {
		return groupsList;
	}

	public void setGroupsList(List<Group> groupsList) {
		this.groupsList = groupsList;
	}

	public GroupService getGroupService() {
		return groupService;
	}

	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}


	public List<Group> getGroupListProfiles() {
		return groupListProfiles;
	}

	public void setGroupListProfiles(List<Group> groupListProfiles) {
		this.groupListProfiles = groupListProfiles;
	}

	public BaseService<Group> getGroupBaseService() {
		return groupBaseService;
	}

	public void setGroupBaseService(BaseService<Group> groupBaseService) {
		this.groupBaseService = groupBaseService;
	}



	public List getGroupInvitationProfiles() {
		return groupInvitationProfiles;
	}

	public void setGroupInvitationProfiles(List groupInvitationProfiles) {
		this.groupInvitationProfiles = groupInvitationProfiles;
	}

	public Profile getGroupUsersprofile() {
		return groupUsersprofile;
	}

	public void setGroupUsersprofile(Profile groupUsersprofile) {
		this.groupUsersprofile = groupUsersprofile;
	}

	public Profile getGroupInvitationProfile() {
		return groupInvitationProfile;
	}

	public void setGroupInvitationProfile(Profile groupInvitationProfile) {
		this.groupInvitationProfile = groupInvitationProfile;
	}

	public List getGroupUsersProfileList() {
		return groupUsersProfileList;
	}

	public void setGroupUsersProfileList(List groupUsersProfileList) {
		this.groupUsersProfileList = groupUsersProfileList;
	}


	

}