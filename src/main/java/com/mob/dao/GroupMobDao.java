package com.mob.dao;

import java.util.List;

import com.mob.model.Role;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.group.GroupAdmin;
import com.mob.model.group.GroupDiscussions;
import com.mob.model.group.GroupJoinUsers;
import com.mob.model.group.Topics;

import com.mob.model.profile.Profile;


public interface GroupMobDao{
	
//	public List<Group> findListOfGroups(long id);
//	public GroupUsers findGroupUsers(long  groupId);
	
	public List<Group> findGroupsAsCreator(User user);
	public List<Group> findGroupsAsMember(User user);
	
	public GroupJoinUsers findProfile(GroupJoinUsers groupJoinusers, long id);

//	public List<Group> findAllMyOwnGroups(long id);
//	public List<Group> findAllMyJoinedGroups(long id);
//	public List<Profile> findListOfMyProfiles(long id);

	public List<Topics> findAllGroupTopics(long id);
	public List<GroupJoinUsers> findAllGroupProfiles(long id);
	public List<Profile> findAllGroupUsers(long id);
	public void updateGroupUsers(long  profileId);
	public List<GroupDiscussions> findAllGroupDiscussions(long id);
	public  Role findGroupAdminRole(String groupRoleName);
	public  boolean  findGroupRoleAdmin(long  groupId, long profileId);
	public GroupAdmin findGroupAdminRole(long groupId, long profileId);
	public List<Group> findPrivateGroupsAsMember(User user);
	public  GroupAdmin  findProfileGroupRole(long  groupId, long userId);
	public List<Group> findGroupOwnerProfile(long groupId);
	public  GroupAdmin  findProfileGroupOwnerRole(long  groupId, long profileId);
	public long findNewTopicsId(long id);
	public Topics findAllGroupTopicInfo(long id);
}
