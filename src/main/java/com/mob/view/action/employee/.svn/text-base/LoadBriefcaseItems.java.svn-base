package com.mob.view.action.employee;

import com.mob.dao.ContactEmployeeDao;
import com.mob.model.ContactTypes;
import com.mob.model.User;
import com.mob.model.profile.BriefCase;
import com.mob.model.profile.BriefcaseCategory;
import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;
import com.mob.services.*;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;
import org.acegisecurity.context.SecurityContextHolder;
import org.apache.struts2.interceptor.SessionAware;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

public class LoadBriefcaseItems extends ActionSupport implements Preparable, SessionAware {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
            new MOBLogger(LoadBriefcaseItems.class);

    private ContactTypes contactType;
    private List contactTypesList;
    private BaseService<ContactTypes> employeeContactTypesService;
    private PrivacyGroupService privacyGroupService;
    private EmployeeProfileService employeeProfileService;
    private User user;
    private Item item;
    private BriefCase briefcase;
    private ItemService itemService;
    private List itemsList;
    private Profile profile = new Profile();
    private int itemcount;

    private BriefcaseCategory briefcaseCategory;
    private List briefcaseCategoryList;
    private BaseService<BriefcaseCategory> briefcaseCategoryService;

    private BaseService<Profile> profileBaseService;

    private long inboxMessageCount;
    private MessagingService messagingService;
    private List listInboxEmailMessages;

    private List documentsListFromBriefcase = new ArrayList();
    private List photosListFromBriefcase = new ArrayList();
    private List audioVedioListFromBriefcase = new ArrayList();
    private List uRLListFromBriefcase = new ArrayList();
    private int documentsCount;
    private int photossCount;
    private int audioVedioCount;
    private int urlListCount;

    private long unreadEmpMsgListSize;
    private List cntUnreadMsgList;
    private boolean unreadMsgCnt;

    private Map session;
    private Long currentProfileId;
    private String contactPrivacyGroup;
    private ContactEmployeeDao contactDao;

	 private BriefCaseService briefCaseService;
	 private long briefcaseProfileId;
	

	private BriefCase briefCase;
    //private List profilelist;
	

    public void setContactDao(ContactEmployeeDao contactDao) {
        this.contactDao = contactDao;
    }

    public String loadBriefcaseItems() {
        LOGGER.info("Inside loadBriefcaseItems");
        User user = (User) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();

        currentProfileId = (Long) getSession().get("currentProfile");
        if (currentProfileId == null) {
            Profile profile1 = employeeProfileService.getDefaultProfileForUser(user.getId());
            if (profile1 != null)
                getSession().put("currentProfile", profile1.getId());
        }

        currentProfileId = (Long) getSession().get("currentProfile");
        if (currentProfileId != null) {
            System.out.println("currentProfileId:" + currentProfileId);
            profile = profileBaseService.findByPrimaryKey(profile, currentProfileId);
            itemsList = itemService.findItems(profile.getId());
            LOGGER.info("items size:" + itemsList.size());
            itemcount = itemsList.size();

            getDocumentsFromBriefcase();
            getphotosFromBriefcase();
            getAudioVedioFromBriefcase();
            getBriefcaseURLList();

            listInboxEmailMessages = messagingService.findInboxListEmailMessages(user.getId());
            inboxMessageCount = listInboxEmailMessages.size();

            LOGGER.info("inbox msg count" + inboxMessageCount);

            cntUnreadMsgList = messagingService.findUnreadEmailMsgList(user.getId(), unreadMsgCnt);
            unreadEmpMsgListSize = cntUnreadMsgList.size();

            contactTypesList = privacyGroupService.loadAllPrivacyGroupsOfUser(profile.getId());
           
               System.out.println("profile Id"+profile.getId());
               System.out.println("briefcase"+briefcase);
              
           briefCase=briefCaseService.findBriefcaseViewCountForProfile(profile.getId()); 	
              
           
            return "success";
        } else
            return "emptyList";
    }
    
   


    private void getBriefcaseURLList() {
		// TODO Auto-generated method stub
    	 LOGGER.info("Inside getUrlListFromBriefcase");
    	 System.out.println("getUrlListFromBriefcase");
         Iterator it = itemsList.iterator();
         while (it.hasNext()) {
             Item item = (Item) it.next();
             if (item.getItemURL() != null) {
            	 uRLListFromBriefcase.add(item);
             }
         }
         urlListCount = uRLListFromBriefcase.size();
	}

