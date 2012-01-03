package com.mob.util;

import org.displaytag.decorator.TableDecorator;

import com.mob.model.profile.Item;

public class EmployerBriefCaseURL extends TableDecorator{
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EmployerBriefCaseURL.class);
    public Object getImage() {
		LOGGER.info("Inside getImage");
        Item item = (Item) getCurrentRowObject();
        StringBuffer retString = new StringBuffer();
        retString.append("<div class='bc_tbl_profpic'>");
        retString.append("<div class='bc_info_btn'></div>");
        if (item.getItemURL() != null) {
        	retString.append("<img src='../styles/default/images/minibriefcase_icon_link.png'>");
    	}

    	retString.append("</div>");
        retString.append("</div>");


        return retString.toString();
    }

    public Object getName() {
    	LOGGER.info("Inside getName");
        Item item = (Item) getCurrentRowObject();
        StringBuffer retString = new StringBuffer();
        retString.append("<div  id='name" + item.getId() + "' style='display:block;'>");
        retString.append("<a  target='_blank'  class='briefCaseLink'  href="+item.getItemURL()+">" +item.getName()+"</a>");
        retString.append("</div>");
        retString.append("<div id='name1" + item.getId() + "' style='display:none'>");
        retString.append("<input type=\"text\"");
        retString.append(" id=\"txtname" + item.getId() + "\"");
        retString.append(" name=\"name\" value=\"");
        retString.append(item.getName());
        retString.append("\"");
        retString.append(">");
        retString.append("</input>");
        retString.append("</div>");


        return retString.toString();
    }


    public Object getDoumentCategory() {
    	LOGGER.info("Inside getDoumentCategory");
        Item item = (Item) getCurrentRowObject();
        StringBuffer retString = new StringBuffer();

        
        retString.append("<div id='category" + item.getId() + "' style='display:block'>");
        retString.append(item.getCategory());
        retString.append("</div>");
        retString.append("<div id='category1" + item.getId() + "'  style='display:none'>");
        
        retString.append("<div id='selcategory" + item.getId() + "'>");
       	retString.append("Document");
        retString.append("</div>");
        
        
        retString.append("</div>");
        retString.append("</div>");


        return retString.toString();
    }

    public Object getPhotoCategory() {
    	LOGGER.info("Inside getPhotoCategory");
        Item item = (Item) getCurrentRowObject();
        StringBuffer retString = new StringBuffer();


        retString.append("<div id='category" + item.getId() + "' style='display:block'>");
        retString.append(item.getCategory());
        retString.append("</div>");
        retString.append("<div id='category1" + item.getId() + "' style='display:none'>");
        retString.append("<div id='selcategory" + item.getId() + "'>");
       	retString.append("Photo");
        retString.append("</div>");
        
        
        retString.append("</div>");
        retString.append("</div>");


        return retString.toString();
    }

    public Object getAudioVedioCategory() {
    	LOGGER.info("Inside getAudioVedioCategory");
        Item item = (Item) getCurrentRowObject();
        StringBuffer retString = new StringBuffer();


        retString.append("<div id='category" + item.getId() + "' style='display:block'>");
        retString.append(item.getCategory());
        retString.append("</div>");
        retString.append("<div id='category1" + item.getId() + "' style='display:none'>");
        retString.append("<div id='selcategory" + item.getId() + "'>");
        LOGGER.info("url:"+item.getVideourl());
        if(item.getVideourl()!=null){
        	retString.append("Video");
        	
        }
        if(item.getAudiourl()!=null){
        	retString.append("Music");
        	
        }
        retString.append("</div>");
        
        
        
        
        retString.append("</div>");
        retString.append("</div>");


        return retString.toString();
    }
	
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
	     retString.append("<input type='image'   src='../styles/default/images/grn_save_btn-up.png' alt='Save' onclick=\"editEmployerBriefcaseDetailsURL('"+item.getId()+"')\"/>");
	     retString.append("<br>");
	     
	    
	     retString.append("<s:url id='cancelBreifcaseItem' action='Briefcase'/>");
	     retString.append("<input type='image'  src='../styles/default/images/prpl_cancel_btn-up.png' alt='Cancel' onclick=\"cancelBriefcaseDetails('"+item.getId()+"')\"/>");
	   
	     retString.append("</div>");
	    
	     
     return retString.toString();
		
	}
	
	 public Object getItemURL() {
	    	LOGGER.info("Inside getName");
	        Item item = (Item) getCurrentRowObject();
	        StringBuffer retString = new StringBuffer();


	        retString.append("<div  id='name" + item.getId() + "' style='display:block;'>");
	        retString.append("<a  target='_blank'  href="+item.getItemURL()+">" +item.getItemURL()+"</a>");
	        retString.append("</div>");
	        retString.append("<div id='name1" + item.getId() + "' style='display:none'>");
	        retString.append("<input type=\"text\"");
	        retString.append(" id=\"txtURL" + item.getId() + "\"");
	        retString.append(" name=\"itemURL\" value=\"");
	        retString.append(item.getItemURL());
	        retString.append("\"");
	        retString.append(">");
	        retString.append("</input>");
	        retString.append("</div>");


	        return retString.toString();
	    }
	 
	  public Object getPrivacySetting() {
	    	LOGGER.info("Inside getPrivacySetting");
	        Item item = (Item) getCurrentRowObject();
	        StringBuffer retString = new StringBuffer();

	        retString.append("<div id='privacySetting" + item.getId() + "' style='display:block'>");
	        retString.append(item.getPrivacySetting());
	        retString.append("</div>");
	        retString.append("<div id='privacySetting1" + item.getId() + "' style='display:none'>");
	        retString.append("</div>");
	        retString.append("</div>");

	        return retString.toString();
	    }

}
