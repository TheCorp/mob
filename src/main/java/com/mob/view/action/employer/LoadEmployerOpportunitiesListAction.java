package com.mob.view.action.employer;

import java.io.File;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.acegisecurity.context.SecurityContextHolder;
import org.apache.struts2.interceptor.SessionAware;

import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Industry;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.EmployerProfileService;
import com.mob.services.ItemService;
import com.mob.services.OpportunityService;
import com.mob.services.ProfileService;
import com.mob.services.UserManagement;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class LoadEmployerOpportunitiesListAction extends ActionSupport
		implements SessionAware {
	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER = new MOBLogger(
			LoadEmployerOpportunitiesListAction.class);

	private static final long serialVersionUID = 1L;

	private Opportunity opportunity;
	private OpportunityService opportunityService;
	private Map session;

	private EmployerProfile profile;
	private EmployerProfileService employerProfileService;
	private Employer user;
	private BaseService<Profile> profileService;
	private List<Opportunity> opportunityList = new ArrayList<Opportunity>();
	private List opportunityDetailsList = new ArrayList();
	private List<EmployerProfile> profilelist;
	private ItemService itemService;
	private List itemsList;
	private int itemcount;
	private BaseService<Employer> editEmployerService;

	private BaseService<EmployerProfile> editEmployerProfileService;
	private Employer employer;
	private EmployerProfile employerProfile;
	private int employerId;
	private List<String> states;
	private String organizationName;
	private String city;
	private String SkypeId;
	private String zipcode;
	private String state;

	private String address1;
	private String address2;
	private String missionstatement;
	private String website;
	private String phonenumber;
	private Profile emplrProfile;
	private String emplrorganizationInfo;
	private String emplrorganizationCulture;
	private String whyChooseUs;
	private List<Employer> emplrProfilelist;
	private String confirmpassword;

	private BaseService<EmployerProfile> employerEditProfileService;
	private BaseService<Profile> employerService;
	private BaseService<Employer> employerProfileEditService;
	private BaseService<EmployerProfile> employerProfileBaseService;
	// private EmployerProfileService employerProfileService;

	private UserManagement userManagement;
	private ProfileService pService;
	private CreateEmployerAction emloyerAction;
	private String email;
	private String image;
	private String resizedMidImage;
	private String resizedMidImage_employerProfile;

	private File upload;// The actual file
	private String uploadContentType; // The content type of the file
	private String uploadFileName; // The uploaded file name
	
	private Industry industry;
    private List industryList = new ArrayList();
    private BaseService<Industry> industryService;
	
	// private Set<EmployerProfile> profilelist1;

    public List getIndustryList() {
		return industryList;
	}

	public void setIndustry(Industry industry) {
		this.industry = industry;
	}

	public Industry getIndustry() {
		return industry;
	}

	public void setIndustryService(BaseService<Industry> industryService) {
		this.industryService = industryService;
	}

	public String loadEmployerOpportunities() {
		LOGGER.info("inside loadEmployerOpportunities");
		profile = new EmployerProfile();
		long defaultProfileId;

		user = (Employer) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		profile.setEmployer(user);
		profilelist = employerProfileService.findUserProfile(profile
				.getEmployer().getId());
		emplrProfilelist = employerProfileService
				.findemplrProfile(user.getId());
		employer = employerProfileService.loadEmployerAccInfo(user.getId());
		industry = employer.getIndustry();
		if (employer.getPicture() != null) {
			image = (String) employer.getAmazonFileURL().get(0);
		}

		if (employer.getResizedMidPicture() != null) {
			resizedMidImage_employerProfile = (String) employer
					.getAmazonFileURL().get(1);
		}

		Iterator it2 = profilelist.iterator();
		while (it2.hasNext()) {
			Profile profile1 = (Profile) it2.next();
			if (profile1.getStatus() != null) {
				if (profile1.getStatus().equals("default")) {
					defaultProfileId = profile1.getId();
					System.out.println("defaultProfileId:" + defaultProfileId);
					getSession().put("currentProfile", defaultProfileId);

					/*
					 * if(profile1.getPicture()!=null){ image=(String)
					 * profile1.getAmazonFileURL().get(0); }
					 */
					if (profile1.getResizedMidPicture() != null) {
						resizedMidImage = (String) profile1.getAmazonFileURL()
								.get(1);
					}

				}
			}
		}
		Iterator it = profilelist.iterator();
		while (it.hasNext()) {
			LOGGER.info("inside Iterator");
			profile = (EmployerProfile) it.next();

			opportunity = new Opportunity();
			opportunity.setProfileOwner(profile);
			opportunityList = opportunityService
					.findListOpportunities(opportunity.getProfileOwner()
							.getId());

			Iterator it1 = opportunityList.iterator();
			while (it1.hasNext()) {
				Opportunity opp = (Opportunity) it1.next();
				opportunityDetailsList.add(opp);
			}
		}
		briefcaseItemList();

		return "success";

	}

	public String editEmployerAccountdetails() {
		user = (Employer) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		employer = employerProfileService.loadEmployerAccInfo(user.getId());
		if (employer.getResizedMidPicture() != null) {
			resizedMidImage_employerProfile = (String) employer
					.getAmazonFileURL().get(1);
		}

		whyChooseUs = employer.getWhyChooseUs();
		emplrorganizationInfo = employer.getEmplrorganizationInfo();
		emplrorganizationCulture = employer.getEmplrorganizationCulture();
		missionstatement = employer.getMissionstatement();
		states = pService.listStates();
		employerId = (int) employer.getId();
		Industry industry = new Industry();

        industryList = industryService.findAll(industry);
		
		return "success";
	}

	public void briefcaseItemList() {
		System.out.println("briefcaseItemList");
		itemsList = itemService.findItems(profile.getId());
		LOGGER.info("items size:" + itemsList.size());
		itemcount = itemsList.size();

	}

	public String listEmployerOpportunities() {
		profile = new EmployerProfile();
		LOGGER.info("inside listEmployerOpportunities");
		user = (Employer) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();
		profile.setEmployer(user);
		profilelist = employerProfileService.findUserProfile(profile
				.getEmployer().getId());
		opportunity = new Opportunity();
		opportunity.setProfileOwner(profile);
		opportunityList = opportunityService.findListOpportunities(opportunity
				.getProfileOwner().getId());
		return "success";
	}

	public String saveEmployerProfileAccountDetails() {
		try {
			user = (Employer) SecurityContextHolder.getContext()
					.getAuthentication().getPrincipal();
			profile = new EmployerProfile();
			employer = new Employer();
			employer = employerProfileService.loadEmployerAccInfo(user.getId());
			employer.setOrganizationName(organizationName);
			// employer.setPassword(password);
			employer.setEmplrorganizationCulture(emplrorganizationCulture);
			employer.setEmplrorganizationInfo(emplrorganizationInfo);
			employer.setPhoneNumber(phonenumber);
			employer.setCity(city);
			employer.setSkypeId(SkypeId);
			employer.setZipcode(zipcode);
			employer.setState(state);
			employer.setAddress1(address1);
			employer.setEmail(email);
			
			if(industry!=null && industry.getId()>0){
				employer.setIndustry(industry);
			}

			if (!confirmpassword.equalsIgnoreCase(""))
				employer.setPassword(emloyerAction.encrypt(confirmpassword));

			// user.setPassword(confirmpassword);

			employer.setAddress2(address2);
			employer.setWhyChooseUs(whyChooseUs);
			employer.setMissionstatement(missionstatement);
			employer.setWebsite(website);
			employerProfileEditService.update(employer);

			// added for update employer profile page//
			List profilesList = employerProfileService
					.findUserProfile(user.getId());
			profile = employerProfileService.findEmployerProfile(user.getId());

			if (this.upload != null && upload.length() > 0) {
				this.userManagement.addEmployerPicture(employer,
						this.upload.getAbsolutePath(), uploadFileName,
						uploadContentType);
			}
			// this.userManagement.updateUserPicture(user,this.upload.getAbsolutePath(),uploadFileName);

			return "success";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return "error";
		}

	}

	public List<EmployerProfile> getProfilelist() {
		return profilelist;
	}

	public void setProfilelist(List<EmployerProfile> profilelist) {
		this.profilelist = profilelist;
	}

	public Opportunity getOpportunity() {
		return opportunity;
	}

	public void setOpportunity(Opportunity opportunity) {
		this.opportunity = opportunity;
	}

	public EmployerProfile getProfile() {
		return profile;
	}

	public void setProfile(EmployerProfile profile) {
		this.profile = profile;
	}

	public BaseService<Profile> getProfileService() {
		return profileService;
	}

	public void setProfileService(BaseService<Profile> profileService) {
		this.profileService = profileService;
	}

	public Employer getUser() {
		return user;
	}

	public void setUser(Employer user) {
		this.user = user;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	public List<Opportunity> getOpportunityList() {
		return opportunityList;
	}

	public void setOpportunityList(List<Opportunity> opportunityList) {
		this.opportunityList = opportunityList;
	}

	public List getOpportunityDetailsList() {
		return opportunityDetailsList;
	}

	public void setOpportunityDetailsList(List opportunityDetailsList) {
		this.opportunityDetailsList = opportunityDetailsList;
	}

	public OpportunityService getOpportunityService() {
		return opportunityService;
	}

	public void setOpportunityService(OpportunityService opportunityService) {
		this.opportunityService = opportunityService;
	}

	public EmployerProfileService getEmployerProfileService() {
		return employerProfileService;
	}

	public void setEmployerProfileService(
			EmployerProfileService employerProfileService) {
		this.employerProfileService = employerProfileService;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
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

	public BaseService<Employer> getEditEmployerService() {
		return editEmployerService;
	}

	public void setEditEmployerService(BaseService<Employer> editEmployerService) {
		this.editEmployerService = editEmployerService;
	}

	public BaseService<EmployerProfile> getEditEmployerProfileService() {
		return editEmployerProfileService;
	}

	public void setEditEmployerProfileService(
			BaseService<EmployerProfile> editEmployerProfileService) {
		this.editEmployerProfileService = editEmployerProfileService;
	}

	public EmployerProfile getEmployerProfile() {
		return employerProfile;
	}

	public void setEmployerProfile(EmployerProfile employerProfile) {
		this.employerProfile = employerProfile;
	}

	public int getEmployerId() {
		return employerId;
	}

	public void setEmployerId(int employerId) {
		this.employerId = employerId;
	}

	public Employer getEmployer() {
		return employer;
	}

	public void setEmployer(Employer employer) {
		this.employer = employer;
	}

	public String getOrganizationName() {
		return organizationName;
	}

	public void setOrganizationName(String organizationName) {
		this.organizationName = organizationName;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getMissionstatement() {
		return missionstatement;
	}

	public void setMissionstatement(String missionstatement) {
		this.missionstatement = missionstatement;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public Profile getEmplrProfile() {
		return emplrProfile;
	}

	public void setEmplrProfile(Profile emplrProfile) {
		this.emplrProfile = emplrProfile;
	}

	public BaseService<EmployerProfile> getEmployerEditProfileService() {
		return employerEditProfileService;
	}

	public void setEmployerEditProfileService(
			BaseService<EmployerProfile> employerEditProfileService) {
		this.employerEditProfileService = employerEditProfileService;
	}

	public BaseService<Profile> getEmployerService() {
		return employerService;
	}

	public void setEmployerService(BaseService<Profile> employerService) {
		this.employerService = employerService;
	}

	public BaseService<Employer> getEmployerProfileEditService() {
		return employerProfileEditService;
	}

	public void setEmployerProfileEditService(
			BaseService<Employer> employerProfileEditService) {
		this.employerProfileEditService = employerProfileEditService;
	}

	public String getEmplrorganizationInfo() {
		return emplrorganizationInfo;
	}

	public void setEmplrorganizationInfo(String emplrorganizationInfo) {
		this.emplrorganizationInfo = emplrorganizationInfo;
	}

	public String getEmplrorganizationCulture() {
		return emplrorganizationCulture;
	}

	public void setEmplrorganizationCulture(String emplrorganizationCulture) {
		this.emplrorganizationCulture = emplrorganizationCulture;
	}

	public String getWhyChooseUs() {
		return whyChooseUs;
	}

	public void setWhyChooseUs(String whyChooseUs) {
		this.whyChooseUs = whyChooseUs;
	}

	public List<Employer> getEmplrProfilelist() {
		return emplrProfilelist;
	}

	public void setEmplrProfilelist(List<Employer> emplrProfilelist) {
		this.emplrProfilelist = emplrProfilelist;
	}

	public String getConfirmpassword() {
		return confirmpassword;
	}

	public void setConfirmpassword(String confirmpassword) {
		this.confirmpassword = confirmpassword;
	}

	public BaseService<EmployerProfile> getEmployerProfileBaseService() {
		return employerProfileBaseService;
	}

	public void setEmployerProfileBaseService(
			BaseService<EmployerProfile> employerProfileBaseService) {
		this.employerProfileBaseService = employerProfileBaseService;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public UserManagement getUserManagement() {
		return userManagement;
	}

	public void setUserManagement(UserManagement userManagement) {
		this.userManagement = userManagement;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getSkypeId() {
		return SkypeId;
	}

	public void setSkypeId(String skypeId) {
		SkypeId = skypeId;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public void setPService(ProfileService service) {
		pService = service;
	}

	public List<String> getStates() {
		return states;
	}

	public void setStates(List<String> states) {
		this.states = states;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public CreateEmployerAction getEmloyerAction() {
		return emloyerAction;
	}

	public void setEmloyerAction(CreateEmployerAction emloyerAction) {
		this.emloyerAction = emloyerAction;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
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

	public String getResizedMidImage_employerProfile() {
		return resizedMidImage_employerProfile;
	}

	public void setResizedMidImage_employerProfile(
			String resizedMidImage_employerProfile) {
		this.resizedMidImage_employerProfile = resizedMidImage_employerProfile;
	}

}
