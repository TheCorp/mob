package com.mob.browse.service;

import java.util.List;

import com.mob.forum.entities.Group;
import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.model.profile.Education;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Industry;
import com.mob.model.profile.Profile;
import com.mob.model.profile.Skills;

public interface BrowseService {
	List<Profile> listEmployeeProfileByCriteria(EmployeeSearchCriteria criteria,int startIndex, int endIndex);
	List<EmployerProfile> listEmployerProfileByCriteria(EmployerSearchCriteria criteria,int startIndex, int endIndex);	
	List<Group> listGroupByCriteria(GroupSearchCriteria criteria,int startIndex, int endIndex);
	List<Opportunity> listOpportunitiesByCriteria(OpportunitySearchCriteria criteria, int startIndex, int endIndex);
}
