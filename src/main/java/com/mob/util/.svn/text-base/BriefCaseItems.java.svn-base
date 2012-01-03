package com.mob.util;

import org.displaytag.decorator.TableDecorator;

import com.mob.model.profile.Item;

public class BriefCaseItems extends TableDecorator {

    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(BriefCaseItems.class);

	public Object getImage() {
		LOGGER.info("Inside getImage");
        Item item = (Item) getCurrentRowObject();
        StringBuffer retString = new StringBuffer();

        retString.append("<div class='bc_tbl_profpic' style='width:53px;'>");
        retString.append("<div class='bc_info_btn'></div>");
        
        if (item.getVideourl() != null) {
            retString.append("<a  rel=\"ibox\" href='");
            retString.append(item.getVideourl());
            retString.append("'>");
            retString.append("<img src='../styles/default/images/mobc_briefcase_icon-video.png' alt='' onclick=\"updateCount()\"/>");
            retString.append("</a>");
        }
        if (item.getAudiourl() != null) {
        	retString.append("<img src='../styles/default/images/mobc_briefcase_icon-music.png' alt=''/>");
        	retString.append("<a class='htrack' style='padding-top:14px;' onclick='updateCount()' href='");
        	retString.append(item.getAmazonFileURL().get(0));
            retString.append("'>");
            retString.append("</a>");
        }
        if (item.getTextFileurl() != null) {
            retString.append("<a target=\"_blank\" href='");
            retString.append(item.getAmazonFileURL().get(0));
          
            retString.append("'>");
            retString.append("<img src='../styles/default/images/mobc_briefcase_icon-doc.png' alt=''  onclick=\"updateCount()\" />");
            retString.append("</a>");
        }

        if (item.getImageUrl() != null) {
            retString.append("<a  rel=\"ibox\" href='");
            retString.append(item.getAmazonFileURL().get(0));
            retString.append("'>");
            //retString.append("<img src='../styles/default/images/minibriefcase_photo_link.png' alt='' onclick=\"updateCount()\"/>");
            retString.append("<img src='"+item.getAmazonFileURL().get(1)+"' alt='' onclick=\"updateCount()\"/>");
            retString.append("</a>");
        }
        if (item.getItemURL() != null) {
        	retString.append("<img src='../styles/default/images/minibriefcase_icon_link.png'>");
            
        }
        retString.append("</div>");


        return retString.toString();
    }

    public Object getName() {
    	LOGGER.info("Inside getName");
        Item item = (Item) getCurrentRowObject();
        StringBuffer retString = new StringBuffer();
        retString.append("<div  id='name" + item.getId() + "' style='display:block;'>");
        if(item.getItemURL()!=null){
        	retString.append("<a  target='_blank' class='briefCaseLink' href="+item.getItemURL()+">" +item.getName()+"</a>");
        	
        }else{
        	retString.append(item.getName());
        }
        
        
        //retString.append(item.getName());
        retString.append("</div>");
        retString.append("<div id='name1" + item.getId() + "' style='display:none'>");
        retString.append("<input type=\"text\"");
        retString.append(" id=\"txtname" + item.getId() + "\"");
        retString.append(" name=\"nickName\" value=\"");
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

    public Object getLinks() {
    	LOGGER.info("Inside getLinks");
        Item item = (Item) getCurrentRowObject();
        StringBuffer retString = new StringBuffer();

        retString.append("<div class='bc_tbl2_actions' style='display:block;' id='actionId" + item.getId() + "' >");
        //retString.append("<a href=''><img src='../styles/default/images/mobc_prof_action_btn-write.gif'/></a>");
       // retString.append("<a href=''><img src='../styles/default/images/mobc_prof_action_btn-envelope.gif'/></a>");
        retString.append("<img src='../styles/default/images/mobc_prof_action_btn-writep.png' alt='Edit'onclick=\"ediBreifcaseListItems(" + item.getId() + ")\" />");
        retString.append("<a href='#' onclick=\"return pop_upForDeleteBriefcase(event," + item.getId() + ",'" + item.getName() + "','briefcaseName','confirm_delete',[20,20,'negoffset_mouse'])\"><img src='../styles/default/images/mobc_prof_action_btn-redx.gif' alt='Remove' /></a>");
        retString.append("</div>");


        retString.append("<div id='actionId1" + item.getId() + "' style='display:none' class='bc_tbl2_actions2' >");
        retString.append("<input type='image'  src='../styles/default/images/grn_save_btn-up.png' alt='Save' onclick=\"editBriefcaseDetails('" + item.getId() + "')\"/>");
        retString.append("<br>");


        retString.append("<s:url id='cancelBreifcaseItem' action='Briefcase'/>");
        retString.append("<input type='image'  src='../styles/default/images/prpl_cancel_btn-up.png' alt='Cancel' onclick=\"cancelBriefcaseDetails('" + item.getId() + "')\"/>");

        retString.append("</div>");


        return retString.toString();

    }
    
    public Object getFlagImage(){
    	
    	 Item item = (Item) getCurrentRowObject();
         StringBuffer retString = new StringBuffer();
         retString.append("<a href='#' onclick=\"return pop_upForFlagComment(event," + item.getId() + ",'" + item.getName() + "','briefcaseName','confirm_delete',[20,20,'negoffset_mouse'])\"><img src='../styles/default/images/icon_flag.png'/></a>");
         
    	 return retString.toString();
    }

}
