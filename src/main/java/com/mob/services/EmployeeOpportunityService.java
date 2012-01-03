package com.mob.services;

public interface EmployeeOpportunityService {
	
	public void applyForOpportunity(long interestedEmployeeId,long opportunityId);
	
	public void bookMarkOpportunity(long bookmarkedEmployeeid,long opportunityId);
	
}
