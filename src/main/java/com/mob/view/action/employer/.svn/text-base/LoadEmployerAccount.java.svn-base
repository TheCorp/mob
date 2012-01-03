package com.mob.view.action.employer;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.employer.Employer;
import com.mob.services.EmployerService;
import com.mob.util.MOBLogger;

public class LoadEmployerAccount {
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(LoadEmployerAccount.class);

	private Employer employer;

	private EmployerService employerService;

	public String loadAccount() {
		try {
			LOGGER.info("Inside loadAccount");
			Employer employer1 = (Employer) SecurityContextHolder.getContext()
					.getAuthentication().getPrincipal();
			LOGGER.info("employer id is:" + employer1.getId());
			employer = employerService.findByEmployerPrimaryKey(employer1,
					employer1.getId());
			LOGGER.info("after findByPrimaryKey() in load account");
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "success";
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

}