	public void getDocumentsFromBriefcase() {
        LOGGER.info("Inside getDocumentsFromBriefcase");
        Iterator it = itemsList.iterator();
        while (it.hasNext()) {
            Item item = (Item) it.next();
            if (item.getTextFileurl() != null) {
                documentsListFromBriefcase.add(item);
            }
        }
        documentsCount = documentsListFromBriefcase.size();
       
       
    }

    public void getphotosFromBriefcase() {
        LOGGER.info("Inside getphotosFromBriefcase");
        Iterator it = itemsList.iterator();
        while (it.hasNext()) {
            Item item = (Item) it.next();
            if (item.getImageUrl() != null) {
                photosListFromBriefcase.add(item);
            }
        }
        photossCount = photosListFromBriefcase.size();

    }


    public void getAudioVedioFromBriefcase() {
        LOGGER.info("Inside getAudioVedioFromBriefcase");
        Iterator it = itemsList.iterator();
        while (it.hasNext()) {
            Item item = (Item) it.next();
            if (item.getVideourl() != null || item.getAudiourl() != null) {
                LOGGER.info(item.getVideourl());
                audioVedioListFromBriefcase.add(item);
            }
        }
        audioVedioCount = audioVedioListFromBriefcase.size();
    }

    public String getContactTypesListForProfile() {
        currentProfileId = (Long) getSession().get("currentProfile");
        if (currentProfileId != null)
            contactTypesList = privacyGroupService.loadAllPrivacyGroupsOfUser(currentProfileId);
        return "success";
    }

    public void prepare() throws Exception {
        LOGGER.info("Inside prepare");
        User user = (User) SecurityContextHolder.getContext()
                .getAuthentication().getPrincipal();
        //contactType = new ContactTypes();
        //contactTypesList = employeeContactTypesService.findAll(contactType);
        //contactTypesList= privacyGroupService.loadAllPrivacyGroupsOfUser(user.getId());
        briefcaseCategory = new BriefcaseCategory();
        briefcaseCategoryList = briefcaseCategoryService.findAll(briefcaseCategory);
        LOGGER.info("briefcaseCategory type:" + briefcaseCategoryList.size());
       
        //LOGGER.info("contact type:"+contactTypesList.size());
    }

    public int getDocumentsCount() {
        return documentsCount;
    }


    public void setDocumentsCount(int documentsCount) {
        this.documentsCount = documentsCount;
    }


    public int getPhotossCount() {
        return photossCount;
    }


    public void setPhotossCount(int photossCount) {
        this.photossCount = photossCount;
    }


    public int getAudioVedioCount() {
        return audioVedioCount;
    }


    public void setAudioVedioCount(int audioVedioCount) {
        this.audioVedioCount = audioVedioCount;
    }

    public List getPhotosListFromBriefcase() {
        return photosListFromBriefcase;
    }


    public void setPhotosListFromBriefcase(List photosListFromBriefcase) {
        this.photosListFromBriefcase = photosListFromBriefcase;
    }


    public List getAudioVedioListFromBriefcase() {
        return audioVedioListFromBriefcase;
    }


    public void setAudioVedioListFromBriefcase(List audioVedioListFromBriefcase) {
        this.audioVedioListFromBriefcase = audioVedioListFromBriefcase;
    }


    public BriefcaseCategory getBriefcaseCategory() {
        return briefcaseCategory;
    }

    public void setBriefcaseCategory(BriefcaseCategory briefcaseCategory) {
        this.briefcaseCategory = briefcaseCategory;
    }

    public List getBriefcaseCategoryList() {
        return briefcaseCategoryList;
    }

    public void setBriefcaseCategoryList(List briefcaseCategoryList) {
        this.briefcaseCategoryList = briefcaseCategoryList;
    }

    public BaseService<BriefcaseCategory> getBriefcaseCategoryService() {
        return briefcaseCategoryService;
    }

    public void setBriefcaseCategoryService(
            BaseService<BriefcaseCategory> briefcaseCategoryService) {
        this.briefcaseCategoryService = briefcaseCategoryService;
    }

    public List getItemsList() {
        return itemsList;
    }

