package com.mob.services;

import java.util.List;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.model.group.Group;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Profile;
import com.mob.model.profile.WorkExperience;

public interface SearchService {
	public List findByAllProfiles();
	public List findOpportunities(String position,String location,String skills, String additionalKeyword, String additionalSkillNames);
	public List<Opportunity> findOpportunitySkills(long id);
	public Opportunity loadForViewOpportunity(Opportunity opportunity, long id);
	
   	public List findListOfEmployees(String ProfileName,String location);
	
	
	public List findListOfEmployers(String employerName,String employerLocation);
	
	
	public List findListOfEmployerProfiles(EmployerProfile employerProfile,long id);
	public List findListOfEmployeeProfiles(Profile employeeProfile,long id);
	
	public List findEmployeeWorkExperience(WorkExperience experience,long id);
	public List findListContacts(long id);
	
	public Profile findEmployeeProfileForView(Profile employeeProfile,long employeeProfileId);
	public EmployerProfile findEmployerProfileForView(EmployerProfile employerProfile,long employerProfileId);
	public List<EmployerProfile> findAllEmployer(String name);
	//public List<User> findAllEmployees(String name);
	public List<Profile> findAllEmployeeProfilesFromSearch(String name);
	public List<Opportunity> findAllOpportunities(String search);
	public List<Opportunity> findEmployerOpportunities(long id);
	public List<Group> findAllGroupsFromSearch(String name,User user);
	public List<Employer> findAllEmployerList(String name);
	
}
