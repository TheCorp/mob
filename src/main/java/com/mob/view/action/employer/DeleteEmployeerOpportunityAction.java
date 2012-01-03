package com.mob.view.action.employer;

import com.mob.model.employer.Opportunity;
import com.mob.services.BaseService;
import com.opensymphony.xwork2.ActionSupport;

public class DeleteEmployeerOpportunityAction extends ActionSupport {
	
	private Opportunity opportunity;
	private BaseService<Opportunity> opportunityEmployerService;

	public String deleteOpportunity() {
		//opportunity=opportunityEmployerService.findByPrimaryKey(opportunity,opportunity.getId());
		opportunityEmployerService.delete(opportunity);
		
		return "success";
	}

	public BaseService<Opportunity> getOpportunityEmployerService() {
		return opportunityEmployerService;
	}

	public void setOpportunityEmployerService(
			BaseService<Opportunity> opportunityEmployerService) {
		this.opportunityEmployerService = opportunityEmployerService;
	}

	public Opportunity getOpportunity() {
		return opportunity;
	}

	public void setOpportunity(Opportunity opportunity) {
		this.opportunity = opportunity;
	}

}
