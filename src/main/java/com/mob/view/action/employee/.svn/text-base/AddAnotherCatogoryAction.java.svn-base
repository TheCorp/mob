package com.mob.view.action.employee;

import java.util.List;

import com.mob.model.profile.Industry;
import com.mob.model.profile.SkillsCategory;
import com.mob.services.BaseService;
import com.opensymphony.xwork2.ActionSupport;

public class AddAnotherCatogoryAction  extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private SkillsCategory skillsCategory;
	private Industry industry;
	
	private BaseService<Industry> industryService;
	private BaseService<SkillsCategory> skillsCategoryyService;
	
	private List categoryList;
	private String categoryname;
	private long industryId;
	

	public String addCatogory(){
		
		industry = new Industry();
		industry=industryService.findByPrimaryKey(industry,industryId);
		
		skillsCategory = new SkillsCategory();
		skillsCategory.setIndustry(industry);
		skillsCategory.setName(categoryname);
		skillsCategoryyService.create(skillsCategory);	 
		
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

	public SkillsCategory getSkillsCategory() {
		return skillsCategory;
	}


	public void setSkillsCategory(SkillsCategory skillsCategory) {
		this.skillsCategory = skillsCategory;
	}


	public BaseService<SkillsCategory> getSkillsCategoryyService() {
		return skillsCategoryyService;
	}


	public void setSkillsCategoryyService(
			BaseService<SkillsCategory> skillsCategoryyService) {
		this.skillsCategoryyService = skillsCategoryyService;
	}


	

	public List getCategoryList() {
		return categoryList;
	}


	public void setCategoryList(List categoryList) {
		this.categoryList = categoryList;
	}


	public String getCategoryname() {
		return categoryname;
	}


	public void setCategoryname(String categoryname) {
		this.categoryname = categoryname;
	}


	public long getIndustryId() {
		return industryId;
	}


	public void setIndustryId(long industryId) {
		this.industryId = industryId;
	}


	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	
}
