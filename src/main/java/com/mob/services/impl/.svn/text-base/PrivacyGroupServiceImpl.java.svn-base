package com.mob.services.impl;

import com.mob.dao.BaseDao;
import com.mob.dao.ContactEmployeeDao;
import com.mob.dao.PrivacyGroupDao;
import com.mob.model.PrivacyGroup;
import com.mob.model.PrivateItems;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Profile;
import com.mob.services.OpportunityService;
import com.mob.services.PrivacyGroupNames;
import com.mob.services.PrivacyGroupService;
import com.mob.util.MOBLogger;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

public class PrivacyGroupServiceImpl implements PrivacyGroupService {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
            new MOBLogger(PrivacyGroupServiceImpl.class);

    private PrivacyGroupDao privacyGroupDao;
    private ContactEmployeeDao contactEmployeeDao;
    private BaseDao<PrivateItems> privateItemsBaseDao;
    private BaseDao<PrivacyGroup> privacyGroupBaseDao;
    private BaseDao<EmployerProfile> employerProfile;

    public void setEmployerProfile(BaseDao<EmployerProfile> employerProfile) {
        this.employerProfile = employerProfile;
    }

    public void setContactEmployeeDao(
            ContactEmployeeDao contactEmployeeDao) {
        this.contactEmployeeDao = contactEmployeeDao;
    }

    @Transactional(propagation = Propagation.REQUIRED,
            readOnly = false)
    public List loadAllPrivacyGroupsOfUser(long id) {
        // TODO Auto-generated method stub
        return privacyGroupDao.loadAllPrivacyGroupsOfUser(id);
    }

    public List getPrivacyGroups(long id) {
        // TODO Auto-generated method stub
        return privacyGroupDao.getPrivacyGroups(id);
    }

    /**
     * This method will check if a viewer of a item is allowed to view the item, as per the
     * privacy settings set by the item owner
     * <p/>
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
     * @param itemOwnerProfileId
     * @return
     */
    public boolean isItemViewableByViewer(String itemName, long viewerProfileId, long itemOwnerProfileId) {
        LOGGER.info("Inside isItemViewableByViewer");
        System.out.println("viewerProfileId:" +viewerProfileId +"itemOwnerProfileId:"+ itemOwnerProfileId);
        String contactType = null;
        List<PrivacyGroup> privacyGroupList = privacyGroupDao.getPrivacyGroupNameForPrivateItem(itemName, itemOwnerProfileId);

        PrivacyGroup publicPrivacyGroup = new PrivacyGroup();
        publicPrivacyGroup.setName(PrivacyGroupNames.Public.toString());
        Profile owner = new Profile();
        owner.setId(itemOwnerProfileId);
        publicPrivacyGroup.setProfile(owner);
        
        
        PrivacyGroup privatePrivacyGroup = new PrivacyGroup();
        privatePrivacyGroup.setName(PrivacyGroupNames.Private.toString());
        Profile ownerProfile = new Profile();
        ownerProfile.setId(itemOwnerProfileId);
        publicPrivacyGroup.setProfile(ownerProfile);
        
        if (privacyGroupList.contains(privatePrivacyGroup)) {
            /*
            Check if the user allows "Private" privacy group, just return true if it does
             */
        	
        		if (viewerProfileId==itemOwnerProfileId){
        			System.out.println("viewerProfileId" +viewerProfileId +itemOwnerProfileId);
        		 return true;
        		}
           
        }  
        if (privacyGroupList.contains(publicPrivacyGroup)) {
            /*
            Check if the user allows "Public" privacy group, just return true if it does
             */
            return true;
        } else {
            String contactsType = contactEmployeeDao.getPrivacyGroupForContact(viewerProfileId, itemOwnerProfileId);

            if (contactsType != null) {
                /*
                Check if the user allows the contactType privacy group of the user, just return true if it does
                */
                PrivacyGroup userPrivacyGroup = new PrivacyGroup();
                userPrivacyGroup.setName(contactsType);
                owner = new Profile();
                owner.setId(itemOwnerProfileId);
                userPrivacyGroup.setProfile(owner);
                if (privacyGroupList.contains(userPrivacyGroup)) {
                    return true;
                } else {
                    /*
                    If the user's privacy group is not supported, then check if the item owner
                    allows all contacts to view the item. If yes, then return true
                    */
                    PrivacyGroup contactPrivacyGroup = new PrivacyGroup();
                    contactPrivacyGroup.setName(PrivacyGroupNames.Contact.toString());
                    owner = new Profile();
                    owner.setId(itemOwnerProfileId);
                    contactPrivacyGroup.setProfile(owner);
                    if (privacyGroupList.contains(contactPrivacyGroup)) {
                        return true;
                    } else {
                        if (isViewerAPotentialEmployer(viewerProfileId, itemOwnerProfileId)) {
                            PrivacyGroup potEmpPrivacyGroup = new PrivacyGroup();
                            potEmpPrivacyGroup.setName(PrivacyGroupNames.Potential_Employer.toString());
                            potEmpPrivacyGroup.setProfile(owner);
                            if (privacyGroupList.contains(potEmpPrivacyGroup)) {
                                return true;
                            } else {
                                return false;
                            }
                        }
                    }
                }
            }

        }
        return false;
        //To change body of implemented methods use File | Settings | File Templates.
    }

