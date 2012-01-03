package com.mob.util;
import org.displaytag.decorator.TableDecorator;

import com.mob.model.employer.Opportunity;

public class EmployerProfileDecorator extends TableDecorator {
	
    /**
     * Logger for logging messages.
     */
    private static final MOBLogger LOGGER =
        new MOBLogger(EmployerProfileDecorator.class);

	public Object getOpportunities()
	{
		LOGGER.info("Inside getOpportunities");
		Opportunity lObject = (Opportunity) getCurrentRowObject();
		String name = lObject.getStr_job_name();
		long opportunityId = lObject.getId();
		System.out.println("opportunityId" + opportunityId);
		String description = lObject.getDescription();
		StringBuffer retString = new StringBuffer();
		retString.append("<div class='bc_op_entry'>");
		retString.append("<div class='bcope_desc'>");

		retString.append("<a href=''id='viewOppId" + opportunityId
				+ "' onclick=\"return viewOpportunity(" + opportunityId
				+ ")\">");
		retString.append(name);
		retString.append("</a>");
		retString.append("<p>" + description + "</p>");
		retString.append("</div>");
		retString.append("</div>");
		return retString.toString();
	}
	
	
	
	
	
}
