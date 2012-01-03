package com.mob.services;

import java.util.List;

import com.mob.model.Group;
import com.mob.model.User;

public interface GroupManagement {
	public void createGroup(Group group);
	public void addUserToGroup(User user, Group group);
	public List<User> returnAllUsersInGroup(Group group);
}
