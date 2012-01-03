package com.mob.view.action.group;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;


import com.mob.dto.GroupMember;

import com.mob.group.service.GroupService;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.group.GroupAdmin;
import com.mob.model.group.GroupDiscussions;
import com.mob.model.group.Topics;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.ItemService;
import com.opensymphony.xwork2.ActionSupport;

public class LoadGroupProfileInfo extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private User  user;
	private Profile profile;
	private Group  group;
	private List<Topics> groupTopicsList;
	private List<Profile> listOfMyJoinedGroupUsers;
	private GroupService groupService;
	private List<Group> groupsList;
	private String  groupOwnerName;	
	private List  groupUsersProfileList;
	private Profile groupUsersprofile;
	private Profile groupInvitationProfile;

	private BaseService<Group> groupBaseService;
	private BaseService<Profile> profileBaseService;
	private long groupId; 
	private String groupName;
	private Group existGroup;
	private Profile existProfile;
	private List<GroupDiscussions> groupDiscussionList;
	private List groupMemberList = new ArrayList();
	private List groupOwnerList = new ArrayList();
	private List  groupInvitationProfiles=new ArrayList();
	private ItemService itemService;
	private List itemsList;
	private int itemcount;
	private Topics topics;
	private long myProfileId; 
	private String icon;
	 private String resizedPicture;




	public String loadGroupProfileInfo(){
		myProfileId=profile.getId();
		existGroup= new Group();
		existProfile=new Profile();
		user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		existGroup=groupBaseService.findByPrimaryKey(existGroup, group.getId());
		existProfile= profileBaseService.findByPrimaryKey(existProfile, profile.getId());
		groupId=existGroup.getId();
		groupTopicsList=groupService.findAllGroupTopics(group.getId());
		existGroup=groupBaseService.findByPrimaryKey(existGroup, group.getId());
		groupName=existGroup.getName();
		listOfMyJoinedGroupUsers=groupService.findAllGroupUsers(group.getId());
		loadGroupInvitationProfiles();
		loadGroupUsersProfiles();
		loadGroupOwnerProfile();
		itemsList = itemService.findItems(profile.getId());
		itemcount=itemsList.size();
		Iterator iterator= groupTopicsList.iterator();
		while(iterator.hasNext()){

	   topics=(Topics)iterator.next();
	   groupDiscussionList=groupService.findAllGroupDiscussions(topics.getId());

	   topics.setDiscussionList(groupDiscussionList);
	   System.out.println("topics.getProfile().getName()"+topics.getProfile().getName());
	}
		if(existGroup.getIcon()!=null){
			icon=(String) existGroup.getAmazonFileURL().get(0);
		}
		if(existGroup.getResizedPicture()!=null){
			resizedPicture=(String) existGroup.getAmazonFileURL().get(1);
		}
		
			

		return "success";
	}
	public String loadGroupTopicInfo() {
		try {
			groupTopicsList=groupService.findAllGroupTopics(group.getId());
			Iterator iterator = groupTopicsList.iterator();
			while (iterator.hasNext()) {
				topics = (Topics) iterator.next();
				groupDiscussionList = groupService
						.findAllGroupDiscussions(topics.getId());
				topics.setDiscussionList(groupDiscussionList);
				if(groupDiscussionList.size()!=0){
				GroupDiscussions gd = (GroupDiscussions) groupDiscussionList
						.iterator().next();
				topics.setLatestDiscussion(gd);
				topics.setLatestDiscussionDate(gd);

				topics.setDiscussionList(groupDiscussionList);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return "success";
	}
	
	
	public  void  loadGroupInvitationProfiles(){
		groupInvitationProfiles= groupService.findGroupInvitationList(group.getId());
		
	}

	public  void  loadGroupUsersProfiles(){
		
		groupMemberList= groupService.findGroupMembersList(group.getId());
		
	}
	
	public  void  loadPrivateGroupUsersProfiles(){
		groupMemberList= groupService.findGroupMembersList(group.getId());
          
	}
	public  void  loadGroupOwnerProfile(){
		groupOwnerList= groupService.findGroupOwnerList(group.getId());
     System.out.println(""+groupOwnerList.size());
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

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public List<Topics> getGroupTopicsList() {
		return groupTopicsList;
	}

	public void setGroupTopicsList(List<Topics> groupTopicsList) {
		this.groupTopicsList = groupTopicsList;
	}

	public GroupService getGroupService() {
		return groupService;
	}

	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}

	public List<Profile> getListOfMyJoinedGroupUsers() {
		return listOfMyJoinedGroupUsers;
	}

	public void setListOfMyJoinedGroupUsers(List<Profile> listOfMyJoinedGroupUsers) {
		this.listOfMyJoinedGroupUsers = listOfMyJoinedGroupUsers;
	}

	public List<Group> getGroupsList() {
		return groupsList;
	}

	public void setGroupsList(List<Group> groupsList) {
		this.groupsList = groupsList;
	}



	public String getGroupOwnerName() {
		return groupOwnerName;
	}



	public void setGroupOwnerName(String groupOwnerName) {
		this.groupOwnerName = groupOwnerName;
	}
	public List getGroupUsersProfileList() {
		return groupUsersProfileList;
	}
	public void setGroupUsersProfileList(List groupUsersProfileList) {
		this.groupUsersProfileList = groupUsersProfileList;
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
	public List getGroupInvitationProfiles() {
		return groupInvitationProfiles;
	}
	public void setGroupInvitationProfiles(List groupInvitationProfiles) {
		this.groupInvitationProfiles = groupInvitationProfiles;
	}
	public BaseService<Group> getGroupBaseService() {
		return groupBaseService;
	}
	public void setGroupBaseService(BaseService<Group> groupBaseService) {
		this.groupBaseService = groupBaseService;
	}
	public long getGroupId() {
		return groupId;
	}
	public void setGroupId(long groupId) {
		this.groupId = groupId;
	}
	public String getGroupName() {
		return groupName;
	}
	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}
	public Group getExistGroup() {
		return existGroup;
	}
	public void setExistGroup(Group existGroup) {
		this.existGroup = existGroup;
	}
	public Profile getExistProfile() {
		return existProfile;
	}
	public void setExistProfile(Profile existProfile) {
		this.existProfile = existProfile;
	}
	public BaseService<Profile> getProfileBaseService() {
		return profileBaseService;
	}
	public void setProfileBaseService(BaseService<Profile> profileBaseService) {
		this.profileBaseService = profileBaseService;
	}
	public List<GroupDiscussions> getGroupDiscussionList() {
		return groupDiscussionList;
	}
	public void setGroupDiscussionList(List<GroupDiscussions> groupDiscussionList) {
		this.groupDiscussionList = groupDiscussionList;
	}
	public ItemService getItemService() {
		return itemService;
	}
	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}
	public List getItemsList() {
		return itemsList;
	}
	public void setItemsList(List itemsList) {
		this.itemsList = itemsList;
	}
	public int getItemcount() {
		return itemcount;
	}
	public void setItemcount(int itemcount) {
		this.itemcount = itemcount;
	}
	public Topics getTopics() {
		return topics;
	}
	public void setTopics(Topics topics) {
		this.topics = topics;
	}
	public List getGroupMemberList() {
		return groupMemberList;
	}
	public void setGroupMemberList(List groupMemberList) {
		this.groupMemberList = groupMemberList;
	}

	public long getMyProfileId() {
		return myProfileId;
	}
	public void setMyProfileId(long myProfileId) {
		this.myProfileId = myProfileId;
	}

	public List getGroupOwnerList() {
		return groupOwnerList;
	}
	public void setGroupOwnerList(List groupOwnerList) {
		this.groupOwnerList = groupOwnerList;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public String getResizedPicture() {
		return resizedPicture;
	}
	public void setResizedPicture(String resizedPicture) {
		this.resizedPicture = resizedPicture;
	}
	


}
