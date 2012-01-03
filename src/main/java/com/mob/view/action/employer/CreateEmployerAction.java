 package com.mob.view.action.employer;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
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
import org.apache.struts2.interceptor.SessionAware;

import sun.misc.BASE64Encoder;

import com.mob.model.Role;
import com.mob.model.RoleNames;
import com.mob.model.User;
import com.mob.model.employer.Employer;
import com.mob.model.profile.EmployerProfile;
import com.mob.model.profile.Industry;
import com.mob.services.BaseService;
import com.mob.services.EmployerAccountService;
import com.mob.services.MessagingService;
import com.mob.services.UserManagement;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;

public class CreateEmployerAction extends ActionSupport implements SessionAware {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(CreateEmployerAction.class);
    private static final long serialVersionUID = 1L;
	private Employer employer;
	private UserManagement userManagement;
	private BaseService<Role> roleService;
	private String confirmPassword;
	private Map session;
	private File upload;
	private String uploadFileName; 
	private EmployerAccountService employerAccountService;
	private MessagingService msgingService;
	private EmployerProfile employerProfile;
	private User user;
	 private Industry industry;
	    private String industryName;
	    private BaseService<Industry> industryBaseService;
	 private String uploadContentType; // The content type of the file
	public String create() {
		employerProfile=new EmployerProfile();
		industry=new Industry();
		Role employerRole = new Role();
		employerRole.setName(RoleNames.ROLE_EMPLOYER.name());
		List<Role> roles = this.roleService.findByExample(employerRole);
		Set<Role> employerRoles = new HashSet<Role>();
		employerRoles.addAll(roles);
	//	employerProfile.setProfileOwner(user);
		employer.setRoles(employerRoles);
		LOGGER.info("create().......");
        employer.setPassword(encrypt(employer.getPassword()));
		this.userManagement.registerUser(employer);
		employer = (Employer) employerAccountService.findByUserName(employer, employer.getEmail());
		 try {
	            if (industryName != null || (!industryName.equalsIgnoreCase(""))) {
	                int industryId = Integer.parseInt(industryName);
	                industry = industryBaseService.findByPrimaryKey(industry, industryId);
	                employer.setIndustry(industry);
	            }
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
		
			System.out.println("notification:--"+employer.getEmail());
			try {
				String msg ="Your Account has been created";
				msgingService.sendEmail("admin@myownbriefcase.com",new String[]{employer.getEmail()}, "Registration to MyOwnBriefcase",msg);
	            
			} catch (MessagingException e) {
				e.printStackTrace();
			}
			
			 		if(this.upload != null && upload.length()>0){
/*            this.userManagement.updateUserPicture(employer,this.upload.getAbsolutePath(),
                uploadFileName);
*/            
            this.userManagement.addEmployerPicture(employer, this.upload.getAbsolutePath(),
                    uploadFileName, uploadContentType);

        }
		LOGGER.info("create().......");
		
		 UsernamePasswordAuthenticationToken auth = new UsernamePasswordAuthenticationToken(
				 employer, "employer.getPassword()",new GrantedAuthority[] {new GrantedAuthorityImpl(RoleNames.ROLE_EMPLOYER.name())});
	        
        SecurityContext context = SecurityContextHolder.getContext();
        context.setAuthentication(auth); 
        getSession().put("ACEGI_SECURITY_CONTEXT", context);
        System.out.println("Done");
	        
		return "success";
	}
    public synchronized String encrypt(String password) {
           MessageDigest messageDigest = null;
           String hash = null;
        try {
            messageDigest = MessageDigest.getInstance("SHA");
            messageDigest.update(password.getBytes("UTF-8"));
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
          catch (UnsupportedEncodingException e) {
                e.printStackTrace();
        }
           byte bytes[] = messageDigest.digest();
           hash = (new BASE64Encoder().encode(bytes));
           return hash;
    }
    
   

	public BaseService<Role> getRoleService() {
		return roleService;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public void setRoleService(BaseService<Role> roleService) {
		this.roleService = roleService;
	}

	public void setUserManagement(UserManagement userManagement) {
		this.userManagement = userManagement;
	}

	
	public Employer getEmployer() {
		LOGGER.info("getEmp of emp.r");
		return employer;
	}

	public void setEmployer(Employer employer) {
		this.employer = employer;
		LOGGER.info("setEmp of emp.r");
	}
	
	public Map getSession() {
		return session;
	}
	public void setSession(Map session) {
		this.session = session;
	}

	public void setUpload(File upload) {
		this.upload = upload;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public File getUpload() {
		return upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
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
	public EmployerProfile getEmployerProfile() {
		return employerProfile;
	}
	public void setEmployerProfile(EmployerProfile employerProfile) {
		this.employerProfile = employerProfile;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public String getUploadContentType() {
		return uploadContentType;
	}
	public void setUploadContentType(String uploadContentType) {
		this.uploadContentType = uploadContentType;
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
	
	

}
