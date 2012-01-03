/*
 * Created on 04/09/2006 21:59:39
 */
package com.mob.forum.api.rest;

import com.mob.forum.dao.ApiDAO;
import com.mob.forum.dao.DataAccessDriver;

/**
 * @author Rafael Steil
 * @version $Id: RESTAuthentication.java,v 1.2 2006/10/10 00:49:04 rafaelsteil Exp $
 */
public class RESTAuthentication
{
	public boolean validateApiKey(String apiKey)
	{
		ApiDAO dao = DataAccessDriver.getInstance().newApiDAO();
		return dao.isValid(apiKey);
	}
}
