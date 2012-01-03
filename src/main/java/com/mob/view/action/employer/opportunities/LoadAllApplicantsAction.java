package com.mob.view.action.employer.opportunities;

import com.mob.dao.BaseDao;
import com.mob.model.employer.Opportunity;
import com.mob.model.profile.Profile;
import com.mob.services.OpportunityService;
import com.opensymphony.xwork2.ActionSupport;

import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: ezone
 * Date: Apr 3, 2009
 * Time: 2:01:04 PM
 * To change this template use File | Settings | File Templates.
 */
public class LoadAllApplicantsAction extends ActionSupport {
    private List<Profile> employeesList;
    private BaseDao<Opportunity> opportunityDao;
    private Opportunity opportunity;
    private OpportunityService opportunityService;

    public void setOpportunityDao(BaseDao<Opportunity> opportunityDao) {
        this.opportunityDao = opportunityDao;
    }

    public void setOpportunityService(OpportunityService opportunityService) {
        this.opportunityService = opportunityService;
    }

    public Opportunity getOpportunity() {
        return opportunity;
    }

    public void setOpportunity(Opportunity opportunity) {
        this.opportunity = opportunity;
    }

    public List<Profile> getEmployeesList() {
        return employeesList;
    }

    public String load(){
        employeesList = this.opportunityService.findInterestedEmployeeProfiles(opportunity.getId());
        opportunity =  opportunityDao.findByPrimaryKey(opportunity,opportunity.getId());
        return SUCCESS;
    }

}
