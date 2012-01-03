package com.mob.view.action.employee;

import java.util.ArrayList;
import java.util.List;




import com.mob.model.profile.Industry;
import com.mob.services.BaseService;
import com.mob.services.ProfileService;
import com.opensymphony.xwork2.ActionSupport;

public class signUPAction  extends ActionSupport{

	private static final long serialVersionUID = 1L;
	private List<String> states;
    private String accountType;
    private List<String> myList;
    private ProfileService pService;
    private Industry industry;
    private List industryList = new ArrayList();
    private BaseService<Industry> industryService;
	public String getStatesList(){
		getaccountList();
		states =new ArrayList<String>();
		states=pService.listStates();
	   /* states.add("Alabama");
	    states.add("Alaska");
	    states.add("Arizona");
	    states.add("California");
	    states.add("Colorado");
	    states.add("Connecticut");
	    states.add("Delaware");
	    states.add("Florida");
	    states.add("Georgia");
	    states.add("Hawaii");
	    states.add("Idaho");
	    states.add("Illinois");
	    states.add("Indiana");
	    states.add("Iowa");
	    states.add("Kansas");
	    states.add("Kentucky");
	    states.add("Louisiana");
	    states.add("Maine");
	    states.add("Maryland");
	    states.add("Massachusetts");
	    states.add("Michigan");
	    states.add("Minnesota");
	    states.add("Mississippi");
	    states.add("Missouri");
	    states.add("Montana");
	    states.add("Nebraska");
	    states.add("Nevada");
	    states.add("New Hampshire");
	    states.add("New Jersey");
	    states.add("New Mexico");
	    states.add("New York");
	    states.add("North Carolina");
	    states.add("North Dakota");
	    states.add("Ohio");
	    states.add("Oklahoma");
	    states.add("Oregon");
	    states.add("Pennsylvania");
	    states.add("Rhode Island");
	    states.add("South Carolina");
	    states.add("South Dakota");
	    states.add("Tennessee");
	    states.add("Texas");
	    states.add("Utah");
	    states.add("Vermont");
	    states.add("Virginia");
	    states.add("Washington");
	    states.add("West Virginia");
	    states.add("Wisconsin");
	    states.add("Wyoming");   */
		    /*states.add("AL");
		    states.add("AK");
		    states.add("AZ");
		    states.add("AR");
		    
		    states.add("CA");
		    states.add("CO");
		    states.add("CT");
		    states.add("DE");
		    states.add("FL");
		    
		    states.add("GA");
		    states.add("HI");
		    states.add("ID");
		    states.add("IL");
		    states.add("IN");
		    
		    states.add("IA");
		    states.add("KS");
		    states.add("KY");
		    states.add("LA");
		    
		    states.add("ME");
		    states.add("MD");
		    states.add("MA");
		    states.add("MI");
		    states.add("MN");
		    states.add("MS");
		    states.add("MO");
		    states.add("MT");
		    states.add("NE");
		    states.add("NV");
		  
		  
		    states.add("NH");
		    states.add("MD");
		    
		    states.add("NM");
		    states.add("NY");
		    states.add("NC");
		    states.add("ND");
		    states.add("OH");
		    states.add("OK");
		    states.add("OR");
		    states.add("PA");
		    states.add("RI");
		    states.add("SC");
		    states.add("SD");
		    states.add("TN");
		    states.add("TX");
		    states.add("UT");
		    states.add("VT");
		    states.add("VA");
		    states.add("WA");
		    states.add("WV");
		    states.add("WI");
		    states.add("WY");*/
		
		   industry = new Industry();
	        industryList = industryService.findAll(industry);
		 
	  return "success";
	}
  public String getaccountList(){
		
	  myList =new ArrayList<String>();
	  myList.add("Employee");
	  myList.add("Employer");
		return "success";
  }

	public List<String> getStates() {
		return states;
	}
	public List<String> getaccounts() {
		return myList;
	}
	public String getAccountType() {
		return accountType;
	}

	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	public void setPService(ProfileService service) {
		pService = service;
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

	
	

}
