package com.mob.services;

import java.util.List;

import com.mob.model.employer.Employer;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Profile;

public interface EmployerProfileService {
	
	public List findUserProfile(long id);
	public Employer loadEmployerAccInfo(long id);
	public List findemplrProfile(long id);
	public EmployerProfile findEmployerProfile(long id);
	public Profile findProfileForEmployer(long id);
	
	
	
}
