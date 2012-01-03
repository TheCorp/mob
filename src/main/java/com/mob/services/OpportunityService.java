package com.mob.services;

import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Profile;
import com.mob.model.profile.WorkExperience;

import java.util.List;

public interface OpportunityService {
	public List findListOpportunities(long id);
	public List findOpportunitySkillsList(long id);
	
	public List<Profile> findInterestedEmployeeProfiles(long id);
    public Profile findEmployeeProfileForView(Profile p,long id);
	
	public List findEmployeeWorkExperience(WorkExperience e,long id);
	
	public List findBookMarkerEmployeeProfiles(long id);
	public List findListEmpPropiles(long id);
	public List findAppliedEmployeeProfiles(long id);
	public List findMarkAsFavoriteList(long id);
	
	public Employer getEmployerForOpportunity(long opportunityId);
    public List<Opportunity> findAllOpportunitiesForEmployer(Employer employer);
    public int[] getInterestsAndApplicationCountForOpportunity(Opportunity opportunity);
    public boolean hasProfileAppliedForOpportunityByEmployerProfile(long employeeProfile, EmployerProfile oppOwnerProfile);
}
