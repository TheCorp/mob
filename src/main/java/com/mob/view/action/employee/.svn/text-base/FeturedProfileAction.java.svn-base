package com.mob.view.action.employee;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.PrivacyGroup;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.FeturedProfile;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.PrivacyGroupNames;
import com.mob.services.PrivacyGroupService;
import com.mob.util.MOBLogger;
import com.mob.view.action.employer.LoadEmployerBriefcaseItems;
import com.opensymphony.xwork2.ActionSupport;
 
public class FeturedProfileAction extends ActionSupport{
    private static final MOBLogger LOGGER =
        new MOBLogger(LoadEmployerBriefcaseItems.class);
   private FeturedProfile feturedProfile;
   private BaseService<FeturedProfile> feturedProfileBaseService;   
   private List<FeturedProfile> feturedProfileList;
   private BaseService<Profile> prfileBaseService;
   private List<Profile> profileList = new ArrayList<Profile>();
   private List<Profile> profileListFeatured = new ArrayList<Profile>();
   private Profile  profile;
	
	private EmployerProfile employerProfile;	
	private BaseService<EmployerProfile> employerProfileBaseService;
	
	
	private PrivacyGroup privacyGroup;
	private BaseService<PrivacyGroup> privacyGroupBaseService;
	private Date privacyGroupCreatedDate;
	private PrivacyGroupService privacyGroupService;
	private String resizedMidPicture;
   
	public String getFeturedProfiles(){
		
		feturedProfile=new FeturedProfile();
		profile = new Profile();
		feturedProfileList=feturedProfileBaseService.findAll(feturedProfile);
		
		for(FeturedProfile fp:feturedProfileList){
			profileList.add(prfileBaseService.findByPrimaryKey(new Profile(), fp.getProfileId()));
		}
		
		for(FeturedProfile fp:feturedProfileList){
			profileListFeatured.add(prfileBaseService.findByPrimaryKey(new Profile(), fp.getProfileId()));
		}
		if (profileListFeatured.size() != 0) {
			profile =  profileListFeatured.get(0);
		}
		
		if(profile.getResizedMidPicture()!=null){
			resizedMidPicture=(String) profile.getAmazonFileURL().get(1);
		}
		
		return "success";
	}
	
	
  public String getFeturedProfiles1(){
		createEmployerprofile();
		feturedProfile=new FeturedProfile();
		profile = new Profile();
		feturedProfileList=feturedProfileBaseService.findAll(feturedProfile);
		
		for(FeturedProfile fp:feturedProfileList){
			profileList.add(prfileBaseService.findByPrimaryKey(new Profile(), fp.getProfileId()));
		}
		
		for(FeturedProfile fp:feturedProfileList){
			profileListFeatured.add(prfileBaseService.findByPrimaryKey(new Profile(), fp.getProfileId()));
		}
		if (profileListFeatured.size() != 0) {
			profile =  profileListFeatured.get(0);
		}
		
		return "success";
	}
	
	
	public String createEmployerprofile(){
		try {
			LOGGER.info("Inside createEmployerprofile");
			 User user = (User) SecurityContextHolder.getContext()
			.getAuthentication().getPrincipal();
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
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
			
		return "success";
	}
	
	
	public List<Profile> getProfileList() {
		return profileList;
	}

	public FeturedProfile getFeturedProfile() {
		return feturedProfile;
	}

	public void setFeturedProfile(FeturedProfile feturedProfile) {
		this.feturedProfile = feturedProfile;
	}

	public BaseService<FeturedProfile> getFeturedProfileBaseService() {
		return feturedProfileBaseService;
	}

	public void setFeturedProfileBaseService(
			BaseService<FeturedProfile> feturedProfileBaseService) {
		this.feturedProfileBaseService = feturedProfileBaseService;
	}

	public List<FeturedProfile> getFeturedProfileList() {
		return feturedProfileList;
	}

	public void setFeturedProfileList(List<FeturedProfile> feturedProfileList) {
		this.feturedProfileList = feturedProfileList;
	}

	public BaseService<Profile> getPrfileBaseService() {
		return prfileBaseService;
	}

	public void setPrfileBaseService(BaseService<Profile> prfileBaseService) {
		this.prfileBaseService = prfileBaseService;
	}

	public List<Profile> getProfileListFeatured() {
		return profileListFeatured;
	}

	public void setProfileListFeatured(List<Profile> profileListFeatured) {
		this.profileListFeatured = profileListFeatured;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
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


	public PrivacyGroupService getPrivacyGroupService() {
		return privacyGroupService;
	}


	public void setPrivacyGroupService(PrivacyGroupService privacyGroupService) {
		this.privacyGroupService = privacyGroupService;
	}


	public void setProfileList(List<Profile> profileList) {
		this.profileList = profileList;
	}

	public String getResizedMidPicture() {
		return resizedMidPicture;
	}

	public void setResizedMidPicture(String resizedMidPicture) {
		this.resizedMidPicture = resizedMidPicture;
	}

}
