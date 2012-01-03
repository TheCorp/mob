package com.mob.view.action.admin;

import java.util.ArrayList;
import java.util.List;

import org.acegisecurity.context.SecurityContextHolder;

import com.mob.model.ContactTypes;
import com.mob.model.User;
import com.mob.model.help.Help;
import com.mob.services.BaseService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.Preparable;

public class AddAdminHelpAction extends ActionSupport {
	
	private Help help;
	private BaseService<Help> baseServiceHelp; 
	private List<Help> listOfHelpConntent =new ArrayList<Help>();
	
	public void setBaseServiceHelp(BaseService<Help> baseServiceHelp) {
		this.baseServiceHelp = baseServiceHelp;
	}


	public String storeHelpInformation(){
		
		baseServiceHelp.create(help);
		return "success";
	}

	public String updateHelpInformation(){
		
		Help existingHelp=baseServiceHelp.findByPrimaryKey(help, help.getId());
		if(existingHelp!=null){
			
			existingHelp.setPageName(help.getPageName());
		    existingHelp.setValue(help.getValue());
		    baseServiceHelp.update(existingHelp);
	     }
		return "success";
	}
	
    
	 public String getListOfHelpConetent() {
		 Help help=new Help();
		 listOfHelpConntent=baseServiceHelp.findAll(help);
		 
		 return "success";
	 }

	public Help getHelp() {
		return help;
	}


	public void setHelp(Help help) {
		this.help = help;
	}


	public List<Help> getListOfHelpConntent() {
		return listOfHelpConntent;
	}


	public void setListOfHelpConntent(List<Help> listOfHelpConntent) {
		this.listOfHelpConntent = listOfHelpConntent;
	}

}
