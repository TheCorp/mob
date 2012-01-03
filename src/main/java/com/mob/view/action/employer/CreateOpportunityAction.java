package com.mob.view.action.employer;

import java.util.Iterator;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.employer.Category;
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

public class CreateOpportunityAction extends ActionSupport implements Preparable{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(CreateOpportunityAction.class);

	private Employer employer;
	private Opportunity opportunity;
	
	private BaseService<Opportunity> opportunityBaseService;
	private Category category;
	private List<Category> categoryList;
	private String[] selectedCategory;
	private BaseService<Category> categoryBaseService;
	
	private EmployerProfile profile = new EmployerProfile();
	private BaseService<EmployerProfile> employerProfileService;
	private Employer user;
	
	private JobTypeOpportunity jobType;
	private BaseService<JobTypeOpportunity> jobTypeBaseService;	
	private List jobTypeList;
	
	private WorkHoursOpportunity workHoursOpportunity;
	private BaseService<WorkHoursOpportunity> WorkHoursBaseService;	
	private List workHoursList;

	
	private Salary salary;
	private BaseService<Salary> salaryService;
	private List salaryList;
	private List educationRequiredList;
	private BaseService<EducationRequired> educationRequiredService;
	private EducationRequired educationRequired;
	private List skillsList;
	private SkillsNeeded skills;
	private BaseService<SkillsNeeded> skillsNeededService;	
	
	private OpportunitySkills opportunitySkills;
	private BaseService<OpportunitySkills> opportunitySkillsService;
	private OpportunityService opportunityService;
	private String[] skillName;
	private String[] skillLevel;
	private String[]  jobTypeName;
	private String[]  nofYears;
	private String[]  skillscategory;
	private String[]  notes;
	private String[] opportunity_list;
	private String  workingHours;
	private String  workingHours_Others;
	

	private String skillsNeeded;
	private String profileId;
	
	private List ProfilesList;

	private long selectedDefaultProfile;
	
	public String getSkillsNeeded() {
		return skillsNeeded;
	}
	public void setSkillsNeeded(String skillsNeeded) {
		this.skillsNeeded = skillsNeeded;
	}


	public Opportunity getOpportunity() {
		return opportunity;
	}
	public void setOpportunity(Opportunity opportunity) {
		this.opportunity = opportunity;
	}
	public BaseService<Opportunity> getOpportunityBaseService() {
		LOGGER.info("in createopportunity action opportunity"+opportunityBaseService.toString());
		return opportunityBaseService;
	}
	public void setOpportunityBaseService(
			BaseService<Opportunity> opportunityBaseService) {
		this.opportunityBaseService = opportunityBaseService;
	}
	public String getAllCategory(){
		categoryList = categoryBaseService.findAll(category);
		profile = employerProfileService.findByPrimaryKey(profile, profile.getId());
		
		return "success";
	}
	
