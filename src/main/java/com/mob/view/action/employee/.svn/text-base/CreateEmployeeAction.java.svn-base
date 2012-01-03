package com.mob.view.action.employee;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.mail.MessagingException;

import org.acegisecurity.GrantedAuthority;
import org.acegisecurity.GrantedAuthorityImpl;
import org.acegisecurity.context.SecurityContext;
import org.acegisecurity.context.SecurityContextHolder;
import org.acegisecurity.providers.UsernamePasswordAuthenticationToken;
import org.acegisecurity.ui.switchuser.SwitchUserProcessingFilter;
import org.acegisecurity.userdetails.UserDetails;
import org.acegisecurity.userdetails.UserDetailsService;
import org.acegisecurity.userdetails.UsernameNotFoundException;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.dao.DataAccessException;

import sun.misc.BASE64Encoder;

import com.mob.model.Role;
import com.mob.model.RoleNames;
import com.mob.model.User;
import com.mob.model.profile.Days;
import com.mob.model.profile.EducationDetails;
import com.mob.model.profile.JobCategory;
import com.mob.model.profile.JobType;
import com.mob.model.profile.Occupation;
import com.mob.model.profile.Profile;
import com.mob.model.profile.Salary;
import com.mob.model.profile.SalaryType;
import com.mob.model.profile.Skills;
import com.mob.model.profile.WorkTimeframe;
import com.mob.services.BaseService;
import com.mob.services.EmployerAccountService;
import com.mob.services.MessagingService;
import com.mob.services.UserManagement;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.Action;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class CreateEmployeeAction extends ActionSupport implements Preparable,
		SessionAware {
	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER = new MOBLogger(
			CreateEmployeeAction.class);
	private static final long serialVersionUID = 1L;
	private User user;
	private UserManagement userManagement;
	private BaseService<Role> roleService;

	private Occupation occupation;
	private Skills skills;
	private WorkTimeframe workTimeframe;
	private EducationDetails educationDetails;
	private JobType jobType;
	private JobCategory jobcategory;
	private Salary salary;
	private Profile profile;

	private BaseService<Salary> salaryService;
	private List salaryList;

	private SalaryType salaryType;
	private BaseService<SalaryType> salaryTypeService;
	private List salaryTypeList;

	private BaseService<Occupation> occupationService;
	private List occupationList;

	private BaseService<Skills> skilsService;
	private List skillsList;

	private BaseService<WorkTimeframe> workTimeFrameService;
	private List workTimeFrameList;

	private BaseService<EducationDetails> educationDetailsService;
	private List educationDetailsList;

	private BaseService<JobType> jobTypeService;
	private List jobTypeList;

	private BaseService<JobCategory> jobCategoryService;
	private List jobCateoryList;
	private List<WorkTimeframe> workTimeframeList2;

	private Days days;
	private List daysList = new ArrayList();
	private BaseService<Days> daysService;

	private List checkBoxList = new ArrayList();
	private List ckBoxList = new ArrayList();
	// private int age;
	private long year;

	private File upload;// The actual file
	private String uploadContentType; // The content type of the file
	private String uploadFileName; // The uploaded file name
	private String fileCaption;// The caption of the file entered by user

	private String picture;
	private Date privacyGroupCreatedDate;
	private Map session;

	private EmployerAccountService employerAccountService;
	private MessagingService msgingService;
	private String  dobCheckbox;
	
	//private boolean  dobCheckbox;

	public String create() {
		LOGGER.info("Inside create");

		try {
			Role employeeRole = new Role();
			employeeRole.setName(RoleNames.ROLE_EMPLOYEE.name());
			List<Role> roles = this.roleService.findByExample(employeeRole);
			Set<Role> userRoles = new HashSet<Role>();
			userRoles.addAll(roles);
			user.setRoles(userRoles);
			
			// user.setAge(ageCalculator(user));
			user.setPassword(encrypt(user.getPassword()));
			System.out.println("dobCheckbox" +dobCheckbox);
			//if(dobCheckbox.equals("true")){
				//user.setCheckDOBYR(true);
		//	}else{
				//user.setCheckDOBYR(false);
		//	}
			this.userManagement.registerUser(user);

			user = employerAccountService.findByUserName(user, user.getEmail());

			try {
				String msg = "Your Account has been created";
				msgingService.sendEmail("admin@myownbriefcase.com",
						new String[] { user.getEmail() },
						"Registration to MyOwnBriefcase", msg);

			} catch (MessagingException e) {
				e.printStackTrace();
			}
			if(this.upload != null && upload.length()>0){
	            this.userManagement.updateUserPicture(user,this.upload.getAbsolutePath(),
	                uploadFileName);
	        }

			// log newUser in automatically

			UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(
					user, "user.getPassword()",
					new GrantedAuthority[] { new GrantedAuthorityImpl(
							RoleNames.ROLE_EMPLOYEE.name()) });

			System.out.println("Setting auth details");
			SecurityContext context = SecurityContextHolder.getContext();
			context.setAuthentication(auth);
			System.out.println("auth" + auth.getClass());
			getSession().put("ACEGI_SECURITY_CONTEXT", context);

			/*
			 * SwitchUserProcessingFilter filter = new
			 * SwitchUserProcessingFilter(); filter.setUserDetailsService(new
			 * MockAuthenticationDaoUserJackLord());
			 */
			System.out.println("Done");
		} catch (Exception e) {
			e.printStackTrace();
			return "error";
		}
		return Action.SUCCESS;
	}

	public synchronized String encrypt(String password) {
		MessageDigest messageDigest = null;
		String hash = null;
		try {
			messageDigest = MessageDigest.getInstance("SHA");
			messageDigest.update(password.getBytes("UTF-8"));
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		byte bytes[] = messageDigest.digest();
		hash = (new BASE64Encoder().encode(bytes));
		return hash;
	}

	public void prepare() throws Exception {
		LOGGER.info("in prepare method of createEmployeeAction");

		workTimeframe = new WorkTimeframe();
		workTimeFrameList = workTimeFrameService.findAll(workTimeframe);

		jobcategory = new JobCategory();
		jobCateoryList = jobCategoryService.findAll(jobcategory);

		salary = new Salary();
		salaryList = salaryService.findAll(salary);

		salaryType = new SalaryType();
		salaryTypeList = salaryTypeService.findAll(salaryType);
		LOGGER.info("salary type list" + salaryTypeList.size());

		workTimeframeList2 = workTimeFrameService.findAll(workTimeframe);

		days = new Days();
		daysList = daysService.findAll(days);

	}

	public List getCheckBoxList() {

		LOGGER.info("Inside getCheckBoxList");
		String[] temp = profile.getWorkTimeframe().split(",");
		String[] checkBoxSets = new String[temp.length];

		for (int i = 0; i < checkBoxSets.length; i++) {

			checkBoxSets[i] = temp[i].trim().replace("", "");
			checkBoxList.add(checkBoxSets[i]);

		}
		return checkBoxList;
	}

	public void setCheckBoxList(List checkBoxList) {
		this.checkBoxList = checkBoxList;
	}

	public List getCkBoxList() {
		LOGGER.info("Inside getCkBoxList");
		String[] temp = profile.getDays().split(",");
		String[] checkBoxSets = new String[temp.length];

		for (int i = 0; i < checkBoxSets.length; i++) {

			checkBoxSets[i] = temp[i].trim();
			ckBoxList.add(checkBoxSets[i]);
		}
		return ckBoxList;
	}

	public void setCkBoxList(List ckBoxList) {
		this.ckBoxList = ckBoxList;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setUserManagement(UserManagement userManagement) {
		this.userManagement = userManagement;
	}

	public BaseService<Role> getRoleService() {
		return roleService;
	}

	public void setRoleService(BaseService<Role> roleService) {
		this.roleService = roleService;
	}

	public Occupation getOccupation() {
		return occupation;
	}

	public void setOccupation(Occupation occupation) {
		this.occupation = occupation;
	}

	public Skills getSkills() {
		return skills;
	}

	public void setSkills(Skills skills) {
		this.skills = skills;
	}

	public WorkTimeframe getWorkTimeframe() {
		return workTimeframe;
	}

	public void setWorkTimeframe(WorkTimeframe workTimeframe) {
		this.workTimeframe = workTimeframe;
	}

	public EducationDetails getEducationDetails() {
		return educationDetails;
	}

	public void setEducationDetails(EducationDetails educationDetails) {
		this.educationDetails = educationDetails;
	}

	public JobType getJobType() {
		return jobType;
	}

	public void setJobType(JobType jobType) {
		this.jobType = jobType;
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

	public BaseService<EducationDetails> getEducationDetailsService() {
		return educationDetailsService;
	}

	public void setEducationDetailsService(
			BaseService<EducationDetails> educationDetailsService) {
		this.educationDetailsService = educationDetailsService;
	}

	public List getEducationDetailsList() {
		return educationDetailsList;
	}

	public void setEducationDetailsList(List educationDetailsList) {
		this.educationDetailsList = educationDetailsList;
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

	public List<WorkTimeframe> getWorkTimeframeList2() {
		return workTimeframeList2;
	}

	public void setWorkTimeframeList2(List<WorkTimeframe> workTimeframeList2) {
		this.workTimeframeList2 = workTimeframeList2;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
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

	public int ageCalculator(User user) {

		/*
		 * String temp = user.getDob().toString(); System.out.println("year : " +
		 * user.getDob()); int index = temp.lastIndexOf("T") + 1; String strAge =
		 * temp.substring(index).trim(); LOGGER.info("year : " + strAge); year =
		 * Integer.parseInt(strAge); Calendar cd = Calendar.getInstance(); long
		 * yr = cd.get(Calendar.YEAR); int age = (int) ((int) yr - year);
		 * LOGGER.info("age is :" + age); //user.setAge(age); return age;
		 */

		String[] daysOfWeek = { "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" };
		String[] months = { "Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul",
				"Aug", "Sep", "Oct", "Nov", "Dec" };
		System.out.println(user.getDob());
		String temp = user.getDob().toString();
		Calendar gDob;
		int age = 0;
		int day = 0;
		int month = 0;
		int year = 0;
		int date = 0;
		Calendar gToday = new GregorianCalendar();
		System.out.println("today is :" + gToday.get(GregorianCalendar.YEAR)
				+ "," + gToday.get(GregorianCalendar.DAY_OF_WEEK) + ","
				+ gToday.get(GregorianCalendar.MONTH) + ","
				+ gToday.get(GregorianCalendar.DATE) + ","
				+ gToday.get(GregorianCalendar.DAY_OF_MONTH));
		String strDay = temp.substring(0, 3);
		System.out.println("day " + strDay);
		String strMonth = temp.substring(3, 7).trim();
		System.out.println("month " + strMonth);
		String strDate = temp.substring(7, 10).trim();
		System.out.println("date " + strDate);
		int index = temp.lastIndexOf("T") + 1;
		String strYear = temp.substring(index).trim();
		System.out.println("year " + strYear);
		for (int i = 0; i < daysOfWeek.length; i++) {
			if (daysOfWeek[i].equalsIgnoreCase(strDay)) {
				System.out.println("day is:" + i);
				day = i;
			}
		}// end of for loon for getting index of day of the week

		for (int j = 0; j < months.length; j++) {
			if (months[j].equalsIgnoreCase(strMonth)) {
				System.out.println("month is:" + j);
				month = j;
			}
		}// end of for loon for getting index of month
		try {
			year = Integer.parseInt(strYear);
			date = Integer.parseInt(strDate);
			gDob = new GregorianCalendar(year, month, date);

			age = gToday.get(GregorianCalendar.YEAR)
					- gDob.get(GregorianCalendar.YEAR);
			System.out.println("age" + age);
			gToday
					.set(GregorianCalendar.YEAR, gDob
							.get(GregorianCalendar.YEAR));
			if (gDob.after(gToday)) {
				System.out.println("inside condition");
				age--;
			}

			System.out.println("age is:" + age);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		return age;
	}

	public long getYear() {
		return year;
	}

	public void setYear(long year) {
		this.year = year;
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

	public UserManagement getUserManagement() {
		return userManagement;
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

	public Date getPrivacyGroupCreatedDate() {
		return privacyGroupCreatedDate;
	}

	public void setPrivacyGroupCreatedDate(Date privacyGroupCreatedDate) {
		this.privacyGroupCreatedDate = privacyGroupCreatedDate;
	}

	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

	private class MockAuthenticationDaoUserJackLord implements
			UserDetailsService {
		// private String password = "hawaii50";

		public UserDetails loadUserByUsername(String email)
				throws UsernameNotFoundException, DataAccessException {

			return user;
		}
	}

	public EmployerAccountService getEmployerAccountService() {
		return employerAccountService;
	}

	public void setEmployerAccountService(
			EmployerAccountService employerAccountService) {
		this.employerAccountService = employerAccountService;
	}

	public MessagingService getMsgingService() {
		return msgingService;
	}

	public void setMsgingService(MessagingService msgingService) {
		this.msgingService = msgingService;
	}

	public String getDobCheckbox() {
		return dobCheckbox;
	}

	public void setDobCheckbox(String dobCheckbox) {
		this.dobCheckbox = dobCheckbox;
	}


	
}
