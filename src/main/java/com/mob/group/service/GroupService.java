package com.mob.group.service;

import java.util.List;

import com.mob.dto.GroupMember;
import com.mob.model.Role;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.group.GroupDiscussions;
import com.mob.model.group.Topics;
import com.mob.model.profile.Profile;


public interface GroupService {
	public void createGroup(Group group,Profile profile,User user);
	public void createTopics(Topics topics,Group group, User user);
	public void  joinGroup(User  user, Group  group,Profile profile,String message);
	public  long  saveTopics(Group group,Profile profile,User user,Topics objTopics);
	public  void checkForExistingGroup(Group group);
//	public List<Group> findListOfGroups(long id);
	public List<Group> findAllMyOwnGroups(User user);
	public List<GroupMember> findAllMyJoinedGroups(User user);
	public List<Topics> findAllGroupTopics(long id);
	public List<Profile> findAllGroupUsers(long id);
	public  void  acceptGroupRequest(Profile profile,long groupId);
	public  void  denyGroupRequest(Profile profile,long groupId);
	public void updateGroupDetails(Group group,String picturePath,String pictureName,String uploadContentType);
	public  void saveGroupDiscussions(Profile profile,Topics topic,String discussion);
	public List<GroupDiscussions> findAllGroupDiscussions(long id);
	public  void makeGroupAdmin(Profile profile, Role  role,long groupId);
	public List<GroupMember> findGroupMembersList(long groupId);
	public void removeGroupAdmin(Profile profile, long groupId);
	public void deleteJoinGroupMembers(Profile profile, long groupId);
	public  void  deleteGroup(long groupId);
	public  List<GroupMember>  findAllMyJoinedPrivateGroups(User  user);
	public List<Group> findGroupOwnerList(long groupId);
	
	public  void makeGroupOwner(Profile profile, Role  role,long groupId);
	public void removeGroupOwner(Profile profile, long groupId);
	public List<GroupMember> findGroupInvitationList(long groupId);
	public Topics findAllGroupTopicInfo(long id);
	
}
	  
	  

