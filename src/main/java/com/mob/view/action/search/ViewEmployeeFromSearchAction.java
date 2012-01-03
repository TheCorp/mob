package com.mob.view.action.search;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.ItemService;
import com.mob.services.MessagingService;
import com.mob.services.PrivacyGroupService;
import com.mob.services.SearchService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class ViewEmployeeFromSearchAction extends ActionSupport{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ViewEmployeeFromSearchAction.class);

   // private User mobuser;
	private BaseService<Profile> baseService; 
	private long employeeId;
	private Profile viewEmployee=new Profile();
	private List employeesProfileList;
	
	private Profile employeeProfile;
	private SearchService searchService;
	
	private ItemService itemService;
	private List itemsList;
	private int itemcount;

	private long inboxMessageCount;
	private  MessagingService messagingService;
	private List  listInboxEmailMessages;
	private long employeeProfileId;
	private PrivacyGroupService privacyGroupService;
	

	public PrivacyGroupService getPrivacyGroupService() {
		return privacyGroupService;
	}




	public void setPrivacyGroupService(PrivacyGroupService privacyGroupService) {
		this.privacyGroupService = privacyGroupService;
	}




	public String viewEmployeeProfiles(){
		LOGGER.info("Entered viewEmployeeProfiles");
		LOGGER.info("employeeId"+employeeId);
		//viewEmployee=baseService.findByPrimaryKey(viewEmployee,employeeId);
		employeeProfile=new Profile();
		viewEmployee=baseService.findByPrimaryKey(employeeProfile,employeeProfileId);
		
		employeesProfileList=searchService.findListOfEmployeeProfiles(employeeProfile,viewEmployee.getId());
		LOGGER.info("employeesProfileList size:"+employeesProfileList.size());
		
		itemsList = itemService.findItems(viewEmployee.getId());
		itemcount=itemsList.size();
		LOGGER.info("item count:"+itemcount);
		
		listInboxEmailMessages= messagingService.findInboxListEmailMessages(viewEmployee.getId());
		inboxMessageCount=listInboxEmailMessages.size();
		LOGGER.info("inbox msg count"+inboxMessageCount);
		
		User mobuser = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		
		boolean res=privacyGroupService.isItemViewableByViewer("Work Experience",mobuser.getId(),viewEmployee.getId());
		
		return "success";
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
	
	

	public long getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(long employeeId) {
		this.employeeId = employeeId;
	}
	
	

	public List getEmployeesProfileList() {
		return employeesProfileList;
	}

	public void setEmployeesProfileList(List employeesProfileList) {
		this.employeesProfileList = employeesProfileList;
	}

	

	public Profile getEmployeeProfile() {
		return employeeProfile;
	}

	public void setEmployeeProfile(Profile employeeProfile) {
		this.employeeProfile = employeeProfile;
	}

	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}




	public long getEmployeeProfileId() {
		return employeeProfileId;
	}




	public void setEmployeeProfileId(long employeeProfileId) {
		this.employeeProfileId = employeeProfileId;
	}




	public void setBaseService(BaseService<Profile> baseService) {
		this.baseService = baseService;
	}




	public BaseService<Profile> getBaseService() {
		return baseService;
	}




	public void setViewEmployee(Profile viewEmployee) {
		this.viewEmployee = viewEmployee;
	}




	public Profile getViewEmployee() {
		return viewEmployee;
	}
	
}
