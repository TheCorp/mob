package com.mob.services;

import java.util.List;

import com.mob.model.User;
import com.mob.model.profile.Profile;

public interface ProfileManagement {
	public void addProfile(User user, Profile profile);
	public void updateProfile(Profile profile);
	public Profile returnProfile(String profileName, User user);
	public List<Profile> returnProfile(User user);
	public void removeProfile(User user);
}
