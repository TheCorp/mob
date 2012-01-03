package com.mob.dao;

import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.model.profile.WorkExperience;
import com.mob.model.profile.EmployerProfile;

import java.util.List;

public interface OpportunityDao {
	
	public List findListOpportunities(long id);
	public List findOpportunitySkillsList(long id);
	
	public List findInterestedEmployeeProfiles(long id);
	public List findEmployeeWorkExperience(WorkExperience e,long id);
	
	public List findBookMarkerEmployeeProfiles(long id);
	public List findListEmpPropiles(long id);
	public List findAppliedEmployeeProfiles(long id);
	
	public List findMarkAsFavoriteList(long id);
	public Employer getEmployerForOpportunity(long opportunityId);
    public List<Opportunity> findOpportunitiesCreatedByEmployer(Employer employer);

    public int findCountOfApplicationsForOpportunity(Opportunity opp);
    public int findCountOfFavoriteForOpportunity(Opportunity opp);
    public boolean findIfProfileAppliedForOpportunityByEmployerProfile(long employeeProfile, EmployerProfile oppOwnerProfile);
}
