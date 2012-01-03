package com.mob.view.action.search;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.EmployerProfileService;
import com.mob.services.ItemService;
import com.mob.services.MessagingService;
import com.mob.services.OpportunityService;
import com.mob.services.SearchService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class ViewEmployerFromSearchAction extends ActionSupport implements Preparable{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ViewEmployerFromSearchAction.class);

	private BaseService<Employer> employerBaseService; 
	private long employerId;
	private long employerProfileId;
	private Employer viewEmployer=new Employer();
	private List employersProfileList;
	private SearchService searchService;
	private EmployerProfile employerProfile;
	
	private ItemService itemService;
	private List itemsList;
	private int itemcount;
	
	private long inboxMessageCount;
	private  MessagingService messagingService;
	private List  listInboxEmailMessages;
	private List<Opportunity> opportunityList=new ArrayList<Opportunity>();
	
	private List<EmployerProfile> profilelist=new ArrayList<EmployerProfile>();
	private EmployerProfileService employerProfileService;
	private EmployerProfile profile;
	
	
	private OpportunityService opportunityService;
	private List opportunityDetailsList=new ArrayList();
	
	private SearchService employeeProfilesForSearch; 
	private List employeeProfilesListForSearch;
	
	private Opportunity opportunity;	
	
	private BaseService<EmployerProfile> employerProfileBaseService;
	
	
	
	public String viewEmployerProfiles(){
		LOGGER.info("Entered viewEmployerProfiles");
		
		viewEmployer=employerBaseService.findByPrimaryKey(viewEmployer,employerProfile.getEmployer().getId());
		//employersProfileList=searchService.findListOfEmployerProfiles(employerProfile,viewEmployer.getId());
		employersProfileList=searchService.findListOfEmployerProfiles(employerProfile,employerProfileId);
		
		//itemsList = itemService.findItems(employerProfileId);
		//itemcount=itemsList.size();
		 
		listInboxEmailMessages= messagingService.findInboxListEmailMessages(viewEmployer.getId());
		inboxMessageCount=listInboxEmailMessages.size();
		
		LOGGER.info("employerId:"+employerId);	
		
		profilelist = employerProfileService.findUserProfile(employerId);
		Iterator it=profilelist.iterator();
		while(it.hasNext()){
			LOGGER.info("inside Iterator");
			profile=(EmployerProfile)it.next();
			
			opportunity=new Opportunity();
			opportunity.setProfileOwner(profile);
			opportunityList=opportunityService.findListOpportunities(opportunity.getProfileOwner().getId());
			
			LOGGER.info("opportunityList"+opportunityList.size());
			Iterator it1=opportunityList.iterator();
			while(it1.hasNext()){
			Opportunity opp=(Opportunity)it1.next();
			opportunityDetailsList.add(opp);
			LOGGER.info("opportunityDetailsList"+opportunityDetailsList.size());
			}
			}		
		return "success";
	}
	
	public void prepare() throws Exception {
		LOGGER.info("Entered prepare");
		User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
		LOGGER.info("logined user:--"+user.getId());
		Profile profile=new Profile();
		employeeProfilesListForSearch = new ArrayList();
		employeeProfilesListForSearch = employeeProfilesForSearch.findListOfEmployeeProfiles(profile,user.getId());
		LOGGER.info("employeeProfilesListForSearch:---"+employeeProfilesListForSearch.size());
		
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

	
	public long getEmployerId() {
		return employerId;
	}

	public void setEmployerId(long employerId) {
		this.employerId = employerId;
	}

	public Employer getViewEmployer() {
		return viewEmployer;
	}

	public void setViewEmployer(Employer viewEmployer) {
		this.viewEmployer = viewEmployer;
	}

	public List getEmployersProfileList() {
		return employersProfileList;
	}

	public void setEmployersProfileList(List employersProfileList) {
		this.employersProfileList = employersProfileList;
	}

	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	public EmployerProfile getEmployerProfile() {
		return employerProfile;
	}

	public void setEmployerProfile(EmployerProfile employerProfile) {
		this.employerProfile = employerProfile;
	}



	public BaseService<Employer> getEmployerBaseService() {
		return employerBaseService;
	}



	public void setEmployerBaseService(BaseService<Employer> employerBaseService) {
		this.employerBaseService = employerBaseService;
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



	public List<Opportunity> getOpportunityList() {
		return opportunityList;
	}



	public void setOpportunityList(List<Opportunity> opportunityList) {
		this.opportunityList = opportunityList;
	}



	public List<EmployerProfile> getProfilelist() {
		return profilelist;
	}



	public void setProfilelist(List<EmployerProfile> profilelist) {
		this.profilelist = profilelist;
	}



	public EmployerProfileService getEmployerProfileService() {
		return employerProfileService;
	}



	public void setEmployerProfileService(
			EmployerProfileService employerProfileService) {
		this.employerProfileService = employerProfileService;
	}



	public EmployerProfile getProfile() {
		return profile;
	}



	public void setProfile(EmployerProfile profile) {
		this.profile = profile;
	}



	public Opportunity getOpportunity() {
		return opportunity;
	}



	public void setOpportunity(Opportunity opportunity) {
		this.opportunity = opportunity;
	}



	public OpportunityService getOpportunityService() {
		return opportunityService;
	}



	public void setOpportunityService(OpportunityService opportunityService) {
		this.opportunityService = opportunityService;
	}



	public List getOpportunityDetailsList() {
		return opportunityDetailsList;
	}



	public void setOpportunityDetailsList(List opportunityDetailsList) {
		this.opportunityDetailsList = opportunityDetailsList;
	}

	public SearchService getEmployeeProfilesForSearch() {
		return employeeProfilesForSearch;
	}

	public void setEmployeeProfilesForSearch(SearchService employeeProfilesForSearch) {
		this.employeeProfilesForSearch = employeeProfilesForSearch;
	}

	public List getEmployeeProfilesListForSearch() {
		return employeeProfilesListForSearch;
	}

	public void setEmployeeProfilesListForSearch(List employeeProfilesListForSearch) {
		this.employeeProfilesListForSearch = employeeProfilesListForSearch;
	}

	public BaseService<EmployerProfile> getEmployerProfileBaseService() {
		return employerProfileBaseService;
	}

	public void setEmployerProfileBaseService(
			BaseService<EmployerProfile> employerProfileBaseService) {
		this.employerProfileBaseService = employerProfileBaseService;
	}

	public long getEmployerProfileId() {
		return employerProfileId;
	}

	public void setEmployerProfileId(long employerProfileId) {
		this.employerProfileId = employerProfileId;
	}



	

}
