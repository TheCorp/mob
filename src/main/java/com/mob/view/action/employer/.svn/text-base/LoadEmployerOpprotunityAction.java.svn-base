package com.mob.view.action.employer;

import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.employer.Employer;
import com.mob.model.employer.JobTypeOpportunity;
import com.mob.model.employer.Opportunity;
import com.mob.model.employer.OpportunitySkills;
import com.mob.model.employer.SkillsNeeded;
import com.mob.model.employer.WorkHoursOpportunity;
import com.mob.model.profile.EducationRequired;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Salary;
import com.mob.services.BaseService;
import com.mob.services.OpportunityService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class LoadEmployerOpprotunityAction extends ActionSupport implements
		Preparable {
	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER = new MOBLogger(
			LoadEmployerOpprotunityAction.class);

	private Opportunity opportunity;

	private BaseService<Opportunity> opportunityBaseService;

	private Employer user;
	/*private JobType jobType;
	private BaseService<JobType> jobTypeService;	
	private List jobTypeList;
	 */
	private JobTypeOpportunity jobType;
	private BaseService<JobTypeOpportunity> jobTypeBaseService;
	private List jobTypeList;

	private WorkHoursOpportunity workHoursOpportunity;
	private BaseService<WorkHoursOpportunity> WorkHoursBaseService;
	private List workHoursList;

	private EmployerProfile profile;
	private BaseService<EmployerProfile> employerProfileService;

	private Salary salary;
	private BaseService<Salary> salaryService;
	private List salaryList;
	private List educationRequiredList;
	private BaseService<EducationRequired> educationRequiredService;
	private EducationRequired educationRequired;

	/*private Skills skills;
	private BaseService<Skills> skilsService;	
	private List skillsList;*/

	private List skillsList;
	private SkillsNeeded skills;
	private BaseService<SkillsNeeded> skillsNeededService;

	private OpportunitySkills opportunitySkills;
	private OpportunityService opportunityService;
	private List<OpportunitySkills> opportunitySkillsList;
	private String str_benefits;
	private String str_job_application_criteria;
	private String description;
	public String loadOpprotunity() {
		LOGGER.info("inside loadOpprotunity");
		user = (Employer) SecurityContextHolder.getContext()
				.getAuthentication().getPrincipal();

		//			profile = employerProfileService.findByPrimaryKey(profile,profile.getId());
		opportunity = opportunityBaseService.findByPrimaryKey(opportunity,
				opportunity.getId());
		str_benefits=opportunity.getStr_benefits();
		str_job_application_criteria=opportunity.getStr_job_application_criteria();
		description=opportunity.getDescription();
		opportunitySkills = new OpportunitySkills();
		
		LOGGER.info("opp skills:" + opportunitySkills.getClass());
		opportunitySkillsList = opportunityService
				.findOpportunitySkillsList(opportunity.getId());
		LOGGER.info("opp skils list" + opportunitySkillsList.size());

		return "success";
	}

	public void prepare() throws Exception {
		LOGGER.info("inside prepare");
		jobType = new JobTypeOpportunity();
		jobTypeList = jobTypeBaseService.findAll(jobType);
		workHoursOpportunity = new WorkHoursOpportunity();
		workHoursList = WorkHoursBaseService.findAll(workHoursOpportunity);
		LOGGER.info("workHoursList size:" + workHoursList.size());

		skills = new SkillsNeeded();
		skillsList = skillsNeededService.findAll(skills);

		salary = new Salary();
		salaryList = salaryService.findAll(salary);
		educationRequired = new EducationRequired();
		educationRequiredList = educationRequiredService
				.findAll(educationRequired);
	}

	public Opportunity getOpportunity() {
		return opportunity;
	}

	public void setOpportunity(Opportunity opportunity) {
		this.opportunity = opportunity;
	}

	public BaseService<Opportunity> getOpportunityBaseService() {
		return opportunityBaseService;
	}

	public void setOpportunityBaseService(
			BaseService<Opportunity> opportunityBaseService) {
		this.opportunityBaseService = opportunityBaseService;
	}

	public JobTypeOpportunity getJobType() {
		return jobType;
	}

	public void setJobType(JobTypeOpportunity jobType) {
		this.jobType = jobType;
	}

	public BaseService<JobTypeOpportunity> getJobTypeBaseService() {
		return jobTypeBaseService;
	}

	public void setJobTypeBaseService(
			BaseService<JobTypeOpportunity> jobTypeBaseService) {
		this.jobTypeBaseService = jobTypeBaseService;
	}

	public List getJobTypeList() {
		return jobTypeList;
	}

	public void setJobTypeList(List jobTypeList) {
		this.jobTypeList = jobTypeList;
	}

	public Salary getSalary() {
		return salary;
	}

	public void setSalary(Salary salary) {
		this.salary = salary;
	}

	public BaseService<Salary> getSalaryService() {
		return salaryService;
	}

	public void setSalaryService(BaseService<Salary> salaryService) {
		this.salaryService = salaryService;
	}

	public List getSalaryList() {
		return salaryList;
	}

	public void setSalaryList(List salaryList) {
		this.salaryList = salaryList;
	}

	public List getSkillsList() {
		return skillsList;
	}

	public void setSkillsList(List skillsList) {
		this.skillsList = skillsList;
	}

	public OpportunitySkills getOpportunitySkills() {
		return opportunitySkills;
	}

	public void setOpportunitySkills(OpportunitySkills opportunitySkills) {
		this.opportunitySkills = opportunitySkills;
	}

	public BaseService<EmployerProfile> getEmployerProfileService() {
		return employerProfileService;
	}

	public void setEmployerProfileService(
			BaseService<EmployerProfile> employerProfileService) {
		this.employerProfileService = employerProfileService;
	}

	public Employer getUser() {
		return user;
	}

	public void setUser(Employer user) {
		this.user = user;
	}

	public EmployerProfile getProfile() {
		return profile;
	}

	public void setProfile(EmployerProfile profile) {
		this.profile = profile;
	}

	public List<OpportunitySkills> getOpportunitySkillsList() {
		return opportunitySkillsList;
	}

	public void setOpportunitySkillsList(
			List<OpportunitySkills> opportunitySkillsList) {
		this.opportunitySkillsList = opportunitySkillsList;
	}

	public OpportunityService getOpportunityService() {
		return opportunityService;
	}

	public void setOpportunityService(OpportunityService opportunityService) {
		this.opportunityService = opportunityService;
	}

	public SkillsNeeded getSkills() {
		return skills;
	}

	public void setSkills(SkillsNeeded skills) {
		this.skills = skills;
	}

	public BaseService<SkillsNeeded> getSkillsNeededService() {
		return skillsNeededService;
	}

	public void setSkillsNeededService(
			BaseService<SkillsNeeded> skillsNeededService) {
		this.skillsNeededService = skillsNeededService;
	}

	public List getEducationRequiredList() {
		return educationRequiredList;
	}

	public void setEducationRequiredList(List educationRequiredList) {
		this.educationRequiredList = educationRequiredList;
	}

	public BaseService<EducationRequired> getEducationRequiredService() {
		return educationRequiredService;
	}

	public void setEducationRequiredService(
			BaseService<EducationRequired> educationRequiredService) {
		this.educationRequiredService = educationRequiredService;
	}

	public EducationRequired getEducationRequired() {
		return educationRequired;
	}

	public void setEducationRequired(EducationRequired educationRequired) {
		this.educationRequired = educationRequired;
	}

	public WorkHoursOpportunity getWorkHoursOpportunity() {
		return workHoursOpportunity;
	}

	public void setWorkHoursOpportunity(WorkHoursOpportunity workHoursOpportunity) {
		this.workHoursOpportunity = workHoursOpportunity;
	}

	public BaseService<WorkHoursOpportunity> getWorkHoursBaseService() {
		return WorkHoursBaseService;
	}

	public void setWorkHoursBaseService(
			BaseService<WorkHoursOpportunity> workHoursBaseService) {
		WorkHoursBaseService = workHoursBaseService;
	}

	public List getWorkHoursList() {
		return workHoursList;
	}

	public void setWorkHoursList(List workHoursList) {
		this.workHoursList = workHoursList;
	}

	public String getStr_benefits() {
		return str_benefits;
	}

	public void setStr_benefits(String str_benefits) {
		this.str_benefits = str_benefits;
	}

	public String getStr_job_application_criteria() {
		return str_job_application_criteria;
	}

	public void setStr_job_application_criteria(String str_job_application_criteria) {
		this.str_job_application_criteria = str_job_application_criteria;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
