package com.mob.view.action.employee;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.acegisecurity.context.SecurityContextHolder;
import org.apache.struts2.interceptor.SessionAware;

import com.mob.dto.ProfileSession;
import com.mob.model.Contact;
import com.mob.model.ContactTypes;
import com.mob.model.User;
import com.mob.model.profile.Days;
import com.mob.model.profile.Education;
import com.mob.model.profile.Feedback;
import com.mob.model.profile.Industry;
import com.mob.model.profile.JobCategory;
import com.mob.model.profile.JobType;
import com.mob.model.profile.Occupation;
import com.mob.model.profile.PhysicalTraits;
import com.mob.model.profile.Profile;
import com.mob.model.profile.Salary;
import com.mob.model.profile.SalaryType;
import com.mob.model.profile.Skills;
import com.mob.model.profile.SkillsCategory;
import com.mob.model.profile.SkillsDetails;
import com.mob.model.profile.Training;
import com.mob.model.profile.WorkExperience;
import com.mob.model.profile.WorkTimeframe;
import com.mob.services.BaseService;
import com.mob.services.ContactEmployeeService;
import com.mob.services.EmployeeProfileService;
import com.mob.services.FeedbackService;
import com.mob.services.ItemService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class LoadProfileAction extends ActionSupport implements Preparable,SessionAware
{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(LoadProfileAction.class);

    private static final long serialVersionUID = 1L;
    
	private Profile profile = new Profile();
    private ProfileSession profileSession;
	private Skills skills;
	private BaseService<Skills> skilsService;	
	private List skillsList;
	
	private WorkTimeframe workTimeframe;
	private BaseService<WorkTimeframe> workTimeFrameService;	
	private List workTimeFrameList;
	
	private JobType jobType;
	private BaseService<JobType> jobTypeService;	
	private List jobTypeList;
	
	
	private BaseService<Occupation> occupationService;	
	private List occupationList;	
	private Occupation occupation;

	private BaseService<Profile> profileService;	
	private ContactEmployeeService contactEmployeeService;
	
	private BaseService<ContactTypes> employeeContactTypesService;
	private Contact contact;
	private ContactTypes friendtype;
	private List contactTypesList;
	

	private JobCategory jobcategory;
	private BaseService<JobCategory> jobCategoryService;	
	private List jobCateoryList;
	

	private Salary salary;
	private BaseService<Salary> salaryService;
	private List salaryList;
	
	
	private SalaryType salaryType;
	private BaseService<SalaryType> salaryTypeService;
	private List salaryTypeList;
	
	private int age;
	
	private List<Contact> contacts;
	private User user;
	
	private WorkExperience workExperience;
	private BaseService<WorkExperience> baseWorkExperienceService;
	private List<WorkExperience> workExperienceList;	
	private EmployeeProfileService workExperienceService;
	
	
	private Education education;
	private Training training;

	
	private List<Education> educationList;	
	private List<Training> trainingList;
	
	
	
	private EmployeeProfileService educationService;
	private EmployeeProfileService trainingService;
	
	private SkillsDetails userSkillsDetails;	
	private PhysicalTraits physicalTraits;	
	
	private EmployeeProfileService userSkillsDetailsService;
	private EmployeeProfileService userPhysicalTraits;
	private List userSkillsDetailsList;
	private List physicalTraitsList;
	
	private Days days;
	private List daysList = new ArrayList();
	private BaseService<Days> daysService;
	    

	private List checkBoxList = new ArrayList();
    private List ckBoxList = new ArrayList();


    private ItemService itemService;
	private List itemsList;
	private int itemcount;
	private int possitiveSize;
	private Feedback feedback;	
	private FeedbackService feedbackService;
	private int allProfilesFeedbackCount;
	
	private EmployeeProfileService employeeProfileService;
    
	private Industry industry;
	private BaseService<Industry> industryService;
	private List industryList;

	private SkillsCategory skillsCategory;
	private BaseService<SkillsCategory> skillsCategoryService;
	private List skillsCategoryList;
	
	private Map session;
	
	private String  image;
	private String  resizedMinImage;
	private String  resizedMidImage;
	
	
	private String height;
	private String measurements;
	private int weight;
	private int shoesize;
	private String build;
	private String haircolor;
	private String eyecolor;
	private String breastcupsize;
	private String ethnicity;
	private String heightIn;
	private String heightFt;
	 private String resizedMidPicture;
	private String resizedMinPicture;
	private Contact contactOwner;
	private Education educationMinor;	
	 private String major;
	 private String minor;

	public String loadEmpolyeeProfile() {

		LOGGER.info("inside loademployeeProfile");

		user = (User)SecurityContextHolder.getContext().
		getAuthentication().getPrincipal();

		profile = profileService.findByPrimaryKey(profile,profile.getId());
		
		List listContacts = contactEmployeeService.findContacts(profile.getProfileOwner().getId());
			
		profile.setNoOfContacts(listContacts.size());
		contacts = contactEmployeeService.findListContacts(profile.getProfileOwner().getId());
		if(profile.getPicture()!=null){
			image=(String) profile.getAmazonFileURL().get(0);
		}
		if(profile.getResizedMidPicture()!=null){
			resizedMidImage=(String) profile.getAmazonFileURL().get(1);
		}
		if(profile.getResizedMinPicture()!=null){
			resizedMinImage=(String) profile.getAmazonFileURL().get(2);
		}
		workExperience = new WorkExperience();
		workExperienceList= workExperienceService.findExperienceList(workExperience,profile.getId());

		System.out.println("Image" +image);
		try {
			Iterator it=contacts.iterator();
			while (it.hasNext()) {
				contact = (Contact) it.next();
						if(contact.getAssociatedProfile().getResizedMinPicture()!=null){
						resizedMinPicture=(String) contact.getAssociatedProfile().getAmazonFileURL().get(0);
						contact.getAssociatedProfile().setResizedMinPicture(resizedMinPicture);
					}
				
		} 
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return "success";
	}
	
	
	public String setFeedback(){	
		
		LOGGER.info("inside setFeedback method");
		 
		List positiveListSize= feedbackService.findListOfFeedbacks(feedback, profile.getId());     
	   	possitiveSize=positiveListSize.size();
	   	
		return "success";
	}
	public String loadEmpolyeeEducationTrainingDetails() {
		LOGGER.info("Inside loadEmpolyeeEducationTrainingDetails");
		 user = (User)SecurityContextHolder.getContext().
		 getAuthentication().getPrincipal();
		
		 education = new Education();		 
		 educationList = educationService.findEducationList(education,profile.getId());	
		 
		 
		 Iterator<Education> it = educationList.iterator();
		try {
			while (it.hasNext()) {
				// Get element
				educationMinor = it.next();
				minor = educationMinor.getMinor();
				if (minor.equalsIgnoreCase("")) {
					minor = null;
					educationMinor.setMinor(minor);
				}

			}
		
		} catch (Exception e) {
			e.printStackTrace();
		}
			
		 
		 training=new Training();
		 trainingList=trainingService.findTrainingList(training,profile.getId());
		
		 return "success";
	}
	
	public String loadEmpolyeeSkillsDetails() {
		 LOGGER.info("Inside loadEmpolyeeSkillsDetails");
		 user = (User)SecurityContextHolder.getContext().
		 getAuthentication().getPrincipal();		 
		 profile = profileService.findByPrimaryKey(profile,profile.getId());
		 userSkillsDetails = new SkillsDetails();
		 userSkillsDetailsList= userSkillsDetailsService.findUserSkillsList(userSkillsDetails,profile.getId());
		 physicalTraits=employeeProfileService.getphysicalTraitsForUser(profile.getId());
		return "success";
	}
	public String loadEmpolyeePhysicalTraits() {
		 LOGGER.info("Inside loadEmpolyeeSkillsDetails");
		 user = (User)SecurityContextHolder.getContext().
		 getAuthentication().getPrincipal();		 
		 profile = profileService.findByPrimaryKey(profile,profile.getId());
		 physicalTraits = new PhysicalTraits();
		 physicalTraitsList= userPhysicalTraits.findUserPhysicalTraits(physicalTraits,profile.getId());
		 Iterator<PhysicalTraits> it = physicalTraitsList.iterator();
		 try {
			 while (it.hasNext()) {
					// Get element
					physicalTraits = it.next();
					System.out.println("profile" +physicalTraits.getId());
					 height=physicalTraits.getHeight();
					 
					 
					 String[] st = height.split(",");
					 if(st.length == 2){
					 heightFt = st[0];
					 heightIn = st[1];
					 }else if(st.length == 1){
						 heightFt = st[0];
					 }
					 
					 measurements=physicalTraits.getMeasurements();
					 measurements= measurements.replaceAll(",","-");
					 weight=physicalTraits.getWeight();
					 shoesize=physicalTraits.getShoesize();
					 build=physicalTraits.getBuild();
					 haircolor=physicalTraits.getHaircolor();;
					 eyecolor=physicalTraits.getEyecolor();
					 breastcupsize=physicalTraits.getBreastcupsize();
					ethnicity=physicalTraits.getEthnicity();
				}
		
			
		} catch (Exception e) {
			e.printStackTrace();
		}
			
	
		return "success";
	}

	
	public String getProfileViewCount(){
		 LOGGER.info("inside getProfileViewCount method");
		 profile = employeeProfileService.viewProfileCount(profile,profile.getId());
		 getSession().put("currentProfile",profile.getId());
		 getFeedbackCount();
		 getAllProfilesFeedbacksCount();
		 loadEmpolyeeProfile();		
			loadEmpolyeeEducationTrainingDetails();
			loadEmpolyeeSkillsDetails();
			loadEmpolyeePhysicalTraits();
		 
		 contacts = contactEmployeeService.findListContacts(profile.getId());
		 Iterator it=contacts.iterator();
		 while(it.hasNext()){
			 contactOwner=(Contact)it.next();
			 if(contactOwner.getContactOwner().getResizedMinPicture()!=null){
					resizedMinPicture=(String) contactOwner.getContactOwner().getAmazonFileURL().get(2);
					contactOwner.getContactOwner().setResizedMinPicture(resizedMinPicture);
				}
			 boolean result=contactEmployeeService.isContactOwnerEmployer(contactOwner);
			 contactOwner.setEmployer(result);
			
		 }
		 profile.setNoOfContacts(contacts.size());
		 
		 itemsList = itemService.findItems(profile.getId());
		 itemcount=itemsList.size();
		 return "success";
	}
	
	public void getFeedbackCount(){
		 
		 List positiveListSize= feedbackService.findListOfFeedbacks(feedback, profile.getId());   
		 possitiveSize=positiveListSize.size();
	}
	
	public void getAllProfilesFeedbacksCount(){
		user = (User)SecurityContextHolder.getContext().
		 getAuthentication().getPrincipal();		
		 List allProfilesFeedback= feedbackService.findAllProfilesFeedback(feedback, user.getId());   
		 allProfilesFeedbackCount=allProfilesFeedback.size();
	}
	
	public String viewEmployeeProfileDetails(){
		loadEmpolyeeProfile();		
		loadEmpolyeeEducationTrainingDetails();
		loadEmpolyeeSkillsDetails();
		getFeedbackCount();
		getAllProfilesFeedbacksCount();
		
		return "success";
	}
	
	
	public void prepare() throws Exception {
		
		LOGGER.info("***inside prepare method***");
	
		
		 user = (User)SecurityContextHolder.getContext().
		 getAuthentication().getPrincipal();
	    
		 profile.setProfileOwner(user);		 
    	 profileService.findByPrimaryKey(profile,profile.getId());
    	 
		 occupation =new Occupation();
		 occupationList = occupationService.findAll(occupation);
		
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
		 
		 salaryType=new SalaryType();
		 salaryTypeList=salaryTypeService.findAll(salaryType);
		
		 
		 days = new Days();
		 daysList= daysService.findAll(days);
		
		 friendtype = new ContactTypes();
		 contactTypesList = employeeContactTypesService.findAll(friendtype);	
		
		 contacts = contactEmployeeService.findListContacts(profile.getProfileOwner().getId());
		 profile.setNoOfContacts(contacts.size());
		 LOGGER.info("contacts size:---"+profile.getNoOfContacts());
		 
		 /*itemsList = itemService.findItems(user.getId());
		 itemcount=itemsList.size();*/
		
			
		/*friendtype = new ContactTypes();
		contactTypesList = employeeContactTypesService.findAll(friendtype);
		*/
		
		industry = new Industry();
		industryList = industryService.findAll(industry);

		skillsCategory = new SkillsCategory();
		skillsCategoryList = skillsCategoryService.findAll(skillsCategory);
		 
	}
	
	
	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public ItemService getItemService() {
		return itemService;
	}

	public void setItemService(ItemService itemService) {
		this.itemService = itemService;
	}

	public List getItemsList() {
		return itemsList;
	}

	public void setItemsList(List itemsList) {
		this.itemsList = itemsList;
	}

	public int getItemcount() {
		return itemcount;
	}

	public void setItemcount(int itemcount) {
		this.itemcount = itemcount;
	}	

	public BaseService<ContactTypes> getEmployeeContactTypesService() {
		return employeeContactTypesService;
	}

	public void setEmployeeContactTypesService(
			BaseService<ContactTypes> employeeContactTypesService) {
		this.employeeContactTypesService = employeeContactTypesService;
	}

	public Contact getContact() {
		return contact;
	}

	public void setContact(Contact contact) {
		this.contact = contact;
	}

	public ContactTypes getFriendtype() {
		return friendtype;
	}

	public void setFriendtype(ContactTypes friendtype) {
		this.friendtype = friendtype;
	}

	public List getContactTypesList() {
		return contactTypesList;
	}

	public void setContactTypesList(List contactTypesList) {
		this.contactTypesList = contactTypesList;
	}

	public List<Contact> getContacts() {
		return contacts;
	}

	public void setContacts(List<Contact> contacts) {
		this.contacts = contacts;
	}

	public Profile getProfile() {
		
		return profile;
	}

	public void setProfile(Profile profile) {
		
		this.profile = profile;
	}

	public void setProfileService(BaseService<Profile> profileService) {
		this.profileService = profileService;
	}

	public WorkExperience getWorkExperience() {
		return workExperience;
	}

	public void setWorkExperience(WorkExperience workExperience) {
		this.workExperience = workExperience;
	}

	public BaseService<Profile> getProfileService() {
		return profileService;
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

	public Occupation getOccupation() {
		return occupation;
	}

	public void setOccupation(Occupation occupation) {
		this.occupation = occupation;
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

	public Skills getSkills() {
		return skills;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
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

	public void setJobCategoryService(BaseService<JobCategory> jobCategoryService) {
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

	public List<WorkExperience> getWorkExperienceList() {
		return workExperienceList;
	}

	public void setWorkExperienceList(List<WorkExperience> workExperienceList) {
		this.workExperienceList = workExperienceList;
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

	

	public List<Education> getEducationList() {
		return educationList;
	}

	public void setEducationList(List<Education> educationList) {
		this.educationList = educationList;
	}	

	public List<Training> getTrainingList() {
		return trainingList;
	}

	public void setTrainingList(List<Training> trainingList) {
		this.trainingList = trainingList;
	}

	public SkillsDetails getUserSkillsDetails() {
		return userSkillsDetails;
	}

	public void setUserSkillsDetails(SkillsDetails userSkillsDetails) {
		this.userSkillsDetails = userSkillsDetails;
	}

	

	public List getUserSkillsDetailsList() {
		return userSkillsDetailsList;
	}

	public void setUserSkillsDetailsList(List userSkillsDetailsList) {
		this.userSkillsDetailsList = userSkillsDetailsList;
	}


	public List getCheckBoxList()
	{
		
		
		String[] temp = profile.getWorkTimeframe().split(",");
		String[] checkBoxSets = new String[temp.length];
		
		for(int i=0;i<checkBoxSets.length;i++){
			
			checkBoxSets[i] = temp[i].trim().replace("","");
			checkBoxList.add(checkBoxSets[i]);
		  
		}
		return  checkBoxList;
	}

	public void setCheckBoxList(List checkBoxList) {
		this.checkBoxList = checkBoxList;
	}	

	

	public List getCkBoxList() {
		
		String[] temp = profile.getDays().split(",");
		String[] checkBoxSets = new String[temp.length];
		
		for(int i=0;i<checkBoxSets.length;i++){
			
			checkBoxSets[i] = temp[i].trim();
			ckBoxList.add(checkBoxSets[i]);
		    	}
		return ckBoxList;
	}

	public void setCkBoxList(List ckBoxList) {
		this.ckBoxList = ckBoxList;
	}

	public Days getDays() {
		return days;
	}

	public void setDays(Days days) {
		this.days = days;
	}

	public List getDaysList() {
		return daysList;
	}

	public void setDaysList(List daysList) {
		this.daysList = daysList;
	}

	public BaseService<Days> getDaysService() {
		return daysService;
	}

	public void setDaysService(BaseService<Days> daysService) {
		this.daysService = daysService;
	}

	public ProfileSession getProfileSession() {
		return profileSession;
	}

	public void setProfileSession(ProfileSession profileSession) {
		this.profileSession = profileSession;
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

	public Feedback getFeedback() {
		return feedback;
	}

	public void setFeedback(Feedback feedback) {
		this.feedback = feedback;
	}

	

	public int getPossitiveSize() {
		return possitiveSize;
	}

	public void setPossitiveSize(int possitiveSize) {
		this.possitiveSize = possitiveSize;
	}

	

	public FeedbackService getFeedbackService() {
		return feedbackService;
	}

	public void setFeedbackService(FeedbackService feedbackService) {
		this.feedbackService = feedbackService;
	}

	public EmployeeProfileService getWorkExperienceService() {
		return workExperienceService;
	}

	public void setWorkExperienceService(
			EmployeeProfileService workExperienceService) {
		this.workExperienceService = workExperienceService;
	}

	public EmployeeProfileService getEducationService() {
		return educationService;
	}

	public void setEducationService(EmployeeProfileService educationService) {
		this.educationService = educationService;
	}

	public EmployeeProfileService getTrainingService() {
		return trainingService;
	}

	public void setTrainingService(EmployeeProfileService trainingService) {
		this.trainingService = trainingService;
	}

	public EmployeeProfileService getUserSkillsDetailsService() {
		return userSkillsDetailsService;
	}

	public void setUserSkillsDetailsService(
			EmployeeProfileService userSkillsDetailsService) {
		this.userSkillsDetailsService = userSkillsDetailsService;
	}

	public ContactEmployeeService getContactEmployeeService() {
		return contactEmployeeService;
	}

	public void setContactEmployeeService(
			ContactEmployeeService contactEmployeeService) {
		this.contactEmployeeService = contactEmployeeService;
	}

	public EmployeeProfileService getEmployeeProfileService() {
		return employeeProfileService;
	}

	public void setEmployeeProfileService(
			EmployeeProfileService employeeProfileService) {
		this.employeeProfileService = employeeProfileService;
	}

	public BaseService<WorkExperience> getBaseWorkExperienceService() {
		return baseWorkExperienceService;
	}

	public void setBaseWorkExperienceService(
			BaseService<WorkExperience> baseWorkExperienceService) {
		this.baseWorkExperienceService = baseWorkExperienceService;
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


	public int getAllProfilesFeedbackCount() {
		return allProfilesFeedbackCount;
	}


	public void setAllProfilesFeedbackCount(int allProfilesFeedbackCount) {
		this.allProfilesFeedbackCount = allProfilesFeedbackCount;
	}

	public void setSession(Map session) {
		this.session = session;
	}


	public Map getSession() {
		return session;
	}


	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getResizedMinImage() {
		return resizedMinImage;
	}


	public void setResizedMinImage(String resizedMinImage) {
		this.resizedMinImage = resizedMinImage;
	}


	public String getResizedMidImage() {
		return resizedMidImage;
	}


	public void setResizedMidImage(String resizedMidImage) {
		this.resizedMidImage = resizedMidImage;
	}


	public PhysicalTraits getPhysicalTraits() {
		return physicalTraits;
	}


	public void setPhysicalTraits(PhysicalTraits physicalTraits) {
		this.physicalTraits = physicalTraits;
	}


	public EmployeeProfileService getUserPhysicalTraits() {
		return userPhysicalTraits;
	}


	public void setUserPhysicalTraits(EmployeeProfileService userPhysicalTraits) {
		this.userPhysicalTraits = userPhysicalTraits;
	}


	public List getPhysicalTraitsList() {
		return physicalTraitsList;
	}


	public void setPhysicalTraitsList(List physicalTraitsList) {
		this.physicalTraitsList = physicalTraitsList;
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


	public String getBreastcupsize() {
		return breastcupsize;
	}


	public void setBreastcupsize(String breastcupsize) {
		this.breastcupsize = breastcupsize;
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


	public String getResizedMidPicture() {
		return resizedMidPicture;
	}


	public void setResizedMidPicture(String resizedMidPicture) {
		this.resizedMidPicture = resizedMidPicture;
	}


	public String getResizedMinPicture() {
		return resizedMinPicture;
	}


	public void setResizedMinPicture(String resizedMinPicture) {
		this.resizedMinPicture = resizedMinPicture;
	}


	public Contact getContactOwner() {
		return contactOwner;
	}


	public void setContactOwner(Contact contactOwner) {
		this.contactOwner = contactOwner;
	}


	public Education getEducationMinor() {
		return educationMinor;
	}


	public void setEducationMinor(Education educationMinor) {
		this.educationMinor = educationMinor;
	}


	public String getMajor() {
		return major;
	}


	public void setMajor(String major) {
		this.major = major;
	}


	public String getMinor() {
		return minor;
	}


	public void setMinor(String minor) {
		this.minor = minor;
	}





	

	

	
}
