/*
 * Created on 04/09/2006 21:23:22
 */
package com.mob.forum.api.rest;

import java.util.List;

import com.mob.forum.Command;
import com.mob.forum.JForumExecutionContext;
import com.mob.forum.context.RequestContext;
import com.mob.forum.context.ResponseContext;
import com.mob.forum.dao.DataAccessDriver;
import com.mob.forum.dao.UserDAO;
import com.mob.forum.entities.User;
import com.mob.forum.exceptions.APIException;
import com.mob.forum.util.I18n;
import com.mob.forum.util.preferences.ConfigKeys;
import com.mob.forum.util.preferences.SystemGlobals;
import com.mob.forum.util.preferences.TemplateKeys;

import freemarker.template.SimpleHash;
import freemarker.template.Template;

/**
 * @author Rafael Steil
 * @version $Id: UserREST.java,v 1.3 2006/10/10 00:49:04 rafaelsteil Exp $
 */
public class UserREST extends Command
{
	/**
	 * List all users
	 */
	public void list()
	{
		try {
			this.authenticate();

			UserDAO dao = DataAccessDriver.getInstance().newUserDAO();
			List users = dao.selectAll();

			this.setTemplateName(TemplateKeys.API_USER_LIST);
			this.context.put("users", users);
		}
		catch (Exception e) {
			this.setTemplateName(TemplateKeys.API_ERROR);
			this.context.put("exception", e);
		}
	}

	/**
	 * Creates a new user.
	 * Required parameters ara "username", "email" and "password".
	 */
	public void insert()
	{
		try {
			this.authenticate();

			String username = this.requiredRequestParameter("username");
			String email = this.requiredRequestParameter("email");
			String password = this.requiredRequestParameter("password");

			if (username.length() > SystemGlobals.getIntValue(ConfigKeys.USERNAME_MAX_LENGTH)) {
				throw new APIException(I18n.getMessage("User.usernameTooBig"));
			}

			if (username.indexOf('<') > -1 || username.indexOf('>') > -1) {
				throw new APIException(I18n.getMessage("User.usernameInvalidChars"));
			}

			UserDAO dao = DataAccessDriver.getInstance().newUserDAO();

			if (dao.isUsernameRegistered(username)) {
				throw new APIException(I18n.getMessage("UsernameExists"));
			}

			if (dao.findByEmail(email) != null) {
				throw new APIException(I18n.getMessage("User.emailExists", new Object[] { email }));
			}

			// Ok, time to insert the user
			User user = new User();
			user.setUsername(username);
			user.setEmail(email);
			user.setPassword(password);

			int userId = dao.addNew(user);

			this.setTemplateName(TemplateKeys.API_USER_INSERT);
			this.context.put("userId", new Integer(userId));
		}
		catch (Exception e) {
			this.setTemplateName(TemplateKeys.API_ERROR);
			this.context.put("exception", e);
		}
	}

	/**
	 * Retrieves a parameter from the request and ensures it exists
	 * @param paramName the parameter name to retrieve its value
	 * @return the parameter value
	 * @throws APIException if the parameter is not found or its value is empty
	 */
	private String requiredRequestParameter(String paramName)
	{
		String value = this.request.getParameter(paramName);

		if (value == null || value.trim().length() == 0) {
			throw new APIException("The parameter '" + paramName + "' was not found");
		}

		return value;
	}

	/**
	 * Tries to authenticate the user accessing the API
	 * @throws APIException if the authentication fails
	 */
	private void authenticate()
	{
		String apiKey = this.requiredRequestParameter("api_key");

		RESTAuthentication auth = new RESTAuthentication();

		if (!auth.validateApiKey(apiKey)) {
			throw new APIException("The provided API authentication information is not valid");
		}
	}

	public Template process(RequestContext request, ResponseContext response, SimpleHash context)
	{
		JForumExecutionContext.setContentType("text/xml");
		return super.process(request, response, context);
	}
}
