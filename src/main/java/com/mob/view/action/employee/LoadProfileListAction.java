package com.mob.view.action.employee;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.profile.Education;
import com.mob.model.profile.Profile;
import com.mob.model.profile.WorkExperience;
import com.mob.services.EmployeeProfileService;
import com.mob.services.ItemService;
import com.mob.services.MessagingService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class LoadProfileListAction extends ActionSupport{
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(LoadProfileListAction.class);

	private Profile profile;	
	private List profiles;
	private Education education;
	private WorkExperience workExperience;
	private User user;
	private int itemcount;
	private List itemsList;
	private ItemService itemService;
	private EmployeeProfileService employeeProfileService;
	
	private long inboxMessageCount;
	private  MessagingService messagingService;
	private List  listInboxEmailMessages;
	private List nonDefaulProfiles=new ArrayList();
	

	

	public String loadEmployeeProfiles() {
		LOGGER.info("Inside loadEmployeeProfiles" );

		user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		profile = new Profile();
		profile.setProfileOwner(user);		
		profiles = employeeProfileService.findByUserProfiles(profile, profile.getProfileOwner().getId());
		
		if(profiles.size()!=0){
		Iterator it=profiles.iterator();
		while(it.hasNext()){
			Profile nonDefaultProfile=(Profile)it.next();
			if(!nonDefaultProfile.getStatus().equals("default")){
				nonDefaulProfiles.add(nonDefaultProfile);
			}
		  }
		}
		
		if(profiles.size()!=0){
			
		   Iterator it1=profiles.iterator();
		   while(it1.hasNext()){
			   Profile profile=(Profile)it1.next();			  
		       itemsList = itemService.findItems(profile.getId());		      
		       profile.setItemCount(itemsList.size());
		      		        
		   }
		}
		
		listInboxEmailMessages= messagingService.findInboxListEmailMessages(user.getId());
		inboxMessageCount=listInboxEmailMessages.size();
		return "success";

	}
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	
	public Education getEducation() {
		return education;
	}

	public void setEducation(Education education) {
		this.education = education;
	}

	public WorkExperience getWorkExperience() {
		return workExperience;
	}

	public void setWorkExperience(WorkExperience workExperience) {
		this.workExperience = workExperience;
	}

	public EmployeeProfileService getEmployeeProfileService() {
		return employeeProfileService;
	}

	public void setEmployeeProfileService(
			EmployeeProfileService employeeProfileService) {
		this.employeeProfileService = employeeProfileService;
	}

	public List getProfiles() {
		return profiles;
	}

	public void setProfiles(List profiles) {
		this.profiles = profiles;
	}

	public int getItemcount() {
		return itemcount;
	}

	public void setItemcount(int itemcount) {
		this.itemcount = itemcount;
	}

	public List getItemsList() {
		return itemsList;
	}

	public void setItemsList(List itemsList) {
		this.itemsList = itemsList;
	}

	public ItemService getItemService() {
		return itemService;
	}

	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
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

	public void setNonDefaulProfiles(List nonDefaulProfiles) {
		this.nonDefaulProfiles = nonDefaulProfiles;
	}

	public List getNonDefaulProfiles() {
		return nonDefaulProfiles;
	}

	

	

}
