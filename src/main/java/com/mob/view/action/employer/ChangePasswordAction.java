 package com.mob.view.action.employer;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.acegisecurity.context.SecurityContextHolder;

import sun.misc.BASE64Encoder;

import com.mob.model.employer.Employer;
import com.mob.services.EmployerService;
import com.opensymphony.xwork2.ActionSupport;

public class ChangePasswordAction extends ActionSupport{

	private String oldPassword;
	private String newPassword;

	private Employer employer;

	private EmployerService employerService;

	private String result;

	public String checkEmplrPassword() {
		employer = (Employer) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();

		if (encrypt(oldPassword).equals(employer.getPassword())) {
			employerService.updateEmployerPassword(employer, encrypt(newPassword));
			result="success";
		} else {
			result="failure";
		}
		return result;
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

	public String getOldPassword() {
		return oldPassword;
	}


	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}


	public String getNewPassword() {
		return newPassword;
	}


	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
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

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

}
