package com.mob.model.employer;

import java.util.HashSet;
import java.util.Set;

import com.mob.model.User;

public class Job {

	private User creator;
	private Set<Category> categories = new HashSet<Category>();
}
