package com.mob.view.action.search;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Feedback;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.EmployeeProfileService;
import com.mob.services.FeedbackService;
import com.mob.services.ItemService;
import com.mob.services.OpportunityService;
import com.mob.services.PrivacyGroupService;
import com.mob.services.SearchService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class ViewEmployerProfileFromSearchAction extends ActionSupport{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ViewEmployerProfileFromSearchAction.class);

	private long employerId;
	private Employer employer=new Employer();
	private EmployerProfile employerProfile=new EmployerProfile();
	
	private BaseService<EmployerProfile> employerProfileBaseService; 
	private BaseService<Employer> employerBaseService; 
	
	private SearchService searchService;
	private OpportunityService opportunityService;
	private List opportunityDetailsList;
	
	private Feedback feedback;
	private FeedbackService feedbackService;
	private int possitiveSize;
	
	private BaseService<User> userBaseService;
	private User feedbackOwner=new User();
	private int allProfilesFeedbackCount;
	private List allProfilesFeedback;
	private BaseService<EmployerProfile> profileBaseService;
	
	private List profilesListForSearch;
	private ItemService itemService;
    private List itemsList;
    private int itemcount;
    private List contactTypesList;
    
    private Profile currentProfile;
    private EmployeeProfileService employeeProfileService;
    private PrivacyGroupService privacygroupService;
    private String  resizedMidImage_employerProfile;
	public String viewEmployerProfile(){
		
		//employer=employerBaseService.findByPrimaryKey(employer,employerId);
	   //employerProfile=employerProfileBaseService.findByPrimaryKey(employerProfile,employerProfile.getId());
		User user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		Profile profile=new Profile();
		profilesListForSearch=searchService.findListOfEmployeeProfiles(profile,user.getId());
		employerProfile=searchService.findEmployerProfileForView(employerProfile,employerProfile.getId());
		employer=employerBaseService.findByPrimaryKey(employer,employerProfile.getEmployer().getId());
		opportunityDetailsList=opportunityService.findListOpportunities(employerProfile.getId());
		List positiveListSize= feedbackService.findListOfFeedbacks(feedback,employerProfile.getId()); 
	   	possitiveSize=positiveListSize.size();
	   	if(employer.getResizedMidPicture()!=null){
			resizedMidImage_employerProfile=(String) employer.getAmazonFileURL().get(0);
		}
		
	   	listOfAllProfileFeedbacks();
	   	briefcaseItemList();
	   	contactsTypeList();
		return "success";
	}
	
	public void  listOfAllProfileFeedbacks(){
		
		 employerProfile=profileBaseService.findByPrimaryKey(employerProfile,employerProfile.getId());	
		 feedbackOwner=userBaseService.findByPrimaryKey(feedbackOwner,employerProfile.getEmployer().getId());
		 allProfilesFeedback= feedbackService.findAllProfilesFeedback(feedback, feedbackOwner.getId());   
		 allProfilesFeedbackCount=allProfilesFeedback.size();
		
	
		}
	
	public  void   briefcaseItemList(){
		employerProfile=profileBaseService.findByPrimaryKey(employerProfile,employerProfile.getId());	
		System.out.println("briefcaseItemList");
		 itemsList = itemService.findItems(employerProfile.getId());
         LOGGER.info("items size:" + itemsList.size());
         itemcount = itemsList.size();
		
	}
	public  void   contactsTypeList(){
		User user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		employerProfile=profileBaseService.findByPrimaryKey(employerProfile,employerProfile.getId());	
		currentProfile=employeeProfileService.getDefaultProfileForUser(user.getId());
		contactTypesList=privacygroupService.loadAllPrivacyGroupsOfUser(currentProfile.getId());

	}
	

	public EmployerProfile getEmployerProfile() {
		return employerProfile;
	}

	public void setEmployerProfile(EmployerProfile employerProfile) {
		this.employerProfile = employerProfile;
	}

	public long getEmployerId() {
		return employerId;
	}

	public void setEmployerId(long employerId) {
		this.employerId = employerId;
	}

	public Employer getEmployer() {
		return employer;
	}

	public void setEmployer(Employer employer) {
		this.employer = employer;
	}

	public BaseService<EmployerProfile> getEmployerProfileBaseService() {
		return employerProfileBaseService;
	}

	public void setEmployerProfileBaseService(
			BaseService<EmployerProfile> employerProfileBaseService) {
		this.employerProfileBaseService = employerProfileBaseService;
	}

	public BaseService<Employer> getEmployerBaseService() {
		return employerBaseService;
	}

	public void setEmployerBaseService(BaseService<Employer> employerBaseService) {
		this.employerBaseService = employerBaseService;
	}

	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
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

	public Feedback getFeedback() {
		return feedback;
	}

	public void setFeedback(Feedback feedback) {
		this.feedback = feedback;
	}

	public FeedbackService getFeedbackService() {
		return feedbackService;
	}

	public void setFeedbackService(FeedbackService feedbackService) {
		this.feedbackService = feedbackService;
	}

	public int getPossitiveSize() {
		return possitiveSize;
	}

	public void setPossitiveSize(int possitiveSize) {
		this.possitiveSize = possitiveSize;
	}

	public BaseService<User> getUserBaseService() {
		return userBaseService;
	}

	public void setUserBaseService(BaseService<User> userBaseService) {
		this.userBaseService = userBaseService;
	}

	public User getFeedbackOwner() {
		return feedbackOwner;
	}

	public void setFeedbackOwner(User feedbackOwner) {
		this.feedbackOwner = feedbackOwner;
	}

	public int getAllProfilesFeedbackCount() {
		return allProfilesFeedbackCount;
	}

	public void setAllProfilesFeedbackCount(int allProfilesFeedbackCount) {
		this.allProfilesFeedbackCount = allProfilesFeedbackCount;
	}

	public List getAllProfilesFeedback() {
		return allProfilesFeedback;
	}

	public void setAllProfilesFeedback(List allProfilesFeedback) {
		this.allProfilesFeedback = allProfilesFeedback;
	}

	public BaseService<EmployerProfile> getProfileBaseService() {
		return profileBaseService;
	}

	public void setProfileBaseService(
			BaseService<EmployerProfile> profileBaseService) {
		this.profileBaseService = profileBaseService;
	}

	public void setProfilesListForSearch(List profilesListForSearch) {
		this.profilesListForSearch = profilesListForSearch;
	}

	public List getProfilesListForSearch() {
		return profilesListForSearch;
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

	public List getContactTypesList() {
		return contactTypesList;
	}

	public void setContactTypesList(List contactTypesList) {
		this.contactTypesList = contactTypesList;
	}

	public Profile getCurrentProfile() {
		return currentProfile;
	}

	public void setCurrentProfile(Profile currentProfile) {
		this.currentProfile = currentProfile;
	}

	public EmployeeProfileService getEmployeeProfileService() {
		return employeeProfileService;
	}

	public void setEmployeeProfileService(
			EmployeeProfileService employeeProfileService) {
		this.employeeProfileService = employeeProfileService;
	}

	public PrivacyGroupService getPrivacygroupService() {
		return privacygroupService;
	}

	public void setPrivacygroupService(PrivacyGroupService privacygroupService) {
		this.privacygroupService = privacygroupService;
	}

	public String getResizedMidImage_employerProfile() {
		return resizedMidImage_employerProfile;
	}

	public void setResizedMidImage_employerProfile(
			String resizedMidImage_employerProfile) {
		this.resizedMidImage_employerProfile = resizedMidImage_employerProfile;
	}


}