    private OpportunityService opportunityService;

    public void setOpportunityService(OpportunityService opportunityService) {
        this.opportunityService = opportunityService;
    }

    private boolean isViewerAPotentialEmployer(long viewerProfileId, long itemOwnerProfileId) {
        EmployerProfile empProfile = null;
        try {
            empProfile = employerProfile.findByPrimaryKey(new EmployerProfile(), viewerProfileId);
        } catch (Exception e) {
            LOGGER.error(e);
            return false;
        }
        if (empProfile != null) {
            return this.opportunityService.hasProfileAppliedForOpportunityByEmployerProfile(itemOwnerProfileId, empProfile);
        } else {
            return false;  //To change body of created methods use File | Settings | File Templates.
        }
    }

    public PrivacyGroupDao getPrivacyGroupDao() {
        return privacyGroupDao;
    }


    public void setPrivacyGroupDao(PrivacyGroupDao privacyGroupDao) {
        this.privacyGroupDao = privacyGroupDao;
    }

    public List getPrivacyItems(long id) {

        return privacyGroupDao.getPrivacyItems(id);
    }

    @Transactional(propagation = Propagation.REQUIRED,
            readOnly = false)
    public void addDefaultPrivacySettings(long id) {
        PrivacyGroup privacyGroup = new PrivacyGroup();
        PrivateItems privateItems = new PrivateItems();

        privacyGroup = privacyGroupBaseDao.findByPrimaryKey(privacyGroup, id);
        List listOfPrivateItems = privateItemsBaseDao.findByExample(privateItems);
        if (listOfPrivateItems.size() != 0) {
            Iterator it = listOfPrivateItems.iterator();
            while (it.hasNext()) {
                privateItems = (PrivateItems) it.next();
                privacyGroup.getPrivateItems().add(privateItems);
                privacyGroupBaseDao.update(privacyGroup);
            }
        }
    }

    @Transactional(propagation = Propagation.REQUIRED,
            readOnly = false)
    public void setPrivacySettings(long id) {

        PrivacyGroup privacyGroup = new PrivacyGroup();
        PrivateItems privateItems = new PrivateItems();
        privacyGroup = privacyGroupBaseDao.findByPrimaryKey(privacyGroup, id);
        List listOfPrivateItems = privateItemsBaseDao.findByExample(privateItems);
        if (listOfPrivateItems.size() != 0) {
            Iterator it = listOfPrivateItems.iterator();
            while (it.hasNext()) {
                privateItems = (PrivateItems) it.next();
                if (privateItems.getName().equals("Work Experience")) {
                    privacyGroup.getPrivateItems().add(privateItems);
                    privacyGroupBaseDao.update(privacyGroup);
                }
            }
        }

    }


    public void setPrivateItemsBaseDao(BaseDao<PrivateItems> privateItemsBaseDao) {
        this.privateItemsBaseDao = privateItemsBaseDao;
    }

    public void setPrivacyGroupBaseDao(BaseDao<PrivacyGroup> privacyGroupBaseDao) {
        this.privacyGroupBaseDao = privacyGroupBaseDao;
    }

    public PrivateItems getPrivateItemWithPrivacyGroups(String name, long id) {
        return this.privacyGroupDao.getPrivateItemWithPrivacyGroups(name, id);
    }

    @Transactional(propagation = Propagation.REQUIRED,
            readOnly = false)
    public void addPrivacySettings(long privateItemId, List<Long> privacyGroups, long profileId) {
       
        PrivateItems privateItem = new PrivateItems();
        privateItem = privateItemsBaseDao.findByPrimaryKey(privateItem, privateItemId);
        PrivateItems item = new PrivateItems();
        item = privateItemsBaseDao.findByPrimaryKey(item, privateItemId);
     


        Set<PrivacyGroup> existingPg = null;
        existingPg = privacyGroupDao.getExistingPrivacyGroups(profileId, privateItemId);
     
        Iterator<PrivacyGroup> it = existingPg.iterator();
        while (it.hasNext()) {
            try {
                PrivacyGroup pg = (PrivacyGroup) it.next();
                pg.getPrivateItems().remove(item);
                privacyGroupBaseDao.update(pg);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        Set<PrivacyGroup> newGroups = new HashSet<PrivacyGroup>();
        for (Long groupid : privacyGroups) {
            try {
                PrivacyGroup privacyGroup = new PrivacyGroup();
                privacyGroup = privacyGroupBaseDao.findByPrimaryKey(privacyGroup, groupid);
                privacyGroup.getPrivateItems().add(item);
                privacyGroupBaseDao.update(privacyGroup);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }


    }


}
