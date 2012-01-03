package com.mob.dao;

import java.util.List;

import com.mob.model.FlagData;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.group.GroupDiscussions;
import com.mob.model.group.Topics;
import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;

public interface AdminSearchDao {

	public List<User> findByUserName(String searchName);

	public List<Profile> findByProfileName(String searchName);

	public FlagData findExistingFlagData(String selectedFlaggedId, String type);

	public User findByExistingUser(String selectedFlaggedId);

	public Profile findByExistingProfile(String selectedFlaggedId);

	public Item findByExistingItem(String selectedFlaggedId);

	public GroupDiscussions findByExistingThreads(String selectedFlaggedId);

	public List<User> findAllAdminFlaggedUser(String selectedTableName);

	public List<Profile> findAllAdminFlaggedProfile(String selectedTableName);

	public List<Item> findAllAdminFlaggedItems(String selectedTableName);

	public List<FlagData> findCommentsForFlaggedUser(User user,
			String selectedTableName);

	public List<FlagData> findCommentsForFlaggedProfile(Profile profile,
			String selectedTableName);

	public List<FlagData> findCommentsForFlaggedItem(Item item,
			String selectedTableName);

	public List<User> findByFlaggedUserName(String searchByName);

	public List<Profile> findByFlaggedProfilName(String searchByName);

	public List<Item> findByFlaggedItemTitle(String searchByName);

	public List<User> findAllFlaggedUser();

	public List<Profile> findAllFlaggedProfiles();

	public List<Item> findAllFlaggedItems();

	public List<User> findByAdminFlaggedUserName(String searchByName);

	public List<Profile> findByAdminFlaggedProfilName(String searchByName);

	public List<Item> findByAdminFlaggedItemTitle(String searchByTitle);

	public List<GroupDiscussions> findAllAdminFlaggedThreads(
			String selectedTableName);

	public List<FlagData> findCommentsForFlaggedThreads(
			GroupDiscussions groupDiscussions, String selectedTableName);

	public List<GroupDiscussions> findByAdminFlaggedThreadTitle(
			String searchByTitle);

	public List<FlagData> findCommentsForFlaggedThread(
			GroupDiscussions groupDiscussions, String selectedTableName);

	public List<GroupDiscussions> findAllGroupDiscussions();

	public List<FlagData> findCommentsForFlaggedGroupDiscussions(
			GroupDiscussions groupDiscussions, String selectedTableName);

	public List<GroupDiscussions> findByFlaggedGroupDiscussionsTitle(
			String searchByName);

	public List<Group> findAllGroups();
	
	public List<Topics> findAllTopicReplies();
	
	public List<FlagData> findCommentsForFlaggedGroups(Group groups,
			String selectedTableName);
	
	public List<FlagData> findCommentsForFlaggedTopicReplies(GroupDiscussions groupDiscussions,
			String selectedTableName);
	
	public List<Group> findByFlaggedGroups(String searchByName);
	
	public List<Topics> findByFlaggedTopicReplies(String searchByName);
	
	public Group findByExistingGroups(String selectedFlaggedId);

	public List<Group> findAllAdminFlaggedGroups(String selectedTableName);

	public List<Group> findByAdminFlaggedGroupsTitle(String searchByTitle);
	
	public List<GroupDiscussions> findPostReplies(long id);
	
   public void UpdateUserFlaggedData(User user);

}
