package com.mob.view.action.employee;

import com.mob.model.profile.Industry;
import com.mob.services.BaseService;
import com.opensymphony.xwork2.ActionSupport;

public class AddAnotherIndustryAction  extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private Industry industry;
	private BaseService<Industry> industryService;
	
	
	public String addIndustry(){
	  industryService.create(industry);	  
	  return "success";
	}

	public Industry getIndustry() {
		return industry;
	}

	public void setIndustry(Industry industry) {
		this.industry = industry;
	}

	public BaseService<Industry> getIndustryService() {
		return industryService;
	}

	public void setIndustryService(BaseService<Industry> industryService) {
		this.industryService = industryService;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}
	
}
