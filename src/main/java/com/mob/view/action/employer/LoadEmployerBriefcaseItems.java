package com.mob.view.action.employer;

import java.sql.Date;
import java.util.ArrayList;
import org.apache.struts2.interceptor.SessionAware;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.ContactTypes;
import com.mob.model.PrivacyGroup;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.profile.BriefCase;
import com.mob.model.profile.BriefcaseCategory;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Item;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.EmployeeProfileService;
import com.mob.services.EmployerProfileService;
import com.mob.services.ItemService;
import com.mob.services.MessagingService;
import com.mob.services.PrivacyGroupNames;
import com.mob.services.PrivacyGroupService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class LoadEmployerBriefcaseItems extends ActionSupport implements Preparable,SessionAware{

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(LoadEmployerBriefcaseItems.class);
    private static final long serialVersionUID = 1L;
	private ContactTypes contactType;
	private List contactTypesList;
	private BaseService<ContactTypes> employerContactTypesService;
	private Employer user;
	private Profile profile;
	private Item item;
	private BriefCase briefcase;
	private ItemService itemService;
	private List itemsList;
	private int itemcount;
	
	private BriefcaseCategory briefcaseCategory;
	private List briefcaseCategoryList;
	private BaseService<BriefcaseCategory> briefcaseCategoryService;
	
	private long inboxMessageCount;
	private  MessagingService messagingService;
	private List  listInboxEmailMessages;
	
	private List documentsListFromBriefcase=new ArrayList();
	private List photosListFromBriefcase=new ArrayList();
	private List audioVedioListFromBriefcase=new ArrayList();
	private List uRLListFromBriefcase = new ArrayList();
	
	private int documentsCount;
	private int photossCount;
	private int audioVedioCount;
	private int urlListCount;
	
	
	private long unreadEmprMsgListSize;
	private List  cntUnreadMsgList;
	private  boolean  unreadMsgCnt;
	
	private PrivacyGroupService privacyGroupService;
	private EmployerProfileService employerProfileService;
	
	private Map session;
	private Long currentProfileId;
	private List profilelist;
	private EmployeeProfileService employeeProfileService;
	private long associatedProfileId;
	private EmployerProfile employerProfile;	
	private BaseService<EmployerProfile> employerProfileBaseService;
	
	private PrivacyGroup privacyGroup;
	private BaseService<PrivacyGroup> privacyGroupBaseService;
	private Date privacyGroupCreatedDate;
	
   

	public void setAssociatedProfileId(long associatedProfileId) {
		this.associatedProfileId = associatedProfileId;
	}

	public String loadEmployerBriefcaseItems(){
		LOGGER.info("Inside loadEmployerBriefcaseItems");
		User user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		
		currentProfileId=(Long)getSession().get("currentProfile");
		if(currentProfileId==null){
			Profile profile1=employeeProfileService.getDefaultProfileForUser(user.getId());
			if(profile1!=null)
			getSession().put("currentProfile",profile1.getId());
		}
		
		currentProfileId=(Long)getSession().get("currentProfile");
		
		if(currentProfileId==null){
			
			Employer employer = (Employer) SecurityContextHolder.getContext()
			.getAuthentication().getPrincipal();
			employerProfile=new EmployerProfile();
			employerProfile.setStatus("default");
			employerProfile.setId(user.getId());
			employerProfile.setName(employer.getOrganizationName());
			employerProfile.setProfileOwner(user);
			employerProfile.setEmployer(employer);
			employerProfileBaseService.create(employerProfile);
			
			privacyGroupCreatedDate = new Date(System.currentTimeMillis());

	        privacyGroup = new PrivacyGroup();
	        privacyGroup.setName(PrivacyGroupNames.Public.toString());
	        privacyGroup.setProfile(employerProfile);
	        privacyGroup.setCreatedDate(privacyGroupCreatedDate);
	        privacyGroupBaseService.create(privacyGroup);

	        privacyGroup = new PrivacyGroup();
	        privacyGroup.setName(PrivacyGroupNames.Contact.toString());
	        privacyGroup.setProfile(employerProfile);
	        privacyGroup.setCreatedDate(privacyGroupCreatedDate);
	        privacyGroupBaseService.create(privacyGroup);
	        privacyGroupService.addDefaultPrivacySettings(privacyGroup.getId());        
	       
	        
	        privacyGroup = new PrivacyGroup();
	        privacyGroup.setName(PrivacyGroupNames.Employee.toString());
	        privacyGroup.setProfile(employerProfile);
	        privacyGroup.setCreatedDate(privacyGroupCreatedDate);
	        privacyGroupBaseService.create(privacyGroup);
	        
	        privacyGroup = new PrivacyGroup();
	        privacyGroup.setName(PrivacyGroupNames.Manager.toString());
	        privacyGroup.setProfile(employerProfile);
	        privacyGroup.setCreatedDate(privacyGroupCreatedDate);
	        privacyGroupBaseService.create(privacyGroup);
	        
	        
	        privacyGroup = new PrivacyGroup();
	        privacyGroup.setName(PrivacyGroupNames.Executive.toString());
	        privacyGroup.setProfile(employerProfile);
	        privacyGroup.setCreatedDate(privacyGroupCreatedDate);
	        privacyGroupBaseService.create(privacyGroup);
	        
	        privacyGroup = new PrivacyGroup();
	        privacyGroup.setName(PrivacyGroupNames.Potential_Employee.toString());
	        privacyGroup.setProfile(employerProfile);
	        privacyGroup.setCreatedDate(privacyGroupCreatedDate);
	        privacyGroupBaseService.create(privacyGroup);
	        
	        privacyGroup = new PrivacyGroup();
	        privacyGroup.setName(PrivacyGroupNames.Trusted_Potential_Employee.toString());
	        privacyGroup.setProfile(employerProfile);
	        privacyGroup.setCreatedDate(privacyGroupCreatedDate);
	        privacyGroupBaseService.create(privacyGroup);
			
			
			
			
		}
		if(currentProfileId!=null){
		itemsList = itemService.findItems(currentProfileId);
		itemcount=itemsList.size();
		
		getDocumentsFromBriefcase();
		getphotosFromBriefcase();
		getAudioVedioFromBriefcase();
		getUrlListFromBriefcase();
		
		listInboxEmailMessages= messagingService.findInboxListEmailMessages(user.getId());
		inboxMessageCount=listInboxEmailMessages.size();
		
		cntUnreadMsgList=messagingService.findUnreadEmailMsgList(user.getId(),unreadMsgCnt);
		unreadEmprMsgListSize=cntUnreadMsgList.size();
		
		contactTypesList= privacyGroupService.loadAllPrivacyGroupsOfUser(currentProfileId);
		return "success";
		}
		else
		return "emptyList";
	}
	
	public void getDocumentsFromBriefcase(){
		LOGGER.info("Inside getDocumentsFromBriefcase");
		Iterator it=itemsList.iterator();
		while(it.hasNext()){
			Item item=(Item)it.next();
			 if(item.getTextFileurl()!=null){
			documentsListFromBriefcase.add(item);
			 }
		}
		documentsCount=documentsListFromBriefcase.size();
	}
	
	public void getphotosFromBriefcase(){
		LOGGER.info("Inside getphotosFromBriefcase");
		Iterator it=itemsList.iterator();
		while(it.hasNext()){
			Item item=(Item)it.next();
			 if(item.getImageUrl()!=null){
			 photosListFromBriefcase.add(item);
			 }
		}
		photossCount=photosListFromBriefcase.size();
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
	
	 private void getUrlListFromBriefcase() {
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
	         System.out.println("uRLListFromBriefcase" +uRLListFromBriefcase.size());
		}
	
	public String getContactTypesListForProfile(){
		currentProfileId=(Long)getSession().get("currentProfile");
		if(currentProfileId!=null)
		contactTypesList= privacyGroupService.loadAllPrivacyGroupsOfUser(currentProfileId);
		return "success";
	}
	public void prepare() throws Exception {
		LOGGER.info("Inside prepare");
		/*user = (Employer) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		
		contactType = new ContactTypes();
		contactTypesList= privacyGroupService.loadAllPrivacyGroupsOfUser(user.getId());*/
		
		briefcaseCategory =new BriefcaseCategory();
		briefcaseCategoryList =briefcaseCategoryService.findAll(briefcaseCategory);
		
		
	}
	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}
	public PrivacyGroupService getPrivacyGroupService() {
		return privacyGroupService;
	}

	public void setPrivacyGroupService(PrivacyGroupService privacyGroupService) {
		this.privacyGroupService = privacyGroupService;
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
	public BaseService<ContactTypes> getEmployerContactTypesService() {
		return employerContactTypesService;
	}
	public void setEmployerContactTypesService(
			BaseService<ContactTypes> employerContactTypesService) {
		this.employerContactTypesService = employerContactTypesService;
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
	public Employer getUser() {
		return user;
	}
	public void setUser(Employer user) {
		this.user = user;
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
	public List getItemsList() {
		return itemsList;
	}
	public void setItemsList(List itemsList) {
		this.itemsList = itemsList;
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

	public long getUnreadEmprMsgListSize() {
		return unreadEmprMsgListSize;
	}

	public void setUnreadEmprMsgListSize(long unreadEmprMsgListSize) {
		this.unreadEmprMsgListSize = unreadEmprMsgListSize;
	}

	public EmployerProfileService getEmployerProfileService() {
		return employerProfileService;
	}

	public void setEmployerProfileService(
			EmployerProfileService employerProfileService) {
		this.employerProfileService = employerProfileService;
	}


	public Long getCurrentProfileId() {
		return currentProfileId;
	}

	public void setCurrentProfileId(Long currentProfileId) {
		this.currentProfileId = currentProfileId;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public List getProfilelist() {
		return profilelist;
	}

	public void setProfilelist(List profilelist) {
		this.profilelist = profilelist;
	}


	public EmployeeProfileService getEmployeeProfileService() {
		return employeeProfileService;
	}

	public void setEmployeeProfileService(
			EmployeeProfileService employeeProfileService) {
		this.employeeProfileService = employeeProfileService;
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

	public EmployerProfile getEmployerProfile() {
		return employerProfile;
	}

	public void setEmployerProfile(EmployerProfile employerProfile) {
		this.employerProfile = employerProfile;
	}

	public BaseService<EmployerProfile> getEmployerProfileBaseService() {
		return employerProfileBaseService;
	}

	public void setEmployerProfileBaseService(
			BaseService<EmployerProfile> employerProfileBaseService) {
		this.employerProfileBaseService = employerProfileBaseService;
	}

	public PrivacyGroup getPrivacyGroup() {
		return privacyGroup;
	}

	public void setPrivacyGroup(PrivacyGroup privacyGroup) {
		this.privacyGroup = privacyGroup;
	}

	public BaseService<PrivacyGroup> getPrivacyGroupBaseService() {
		return privacyGroupBaseService;
	}

	public void setPrivacyGroupBaseService(
			BaseService<PrivacyGroup> privacyGroupBaseService) {
		this.privacyGroupBaseService = privacyGroupBaseService;
	}

	public Date getPrivacyGroupCreatedDate() {
		return privacyGroupCreatedDate;
	}

	public void setPrivacyGroupCreatedDate(Date privacyGroupCreatedDate) {
		this.privacyGroupCreatedDate = privacyGroupCreatedDate;
	}
}
