package com.mob.util;

import com.mob.model.profile.Item;

public class EmployerBriefCaseItems extends BriefCaseItems{
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EmployerBriefCaseItems.class);

	
	public Object getLinks()
	{ 
		LOGGER.info("Inside getLinks");		
		Item item= (Item) getCurrentRowObject();		
	     StringBuffer retString = new StringBuffer();
	
	     retString.append("<div class='bc_tbl2_actions' style='display:block;' id='actionId"+item.getId()+"' >");
	    // retString.append("<a href=''><img src='../styles/default/images/mobc_prof_action_btn-write.gif'/></a>");
	    // retString.append("<a href=''><img src='../styles/default/images/mobc_prof_action_btn-envelope.gif'/></a>");
	     retString.append("<img src='../styles/default/images/mobc_prof_action_btn-writep.png' alt='Edit'onclick=\"editEmprBreifcaseListItems("+item.getId()+")\" />");
	     retString.append("<a href='#' onclick=\"return pop_up(event,"+item.getId()+",'"+item.getName()+"','briefcaseName','confirm_delete',[20,20,'negoffset_mouse'])\"><img src='../styles/default/images/mobc_prof_action_btn-redx.gif' alt='Remove' /></a>");
	     retString.append("</div>");
	  
	     
	     
	     retString.append("<div id='actionId1"+item.getId()+"' style='display:none' class='bc_tbl2_actions2' >");
	     retString.append("<input type='image'   src='../styles/default/images/grn_save_btn-up.png' alt='Save' onclick=\"editEmployerBriefcaseDetails('"+item.getId()+"')\"/>");
	     retString.append("<br>");
	     
	    
	     retString.append("<s:url id='cancelBreifcaseItem' action='Briefcase'/>");
	     retString.append("<input type='image'  src='../styles/default/images/prpl_cancel_btn-up.png' alt='Cancel' onclick=\"cancelBriefcaseDetails('"+item.getId()+"')\"/>");
	   
	     retString.append("</div>");
	    
	     
     return retString.toString();
		
	}

}
