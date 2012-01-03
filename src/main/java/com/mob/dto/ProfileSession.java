package com.mob.dto;

import com.mob.model.profile.Profile;

public class ProfileSession {
	
	  private Profile profile;
	    
	    public ProfileSession(){
	        
	    }
	    
	    public void setProfile(Profile profile){
	        this.profile = profile;
	    }
	    
	    public Profile getProfile(){
	        return this.profile;
	    }

}
