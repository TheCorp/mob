package com.mob.view.action.employer;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.employer.Employer;
import com.mob.services.EmployerService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class EditEmployerAccountAction extends ActionSupport implements Preparable{
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EditEmployerAccountAction.class);

	private Employer employer;
	/*private String address;
	private String city;
	private String state;
	private String zipcode;
	private String email;*/
	private EmployerService employerService;

	public String editAccount() {
		try {
			LOGGER.info("Edit Employer Account :");
			LOGGER.info("employer id:"+employer.getId());
			employerService.updateEmployerAccount(employer);
			return "success";
		} catch (Exception e) {
			return "error";
		}
	}

	public Employer getEmployer() {
		return employer;
	}

	public void setEmployer(Employer employer) {
		this.employer = employer;
	}

	public EmployerService getEmployerService() {
		return employerService;
	}

	public void setEmployerService(EmployerService employerService) {
		this.employerService = employerService;
	}

	public void prepare() throws Exception {
		// TODO Auto-generated method stub
		LOGGER.info("prepare");
		try {
			 employer = (Employer) SecurityContextHolder.getContext()
			.getAuthentication().getPrincipal();
			LOGGER.info("employer id is:" + employer.getId());
			employer = employerService.findByEmployerPrimaryKey(employer,
					employer.getId());
			LOGGER.info("after findByPrimaryKey() in load account");
		} catch (Exception e) {
			e.printStackTrace();
		}


	}

	

	
}
