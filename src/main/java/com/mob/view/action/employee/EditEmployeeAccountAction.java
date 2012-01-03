package com.mob.view.action.employee;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

import org.acegisecurity.context.SecurityContextHolder;

import sun.misc.BASE64Encoder;

import com.mob.model.User;
import com.mob.services.BaseService;
import com.mob.services.EmployeeService;
import com.mob.util.MOBLogger;

public class EditEmployeeAccountAction {
	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER =
		new MOBLogger(EditEmployeeAccountAction.class);

	private User user;
	private BaseService<User> userBaseService;
	private EmployeeService employeeService;
	private String firstName;
	private String lastName;
	private String email;
	private Date birthday;
	private String oldPassword;
	private String newPassword;
	private String result;
	private String gender;
	private String phoneNumber;
	private String city;

	public String editAccount() {
		LOGGER.info("Inside editAccount");
		LOGGER.info("first name:"+firstName);
		LOGGER.info("gender:"+gender);
		user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();
		user.setFirstName(firstName);
		user.setLastName(lastName);
		user.setDob(birthday);
		user.setPhoneNumber(phoneNumber);
		user.setCity(city);
		
//		int age = ageCalculator(user);
//		user.setAge(age);
		user.setEmail(email);
		if(!(newPassword.equals(""))){
			user.setPassword(encrypt(newPassword));
			userBaseService.update(user);	
		}else{
			employeeService.updateEmployeeAccount(user);	
		}

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

	public String checkExistingPassword(){
		LOGGER.info("Inside checkExistingPassword");
		user = (User) SecurityContextHolder.getContext()
		.getAuthentication().getPrincipal();

		if(encrypt(oldPassword).equals(user.getPassword())){
			LOGGER.info("oldpassword is existing password");
			result="success";
		}
		else{
			LOGGER.info("oldpassword is not existing password");	
			result="failure";
		}
		return result;
	}



	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getResult() {
		return result;
	}

	public void setResult(String result) {
		this.result = result;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
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

	public int ageCalculator(User user) {
		String[] daysOfWeek ={"Sun","Mon","Tue","Wed","Thu","Fri","Sat"};
		String[] months={"Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"};
//		System.out.println(user.getDob());
		String temp = user.getDob().toString();
		Calendar gDob;
		int age = 0;
		int day =0;
		int month=0;
		int year=0;
		int date=0;
		Calendar gToday=new GregorianCalendar();
//		System.out.println("today is :"+gToday.get(GregorianCalendar.YEAR)+","+gToday.get(GregorianCalendar.DAY_OF_WEEK)+","+gToday.get(GregorianCalendar.MONTH)+","+gToday.get(GregorianCalendar.DATE)
//				+","+gToday.get(GregorianCalendar.DAY_OF_MONTH));
		String strDay = temp.substring(0, 3);
//		System.out.println("day "+strDay);
		String strMonth = temp.substring(3,7).trim();
//		System.out.println("month "+strMonth);
		String strDate = temp.substring(7, 10).trim();
//		System.out.println("date "+strDate);
		int index = temp.lastIndexOf("T") + 1;
		String strYear = temp.substring(index).trim();
//		System.out.println("year "+strYear);
		for(int i = 0;i<daysOfWeek.length;i++){
			if(daysOfWeek[i].equalsIgnoreCase(strDay)){
//				System.out.println("day is:"+i);
				day=i;
			}
		}//end of for loon for getting  index of day of the week

		for(int j=0;j<months.length;j++){
			if(months[j].equalsIgnoreCase(strMonth)){
//				System.out.println("month is:"+j);
				month=j;
			}
		}//end of for loon for getting  index of month
		try {
			year = Integer.parseInt(strYear);
			date = Integer.parseInt(strDate);// day of month
			gDob = new GregorianCalendar(year, month, date);

			age = gToday.get(GregorianCalendar.YEAR)
			- gDob.get(GregorianCalendar.YEAR);
//			System.out.println("age" + age);
			gToday
			.set(GregorianCalendar.YEAR, gDob
					.get(GregorianCalendar.YEAR));
			if (gDob.after(gToday)) {
//				System.out.println("inside condition");
				age--;
			}

//			System.out.println("age is:" + age);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}

		return age;
	}


	public EmployeeService getEmployeeService() {
		return employeeService;
	}

	public void setEmployeeService(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}
}
