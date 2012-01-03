package com.mob.util;
import org.displaytag.decorator.TableDecorator;

import com.mob.model.employer.Opportunity;

public class ViewEmployerProfileFromSearch extends TableDecorator {
	/**
	 * Logger for logging messages.
	 */
	private static final MOBLogger LOGGER =
		new MOBLogger(ViewEmployerProfileFromSearch.class);

	public Object getOpportunitiesForEmployee() {
		LOGGER.info("Inside getOpportunitiesForEmployee");
		Opportunity lObject = (Opportunity) getCurrentRowObject();
		String name = lObject.getStr_job_name();
		String description = lObject.getDescription();
		long id = lObject.getId();
		StringBuffer retString = new StringBuffer();
		retString.append("<div class='bc_op_entry'>");
		retString.append("<div class='bcope_desc'>");
		retString.append("<a href=''id='viewOppId" + id
				+ "' onclick=\"return viewOpportunity(" + id + ")\">");
		retString.append(name);
		retString.append("</a>");
		retString.append("<p>" + description + "</p>");

		retString.append("</div>");
		retString.append("<div class='bcope_actions'>");
		retString.append("<div class='qlink apply_for_pos'>");
		retString.append("<a href='#' onclick=\"return applyForPosition_pop_up(event,"
				+ id
				+ ",'apply_for_position',['center',20,'negoffset_mouse'])\">");
		retString.append("Apply for this position</a>");
		retString.append("</div>");
		retString.append("<div class='qlink mark_as_fav'>");
		retString.append("<a href='#' onclick=\"return markasFavorite_pop_up(event,"
				+ id
				+ ",'markasfavorite',['center',20,'negoffset_mouse'])\">");
		retString.append("Mark as Favorite</a>");
		retString.append("</div>");
		retString.append("</div>");
		retString.append("</div>");
		return retString.toString();
	}


	public Object getOpportunitiesForEmployer() {
		LOGGER.info("Inside getOpportunitiesForEmployer");
		Opportunity lObject = (Opportunity) getCurrentRowObject();
		String name = lObject.getStr_job_name();
		String description = lObject.getDescription();
		long id = lObject.getId();

		StringBuffer retString = new StringBuffer();
		retString.append("<div class='bc_op_entry'>");
		retString.append("<div class='bcope_desc'>");
		retString.append("<a href=''id='viewOppId" + id
				+ "' onclick=\"return viewOpportunity(" + id + ")\">");
		retString.append(name);
		retString.append("</a>");
		retString.append("<p>" + description + "</p>");
		retString.append("</div>");
		retString.append("</div>");
		return retString.toString();
	}




}
