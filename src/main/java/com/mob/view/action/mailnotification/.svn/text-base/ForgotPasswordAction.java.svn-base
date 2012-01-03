package com.mob.view.action.mailnotification;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

import javax.mail.MessagingException;

import sun.misc.BASE64Encoder;

import com.mob.model.User;
import com.mob.services.BaseService;
import com.mob.services.EmployerAccountService;
import com.mob.services.MessagingService;
import com.mob.util.MOBLogger;
import com.opensymphony.xwork2.ActionSupport;


public class ForgotPasswordAction extends ActionSupport {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(ForgotPasswordAction.class);
	private static final long serialVersionUID = 1L;
	private User user=new User();

	private EmployerAccountService employerAccountService;
	private MessagingService msgingService;
    private BaseService<User> userBaseService;

	public String retrievePassword() {
		LOGGER.info("Inside retrievePassword");
        String genPassword = null;
		genPassword = generatePassword(user);

		user = employerAccountService.findByUserName(user, user.getEmail());
		String useremail= user.getUsername();
		try {
			String passwordMsg ="Your password is "+genPassword;
			msgingService.sendEmail("admin@myownbriefcase.com",new String[]{useremail}, "Password Notification",passwordMsg);
            user.setPassword(encrypt(genPassword));
            userBaseService.update(user);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		//sendPassword(user.getPassword(), user.getEmail());
		return "success";
	}

	public MessagingService getMsgingService() {
		return msgingService;
	}

	public void sendPassword(String Password, String Email) {
		LOGGER.info("Inside sendPassword");
		MailPassword mailpwd = new MailPassword();
		try {
			mailpwd.sendMail("Password Notification", Password,
					"suresh.venkat12@gmail.com", Email);
		} catch (Exception e) {
			e.printStackTrace();
		}
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
    /**
     * Method to generate a unique random number for setting a temporary password
     *
     * @param user
     * @return
     */
    public String generatePassword(User user) {
        String genPassword = null;
        Random rand = new Random();
        String userName = user.getUsername().substring(0, 5);
        genPassword =  rand.nextInt(9) + userName + rand.nextInt(100);
        return genPassword;
    }

	public void setMsgingService(MessagingService msgingService) {
		this.msgingService = msgingService;
	}


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

    public BaseService<User> getUserBaseService() {
        return userBaseService;
    }

    public void setUserBaseService(BaseService<User> userBaseService) {
        this.userBaseService = userBaseService;
    }
    
	public EmployerAccountService getEmployerAccountService() {
		return employerAccountService;
	}

	public void setEmployerAccountService(
			EmployerAccountService employerAccountService) {
		this.employerAccountService = employerAccountService;
	}

}
