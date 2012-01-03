package com.mob.view.action.employee;

import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

import com.mob.integration.IntegrationPoint;
import com.mob.integration.IntegrationPointListener;
import com.mob.integration.UserDataIntegrator;
import com.mob.model.PrivacyGroup;
import com.mob.model.User;
import com.mob.model.profile.Education;
import com.mob.model.profile.Industry;
import com.mob.model.profile.JobCategory;
import com.mob.model.profile.JobType;
import com.mob.model.profile.Profile;
import com.mob.model.profile.Salary;
import com.mob.model.profile.SalaryType;
import com.mob.model.profile.Skills;
import com.mob.model.profile.SkillsCategory;
import com.mob.model.profile.Training;
import com.mob.model.profile.WorkExperience;
import com.mob.model.profile.WorkTimeframe;
import com.mob.services.BaseService;
import com.mob.services.EmployeeProfileService;
import com.mob.services.UserManagement;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class EmployeeProfileAccountSession extends ActionSupport implements
		Preparable {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EmployeeProfileAccountSession.class);
    private static final long serialVersionUID = 1L;
	private Profile profile = new Profile();
	private User user;
	private WorkExperience workExperience;

	//private Occupation occupation;
	//private BaseService<Occupation> occupationService;
	//private List occupationList;

	private Skills skills;
	private BaseService<Skills> skilsService;
	private List skillsList;

	private WorkTimeframe workTimeframe;
	private BaseService<WorkTimeframe> workTimeFrameService;
	private List workTimeFrameList;
	private List<WorkTimeframe> workTimeframeList2;

	private JobType jobType;
	private BaseService<JobType> jobTypeService;
	private List jobTypeList;

	private JobCategory jobcategory;
	private BaseService<JobCategory> jobCategoryService;
	private List jobCateoryList;

	private Salary salary;
	private BaseService<Salary> salaryService;
	private List salaryList;

	private SalaryType salaryType;
	private BaseService<SalaryType> salaryTypeService;
	private List salaryTypeList;

	private Education education;
	private BaseService<Education> educationService;
	private List<Education> educationList = new ArrayList<Education>();

	private String[] employerName;
	private String[] description;
	private Date[] workStart;
	private Date[] workEnd;

	private String[] schoolName;
	private String[] degree;
	private Date[] educationStart;
	private Date[] educationEnd;
	private String[] concentration;
	private String[] gpa;
	private String[] honors;

	private String nickName;
	private String phoneNumber;

	private String name;
	private String days1;
	private String jobcategory1;
	private String worktimeframe1;
	private String range1;
	private String salarytype1;

	private Industry industry;
	private BaseService<Industry> industryService;
	private List industryList;

	private SkillsCategory skillsCategory;
	private BaseService<SkillsCategory> skillsCategoryService;
	private List skillsCategoryList;

	private List<WorkExperience> list = new ArrayList<WorkExperience>();

	private String[] trainingName;
	private Training training;
	private List<Training> trainingList = new ArrayList();

	private File upload;//The actual file
	private String uploadContentType; //The content type of the file
	private String uploadFileName; //The uploaded file name
	private String fileCaption;//The caption of the file entered by user

	private String picture;

	private BaseService<Profile> profileService;
	private BaseService<WorkExperience> workExperienceService;
	private BaseService<Training> trainingService;

	private List linkedskillList;
	private long categoryId;
	private EmployeeProfileService employeeProfileService;

	
	private String categoryName;
	private String industryName;
	private BaseService<Industry> industryBaseService;
	private UserManagement userManagement;

    private IntegrationPoint integrationPoint;
    
    private Date privacyGroupCreatedDate;
    private PrivacyGroup privacyGroup;
    private BaseService<PrivacyGroup> privacyGroupBaseService;



    public String applyProfileDetails() {
		LOGGER.info("Inside applyProfileDetails");
		LOGGER.info("day" + days1);

		range1 = range1.replace(",", "");
		range1 = range1.trim();
		this.profile.setDays(days1);
		this.profile.setJobcategory(jobcategory1);
		this.profile.setWorkTimeframe(worktimeframe1);
		this.profile.setRange(range1);
		this.profile.setSalaryType(salarytype1);
		this.profile.setName(name);

		profile.setProfileOwner(user);
		profileService.create(profile);
		
		privacyGroupCreatedDate = new Date(System.currentTimeMillis());
        
        privacyGroup = new PrivacyGroup();
        privacyGroup.setName("Contact");
        privacyGroup.setProfile(profile);
        privacyGroup.setCreatedDate(privacyGroupCreatedDate);
        privacyGroupBaseService.create(privacyGroup);

        privacyGroup = new PrivacyGroup();
        privacyGroup.setName("Public");
        privacyGroup.setProfile(profile);
        privacyGroup.setCreatedDate(privacyGroupCreatedDate);
        privacyGroupBaseService.create(privacyGroup);		

		if (employerName != null) {
			for (int i = 0; i < employerName.length; i++) {
				workExperience = new WorkExperience();
				this.workExperience.setEmployerName(employerName[i]);
				this.workExperience.setDescription(description[i]);
				this.workExperience.setWorkStart(workStart[i]);
				this.workExperience.setWorkEnd(workEnd[i]);

				workExperience.setWorkExperienceProfile(profile);
				workExperienceService.create(workExperience);

			}
		}
        informIntegrationPoint(user,profile);

        return "success";
	}

    private void informIntegrationPoint(User user, Profile profile) {
    	LOGGER.info("Inside informIntegrationPoint");
        List<IntegrationPointListener> listeners = this.integrationPoint.getListeners();
        HttpServletRequest request = ServletActionContext.getRequest();
        HttpServletResponse response = ServletActionContext.getResponse();
        for (IntegrationPointListener listener : listeners) {
            UserDataIntegrator userIntegrator = listener.getUserDataIntegrator();
            userIntegrator.profileCreated(user.getId(),profile.getName(),request,response);
        }
    }

    public String addProfileEducationDetails() {
		LOGGER.info("Inside addProfileEducationDetails");
		profile.setProfileOwner(user);
		profile = profileService.findByPrimaryKey(profile, profile.getId());
		this.profile.setPhoneNumber(phoneNumber);
		profileService.update(profile);
		if (schoolName != null) {
			for (int i = 0; i < schoolName.length; i++) {
				education = new Education();
				LOGGER.info(schoolName[i]);
				this.education.setSchoolName(schoolName[i]);
				this.education.setDegree(degree[i]);
				this.education.setCourseStart(educationStart[i]);
				this.education.setCourseEnd(educationEnd[i]);
				this.education.setConcentration(concentration[i]);
				this.education.setGpa(gpa[i]);
				this.education.setHonors(honors[i]);
				education.setOwningProfile(profile);
				educationService.create(education);

			}
		}

		if (trainingName != null) {

			for (int i = 0; i < trainingName.length; i++) {

				training = new Training();
				this.training.setName(trainingName[i]);

				training.setTrainingProfile(profile);
				trainingService.create(training);

			}

		}
	
		   if(this.upload != null){
		          this.userManagement.updatePicture(profile,this.upload.getAbsolutePath(),uploadFileName);
		        }
		
		return "success";

	}


	public void prepare() throws Exception {
		LOGGER.info("Inside prepare");
		/*occupation = new Occupation();
		occupationList = occupationService.findAll(occupation);*/

		skills = new Skills();
		skillsList = skilsService.findAll(skills);

		workTimeframe = new WorkTimeframe();
		workTimeFrameList = workTimeFrameService.findAll(workTimeframe);

		jobType = new JobType();
		jobTypeList = jobTypeService.findAll(jobType);

		jobcategory = new JobCategory();
		jobCateoryList = jobCategoryService.findAll(jobcategory);

		salary = new Salary();
		salaryList = salaryService.findAll(salary);

		salaryType = new SalaryType();
		salaryTypeList = salaryTypeService.findAll(salaryType);
		LOGGER.info("salary type list" + salaryTypeList.size());

		workTimeframeList2 = workTimeFrameService.findAll(workTimeframe);

		industry = new Industry();
		industryList = industryService.findAll(industry);

		skillsCategory = new SkillsCategory();
		skillsCategoryList = skillsCategoryService.findAll(skillsCategory);

	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	/*public User getUser() {
		return user;
	}


	public void setUser(User user) {
		this.user = user;
	}*/

	public WorkExperience getWorkExperience() {
		return workExperience;
	}

	public void setWorkExperience(WorkExperience workExperience) {
		this.workExperience = workExperience;
	}

	public String[] getEmployerName() {
		return employerName;
	}

	public void setEmployerName(String[] employerName) {
		this.employerName = employerName;
	}

	public String[] getDescription() {
		return description;
	}

	public void setDescription(String[] description) {
		this.description = description;
	}

	public Date[] getWorkStart() {
		return workStart;
	}

	public void setWorkStart(Date[] workStart) {
		this.workStart = workStart;
	}

	public Date[] getWorkEnd() {
		return workEnd;
	}

	public void setWorkEnd(Date[] workEnd) {
		this.workEnd = workEnd;
	}

	
	public Skills getSkills() {
		return skills;
	}

	public void setSkills(Skills skills) {
		this.skills = skills;
	}

	public BaseService<Skills> getSkilsService() {
		return skilsService;
	}

	public void setSkilsService(BaseService<Skills> skilsService) {
		this.skilsService = skilsService;
	}

	public List getSkillsList() {
		return skillsList;
	}

	public void setSkillsList(List skillsList) {
		this.skillsList = skillsList;
	}

	public WorkTimeframe getWorkTimeframe() {
		return workTimeframe;
	}

	public void setWorkTimeframe(WorkTimeframe workTimeframe) {
		this.workTimeframe = workTimeframe;
	}

	public BaseService<WorkTimeframe> getWorkTimeFrameService() {
		return workTimeFrameService;
	}

	public void setWorkTimeFrameService(
			BaseService<WorkTimeframe> workTimeFrameService) {
		this.workTimeFrameService = workTimeFrameService;
	}

	public List getWorkTimeFrameList() {
		return workTimeFrameList;
	}

	public void setWorkTimeFrameList(List workTimeFrameList) {
		this.workTimeFrameList = workTimeFrameList;
	}

	public List<WorkTimeframe> getWorkTimeframeList2() {
		return workTimeframeList2;
	}

	public void setWorkTimeframeList2(List<WorkTimeframe> workTimeframeList2) {
		this.workTimeframeList2 = workTimeframeList2;
	}

	public JobType getJobType() {
		return jobType;
	}

	public void setJobType(JobType jobType) {
		this.jobType = jobType;
	}

	public BaseService<JobType> getJobTypeService() {
		return jobTypeService;
	}

	public void setJobTypeService(BaseService<JobType> jobTypeService) {
		this.jobTypeService = jobTypeService;
	}

	public List getJobTypeList() {
		return jobTypeList;
	}

	public void setJobTypeList(List jobTypeList) {
		this.jobTypeList = jobTypeList;
	}

	public JobCategory getJobcategory() {
		return jobcategory;
	}

	public void setJobcategory(JobCategory jobcategory) {
		this.jobcategory = jobcategory;
	}

	public BaseService<JobCategory> getJobCategoryService() {
		return jobCategoryService;
	}

	public void setJobCategoryService(
			BaseService<JobCategory> jobCategoryService) {
		this.jobCategoryService = jobCategoryService;
	}

	public List getJobCateoryList() {
		return jobCateoryList;
	}

	public void setJobCateoryList(List jobCateoryList) {
		this.jobCateoryList = jobCateoryList;
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

	public String getDays1() {
		return days1;
	}

	public void setDays1(String days1) {
		this.days1 = days1;
	}

	public String getJobcategory1() {
		return jobcategory1;
	}

	public void setJobcategory1(String jobcategory1) {
		this.jobcategory1 = jobcategory1;
	}

	public String getWorktimeframe1() {
		return worktimeframe1;
	}

	public void setWorktimeframe1(String worktimeframe1) {
		this.worktimeframe1 = worktimeframe1;
	}

	public String getRange1() {
		return range1;
	}

	public void setRange1(String range1) {
		this.range1 = range1;
	}

	public String getSalarytype1() {
		return salarytype1;
	}

	public void setSalarytype1(String salarytype1) {
		this.salarytype1 = salarytype1;
	}

	public String[] getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(String[] schoolName) {
		this.schoolName = schoolName;
	}

	public String[] getDegree() {
		return degree;
	}

	public void setDegree(String[] degree) {
		this.degree = degree;
	}

	public Date[] getEducationStart() {
		return educationStart;
	}

	public void setEducationStart(Date[] educationStart) {
		this.educationStart = educationStart;
	}

	public Date[] getEducationEnd() {
		return educationEnd;
	}

	public void setEducationEnd(Date[] educationEnd) {
		this.educationEnd = educationEnd;
	}

	public String[] getConcentration() {
		return concentration;
	}

	public void setConcentration(String[] concentration) {
		this.concentration = concentration;
	}

	public String[] getGpa() {
		return gpa;
	}

	public void setGpa(String[] gpa) {
		this.gpa = gpa;
	}

	public String[] getHonors() {
		return honors;
	}

	public void setHonors(String[] honors) {
		this.honors = honors;
	}

	public Education getEducation() {
		return education;
	}

	public void setEducation(Education education) {
		this.education = education;
	}

	public BaseService<Education> getEducationService() {
		return educationService;
	}

	public void setEducationService(BaseService<Education> educationService) {
		this.educationService = educationService;
	}

	public List<Education> getEducationList() {
		return educationList;
	}

	public void setEducationList(List<Education> educationList) {
		this.educationList = educationList;
	}

	public List<WorkExperience> getList() {
		return list;
	}

	public void setList(List<WorkExperience> list) {
		this.list = list;
	}

	public String[] getTrainingName() {
		return trainingName;
	}

	public void setTrainingName(String[] trainingName) {
		this.trainingName = trainingName;
	}

	public Training getTraining() {
		return training;
	}

	public void setTraining(Training training) {
		this.training = training;
	}

	public List<Training> getTrainingList() {
		return trainingList;
	}

	public void setTrainingList(List<Training> trainingList) {
		this.trainingList = trainingList;
	}

	public File getUpload() {
		return upload;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}

	public String getUploadContentType() {
		return uploadContentType;
	}

	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
	}

	public String getUploadFileName() {
		return uploadFileName;
	}

	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}

	public String getFileCaption() {
		return fileCaption;
	}

	public void setFileCaption(String fileCaption) {
		this.fileCaption = fileCaption;
	}

	public String getPicture() {
		return picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getNickName() {
		return nickName;
	}

	public void setNickName(String nickName) {
		this.nickName = nickName;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public List getIndustryList() {
		return industryList;
	}

	public void setIndustryList(List industryList) {
		this.industryList = industryList;
	}

	public SkillsCategory getSkillsCategory() {
		return skillsCategory;
	}

	public void setSkillsCategory(SkillsCategory skillsCategory) {
		this.skillsCategory = skillsCategory;
	}

	public BaseService<SkillsCategory> getSkillsCategoryService() {
		return skillsCategoryService;
	}

	public void setSkillsCategoryService(
			BaseService<SkillsCategory> skillsCategoryService) {
		this.skillsCategoryService = skillsCategoryService;
	}

	public List getSkillsCategoryList() {
		return skillsCategoryList;
	}

	public void setSkillsCategoryList(List skillsCategoryList) {
		this.skillsCategoryList = skillsCategoryList;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public SalaryType getSalaryType() {
		return salaryType;
	}

	public void setSalaryType(SalaryType salaryType) {
		this.salaryType = salaryType;
	}

	public BaseService<SalaryType> getSalaryTypeService() {
		return salaryTypeService;
	}

	public void setSalaryTypeService(BaseService<SalaryType> salaryTypeService) {
		this.salaryTypeService = salaryTypeService;
	}

	public List getSalaryTypeList() {
		return salaryTypeList;
	}

	public void setSalaryTypeList(List salaryTypeList) {
		this.salaryTypeList = salaryTypeList;
	}

	public BaseService<Profile> getProfileService() {
		return profileService;
	}

	public void setProfileService(BaseService<Profile> profileService) {
		this.profileService = profileService;
	}

	public BaseService<WorkExperience> getWorkExperienceService() {
		return workExperienceService;
	}

	public void setWorkExperienceService(
			BaseService<WorkExperience> workExperienceService) {
		this.workExperienceService = workExperienceService;
	}

	public BaseService<Training> getTrainingService() {
		return trainingService;
	}

	public void setTrainingService(BaseService<Training> trainingService) {
		this.trainingService = trainingService;
	}

	public List getLinkedskillList() {
		return linkedskillList;
	}

	public void setLinkedskillList(List linkedskillList) {
		this.linkedskillList = linkedskillList;
	}

	public long getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(long categoryId) {
		this.categoryId = categoryId;
	}

	public EmployeeProfileService getEmployeeProfileService() {
		return employeeProfileService;
	}

	public void setEmployeeProfileService(
			EmployeeProfileService employeeProfileService) {
		this.employeeProfileService = employeeProfileService;
	}

	public String getIndustryName() {
		return industryName;
	}

	public void setIndustryName(String industryName) {
		this.industryName = industryName;
	}

	public BaseService<Industry> getIndustryBaseService() {
		return industryBaseService;
	}

	public void setIndustryBaseService(BaseService<Industry> industryBaseService) {
		this.industryBaseService = industryBaseService;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public UserManagement getUserManagement() {
		return userManagement;
	}

	public void setUserManagement(UserManagement userManagement) {
		this.userManagement = userManagement;
	}
    public void setPrivacyGroupCreatedDate(Date privacyGroupCreatedDate) {
		this.privacyGroupCreatedDate = privacyGroupCreatedDate;
	}



	public void setPrivacyGroup(PrivacyGroup privacyGroup) {
		this.privacyGroup = privacyGroup;
	}



	public void setPrivacyGroupBaseService(
			BaseService<PrivacyGroup> privacyGroupBaseService) {
		this.privacyGroupBaseService = privacyGroupBaseService;
	}



	public void setIntegrationPoint(IntegrationPoint integrationPoint) {
         this.integrationPoint = integrationPoint;
     }

    

}
