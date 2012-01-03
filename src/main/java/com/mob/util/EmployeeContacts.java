package com.mob.util;

import org.displaytag.decorator.TableDecorator;

import com.mob.model.Contact;

public class EmployeeContacts extends TableDecorator {

	/**
	 * Logger for logging messages.
	 */

	private static final MOBLogger LOGGER = new MOBLogger(
			EmployeeContacts.class);
	private String image;
	private String resizedMidPicture;
	private String resizedMinPicture;

	public Object getPicture() {
		System.out.println("Inside getNickName");

		Contact contact = (Contact) getCurrentRowObject();

		/*
		 * if(contact.getContactOwner().getPicture()!=null){
		 * image=(String)contact.getContactOwner().getAmazonFileURL().get(0); }
		 */
		/*
		 * if(contact.getContactOwner().getResizedMidPicture()!=null){
		 * resizedMidPicture=(String)
		 * contact.getContactOwner().getAmazonFileURL().get(1);
		 * contact.getContactOwner().setResizedMidPicture(resizedMidPicture); }
		 */
		
		if (contact.getContactOwner().getResizedMinPicture() != null) {
			resizedMinPicture = (String) contact.getContactOwner()
					.getAmazonFileURL().get(2);
			contact.getContactOwner().setResizedMinPicture(resizedMinPicture);
		}

		StringBuffer retString = new StringBuffer();
		// If contact is an employee then link to employee profile
		if(!contact.isEmployer()){
			retString.append("<a href='../search/viewEmployeeProfileFromSearchEmployee.action?employeeProfileId="+contact.getContactOwner().getId()+
				"'>");
		}else{
			retString.append("<a href='../search/viewingEmployerProfileFromSearch.action?employerProfile.id="+contact.getContactOwner().getId()+
			"'>");
		}
		if (contact.getContactOwner().getResizedMinPicture() != null) {
			// resizedMinPicture=(String)
			// contact.getContactOwner().getAmazonFileURL().get(0);
			// contact.getContactOwner().setResizedMinPicture(resizedMinPicture);
			retString.append("<img src='");
			retString.append(contact.getContactOwner().getResizedMinPicture());

			retString.append("' width='50' height='50'/>");
		} else {
			retString.append("<img src='../");
			retString
					.append("styles/default/images/mobc_default_profile_pic.jpg");
			retString.append("' width='50' height='50'/>");

		}
		retString.append("</a>");
		return retString.toString();
	}

	public Object getNickName() {
		LOGGER.info("Inside getNickName");
		Contact contact = (Contact) getCurrentRowObject();

		StringBuffer retString = new StringBuffer();

		retString.append("<div  id='lblId" + contact.getId()
				+ "' style='display:block;'>");
		retString.append(contact.getNickName());
		retString.append("</div>");
		/*
		 * retString.append("<div id='nickName"+contact.getId()+
		 * "' style='display:none'>"); retString.append("<input type=\"text\"");
		 * retString.append(" id=\"nickNames"+contact.getId()+"\"");
		 * retString.append(" name=\"nickName\" value=\"");
		 * retString.append(contact.getNickName()); retString.append("\"");
		 * retString.append(">"); retString.append("</input>");
		 * retString.append("</div>");
		 */

		return retString.toString();
	}

	public Object getContactType() {
		LOGGER.info("Inside getContactType");
		Contact contact = (Contact) getCurrentRowObject();
		StringBuffer retString = new StringBuffer();

		retString.append("<div class='pgroup_edit'>");
		retString.append("<div id='lblId1" + contact.getId()
				+ "' style='display:block'>");
		retString.append(contact.getContactType());
		retString.append("</div>");
		retString.append("<div id='contTypeID" + contact.getId()
				+ "' style='display:none'>");
		retString.append("</div>");
		retString.append("</div>");

		return retString.toString();

	}

	public Object getModifiedDate() {
		LOGGER.info("Inside getModifiedDate");
		Contact contact = (Contact) getCurrentRowObject();
		StringBuffer retString = new StringBuffer();

		retString.append("<div id='modifiedDateId" + contact.getId() + "'>");
		retString.append(contact.getModifiedDate());
		retString.append("</div>");
		return retString.toString();
	}

	public Object getLinks() {
		LOGGER.info("Inside getLinks");
		Contact contact = (Contact) getCurrentRowObject();
		StringBuffer retString = new StringBuffer();

		retString.append("<div id='imgIds" + contact.getId()
				+ "' style='display:block'>");
		// retString.append("<a href=''><img src='../styles/default/images/mobc_prof_action_btn-write.gif'/></a>");
		// retString.append("<a href=''><img src='../styles/default/images/mobc_prof_action_btn-envelope.gif'/></a>");
		retString
				.append("<img src='../styles/default/images/mobc_prof_action_btn-writep.png' onclick=\"editContactList("
						+ contact.getId()
						+ ","
						+ contact.getAssociatedProfile().getId()
						+ ")\" alt='Edit'/>");
		retString
				.append("<a href=\"javascript:dummy()\" onclick=\"javascript:return contactpop_up(event,"
						+ contact.getId()
						+ ",'"
						+ contact.getNickName()
						+ "','confirm_delete',[20,20,'negoffset_mouse'])\"");
		retString.append(">");
		retString
				.append("<img src=\"../styles/default/images/mobc_prof_action_btn-redx.gif\" border=\"0\" alt=\"deletecontact\"");
		retString.append("/>");
		retString.append("</a>");
		retString.append("</div>");
		retString.append("<div id='imgIds1" + contact.getId()
				+ "' style='display:none' class='bc_tbl2_actions2' >");
		retString
				.append("<input type='image' src='../styles/default/images/grn_save_btn-up.png' alt='Save' onclick=\"updateContacts("
						+ contact.getId()
						+ ","
						+ contact.getAssociatedProfile().getId() + ")\"/>");
		retString.append("<br>");

		retString
				.append("<s:url id='cancelContactUpdate' action='myContactList'/>");
		retString
				.append("<input type='image' src='../styles/default/images/prpl_cancel_btn-up.png' alt='Cancel' onclick=\"cancelContactsAction("
						+ contact.getId() + ")\"/>");

		retString.append("</div>");
		System.out.println("contact Util");
		return retString.toString();

	}

}