    public void setItemsList(List itemsList) {
        this.itemsList = itemsList;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public ContactTypes getContactType() {
        return contactType;
    }


    public void setContactType(ContactTypes contactType) {
        this.contactType = contactType;
    }


    public List getContactTypesList() {
        return contactTypesList;
    }


    public void setContactTypesList(List contactTypesList) {
        this.contactTypesList = contactTypesList;
    }


    public BaseService<ContactTypes> getEmployeeContactTypesService() {
        return employeeContactTypesService;
    }


    public void setEmployeeContactTypesService(
            BaseService<ContactTypes> employeeContactTypesService) {
        this.employeeContactTypesService = employeeContactTypesService;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public BriefCase getBriefcase() {
        return briefcase;
    }

    public void setBriefcase(BriefCase briefcase) {
        this.briefcase = briefcase;
    }

    public ItemService getItemService() {
        return itemService;
    }

    public void setItemService(ItemService itemService) {
        this.itemService = itemService;
    }


    public int getItemcount() {
        return itemcount;
    }

    public void setItemcount(int itemcount) {
        this.itemcount = itemcount;
    }

    public long getInboxMessageCount() {
        return inboxMessageCount;
    }

    public void setInboxMessageCount(long inboxMessageCount) {
        this.inboxMessageCount = inboxMessageCount;
    }

    public MessagingService getMessagingService() {
        return messagingService;
    }

    public void setMessagingService(MessagingService messagingService) {
        this.messagingService = messagingService;
    }

    public List getListInboxEmailMessages() {
        return listInboxEmailMessages;
    }

    public void setListInboxEmailMessages(List listInboxEmailMessages) {
        this.listInboxEmailMessages = listInboxEmailMessages;
    }


    public List getDocumentsListFromBriefcase() {
        return documentsListFromBriefcase;
    }


    public void setDocumentsListFromBriefcase(List documentsListFromBriefcase) {
        this.documentsListFromBriefcase = documentsListFromBriefcase;
    }


    public long getUnreadEmpMsgListSize() {
        return unreadEmpMsgListSize;
    }


    public void setUnreadEmpMsgListSize(long unreadEmpMsgListSize) {
        this.unreadEmpMsgListSize = unreadEmpMsgListSize;
    }


    public List getCntUnreadMsgList() {
        return cntUnreadMsgList;
    }


    public void setCntUnreadMsgList(List cntUnreadMsgList) {
        this.cntUnreadMsgList = cntUnreadMsgList;
    }


    public boolean isUnreadMsgCnt() {
        return unreadMsgCnt;
    }


    public void setUnreadMsgCnt(boolean unreadMsgCnt) {
        this.unreadMsgCnt = unreadMsgCnt;
    }


    public PrivacyGroupService getPrivacyGroupService() {
        return privacyGroupService;
    }


    public void setPrivacyGroupService(PrivacyGroupService privacyGroupService) {
        this.privacyGroupService = privacyGroupService;
    }


    public Profile getProfile() {
        return profile;
    }


    public void setProfile(Profile profile) {
        this.profile = profile;
    }


    public BaseService<Profile> getProfileBaseService() {
        return profileBaseService;
    }


    public void setProfileBaseService(BaseService<Profile> profileBaseService) {
        this.profileBaseService = profileBaseService;
    }


    private Map getSession() {
        return session;
    }


    public void setSession(Map session) {
        this.session = session;
    }


    public Long getCurrentProfileId() {
        return currentProfileId;
    }


    public void setCurrentProfileId(Long currentProfileId) {
        this.currentProfileId = currentProfileId;
    }


    public void setEmployeeProfileService(
            EmployeeProfileService employeeProfileService) {
        this.employeeProfileService = employeeProfileService;
    }

	public BriefCaseService getBriefCaseService() {
		return briefCaseService;
	}

	public void setBriefCaseService(BriefCaseService briefCaseService) {
		this.briefCaseService = briefCaseService;
	}

	public BriefCase getBriefCase() {
		return briefCase;
	}

	public void setBriefCase(BriefCase briefCase) {
		this.briefCase = briefCase;
	}

	public long getBriefcaseProfileId() {
		return briefcaseProfileId;
	}

	public void setBriefcaseProfileId(long briefcaseProfileId) {
		this.briefcaseProfileId = briefcaseProfileId;
	}

	public List getURLListFromBriefcase() {
		return uRLListFromBriefcase;
	}

	public void setURLListFromBriefcase(List listFromBriefcase) {
		uRLListFromBriefcase = listFromBriefcase;
	}

	public int getUrlListCount() {
		return urlListCount;
	}

	public void setUrlListCount(int urlListCount) {
		this.urlListCount = urlListCount;
	}

	
	
	

}
