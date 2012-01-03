package com.mob.view.action.employee;

import com.mob.model.profile.Skills;
import com.mob.model.profile.SkillsCategory;
import com.mob.services.BaseService;
import com.opensymphony.xwork2.ActionSupport;

public class AddAnotherSkillAction extends ActionSupport{
	
	private static final long serialVersionUID = 1L;
	private Skills skills;
	private SkillsCategory category;
	
	private BaseService<SkillsCategory> skillsCategoryService;
	private BaseService<Skills> skillService;
	
	private String skillName;
	private long categoryId;
	
	public String addSkill(){
		
		category = new  SkillsCategory();
		category = skillsCategoryService.findByPrimaryKey(category, categoryId) ;

		skills=new Skills();
		skills.setCategory(category);
		
		skills.setSkillname(skillName);
		skillService.create(skills);
		return "success";
	}
	
	public String getSkillName() {
		return skillName;
	}
	public void setSkillName(String skillName) {
		this.skillName = skillName;
	}
	public void setSkillsCategoryService(
			BaseService<SkillsCategory> skillsCategoryService) {
		this.skillsCategoryService = skillsCategoryService;
	}
	
	public BaseService<SkillsCategory> getSkillsCategoryService() {
		return skillsCategoryService;
	}
	public void setSkillsCategoryyService(
			BaseService<SkillsCategory> skillsCategoryyService) {
		this.skillsCategoryService = skillsCategoryyService;
	}
	
	public SkillsCategory getCategory() {
		return category;
	}
	public void setCategory(SkillsCategory category) {
		this.category = category;
	}
	public Skills getSkills() {
		return skills;
	}
	public void setSkills(Skills skills) {
		this.skills = skills;
	}
	public BaseService<Skills> getSkillService() {
		return skillService;
	}
	public void setSkillService(BaseService<Skills> skillService) {
		this.skillService = skillService;
	}

	public long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}

	public static long getSerialVersionUID() {
		return serialVersionUID;
	}

	

}
