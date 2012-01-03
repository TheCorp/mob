package com.mob.view.action.employer;

import java.sql.Date;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.employer.Employer;
import com.mob.model.employer.Opportunity;
import com.mob.model.employer.OpportunitySkills;
import com.mob.model.profile.EmployerProfile;
import com.mob.services.BaseService;
import com.mob.services.OpportunityService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class UpdateEmployerOpportunityAction extends ActionSupport implements Preparable{

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(UpdateEmployerOpportunityAction.class);

	private List profilelist;
	
	private Employer user;
	
	private Opportunity opportunity=new Opportunity();
	
	private BaseService<Opportunity> opportunityService;
	
	private OpportunitySkills opportunitySkills;
	private BaseService<OpportunitySkills> opportunitySkillsService;
	private OpportunityService opportunitySkillService;
	private List opportunitySkillsDetailsList;

	private BaseService<EmployerProfile> employerProfileService;
	
	private EmployerProfile profile;
	
	private long[] oppSkills_id;
	private String[] skillsNeeded;
	private String[] level;
	private String[] noOfYears;
	
	private long[] deloppSkillsrow;

	private String[] newCategory;
	private String[] newnotes;
	private String[] newSkillsNeeded;
	private String[] newLevel;
	private String[] newNoOfYears;
	
	private String skills;
	
	
	    
	    
	private String title;
	private String description;
	private Date createdDate;
	private String str_job_name;
	private String str_location;
	private String str_type_of_work;
	private String str_education_requirment;
	private String str_salary_range;
	private String str_job_type;
	private String str_benefits;
	private String workingHours;
	private String str_job_application_criteria;
	private String contactperson;

	

	public String edit() {		
		LOGGER.info("Inside edit");
		/*user = (Employer)SecurityContextHolder.getContext().
		 getAuthentication().getPrincipal();						
		profile.setInboxOwnerProfile(user);
		profile = employerProfileService.findByPrimaryKey(profile, profile.getId());
		*/
		opportunity=opportunityService.findByPrimaryKey(opportunity,opportunity.getId());
		
		//opportunity.setInboxOwnerProfile(profile);
		
		opportunity.setCreatedDate(createdDate);
		opportunity.setDescription(description);
		opportunity.setStr_benefits(str_benefits);
		opportunity.setStr_job_name(str_job_name);
		opportunity.setStr_location(str_location);
		opportunity.setStr_type_of_work(str_type_of_work);
		opportunity.setStr_education_requirment(str_education_requirment);
		opportunity.setStr_salary_range(str_salary_range);
		opportunity.setStr_job_type(str_job_type);
		opportunity.setWorkingHours(workingHours);
		opportunity.setStr_job_application_criteria(str_job_application_criteria);
		opportunity.setTitle(title);
		opportunity.setContactperson(contactperson);
		
		opportunityService.update(opportunity);
		
		if(skillsNeeded!=null){
			String strTemp=null;
			StringBuffer sb = new StringBuffer(skillsNeeded.length);
			for(int i=0;i<skillsNeeded.length;i++){
				strTemp= skillsNeeded[i]+",";
				sb.append(strTemp);
				LOGGER.info("skills :"+ sb.toString());
			}
			int index = sb.lastIndexOf(",");
			sb = sb.deleteCharAt(index);
			skills = sb.toString();
			LOGGER.info("skills are:"+ skills);
		}
		opportunity.setSkillsNeeded(skills);
		/* Added for deleting opportunity skills from db*/
		if(deloppSkillsrow!=null){
			for(int i=0;i<deloppSkillsrow.length;i++){
				opportunitySkills=new OpportunitySkills();
				opportunitySkills.setId(deloppSkillsrow[i]);
				opportunitySkills.setOpprtunityOwner(opportunity);
				opportunitySkillsService.delete(opportunitySkills);
				
			}
		}
		
		/* Added for adding new opportunity skills in db*/
		if(newSkillsNeeded!=null){
			for(int i=0;i<newSkillsNeeded.length;i++){
				opportunitySkills=new OpportunitySkills();
				opportunitySkills.setSkillsNeeded(newSkillsNeeded[i]);
				opportunitySkills.setLevel(newLevel[i]);
				opportunitySkills.setSkillscategory(newCategory[i]);
				opportunitySkills.setNotes(newnotes[i]);
				opportunitySkills.setNoOfYears(newNoOfYears[i]);
				opportunitySkills.setOpprtunityOwner(opportunity);
				opportunitySkillsService.create(opportunitySkills);
			}
		}
		
		/* Added for editing opportunity skills from db*/
		if(skillsNeeded!=null){
			for(int i=0;i<skillsNeeded.length;i++){
			opportunitySkills=new OpportunitySkills();
			opportunitySkills.setId(oppSkills_id[i]);
			opportunitySkills.setSkillsNeeded(skillsNeeded[i]);
			opportunitySkills.setLevel(level[i]);
			//opportunitySkills.setJobType(jobType[i]);
			opportunitySkills.setNoOfYears(noOfYears[i]);
			
			opportunitySkills.setOpprtunityOwner(opportunity);
			opportunitySkillsService.update(opportunitySkills);
			
			}
		}
	
		
		return "success";
	}
	
	
	
	public String loadEmpolyerSkillsDetails() {
		LOGGER.info("Inside loadEmpolyerSkillsDetails");
		 user = (Employer)SecurityContextHolder.getContext().
		 getAuthentication().getPrincipal();
		  
		 profile = employerProfileService.findByPrimaryKey(profile,profile.getId());
		 opportunitySkills = new OpportunitySkills();
		 opportunitySkillsDetailsList= opportunitySkillService.findOpportunitySkillsList(profile.getId());
		return "success";
	}
	
	public EmployerProfile getProfile() {
		return profile;
	}

	public void setProfile(EmployerProfile profile) {
		this.profile = profile;
	}

	public void setEmployerProfileService(
			BaseService<EmployerProfile> employerProfileService) {
		this.employerProfileService = employerProfileService;
	}
	
	public void prepare() throws Exception {
		 user = (Employer)SecurityContextHolder.getContext().
		 getAuthentication().getPrincipal();
	}

	public List getProfilelist() {
		return profilelist;
	}

	public void setProfilelist(List profilelist) {
		this.profilelist = profilelist;
	}

	public Opportunity getOpportunity() {
		return opportunity;
	}

	public void setOpportunity(Opportunity opportunity) {
		this.opportunity = opportunity;
	}

	public BaseService<Opportunity> getOpportunityService() {
		return opportunityService;
	}

	public void setOpportunityService(BaseService<Opportunity> opportunityService) {
		this.opportunityService = opportunityService;
	}

	public BaseService<EmployerProfile> getEmployerProfileService() {
		return employerProfileService;
	}

	

	public OpportunitySkills getOpportunitySkills() {
		return opportunitySkills;
	}

	public void setOpportunitySkills(OpportunitySkills opportunitySkills) {
		this.opportunitySkills = opportunitySkills;
	}
	
	public List getOpportunitySkillsDetailsList() {
		return opportunitySkillsDetailsList;
	}

	public void setOpportunitySkillsDetailsList(List opportunitySkillsDetailsList) {
		this.opportunitySkillsDetailsList = opportunitySkillsDetailsList;
	}

	public Employer getUser() {
		return user;
	}

	public void setUser(Employer user) {
		this.user = user;
	}

	public String[] getSkillsNeeded() {
		return skillsNeeded;
	}

	public void setSkillsNeeded(String[] skillsNeeded) {
		this.skillsNeeded = skillsNeeded;
	}

	public String[] getLevel() {
		return level;
	}

	public void setLevel(String[] level) {
		this.level = level;
	}

	

	
	public String[] getNoOfYears() {
		return noOfYears;
	}

	public void setNoOfYears(String[] noOfYears) {
		this.noOfYears = noOfYears;
	}

	public long[] getOppSkills_id() {
		return oppSkills_id;
	}

	public void setOppSkills_id(long[] oppSkills_id) {
		this.oppSkills_id = oppSkills_id;
	}

	public long[] getDeloppSkillsrow() {
		return deloppSkillsrow;
	}

	public void setDeloppSkillsrow(long[] deloppSkillsrow) {
		this.deloppSkillsrow = deloppSkillsrow;
	}

	public String[] getNewSkillsNeeded() {
		return newSkillsNeeded;
	}

	public void setNewSkillsNeeded(String[] newSkillsNeeded) {
		this.newSkillsNeeded = newSkillsNeeded;
	}

	public String[] getNewLevel() {
		return newLevel;
	}

	public void setNewLevel(String[] newLevel) {
		this.newLevel = newLevel;
	}



	public String[] getNewNoOfYears() {
		return newNoOfYears;
	}

	public void setNewNoOfYears(String[] newNoOfYears) {
		this.newNoOfYears = newNoOfYears;
	}

	public String getSkills() {
		return skills;
	}

	public void setSkills(String skills) {
		this.skills = skills;
	}

	

	public void setOpportunitySkillsService(
			BaseService<OpportunitySkills> opportunitySkillsService) {
		this.opportunitySkillsService = opportunitySkillsService;
	}

	public OpportunityService getOpportunitySkillService() {
		return opportunitySkillService;
	}

	public void setOpportunitySkillService(
			OpportunityService opportunitySkillService) {
		this.opportunitySkillService = opportunitySkillService;
	}

	public BaseService<OpportunitySkills> getOpportunitySkillsService() {
		return opportunitySkillsService;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Date getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public String getStr_job_name() {
		return str_job_name;
	}

	public void setStr_job_name(String str_job_name) {
		this.str_job_name = str_job_name;
	}

	public String getStr_location() {
		return str_location;
	}

	public void setStr_location(String str_location) {
		this.str_location = str_location;
	}

	public String getStr_type_of_work() {
		return str_type_of_work;
	}

	public void setStr_type_of_work(String str_type_of_work) {
		this.str_type_of_work = str_type_of_work;
	}

	public String getStr_education_requirment() {
		return str_education_requirment;
	}

	public void setStr_education_requirment(String str_education_requirment) {
		this.str_education_requirment = str_education_requirment;
	}

	public String getStr_salary_range() {
		return str_salary_range;
	}

	public void setStr_salary_range(String str_salary_range) {
		this.str_salary_range = str_salary_range;
	}

	public String getStr_job_type() {
		return str_job_type;
	}

	public void setStr_job_type(String str_job_type) {
		this.str_job_type = str_job_type;
	}

	public String getStr_benefits() {
		return str_benefits;
	}

	public void setStr_benefits(String str_benefits) {
		this.str_benefits = str_benefits;
	}

	public String getWorkingHours() {
		return workingHours;
	}

	public void setWorkingHours(String workingHours) {
		this.workingHours = workingHours;
	}

	public String getStr_job_application_criteria() {
		return str_job_application_criteria;
	}

	public void setStr_job_application_criteria(String str_job_application_criteria) {
		this.str_job_application_criteria = str_job_application_criteria;
	}



	public String getContactperson() {
		return contactperson;
	}



	public void setContactperson(String contactperson) {
		this.contactperson = contactperson;
	}



	public String[] getNewCategory() {
		return newCategory;
	}



	public void setNewCategory(String[] newCategory) {
		this.newCategory = newCategory;
	}



	public String[] getNewnotes() {
		return newnotes;
	}



	public void setNewnotes(String[] newnotes) {
		this.newnotes = newnotes;
	}

	
	
}
