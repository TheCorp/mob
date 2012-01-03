package com.mob.services;

import java.util.List;

import com.mob.model.Contact;
import com.mob.model.Role;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.group.Group;
import com.mob.model.profile.Profile;

public interface UserManagement {

	public void registerUser(User user);
	public void deleteUser(User user);
	public List<User> listAllUsers();
	public List<User> listAllUsersInRole(Role role);
	public void addAsFriend(User user, User friend);
	public void subscribeToUser(User subscriber,
			User target);
	public List<Contact> returnFriends(User user); 
	public void updatePicture(Profile profile,String picture,String uploadFileName);
	public void updateUserPicture(User user,String picture,String uploadFileName);
	public void updateGroupPicture(Group group, String absolutePath,
			String uploadFileName);
	
	public  void addProfilePicture(Profile profile, String picture,
 			String uploadFileName, String itemFileContentType);
	public  void addGroupPicture(Group group, String picture,
 			String uploadFileName, String itemFileContentType);
	public  void addEmployerPicture(Employer employer, String picture,
 			String uploadFileName, String itemFileContentType);
	
}