	public String createOpportunity() {
		java.sql.Date createdDate = new java.sql.Date(System.currentTimeMillis());
		System.out.println("Inside createOpportunity");
		 user = (Employer)SecurityContextHolder.getContext().
		getAuthentication().getPrincipal();
		profile.setEmployer(user);
		System.out.println("profile.getId:---"+profile.getId());
		profile = employerProfileService.findByPrimaryKey(profile, selectedDefaultProfile);
		opportunity.setProfileOwner(profile);
        if(workingHours.equals("Other")){
        	opportunity.setWorkingHours(workingHours_Others);
        }
        	else
        	{	
        		opportunity.setWorkingHours(workingHours);
        	
        }
		if(opportunity_list!=null){
			String strTemp1 = null;
			StringBuffer sb1 = new StringBuffer(skillName.length);
			for(int i=0;i<skillName.length;i++){
				strTemp1 = skillName[i]+",";
				sb1.append(strTemp1);
			}
		}
		
		if(skillName!=null){
			String strTemp = null;
			StringBuffer sb = new StringBuffer(skillName.length);
			for(int i=0;i<skillName.length;i++){
				strTemp = skillName[i]+",";
				sb.append(strTemp);
			}
			
			int index = sb.lastIndexOf(",");
			sb = sb.deleteCharAt(index);
			LOGGER.info("skills needed:"+sb);
			
			skillsNeeded = sb.toString();
			LOGGER.info("skills are "+skillsNeeded);
		}
		try {
			opportunity.setSkillsNeeded(skillsNeeded);
			opportunity.setCreatedDate(createdDate);
			opportunityBaseService.create(opportunity);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		
		if(skillName!=null){
			for(int i=0;i<skillName.length;i++){
				opportunitySkills = new OpportunitySkills();
				opportunitySkills.setSkillsNeeded(skillName[i]);
				opportunitySkills.setLevel(skillLevel[i]);
				opportunitySkills.setNoOfYears(nofYears[i]);
				opportunitySkills.setSkillscategory(skillscategory[i]);
				opportunitySkills.setNotes(notes[i]);
				opportunitySkills.setOpprtunityOwner(opportunity);
				opportunitySkillsService.create(opportunitySkills);
			}
			
		}
		
		return "success";
	}
	public String skillNamesList()  {
		 skills = new SkillsNeeded();
		 skillsList = skillsNeededService.findAll(skills);
		 LOGGER.info("jobTypeList size:"+skillsList.size());
		 return "success";
	}
	
	
	public void prepare() throws Exception {
		 System.out.println("**************Inside prepare************************");
		 employer = (Employer)SecurityContextHolder.getContext().
		 getAuthentication().getPrincipal();
		 
		 /* Load list of profiles*/
			
			EmployerProfile profile = new EmployerProfile();
			profile.setEmployer(employer);
			profileId=Long.toString(profile.getEmployer().getId());
			ProfilesList = opportunityService.findListEmpPropiles(profile.getEmployer().getId());
			System.out.println("list of profiles of employee:"+ProfilesList.size());
		    Iterator it=ProfilesList.iterator();
		    while(it.hasNext()){
		    	
		    	profile=(EmployerProfile)it.next();
		    	//if(profile.getStatus().equals("default"))
		    	//{
		    	     selectedDefaultProfile=profile.getId();
		    	//}
		    }
		    System.out.println("selectedDefaultProfile:----"+selectedDefaultProfile);
		    
		 jobType = new JobTypeOpportunity();
		 jobTypeList = jobTypeBaseService.findAll(jobType);
		 LOGGER.info("jobTypeList size:"+jobTypeList.size());
		 
		 workHoursOpportunity = new WorkHoursOpportunity();
		 workHoursList = WorkHoursBaseService.findAll(workHoursOpportunity);
		 LOGGER.info("workHoursList size:"+workHoursList.size());
			

		 /*skills = new Skills();
		 skillsList = skilsService.findAll(skills);*/
		 
		 skills = new SkillsNeeded();
		 skillsList = skillsNeededService.findAll(skills);
		 LOGGER.info("jobTypeList size:"+skillsList.size());
		 
		 salary = new Salary();
		 salaryList = salaryService.findAll(salary);
		 educationRequired = new EducationRequired();
		 educationRequiredList=educationRequiredService.findAll(educationRequired);
		 category=new Category();
		 categoryList = categoryBaseService.findAll(category);
		 LOGGER.info("category "+categoryList.size());
	}
	
	
	public BaseService<Category> getCategoryBaseService() {
		return categoryBaseService;
	}
	public void setCategoryBaseService(BaseService<Category> categoryBaseService) {
		this.categoryBaseService = categoryBaseService;
	}

	public List<Category> getCategoryList() {
		return categoryList;
	}
	public void setCategoryList(List<Category> categoryList) {
		this.categoryList = categoryList;
	}
	public String[] getSelectedCategory() {
		return selectedCategory;
	}
	public void setSelectedCategory(String[] selectedCategory) {
		this.selectedCategory = selectedCategory;
	}
	public EmployerProfile getProfile() {
		return profile;
	}
	public void setProfile(EmployerProfile profile) {
		this.profile = profile;
	}
	public BaseService<EmployerProfile> getEmployerProfileService() {
		return employerProfileService;
	}
	public void setEmployerProfileService(
			BaseService<EmployerProfile> employerProfileService) {
		this.employerProfileService = employerProfileService;
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
	
	public BaseService<SkillsNeeded> getSkillsNeededService() {
		return skillsNeededService;
	}
	public void setSkillsNeededService(BaseService<SkillsNeeded> skillsNeededService) {
		this.skillsNeededService = skillsNeededService;
	}
	public List getSkillsList() {
		return skillsList;
	}
	public void setSkillsList(List skillsList) {
		this.skillsList = skillsList;
	}
	public Category getCategory() {
		return category;
	}
	public void setCategory(Category category) {
		this.category = category;
	}
	public OpportunitySkills getOpportunitySkills() {
		return opportunitySkills;
	}
	public void setOpportunitySkills(OpportunitySkills opportunitySkills) {
		this.opportunitySkills = opportunitySkills;
	}
	public BaseService<OpportunitySkills> getOpportunitySkillsService() {
		return opportunitySkillsService;
	}
	public void setOpportunitySkillsService(
			BaseService<OpportunitySkills> opportunitySkillsService) {
		this.opportunitySkillsService = opportunitySkillsService;
	}
	public String[] getSkillName() {
		return skillName;
	}
	public void setSkillName(String[] skillName) {
		this.skillName = skillName;
	}
	public String[] getSkillLevel() {
		return skillLevel;
	}
	public void setSkillLevel(String[] skillLevel) {
		this.skillLevel = skillLevel;
	}
	public String[] getJobTypeName() {
		return jobTypeName;
	}
	public void setJobTypeName(String[] jobTypeName) {
		this.jobTypeName = jobTypeName;
	}
	
	public String[] getNofYears() {
		return nofYears;
	}
	public void setNofYears(String[] nofYears) {
		this.nofYears = nofYears;
	}
	public Employer getUser() {
		return user;
	}
	public void setUser(Employer user) {
		this.user = user;
	}
	public Employer getEmployer() {
		return employer;
	}
	public void setEmployer(Employer employer) {
		this.employer = employer;
	}
	public SkillsNeeded getSkills() {
		return skills;
	}
	public void setSkills(SkillsNeeded skills) {
		this.skills = skills;
	}
	public BaseService<JobTypeOpportunity> getJobTypeBaseService() {
		return jobTypeBaseService;
	}
	public void setJobTypeBaseService(
			BaseService<JobTypeOpportunity> jobTypeBaseService) {
		this.jobTypeBaseService = jobTypeBaseService;
	}
	public void setJobType(JobTypeOpportunity jobType) {
		this.jobType = jobType;
	}
	public JobTypeOpportunity getJobType() {
		return jobType;
	}
	public List getProfilesList() {
		return ProfilesList;
	}
	public void setProfilesList(List profilesList) {
		ProfilesList = profilesList;
	}
	public OpportunityService getOpportunityService() {
		return opportunityService;
	}
	public void setOpportunityService(OpportunityService opportunityService) {
		this.opportunityService = opportunityService;
	}
	public long getSelectedDefaultProfile() {
		return selectedDefaultProfile;
	}
	public void setSelectedDefaultProfile(long selectedDefaultProfile) {
		this.selectedDefaultProfile = selectedDefaultProfile;
	}
	public String getProfileId() {
		return profileId;
	}
	public void setProfileId(String profileId) {
		this.profileId = profileId;
	}
	public String[] getSkillscategory() {
		return skillscategory;
	}
	public void setSkillscategory(String[] skillscategory) {
		this.skillscategory = skillscategory;
	}
	public String[] getNotes() {
		return notes;
	}
	public void setNotes(String[] notes) {
		this.notes = notes;
	}
	public String[] getOpportunity_list() {
		return opportunity_list;
	}
	public void setOpportunity_list(String[] opportunity_list) {
		this.opportunity_list = opportunity_list;
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
	public String getWorkingHours() {
		return workingHours;
	}
	public void setWorkingHours(String workingHours) {
		this.workingHours = workingHours;
	}
	public String getWorkingHours_Others() {
		return workingHours_Others;
	}
	public void setWorkingHours_Others(String workingHours_Others) {
		this.workingHours_Others = workingHours_Others;
	}
	
	
}
