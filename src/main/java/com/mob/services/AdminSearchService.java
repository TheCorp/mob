package com.mob.services;

import java.util.List;

import com.mob.model.FlagData;
import com.mob.model.FlaggedInformation;
import com.mob.model.User;
import com.mob.model.group.Group;
import com.mob.model.group.GroupDiscussions;
import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;

public interface AdminSearchService {

	public List<User> findByUserName(String searchName);
	public List<Profile> findByProfileName(String searchName);
	public FlagData findExistingFlagData(String selectedFlaggedId, String type);
	public User findByExistingUser(String selectedFlaggedId);
	public Profile findByExistingProfile(String selectedFlaggedId);
	public Item findByExistingItem(String selectedFlaggedId);
	public GroupDiscussions findByExistingThreads(String selectedFlaggedId);
	public List<FlaggedInformation> getAllAdminFlaggedData(String selectedTableName, String searchName);
	public List<FlaggedInformation> getAllFlaggedData(String selectedTableName, String searchName);
	public Group findByExistingGroups(String selectedFlaggedId);
	//public void UpdateUserFlaggedData(User user);
	public void UpdateUserFlaggedData(String[] flagItemIds);
	
	public void UpdateProfileFlaggedData(String[] flagItemIds);
	public void UpdateItemFlaggedData(String[] flagItemIds);
	public void UpdateThreadsFlaggedData(String[] flagItemIds);
	public void UpdateGroupsFlaggedData(String[] flagItemIds);
	public void storeFlagCommentForAllTypes(String[] flagItemIds,String type,String flagComment,String selectedFlagTypeName);
	
	
}
