package com.mob.view.action.group;

import java.util.Iterator;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.group.service.GroupService;
import com.mob.model.Contact;
import com.mob.model.FlaggedTypes;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.group.GroupDiscussions;
import com.mob.model.group.Topics;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.SearchService;
import com.opensymphony.xwork2.ActionSupport;

public class CreateGroupDiscussions  extends ActionSupport{
	
	private GroupService  groupService;
	private User  user;
	private Topics topic; 
    private Profile profile;
    private BaseService<FlaggedTypes> flaggedTypeService;
    private String discussion;
    private GroupDiscussions groupDiscussions;
	private List<GroupDiscussions> groupDiscussionList;
	private BaseService<GroupDiscussions> baseGroupService;
	private List flaggedTypeList;
	private List<Profile> profilList;
	private SearchService searchService;
	private Group group; 
	private String resizedMinPicture;
	private Topics topicData; 
	  private String description=null;
    public String createGroupDiscussion() {
    	
    	System.out.println("groupDiscussions.Discussions)" +discussion);
		user = (User)SecurityContextHolder.getContext().
        getAuthentication().getPrincipal();
		groupService.saveGroupDiscussions(profile, topic, discussion);
		return "success";
	}
public String loadGroupTopics() {
	user = (User)SecurityContextHolder.getContext().
    getAuthentication().getPrincipal();
	System.out.println("the group is"+group.getId());
	profilList = searchService.findListOfEmployeeProfiles(profile,user.getId());
	groupDiscussionList=groupService.findAllGroupDiscussions(topic.getId());
	topicData=groupService.findAllGroupTopicInfo(topic.getId());
	description=topicData.getDescription();
	FlaggedTypes flaggedType=new FlaggedTypes();   
    flaggedTypeList= flaggedTypeService.findAll(flaggedType);
    
    Iterator it=profilList.iterator();
	 while(it.hasNext()){
		 profile=(Profile)it.next();
		 if(profile.getResizedMinPicture()!=null){
				resizedMinPicture=(String) profile.getAmazonFileURL().get(2);
				profile.setResizedMinPicture(resizedMinPicture);
			}
			 }
    
	return "success";
}
public String deleteGroupDiscussions() {
	
	baseGroupService.delete(groupDiscussions);  		
	return "success";
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

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}
	public GroupDiscussions getGroupDiscussions() {
		return groupDiscussions;
	}
	public void setGroupDiscussions(GroupDiscussions groupDiscussions) {
		this.groupDiscussions = groupDiscussions;
	}
	public String getDiscussion() {
		return discussion;
	}
	public void setDiscussion(String discussion) {
		this.discussion = discussion;
	}
	public List<GroupDiscussions> getGroupDiscussionList() {
		return groupDiscussionList;
	}
	public void setGroupDiscussionList(List<GroupDiscussions> groupDiscussionList) {
		this.groupDiscussionList = groupDiscussionList;
	}
	public BaseService<GroupDiscussions> getBaseGroupService() {
		return baseGroupService;
	}
	public void setBaseGroupService(BaseService<GroupDiscussions> baseGroupService) {
		this.baseGroupService = baseGroupService;
	}
	public List getFlaggedTypeList() {
		return flaggedTypeList;
	}
	public void setFlaggedTypeList(List flaggedTypeList) {
		this.flaggedTypeList = flaggedTypeList;
	}
	public BaseService<FlaggedTypes> getFlaggedTypeService() {
		return flaggedTypeService;
	}
	public void setFlaggedTypeService(BaseService<FlaggedTypes> flaggedTypeService) {
		this.flaggedTypeService = flaggedTypeService;
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
	public Group getGroup() {
		return group;
	}
	public void setGroup(Group group) {
		this.group = group;
	}
	public String getResizedMinPicture() {
		return resizedMinPicture;
	}
	public void setResizedMinPicture(String resizedMinPicture) {
		this.resizedMinPicture = resizedMinPicture;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Topics getTopicData() {
		return topicData;
	}
	public void setTopicData(Topics topicData) {
		this.topicData = topicData;
	}
}
