package com.mob.view.action.employer;

import java.io.File;
import java.util.Iterator;
import java.util.List;



import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.profile.Profile;
import com.mob.services.BaseService;
import com.mob.services.EmployerProfileService;
import com.mob.services.UserManagement;
import com.opensymphony.xwork2.ActionSupport;

public class EditImageForEmployerAction extends ActionSupport {
	
	    private Employer employer;
	    private User user;
	    private Profile profile;
	   
	    private File upload;//The actual file
	    private String uploadContentType; //The content type of the file
	    private String uploadFileName; //The uploaded file name
	    private String fileCaption;//The caption of the file entered by user
	    private UserManagement userManagement;	   
	    private EmployerProfileService employerProfileService;
	    private BaseService profileBaseService;
	
	public String editImage(){
		user = (User)SecurityContextHolder.getContext().
        getAuthentication().getPrincipal();				
        this.userManagement.updateUserPicture(user,this.upload.getAbsolutePath(),uploadFileName);
        List profilesList=employerProfileService.findUserProfile(user.getId());
        Iterator it= profilesList.iterator();
        while(it.hasNext()) {  
        profile=new Profile();	
        profile=(Profile)it.next();
        profile.setPicture(user.getPicture());	
        profileBaseService.update(profile);
        }
		
		return "success";
	}

	public Employer getEmployer() {
		return employer;
	}

	public void setEmployer(Employer employer) {
		this.employer = employer;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getFileCaption() {
		return fileCaption;
	}

	public void setFileCaption(String fileCaption) {
		this.fileCaption = fileCaption;
	}

	public UserManagement getUserManagement() {
		return userManagement;
	}

	public void setUserManagement(UserManagement userManagement) {
		this.userManagement = userManagement;
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

	


	public void setEmployerProfileService(
			EmployerProfileService employerProfileService) {
		this.employerProfileService = employerProfileService;
	}

	public void setProfileBaseService(BaseService profileBaseService) {
		this.profileBaseService = profileBaseService;
	}

	
}
