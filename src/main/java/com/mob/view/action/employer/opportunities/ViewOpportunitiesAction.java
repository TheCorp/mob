package com.mob.view.action.employer.opportunities;

import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.model.profile.EmployerProfile;
import com.mob.services.OpportunityService;
import com.mob.util.MOBLogger;
import com.mob.view.action.employer.opportunities.dto.OpportunityDetails;
import com.opensymphony.xwork2.ActionSupport;
import org.acegisecurity.context.SecurityContextHolder;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Apr 3, 2009
 * Time: 12:53:07 PM
 * To change this template use File | Settings | File Templates.
 */
public class ViewOpportunitiesAction extends ActionSupport {
	private long profileId;
    private static final MOBLogger LOGGER =
         new MOBLogger(ViewOpportunitiesAction.class);

    private List<OpportunityDetails> opportunityDetails;
    private OpportunityService opportunityService;
    
    public void setOpportunityService(OpportunityService opportunityService) {
        this.opportunityService = opportunityService;
    }

    public List<OpportunityDetails> getOpportunityDetails() {
        return opportunityDetails;
    }

    public String load(){
        LOGGER.info("Inside viewInterestedEmployeeProfiles");
        Employer employer = (Employer) SecurityContextHolder.getContext()
        .getAuthentication().getPrincipal();

        List<Opportunity> opportunities = this.opportunityService.findAllOpportunitiesForEmployer(employer);
        opportunityDetails = new ArrayList<OpportunityDetails>();
        for(Opportunity opportunity:opportunities){
            addDetailsForOpportunity(opportunity);
            System.out.println(""+opportunity.getProfileOwner().getId());
            profileId=opportunity.getProfileOwner().getId();
        }
        return SUCCESS;
    }

    private void addDetailsForOpportunity(Opportunity opportunity) {
        int[] counts = this.opportunityService.getInterestsAndApplicationCountForOpportunity(opportunity);
        OpportunityDetails details = new OpportunityDetails();
        details.setOpportunity(opportunity);
        details.setInterests(counts[0]);
        details.setBookmarks(counts[1]);
        this.opportunityDetails.add(details);
    }

	public long getProfileId() {
		return profileId;
	}

	public void setProfileId(long profileId) {
		this.profileId = profileId;
	}


}
