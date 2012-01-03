package com.mob.view.action.employee;

import com.mob.dao.BaseDao;
import com.mob.dto.ProfileSession;
import com.mob.model.User;
import com.mob.model.profile.*;
import com.mob.services.BaseService;
import com.mob.services.EmployeeProfileService;
import com.mob.util.MOBLogger;
import com.mob.integration.IntegrationPointListener;
import com.mob.integration.UserDataIntegrator;
import com.mob.integration.IntegrationPoint;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

import org.acegisecurity.context.SecurityContextHolder;
import org.apache.struts2.ServletActionContext;
import org.hibernate.SessionFactory;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


public class EditEmployeeProfileSessionAction extends ActionSupport implements
        Preparable {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
            new MOBLogger(EditEmployeeProfileSessionAction.class);

    private Profile profile;
    private ProfileSession profileSession;
    private Profile profile1;
    private User user;
    private WorkExperience workExperience;
    private List workExperience1;

    private Occupation occupation;
    private BaseService<Occupation> occupationService;
    private List occupationList;

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

    private SkillsDetails userSkillsDetails;
    private BaseService<SkillsDetails> userSkillsDetailsService;
    private List userSkillsDetailsList;

    private BaseService<Profile> profileService;

    private long[] id;
    private String[] employerName;
    private String[] description;
    private Date[] workStart;
    private Date[] workEnd;
    private String[] newEmployerName;
    private String[] newDescription;
    private Date[] newWorkStart;
    private Date[] newWorkEnd;

    private String[] newSchoolName;
    private String[] newDegree;
    private Date[] newEducationStart;
    private Date[] newEducationEnd;
    private String[] newConcentration;
    private String[] newGpa;
    private String[] newHonors;
    private long[] year;
    private String[] major;
    private String[] minor;
    private String[] newTrainingName;

    private String name;
    private String days1;
    private String jobcategory1;
    private String worktimeframe1;
    private String range1;
    private String salarytype1;

    private long[] delexperiencerow;
    private long[] deleteeducationrow;
    private long[] deltrainingrow;

    private SessionFactory sessionFactory;
    private BaseDao baseDao;
    private BaseService<WorkExperience> workExperienceService;

    private List<WorkExperience> list = new ArrayList();

    private Education education;
    private BaseService<Education> educationService;
    private List educationList;

    private Training training;
    private BaseService<Training> trainingService;
    private List trainingList;

    private long[] education_id;
    private String[] schoolName;
    private String[] degree;
    private Date[] courseStart;
    private Date[] courseEnd;
    private String[] concentration;
    private String[] gpa;
    private String[] honors;

    private long[] training_id;
    private String[] trainingName;

    private List<Education> educationProfileList = new ArrayList();
    private List<Training> trainingProfileList = new ArrayList();

    private File upload;//The actual file
    private String uploadContentType; //The content type of the file
    private String uploadFileName; //The uploaded file name
    private String fileCaption;//The caption of the file entered by user
    private String nickName;
    private String phoneNumber;

    private EmployeeProfileService employeeProfileService;
    private Profile newDefaultProfile;
    
    private BaseService<Industry> industryService;
    private List industryList =new ArrayList();
    private Industry industry;
    private String industryName;
    private BaseService<Industry> industryBaseService;
    private Profile editProfile;
    
    private String height;
    private String measurements;
    private String measurements1;
    private String measurements2;
    private String measurements3;
    private int weight;
    private int shoesize;
    private String build;
    private String haircolor;
    private String eyecolor;
    private String breastcupsize;
    private String ethnicity;
    private String heightIn;
    private String heightFt;
    private PhysicalTraits physicalTraits;
   // private BaseService<Profile> profileService;
 //   private User user;
    private List physicalTraitsList;
    private EmployeeProfileService userPhysicalTraits;
    
    
    
    public void setEmployeeProfileService(EmployeeProfileService employeeProfileService) {
        this.employeeProfileService = employeeProfileService;
    }

    public String editProfileDetails() {
    	industry= new Industry();
      
        range1 = range1.replace(",", "");
        range1 = range1.trim();
        industryList = industryService.findAll(industry);
        user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	editProfile = profileService.findByPrimaryKey(profile, profile.getId());
       try {
    	   this.employeeProfileService.modifyProfileDetails(this.profile,this.profile.getName(),this.days1,this.jobcategory1,
                   this.worktimeframe1,this.range1,this.salarytype1,this.id,this.employerName,this.description,this.workStart ,
                   this.workEnd ,this.newEmployerName ,this.newDescription ,this.newWorkStart ,this.newWorkEnd,
                   this.delexperiencerow,
                   this.upload==null?null:this.upload.getAbsolutePath(),this.uploadFileName,this.uploadContentType,this.profile.getPersonalStatement());
      
	} catch (Exception e) {
		e.printStackTrace();
	}
    	   
      
        
        
        return "success";
    }

    public String editProfileEducationDetails() {
        LOGGER.info("Inside editProfileEducationDetails");
       
        this.employeeProfileService.modifyProfileEducationDetails(this.profile,this.education_id,this.schoolName,
                this.degree,this.courseStart,this.courseEnd,this.concentration,this.gpa,this.honors,this.deleteeducationrow ,
                this.newSchoolName ,this.newDegree ,this.newEducationStart ,this.newEducationEnd ,this.newConcentration,
                this.year,this.major,this.minor,
                this.newGpa,this.newHonors,this.newTrainingName,this.deltrainingrow,
                this.upload==null?null:this.upload.getAbsolutePath(),this.uploadFileName);
        
        try {
        	user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        	Profile profile1 = profileService.findByPrimaryKey(profile, profile.getId());
        	if(industry!=null||(industryName.equalsIgnoreCase(""))){
    			int industryId=Integer.parseInt(industryName);
    			industry=industryBaseService.findByPrimaryKey(industry, industryId);
    			if(industry!=null){
    				profile1.setIndustry(industry);
    			profileService.update(profile1);
    			}
    		}
        	
        	  physicalTraits = new PhysicalTraits();
              physicalTraitsList = userPhysicalTraits.findUserPhysicalTraits(physicalTraits, profile1.getId());
              Iterator<PhysicalTraits> it = physicalTraitsList.iterator();
              try {

                  while (it.hasNext()) {
                      // Get element
                      physicalTraits = it.next();
                      System.out.println("profile" + physicalTraits.getId());
                      height = physicalTraits.getHeight();


                      String[] st = height.split(",");
                      if (st.length == 2) {
                          heightFt = st[0];
                          heightIn = st[1];
                      } else if (st.length == 1) {
                          heightFt = st[0];
                      }

                      measurements = physicalTraits.getMeasurements();
                      String[] measure = measurements.split(",");
                      if (measure.length == 3) {
                    	  measurements1 = measure[0];
                    	  measurements2 = measure[1];
                    	  measurements3 = measure[2];
                      } else if (measure.length == 1) {
                    	  measurements1 = measure[0];
                      }

                      
                    //  measurements = measurements.replaceAll(",", "-");
                      weight = physicalTraits.getWeight();
                      shoesize = physicalTraits.getShoesize();
                      build = physicalTraits.getBuild();
                      haircolor = physicalTraits.getHaircolor();
                      eyecolor = physicalTraits.getEyecolor();
                      breastcupsize = physicalTraits.getBreastcupsize();
                      ethnicity = physicalTraits.getEthnicity();
                  }


              } catch (Exception e) {
                  e.printStackTrace();
              }
        	
        	} catch (Exception e) {
			e.printStackTrace();
        	}
        return "success";
    }

    public String setAsDefaultProfile()
    {   
    	//Setting old default profile status as empty
    	user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
    	Profile profile=employeeProfileService.getDefaultProfileForUser(user.getId());
        profile.setStatus("notdefault");
        profileService.update(profile);
    	
    	//Changing "newDefaultProfile" as default profile
    	newDefaultProfile = profileService.findByPrimaryKey(newDefaultProfile, newDefaultProfile.getId());
    	newDefaultProfile.setStatus("default");
        profileService.update(newDefaultProfile);
        informIntegrationPoint(user,newDefaultProfile);
        return "success";
    }
    private IntegrationPoint integrationPoint;

	

    public void setIntegrationPoint(IntegrationPoint integrationPoint) {
        this.integrationPoint = integrationPoint;
    }

    private void informIntegrationPoint(User user, Profile profile) {
         if (profile.getStatus().equals("default")) {
             LOGGER.info("Inside informIntegrationPoint");
             List<IntegrationPointListener> listeners = this.integrationPoint.getListeners();
             HttpServletRequest request = ServletActionContext.getRequest();
             HttpServletResponse response = ServletActionContext.getResponse();
             for (IntegrationPointListener listener : listeners) {
                 UserDataIntegrator userIntegrator = listener.getUserDataIntegrator();
                 userIntegrator.profileCreated(user.getId(), profile.getName(), request, response);
             }
         }
     }

    public void prepare() throws Exception {
        LOGGER.info("Inside prepare");
        occupation = new Occupation();
        occupationList = occupationService.findAll(occupation);

        skills = new Skills();
        skillsList = skilsService.findAll(skills);

        workTimeframe = new WorkTimeframe();
        workTimeFrameList = workTimeFrameService.findAll(workTimeframe);

        jobType = new JobType();
        jobTypeList = jobTypeService.findAll(jobType);
        
        industry = new Industry();
		industryList = industryService.findAll(industry);
        jobcategory = new JobCategory();
        jobCateoryList = jobCategoryService.findAll(jobcategory);

        salary = new Salary();
        salaryList = salaryService.findAll(salary);

        workTimeframeList2 = workTimeFrameService.findAll(workTimeframe);

    }

    public Profile getProfile() {
        return profile;
    }

    public void setProfile(Profile profile) {
        this.profile = profile;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

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

    public Occupation getOccupation() {
        return occupation;
    }

    public void setOccupation(Occupation occupation) {
        this.occupation = occupation;
    }

    public BaseService<Occupation> getOccupationService() {
        return occupationService;
    }

    public void setOccupationService(BaseService<Occupation> occupationService) {
        this.occupationService = occupationService;
    }

    public List getOccupationList() {
        return occupationList;
    }

    public void setOccupationList(List occupationList) {
        this.occupationList = occupationList;
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


    public List getList() {
        return list;
    }

    public void setList(List list) {
        this.list = list;
    }

    public List getWorkExperience1() {
        return workExperience1;
    }

    public void setWorkExperience1(List workExperience1) {
        this.workExperience1 = workExperience1;
    }

    public long[] getId() {
        return id;
    }

    public void setId(long[] id) {
        this.id = id;
    }

    public SkillsDetails getUserSkillsDetails() {
        return userSkillsDetails;
    }

    public void setUserSkillsDetails(SkillsDetails userSkillsDetails) {
        this.userSkillsDetails = userSkillsDetails;
    }

    public BaseService<SkillsDetails> getUserSkillsDetailsService() {
        return userSkillsDetailsService;
    }

    public void setUserSkillsDetailsService(
            BaseService<SkillsDetails> userSkillsDetailsService) {
        this.userSkillsDetailsService = userSkillsDetailsService;
    }

    public List getUserSkillsDetailsList() {
        return userSkillsDetailsList;
    }

    public void setUserSkillsDetailsList(List userSkillsDetailsList) {
        this.userSkillsDetailsList = userSkillsDetailsList;
    }

    public BaseService<Profile> getProfileService() {
        return profileService;
    }

    public void setProfileService(BaseService<Profile> profileService) {
        this.profileService = profileService;
    }

    public SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }

    public BaseDao getBaseDao() {
        return baseDao;
    }

    public void setBaseDao(BaseDao baseDao) {
        this.baseDao = baseDao;
    }

    public BaseService<WorkExperience> getWorkExperienceService() {
        return workExperienceService;
    }

    public void setWorkExperienceService(
            BaseService<WorkExperience> workExperienceService) {
        this.workExperienceService = workExperienceService;
    }

    public long[] getDelexperiencerow() {
        return delexperiencerow;
    }

    public void setDelexperiencerow(long[] delexperiencerow) {
        this.delexperiencerow = delexperiencerow;
    }

    public String[] getNewEmployerName() {
        return newEmployerName;
    }

    public void setNewEmployerName(String[] newEmployerName) {
        this.newEmployerName = newEmployerName;
    }

    public String[] getNewDescription() {
        return newDescription;
    }

    public void setNewDescription(String[] newDescription) {
        this.newDescription = newDescription;
    }

    public Date[] getNewWorkStart() {
        return newWorkStart;
    }

    public void setNewWorkStart(Date[] newWorkStart) {
        this.newWorkStart = newWorkStart;
    }

    public Date[] getNewWorkEnd() {
        return newWorkEnd;
    }

    public void setNewWorkEnd(Date[] newWorkEnd) {
        this.newWorkEnd = newWorkEnd;
    }

    public Education getEducation() {
        return education;
    }

    public void setEducation(Education education) {
        this.education = education;
    }

    public Training getTraining() {
        return training;
    }

    public void setTraining(Training training) {
        this.training = training;
    }

    public BaseService<Education> getEducationService() {
        return educationService;
    }

    public void setEducationService(BaseService<Education> educationService) {
        this.educationService = educationService;
    }

    public List getEducationList() {
        return educationList;
    }

    public void setEducationList(List educationList) {
        this.educationList = educationList;
    }

    public BaseService<Training> getTrainingService() {
        return trainingService;
    }

    public void setTrainingService(BaseService<Training> trainingService) {
        this.trainingService = trainingService;
    }

    public List getTrainingList() {
        return trainingList;
    }

    public void setTrainingList(List trainingList) {
        this.trainingList = trainingList;
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

    public String[] getTrainingName() {
        return trainingName;
    }

    public void setTrainingName(String[] trainingName) {
        this.trainingName = trainingName;
    }

    public long[] getEducation_id() {
        return education_id;
    }

    public void setEducation_id(long[] education_id) {
        this.education_id = education_id;
    }

    public Date[] getCourseStart() {
        return courseStart;
    }

    public void setCourseStart(Date[] courseStart) {
        this.courseStart = courseStart;
    }

    public Date[] getCourseEnd() {
        return courseEnd;
    }

    public void setCourseEnd(Date[] courseEnd) {
        this.courseEnd = courseEnd;
    }

    public List<Education> getEducationProfileList() {
        return educationProfileList;
    }

    public void setEducationProfileList(List<Education> educationProfileList) {
        this.educationProfileList = educationProfileList;
    }

    public List<Training> getTrainingProfileList() {
        return trainingProfileList;
    }

    public void setTrainingProfileList(List<Training> trainingProfileList) {
        this.trainingProfileList = trainingProfileList;
    }

    public long[] getTraining_id() {
        return training_id;
    }

    public void setTraining_id(long[] training_id) {
        this.training_id = training_id;
    }

    public long[] getDeleteeducationrow() {
        return deleteeducationrow;
    }

    public void setDeleteeducationrow(long[] deleteeducationrow) {
        this.deleteeducationrow = deleteeducationrow;
    }

    public long[] getDeltrainingrow() {
        return deltrainingrow;
    }

    public void setDeltrainingrow(long[] deltrainingrow) {
        this.deltrainingrow = deltrainingrow;
    }

    public String[] getNewSchoolName() {
        return newSchoolName;
    }

    public void setNewSchoolName(String[] newSchoolName) {
        this.newSchoolName = newSchoolName;
    }

    public String[] getNewDegree() {
        return newDegree;
    }

    public void setNewDegree(String[] newDegree) {
        this.newDegree = newDegree;
    }

    public Date[] getNewEducationStart() {
        return newEducationStart;
    }

    public void setNewEducationStart(Date[] newEducationStart) {
        this.newEducationStart = newEducationStart;
    }

    public Date[] getNewEducationEnd() {
        return newEducationEnd;
    }

    public void setNewEducationEnd(Date[] newEducationEnd) {
        this.newEducationEnd = newEducationEnd;
    }

    public String[] getNewConcentration() {
        return newConcentration;
    }

    public void setNewConcentration(String[] newConcentration) {
        this.newConcentration = newConcentration;
    }

    public String[] getNewGpa() {
        return newGpa;
    }

    public void setNewGpa(String[] newGpa) {
        this.newGpa = newGpa;
    }

    public String[] getNewHonors() {
        return newHonors;
    }

    public void setNewHonors(String[] newHonors) {
        this.newHonors = newHonors;
    }

    public String[] getNewTrainingName() {
        return newTrainingName;
    }

    public void setNewTrainingName(String[] newTrainingName) {
        this.newTrainingName = newTrainingName;
    }

    public Profile getProfile1() {
        return profile1;
    }

    public void setProfile1(Profile profile1) {
        this.profile1 = profile1;
    }

    public void ageCalculator() {


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

    public ProfileSession getProfileSession() {
        return profileSession;
    }

    public void setProfileSession(ProfileSession profileSession) {
        this.profileSession = profileSession;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

	public void setNewDefaultProfile(Profile newDefaultProfile) {
		this.newDefaultProfile = newDefaultProfile;
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

	public Industry getIndustry() {
		return industry;
	}

	public void setIndustry(Industry industry) {
		this.industry = industry;
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

	public long[] getYear() {
		return year;
	}

	public void setYear(long[] year) {
		this.year = year;
	}

	public String[] getMajor() {
		return major;
	}

	public void setMajor(String[] major) {
		this.major = major;
	}

	public String[] getMinor() {
		return minor;
	}

	public void setMinor(String[] minor) {
		this.minor = minor;
	}

	public Profile getEditProfile() {
		return editProfile;
	}

	public void setEditProfile(Profile editProfile) {
		this.editProfile = editProfile;
	}

	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}

	public String getMeasurements() {
		return measurements;
	}

	public void setMeasurements(String measurements) {
		this.measurements = measurements;
	}

	public int getWeight() {
		return weight;
	}

	public void setWeight(int weight) {
		this.weight = weight;
	}

	public int getShoesize() {
		return shoesize;
	}

	public void setShoesize(int shoesize) {
		this.shoesize = shoesize;
	}

	public String getBuild() {
		return build;
	}

	public void setBuild(String build) {
		this.build = build;
	}

	public String getHaircolor() {
		return haircolor;
	}

	public void setHaircolor(String haircolor) {
		this.haircolor = haircolor;
	}

	public String getEyecolor() {
		return eyecolor;
	}

	public void setEyecolor(String eyecolor) {
		this.eyecolor = eyecolor;
	}

	public String getEthnicity() {
		return ethnicity;
	}

	public void setEthnicity(String ethnicity) {
		this.ethnicity = ethnicity;
	}

	public String getHeightIn() {
		return heightIn;
	}

	public void setHeightIn(String heightIn) {
		this.heightIn = heightIn;
	}

	public String getHeightFt() {
		return heightFt;
	}

	public void setHeightFt(String heightFt) {
		this.heightFt = heightFt;
	}

	public PhysicalTraits getPhysicalTraits() {
		return physicalTraits;
	}

	public void setPhysicalTraits(PhysicalTraits physicalTraits) {
		this.physicalTraits = physicalTraits;
	}

	public List getPhysicalTraitsList() {
		return physicalTraitsList;
	}

	public void setPhysicalTraitsList(List physicalTraitsList) {
		this.physicalTraitsList = physicalTraitsList;
	}

	public EmployeeProfileService getUserPhysicalTraits() {
		return userPhysicalTraits;
	}

	public void setUserPhysicalTraits(EmployeeProfileService userPhysicalTraits) {
		this.userPhysicalTraits = userPhysicalTraits;
	}

	public EmployeeProfileService getEmployeeProfileService() {
		return employeeProfileService;
	}

	public String getMeasurements1() {
		return measurements1;
	}

	public void setMeasurements1(String measurements1) {
		this.measurements1 = measurements1;
	}

	public String getMeasurements2() {
		return measurements2;
	}

	public void setMeasurements2(String measurements2) {
		this.measurements2 = measurements2;
	}

	public String getMeasurements3() {
		return measurements3;
	}

	public void setMeasurements3(String measurements3) {
		this.measurements3 = measurements3;
	}

}
