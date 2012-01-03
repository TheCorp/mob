package com.mob.dao;

import java.util.List;
import java.util.Set;

import com.mob.model.PrivacyGroup;
import com.mob.model.PrivateItems;

public interface PrivacyGroupDao {
	
	public List loadAllPrivacyGroupsOfUser(long id);
	
	public List getPrivacyGroups(long id);
	
	public List getPrivacyItems(long id);
	
	public List getPrivacyGroupNameForPrivateItem(String itemName,long id);
	
	public PrivateItems getPrivateItemWithPrivacyGroups(String name,long id);

	public Set<PrivacyGroup> getExistingPrivacyGroups(long profileId,long privateItemId);

	public PrivacyGroup getPrivacyGroup(Long groupid);

}

