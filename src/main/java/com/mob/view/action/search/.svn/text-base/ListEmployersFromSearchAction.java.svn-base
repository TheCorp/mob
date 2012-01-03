package com.mob.view.action.search;

import java.util.Iterator;
import java.util.List;
import org.acegisecurity.context.SecurityContextHolder;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Profile;
import com.mob.services.EmployeeProfileService;
import com.mob.services.PrivacyGroupService;
import com.mob.services.SearchService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class ListEmployersFromSearchAction extends ActionSupport{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ListEmployersFromSearchAction.class);
    private static final long serialVersionUID = 1L;

	private String employerName;
	private String employerLocation;
	private SearchService searchService;
	
	private List<Profile> employersList;
	private List<EmployerProfile> employerSearchList;
	private List<Employer> employerSearchList1;
	public String search;
	
	private List contactTypesList;
	private PrivacyGroupService privacygroupService;
	
	private Profile profile;
	private List<Profile> profiles;
	
	private Profile currentProfile;
	private EmployeeProfileService employeeProfileService;
	private String  image;
	private String  resizedMidImage;
	 private String resizedMidPicture;
	private String resizedMinPicture;
	    private EmployerProfile profileImages;
	    private Employer emplrProfileImages;

	public String searchAllEmployers(){
		LOGGER.info("Entered searchAllEmployers");
		
		User user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		
		employerSearchList=searchService.findListOfEmployers(employerName,employerLocation);
		
		profiles = searchService.findListOfEmployeeProfiles(profile,user.getId());
		
		if(profiles.size()!=0){
		currentProfile=employeeProfileService.getDefaultProfileForUser(user.getId());
		contactTypesList=privacygroupService.loadAllPrivacyGroupsOfUser(currentProfile.getId());
		}
		return "success";
	}
	
	public String checkEmployer(){
		
		User user = (User) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();

	//	employerSearchList = searchService.findAllEmployer(search);
		employerSearchList1=searchService.findAllEmployerList(search);
		profiles = searchService.findListOfEmployeeProfiles(profile, user
				.getId());
		if (profiles.size() != 0) {
			currentProfile = employeeProfileService
					.getDefaultProfileForUser(user.getId());
			contactTypesList = privacygroupService
					.loadAllPrivacyGroupsOfUser(currentProfile.getId());
		}
		 Iterator<Employer> it = employerSearchList1.iterator();
		try {
			while (it.hasNext()) {
				// Get element
				emplrProfileImages = it.next();

				if (emplrProfileImages.getPicture() != null) {
					image = (String) emplrProfileImages.getAmazonFileURL().get(
							0);
				}
				if (emplrProfileImages.getResizedMidPicture() != null) {
					resizedMidPicture = (String) emplrProfileImages
							.getAmazonFileURL().get(1);
					emplrProfileImages.setResizedMidPicture(resizedMidPicture);
				}
				if (emplrProfileImages.getResizedMinPicture() != null) {
					resizedMinPicture = (String) emplrProfileImages
							.getAmazonFileURL().get(2);
					emplrProfileImages.setResizedMinPicture(resizedMinPicture);
				}

			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
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
	
	public String getEmployerName() {
		return employerName;
	}

	public void setEmployerName(String employerName) {
		this.employerName = employerName;
	}

	public String getEmployerLocation() {
		return employerLocation;
	}

	public void setEmployerLocation(String employerLocation) {
		this.employerLocation = employerLocation;
	}

	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	public PrivacyGroupService getPrivacygroupService() {
		return privacygroupService;
	}

	public void setPrivacygroupService(PrivacyGroupService privacygroupService) {
		this.privacygroupService = privacygroupService;
	}

	public void setEmployerSearchList(List<EmployerProfile> employerSearchList) {
		this.employerSearchList = employerSearchList;
	}

	public List<EmployerProfile> getEmployerSearchList() {
		return employerSearchList;
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

	public void setEmployersList(List<Profile> employersList) {
		this.employersList = employersList;
	}

	public List<Profile> getEmployersList() {
		return employersList;
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

	public EmployerProfile getProfileImages() {
		return profileImages;
	}

	public void setProfileImages(EmployerProfile profileImages) {
		this.profileImages = profileImages;
	}

	public List<Employer> getEmployerSearchList1() {
		return employerSearchList1;
	}

	public void setEmployerSearchList1(List<Employer> employerSearchList1) {
		this.employerSearchList1 = employerSearchList1;
	}

	public Employer getEmplrProfileImages() {
		return emplrProfileImages;
	}

	public void setEmplrProfileImages(Employer emplrProfileImages) {
		this.emplrProfileImages = emplrProfileImages;
	}

	
}
