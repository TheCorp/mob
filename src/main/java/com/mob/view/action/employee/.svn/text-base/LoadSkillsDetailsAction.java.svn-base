package com.mob.view.action.employee;

import java.util.List;

import com.mob.model.profile.Industry;
import com.mob.model.profile.SkillsCategory;
import com.mob.services.BaseService;
import com.mob.services.EmployeeProfileService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class LoadSkillsDetailsAction extends ActionSupport{
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(LoadSkillsDetailsAction.class);

	private static final long serialVersionUID = 1L;
	private Industry industry;
	private SkillsCategory skillsCategory;
	
	private BaseService<Industry> industryService;
	private BaseService<SkillsCategory> skillsCategoryService;
	private BaseService<Industry> industryBaseService;
	private EmployeeProfileService employeeProfileService;
	private List<SkillsCategory> skillsCategoryList;
	
	private List industryList;
	private List linkedskillList;
	
	
	private String categoryName;
	private String industryName;
	private long industryId;
	private long categoryId;
	
	
	
	public long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}

	public String getIndustriesForAutoSuggetion() {
		LOGGER.info("Inside getIndustriesForAutoSuggetion" );
		industry = new Industry();
		industryList = industryService.findAll(industry);
		if (industryList.size() != 0)
			return "success";
		else
			return "failure";
	}
	
	public String getCategoriesForAutoSuggetion() {
		LOGGER.info("Inside getCategoriesForAutoSuggetion" );
		Industry industry=new Industry();
		industry=industryBaseService.findByPrimaryKey(industry,industryId);
		
		skillsCategory = new SkillsCategory();
		skillsCategoryList=employeeProfileService.getCategories(industry.getId());
		if (skillsCategoryList.size() != 0)
			return "success";
		else
			return "failure";
	}
	
	public String getSkillsForAutoSuggetion() {
		LOGGER.info("Inside getSkillsForAutoSuggetion" );
		SkillsCategory skillsCategory = new SkillsCategory();
		skillsCategory=skillsCategoryService.findByPrimaryKey(skillsCategory,categoryId);
		
		linkedskillList = employeeProfileService.getSkillsList(skillsCategory.getId());
		
		if (linkedskillList.size() != 0)
			return "success";
		else
			return "failure";
	}

	public String getAllIndustries(){
		LOGGER.info("Inside getAllIndustries" );
		industry = new Industry();
		industryList = industryService.findAll(industry);
		return "success";
	}
	
	public String getAllCategories(){
		LOGGER.info("Inside getAllCategories" );
		skillsCategory = new SkillsCategory();
		skillsCategoryList = skillsCategoryService.findAll(skillsCategory);
		return "success";
	}
	
	
	public Industry getIndustry() {
		return industry;
	}
	
	public void setIndustry(Industry industry) {
		this.industry = industry;
	}
	
	public SkillsCategory getSkillsCategory() {
		return skillsCategory;
	}
	
	public void setSkillsCategory(SkillsCategory skillsCategory) {
		this.skillsCategory = skillsCategory;
	}
	
	public BaseService<Industry> getIndustryService() {
		return industryService;
	}
	
	public void setIndustryService(BaseService<Industry> industryService) {
		this.industryService = industryService;
	}
	
	public BaseService<SkillsCategory> getSkillsCategoryService() {
		return skillsCategoryService;
	}
	
	public void setSkillsCategoryService(
			BaseService<SkillsCategory> skillsCategoryService) {
		this.skillsCategoryService = skillsCategoryService;
	}
	
	public BaseService<Industry> getIndustryBaseService() {
		return industryBaseService;
	}
	
	public void setIndustryBaseService(BaseService<Industry> industryBaseService) {
		this.industryBaseService = industryBaseService;
	}
	
	public EmployeeProfileService getEmployeeProfileService() {
		return employeeProfileService;
	}
	
	public void setEmployeeProfileService(
			EmployeeProfileService employeeProfileService) {
		this.employeeProfileService = employeeProfileService;
	}
	
	public List getIndustryList() {
		return industryList;
	}
	
	public void setIndustryList(List industryList) {
		this.industryList = industryList;
	}
	
	public List getLinkedskillList() {
		return linkedskillList;
	}
	
	public void setLinkedskillList(List linkedskillList) {
		this.linkedskillList = linkedskillList;
	}
	
	public List<SkillsCategory> getSkillsCategoryList() {
		return skillsCategoryList;
	}
	
	public void setSkillsCategoryList(List<SkillsCategory> skillsCategoryList) {
		this.skillsCategoryList = skillsCategoryList;
	}
	
	public String getCategoryName() {
		return categoryName;
	}
	
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	
	public String getIndustryName() {
		return industryName;
	}
	
	public void setIndustryName(String industryName) {
		this.industryName = industryName;
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
