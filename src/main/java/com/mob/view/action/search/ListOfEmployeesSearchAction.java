package com.mob.view.action.search;

import java.util.Iterator;
import java.util.List;
import org.acegisecurity.context.SecurityContextHolder;
import com.mob.model.PrivacyGroup;
import com.mob.model.User;
import com.mob.model.profile.PhysicalTraits;
import com.mob.model.profile.Profile;
import com.mob.services.EmployeeProfileService;
import com.mob.services.PrivacyGroupService;
import com.mob.services.SearchService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class ListOfEmployeesSearchAction extends ActionSupport{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ListOfEmployeesSearchAction.class);
    private static final long serialVersionUID = 1L;

	private String employeeName;
	private String employeeLocation;
	
	private SearchService searchService;
	private User user;
	
	private List<Profile> employeesList;
	private String search;
	
	private List contactTypesList;
	private PrivacyGroup privacyGroup;	
	
	private PrivacyGroupService privacygroupService;
	
	private Profile profile;
	private List<Profile> profiles;
	
	private Profile currentProfile;
	 private EmployeeProfileService employeeProfileService;
	 private String  image;
		private String  resizedMinImage;
		private String  resizedMidImage;
		 private String resizedMidPicture;
		    private String resizedMinPicture;
		
	private long currentProfileID;
	
	public String searchAllEmployees(){
		LOGGER.info("Entered searchAllEmployees");
		User user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		
		employeesList=searchService.findListOfEmployees(employeeName,employeeLocation);
		 
		LOGGER.info("employeelist size:-----"+employeesList.size());
		
		profiles = searchService.findListOfEmployeeProfiles(profile,user.getId());
		if(profiles.size()!=0){
		currentProfile=employeeProfileService.getDefaultProfileForUser(user.getId());
		contactTypesList=privacygroupService.loadAllPrivacyGroupsOfUser(currentProfile.getId());
		}
		return "success";
	}
	
	
	public String getPrivacyGroupForContactByProfileId(){
		contactTypesList = privacygroupService.loadAllPrivacyGroupsOfUser(profile.getId());
		return "success";
	}

	public String searchEmployees(){
		
		User user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
			
		employeesList=searchService.findAllEmployeeProfilesFromSearch(search);
		// physicalTraitsList= userPhysicalTraits.findUserPhysicalTraits(physicalTraits,profile.getId());
		 Iterator<Profile> it = employeesList.iterator();
		 try {
			 while (it.hasNext()) {
					// Get element
				 profile = it.next();
					
				 if(profile.getPicture()!=null){
					 image=(String) profile.getAmazonFileURL().get(0);
					}
					if(profile.getResizedMidPicture()!=null){
						resizedMidPicture=(String) profile.getAmazonFileURL().get(1);
						profile.setResizedMidPicture(resizedMidPicture);
					}
					if(profile.getResizedMinPicture()!=null){
						resizedMinPicture=(String) profile.getAmazonFileURL().get(2);
						profile.setResizedMinPicture(resizedMinPicture);
					}
					
			 }
		 }catch (Exception e) {
		e.printStackTrace();	
		 }
		profiles = searchService.findListOfEmployeeProfiles(profile,user.getId());
		if(profiles.size()!=0){
		currentProfile=employeeProfileService.getDefaultProfileForUser(user.getId());
		contactTypesList=privacygroupService.loadAllPrivacyGroupsOfUser(currentProfile.getId());
		}
		currentProfileID=currentProfile.getId();	
		/*if(profile.getPicture()!=null){
			image=(String) profile.getAmazonFileURL().get(0);
		}
		if(profile.getResizedMidPicture()!=null){
			resizedMidImage=(String) profile.getAmazonFileURL().get(1);
		}
		if(profile.getResizedMinPicture()!=null){
			resizedMinImage=(String) profile.getAmazonFileURL().get(2);
		}

		System.out.println("Image" +image);*/
		
		
		return "success";
	}

	public PrivacyGroup getPrivacyGroup() {
		return privacyGroup;
	}

	public PrivacyGroupService getPrivacygroupService() {
		return privacygroupService;
	}

	public void setPrivacygroupService(PrivacyGroupService privacygroupService) {
		this.privacygroupService = privacygroupService;
	}

	public void setPrivacyGroup(PrivacyGroup privacyGroup) {
		this.privacyGroup = privacyGroup;
	}


	public List getContactTypesList() {
		return contactTypesList;
	}

	public void setContactTypesList(List contactTypesList) {
		this.contactTypesList = contactTypesList;
	}

    public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getEmployeeLocation() {
		return employeeLocation;
	}

	public void setEmployeeLocation(String employeeLocation) {
		this.employeeLocation = employeeLocation;
	}

	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	



	public void setEmployeesList(List<Profile> employeesList) {
		this.employeesList = employeesList;
	}

	public List<Profile> getEmployeesList() {
		return employeesList;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public List<Profile> getProfiles() {
		return profiles;
	}

	public void setProfiles(List<Profile> profiles) {
		this.profiles = profiles;
	}
	public void setCurrentProfile(Profile currentProfile) {
		this.currentProfile = currentProfile;
	}
	public void setEmployeeProfileService(
			EmployeeProfileService employeeProfileService) {
		this.employeeProfileService = employeeProfileService;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getResizedMinImage() {
		return resizedMinImage;
	}


	public void setResizedMinImage(String resizedMinImage) {
		this.resizedMinImage = resizedMinImage;
	}


	public String getResizedMidImage() {
		return resizedMidImage;
	}


	public void setResizedMidImage(String resizedMidImage) {
		this.resizedMidImage = resizedMidImage;
	}


	public String getResizedMidPicture() {
		return resizedMidPicture;
	}


	public void setResizedMidPicture(String resizedMidPicture) {
		this.resizedMidPicture = resizedMidPicture;
	}


	public String getResizedMinPicture() {
		return resizedMinPicture;
	}


	public void setResizedMinPicture(String resizedMinPicture) {
		this.resizedMinPicture = resizedMinPicture;
	}


	public long getCurrentProfileID() {
		return currentProfileID;
	}


	public void setCurrentProfileID(long currentProfileID) {
		this.currentProfileID = currentProfileID;
	}


	
	
	
}
