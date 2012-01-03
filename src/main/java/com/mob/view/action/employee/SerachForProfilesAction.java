package com.mob.view.action.employee;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.profile.Profile;
import com.mob.services.SearchService;
import com.mob.util.MOBLogger;

public class SerachForProfilesAction {
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(SerachForProfilesAction.class);

	private List profiles1= new ArrayList();
	private List profiles= new ArrayList();
	private Profile profiles2;
	private SearchService searchService;
	private Profile profile;
	
	public String search() {
		LOGGER.info("Inside search" );
		User user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		profile = new Profile();
		profile.setProfileOwner(user);
		
		profiles1=searchService.findByAllProfiles();
		Iterator it=profiles1.iterator();
		
		while(it.hasNext()){
			//System.out.println("actionsearch"+it.next());
			profiles2=(Profile)it.next();
			
			if((profiles2.getProfileOwner().getId())!=user.getId()){
				profiles.add(profiles2);
				
			}
		}
		return "success";
	}
	
	public List getProfiles1() {
		return profiles1;
	}
	public void setProfiles1(List profiles1) {
		this.profiles1 = profiles1;
	}

	public SearchService getSearchService() {
		return searchService;
	}

	public void setSearchService(SearchService searchService) {
		this.searchService = searchService;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public List getProfiles() {
		return profiles;
	}

	public void setProfiles(List profiles) {
		this.profiles = profiles;
	}

	public Profile getProfiles2() {
		return profiles2;
	}

	public void setProfiles2(Profile profiles2) {
		this.profiles2 = profiles2;
	}


}
