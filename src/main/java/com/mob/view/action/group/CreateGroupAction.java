package com.mob.view.action.group;

import java.io.File;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.group.service.GroupService;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.group.Topics;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.SearchService;
import com.mob.services.UserManagement;
import com.opensymphony.xwork2.ActionSupport;

public class CreateGroupAction extends ActionSupport {

	private String groupName;
	private String selectedGrpType;
	private String summary;
	private GroupService  groupService;
	private SearchService searchService;
	private UserManagement userManagement;
	private User  user;
	private Topics topic;
	private Group group;
	private String  topics;
	private String description;
	private long groupId;
	private String profileName;
	private Profile profile;
	private List<Profile> profilList;
	private BaseService<Group> baseGroupService;
	private File upload;// The actual file
	private String uploadContentType; // The content type of the file
	private String uploadFileName; // The uploaded file name
	private String fileCaption;// The caption of the file entered by user
	private String icon;
	 private String resizedPicture;
	
	private static final long serialVersionUID = 1L;

	public String createGroup() {
		user = (User)SecurityContextHolder.getContext().
        getAuthentication().getPrincipal();
		
		groupService.createGroup(group,profile,user);
		if(this.upload != null && upload.length()>0){
        	System.out.println("file path:---"+this.upload.getAbsolutePath());
           /* this.userManagement.updateGroupPicture(group,this.upload.getAbsolutePath(),
                uploadFileName);
*/            this.userManagement.addGroupPicture(group, this.upload.getAbsolutePath(),
                    uploadFileName, uploadContentType);
        }		
		return "success";
	}
	public String createTopics() {
		
		 user = (User)SecurityContextHolder.getContext().
        getAuthentication().getPrincipal();
		System.out.println("user.getId" +user.getId());
		System.out.println("topics" + topics +   groupId);
		groupService.createTopics(topic,group,user);
		return "success";
	}
	
	public String loadGroupDetails(){
		user = (User)SecurityContextHolder.getContext().
	    getAuthentication().getPrincipal();
		profilList = searchService.findListOfEmployeeProfiles(profile,user.getId());
		Group newGroup=new Group(); 
		group=baseGroupService.findByPrimaryKey(newGroup, group.getId());
		if(group.getIcon()!=null){
			icon=(String) group.getAmazonFileURL().get(0);
		}
		if(group.getResizedPicture()!=null){
			resizedPicture=(String) group.getAmazonFileURL().get(1);
		}
		
		return "success";
	}
	
	public String deleteGroupDetails() {
		System.out.println("deleteGroupDetails" +group.getId());
		groupService.deleteGroup(group.getId());
		return "success";
	}
	public String editGroupDetails() {
		groupService.updateGroupDetails(group,this.upload==null?null:this.upload.getAbsolutePath(),this.uploadFileName,this.uploadContentType);
		return "success";
	}

	public String getGroupName() {
		return groupName;
	}

	public void setGroupName(String groupName) {
		this.groupName = groupName;
	}

	public String getSelectedGrpType() {
		return selectedGrpType;
	}

	public void setSelectedGrpType(String selectedGrpType) {
		this.selectedGrpType = selectedGrpType;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public GroupService getGroupService() {
		return groupService;
	}

	public void setGroupService(GroupService groupService) {
		this.groupService = groupService;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Topics getTopic() {
		return topic;
	}

	public void setTopic(Topics topic) {
		this.topic = topic;
	}

	public Group getGroup() {
		return group;
	}

	public void setGroup(Group group) {
		this.group = group;
	}

	public String getTopics() {
		return topics;
	}

	public void setTopics(String topics) {
		this.topics = topics;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public long getGroupId() {
		return groupId;
	}

	public void setGroupId(long groupId) {
		this.groupId = groupId;
	}

	public String getProfileName() {
		return profileName;
	}

	public void setProfileName(String profileName) {
		this.profileName = profileName;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public List<Profile> getProfilList() {
		return profilList;
	}

	public void setProfilList(List<Profile> profilList) {
		this.profilList = profilList;
	}

	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	public BaseService<Group> getBaseGroupService() {
		return baseGroupService;
	}

	public void setBaseGroupService(BaseService<Group> baseGroupService) {
		this.baseGroupService = baseGroupService;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getFileCaption() {
		return fileCaption;
	}

	public void setFileCaption(String fileCaption) {
		this.fileCaption = fileCaption;
	}

	

	public UserManagement getUserManagement() {
		return userManagement;
	}

	public void setUserManagement(UserManagement userManagement) {
		this.userManagement = userManagement;
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