package com.mob.services;

import java.util.List;

import com.mob.model.PrivateItems;

public interface PrivacyGroupService {
	
    public List loadAllPrivacyGroupsOfUser(long id);
	
	public List getPrivacyGroups(long id);

	public List getPrivacyItems(long id);
    /**
     * This method will check if a viewer of a item is allowed to view the item, as per the
     * privacy settings set by the item owner
     *
     * The method should perform the following operations
     * 1. Find out the privacy groups allowed to view the item as per the privacy group setting of the item owner
     * 2. Check if the item can be viewed by "All"
     * 3. Return true, if the item can be viewed by "All"
     * 4. If not, then find out if the viewer is a friend of item owner.
     * 5. If not, then return false
     * 6. If viewer is a friend, then find out the privacy group to which the viewer belongs
     * 7. If the privacy group of the viewer is allowed to view the item, then return false
     * 8. Otherwise, return false.
     * 
     * @param itemName
     * @param viewerProfileId
     * @param itemOwnerProfleId
     * @return
     */
    public boolean isItemViewableByViewer(String itemName, long viewerProfileId, long itemOwnerProfleId);
    public void addDefaultPrivacySettings(long id);
    public PrivateItems getPrivateItemWithPrivacyGroups(String name,long id);
    public void addPrivacySettings(long privateItemId,List<Long> privacyGroups,long profileId);
    
    public void setPrivacySettings(long id);

}
